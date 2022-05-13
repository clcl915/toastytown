extends KinematicBody2D
#var moveSpeed :int=200;
#var vel= Vector2();
#var facingDir=Vector2();
export var walk_speed=8.0;
const TILE_SIZE = 16;

var initial_position = Vector2(0,0)
var input_direction = Vector2(0,0)
var is_moving = false
var percent_moved_to_next_tile = 0.0
export (int) var id = 0
#var house = null setget set_house
onready var ray = $RayCast2D
onready var anim = $AnimatedSprite
onready var animPlayer = $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var anim_state = anim_tree.get("parameters/playback")

#global variable can be for shared state for player to interact with different things
#PlayerData.player_count +=1
#data["id"]= PlayerData.player_count;
func _ready():
	$Name.text = Utils.data['name']
	id=Utils.data["id"]
	$Body/BodySprite.texture =load(Utils.data['bodySprite'])
	$Hair/HairSprite.texture =load(Utils.data['hairSprite'])
	$Hair/HairSprite.frame_coords.x  = Utils.data['hairColorFrame']
	$ClothesTop/ClothesTopSprite.texture = load(Utils.data['topsSprite'])
	$ClothesTop/ClothesTopSprite.frame_coords.x = Utils.data['topsColorFrame']
	#$ClothesTop/ClothesTopSprite.frame = Utils.data['topsColorFrame']
	$ClothesBottom/ClothesBottomSprite.texture = load(Utils.data['bottomsSprite'])
	$ClothesBottom/ClothesBottomSprite.frame_coords.x  = Utils.data['bottomsColorFrame']
	$Acc/AccSprite.texture = load(Utils.data['accSprite'])
	$Acc/AccSprite.hframes = Utils.data['accFrame']
	print("acc frame is now " , $Acc/AccSprite.frame)
	_setAnimationPlayerFrames(Utils.data['hairColorFrame'],Utils.data['topsColorFrame'],Utils.data['bottomsColorFrame'])
	initial_position=position

func _physics_process(delta):
	if is_moving == false:
		process_player_input()
	elif (input_direction !=Vector2.ZERO):
		anim_state.travel("Walk")
		move(delta)
	else:
		anim_state.travel("Idle")
		is_moving = false

func process_player_input():
	if input_direction.y ==0:
		input_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	if input_direction.x ==0:
		input_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	if input_direction != Vector2.ZERO:
		print(input_direction)
		anim_tree.set("parameters/Idle/blend_position",input_direction)
		anim_tree.set("parameters/Walk/blend_position",input_direction)
		initial_position = position
		is_moving = true
	
	else:
		anim_state.travel("Idle")
				
func move(delta):
	percent_moved_to_next_tile +=walk_speed*delta
	var desired_step: Vector2 = input_direction * TILE_SIZE /2
	ray.cast_to = desired_step
	ray.force_raycast_update()
	if !(ray.is_colliding()):
		if percent_moved_to_next_tile >=1.0:
			position = initial_position + (TILE_SIZE *input_direction)	
			percent_moved_to_next_tile = 0.0
			is_moving = false
		else:
			position = initial_position + (TILE_SIZE * input_direction * percent_moved_to_next_tile)
	else:
		percent_moved_to_next_tile = 0.0
		is_moving = false
		
func _setAnimationPlayerFrames(haircolorframe,topscolorframe,bottomscolorframe):
	var idleTracks = ['IdleDown','IdleUp','IdleRight','IdleLeft']
	var walkTracks = ['WalkDown','WalkUp','WalkRight','WalkLeft']
	for i in idleTracks:
		print(i)
		var changedhairkeyvalueX= int(haircolorframe)
		var changedhairkeyvalueY = idleTracks.find(i)
		var changedhairvalues = Vector2(changedhairkeyvalueX,changedhairkeyvalueY)
			
		var changedtopskeyvalueX= int(topscolorframe)
		var changedtopskeyvalueY = idleTracks.find(i)
		var changedtopsvalues = Vector2(changedtopskeyvalueX,changedtopskeyvalueY)
			
		var changedbottomskeyvalueX= int(bottomscolorframe)
		var changedbottomskeyvalueY = idleTracks.find(i)
		var changedbottomsvalues = Vector2(changedbottomskeyvalueX,changedbottomskeyvalueY)
		$AnimationPlayer.get_animation(i).track_set_key_value(1,0,changedhairvalues)
		$AnimationPlayer.get_animation(i).track_set_key_value(3,0,changedtopsvalues)
		$AnimationPlayer.get_animation(i).track_set_key_value(4,0,changedbottomsvalues)
	for track in walkTracks:
		for i in 7:
			var changedhairkeyvalueX= int(haircolorframe)+i+1
			var changedhairkeyvalueY = walkTracks.find(track)
			var changedhairvalues = Vector2(changedhairkeyvalueX,changedhairkeyvalueY)
			
			var changedtopskeyvalueX= int(topscolorframe)+i+1
			var changedtopskeyvalueY = walkTracks.find(track)
			var changedtopsvalues = Vector2(changedtopskeyvalueX,changedtopskeyvalueY)
			
			var changedbottomskeyvalueX= int(bottomscolorframe)+i+1
			var changedbottomskeyvalueY = walkTracks.find(track)
			var changedbottomsvalues = Vector2(changedbottomskeyvalueX,changedbottomskeyvalueY)
			
			$AnimationPlayer.get_animation(track).track_set_key_value(1,i,changedhairvalues)
			$AnimationPlayer.get_animation(track).track_set_key_value(3,i,changedtopsvalues)
			$AnimationPlayer.get_animation(track).track_set_key_value(4,i,changedbottomsvalues)
			#print("hair: track: " , track , "'s key: " , i, "is this value ", changedhairvalues )
			#print("tops: track: " , track , "'s key: " , i, "is this value ", changedtopsvalues )
			#print("bottoms: track: " , track , "'s key: " , i, "is this value ", changedbottomsvalues )



"""
#func _physics_process(delta):
	vel = Vector2()
	
	if Input.is_action_pressed("move_up"):
		vel.y -=1;
		facingDir = Vector2(0,-1)
	if Input.is_action_pressed("move_down"):
		vel.y +=1;
		facingDir = Vector2(0,1)
	if Input.is_action_pressed("move_left"):
		vel.x -=1;
		facingDir = Vector2(-1,0)
	if Input.is_action_pressed("move_right"):
		vel.x +=1;
		facingDir = Vector2(1,0)
	if Input.is_action_pressed("pause"):
		get_tree().paused=true;
		
	vel = vel.normalized()	
	
	move_and_slide(vel*moveSpeed,Vector2.ZERO)
	manageAnimation()

func manageAnimation():
	if vel.x>0:
		animPlayer.play("WalkRight")
	
	elif vel.x<0:
		animPlayer.play("WalkLeft")
	
	elif vel.y<0:
		animPlayer.play("WalkUp")
	
	elif vel.y>0:
		animPlayer.play("WalkDown")
	
	elif facingDir.x==1:
		animPlayer.play("IdleRight")
	
	elif facingDir.x==-1:
		animPlayer.play("IdleLeft")
	
	elif facingDir.y==1:
		animPlayer.play("IdleDown")
		
	elif facingDir.y==-1:
		animPlayer.play("IdleUp")
"""
"""func play_animation(anim_name):
	if anim.animation != anim_name:
		anim.play(anim_name)"""
