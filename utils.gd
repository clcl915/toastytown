extends Node
var data = {
	"x": 0,
	"y": 0,
	"id": 0,
	"name":'',
	"message":"has joined",
	"groupIndex":0,
	"bodySprite":'res://assets/sprites/body_walk/char1_walk.png',
	"hairSprite":'res://assets/sprites/hair_walk/braids_walk.png',
	"hairColorFrame":0,
	"topsSprite":'res://assets/sprites/clothes_walk/top_walk/basic_walk.png',
	"topsColorFrame":0,
	"bottomsSprite":'res://assets/sprites/clothes_walk/bottom_walk/pants_walk.png',
	"bottomsColorFrame":0,
	"accSprite":'res://assets/sprites/acc_walk/earring_emerald_walk.png',
	"accFrame":0,
	
}
onready var target = get_node("/root/SceneManager/CurrentScene/Mainscene/YSort/Player");
func get_player():
	return get_node("/root/SceneManager/CurrentScene").get_children().back().find_node("Player")
	
