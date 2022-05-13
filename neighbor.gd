extends Area2D

const dialog = preload("res://DialogueBox.tscn")



func _on_NPC_body_entered(body):
	print(body.name)
	if body.name == "Player":
		print("player")
		var dialogIns = dialog.instance()
		get_node(NodePath("/root/SceneManager")).get_child(1).add_child(dialogIns)
		get_tree().paused=true;
