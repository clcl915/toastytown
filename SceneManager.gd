extends Node2D

var next_scene = null;
func ready():
	$ScreenTransition/AnimationPlayer.play("FadeToBlack")
	
func transition_to_scene(new_scene:String):
	next_scene = new_scene
	$ScreenTransition/AnimationPlayer.play("FadeToBlack")
	print("fading")

func finished_fading():
	$CurrentScene.get_child(0).queue_free()
	$ScreenTransition/AnimationPlayer.play("FadeToNormal")
	print("back to normal")
	$CurrentScene.add_child(load(next_scene).instance())
	#get_tree().change_scene_to(next_scene)

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("ui_end"):
			get_tree().quit()
