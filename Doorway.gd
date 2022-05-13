extends Area2D

#export(PackedScene) var target_scene
export(String,FILE) var target_scene
func _on_Doorway_body_entered(body):
	#body.house = self;
	print("door")
	#next_level()
	get_node(NodePath("/root/SceneManager")).transition_to_scene(target_scene)


"""
func _on_Doorway_body_exited(body):
	#if body.house == self:
	#	body.house = null;
	print("out door")
	
func next_level():
	var ERR = get_tree().change_scene_to(target_scene)
	if ERR != OK:
		print("something went wrong with door scene")
"""
