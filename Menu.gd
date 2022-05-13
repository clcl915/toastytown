extends Control
export(String,FILE) var target_scene

func _ready():
	get_node(NodePath("/root/SceneManager/ScreenTransition/ColorRect")).hide()
	
func _on_NewGame_pressed():
	$CanvasLayer/StartContainer.visible = false;
	$CanvasLayer/EnterName.visible = true;

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_StartButton_pressed():
	get_node(NodePath("/root/SceneManager/ScreenTransition/ColorRect")).show()
	get_node(NodePath("/root/SceneManager")).transition_to_scene(target_scene)


func _on_LineEdit_text_changed(new_text):
	print(new_text)
	Utils.data.name = new_text
func _on_LineEdit_text_entered(new_text):
	Utils.data.name = new_text
	_on_StartButton_pressed()
