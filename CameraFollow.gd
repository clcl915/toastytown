extends Camera2D
#var player = Utils.get_player();
onready var target = get_node("/root/SceneManager/CurrentScene/Mainscene/YSort/Player");
#onready var target = player;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position = target.position
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
