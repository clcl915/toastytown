extends Control

export(String,FILE) var target_scene
export (int) var id = 0
onready var clickAudio = $ClickUIAudio
onready var clickItemAudio = $ClickItemAudio
onready var bodySprite = $CanvasLayer/Player/Body/BodySprite
onready var hairSprite = $CanvasLayer/Player/Hair/HairSprite
onready var topsSprite = $CanvasLayer/Player/ClothesTop/ClothesTopSprite
onready var bottomSprite = $CanvasLayer/Player/ClothesBottom/ClothesBottomSprite
onready var accSprite = $CanvasLayer/Player/Acc/AccSprite

onready var hairArrowLeftButton = $CanvasLayer/Hair/HairLeftButton
onready var hairArrowLeftButtonSprite = $CanvasLayer/Hair/HairLeftButton/HairArrowLeft
onready var hairArrowRightButton = $CanvasLayer/Hair/HairRightButton
onready var hairArrowRightButtonSprite = $CanvasLayer/Hair/HairRightButton/HairArrowRight

onready var accArrowLeftButton  = $CanvasLayer/Acc/AccLeftButton
onready var accArrowLeftButtonSprite  = $CanvasLayer/Acc/AccLeftButton/AccArrowLeft
onready var accArrowRightButton  = $CanvasLayer/Acc/AccRightButton
onready var accArrowRightButtonSprite  = $CanvasLayer/Acc/AccRightButton/AccArrowRight

onready var hair_button_parent = $CanvasLayer/HairColors
onready var clothing_button_parent = $CanvasLayer/ClothingColors

const composite_sprites = preload("res://CompositeSpritesheets.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();
	id= randi();
	Utils.data["id"] = id
	print(Utils.data["id"])
	get_node("CanvasLayer/HBoxContainer/BodyCategory").grab_focus()
	for a in hair_button_parent.get_children():
		a.connect("pressed", self, "_on_Hair_Color_Button_pressed", [a])
	for b in clothing_button_parent.get_children():
		b.connect("pressed", self, "_on_Clothing_Color_Button_pressed", [b])

	
func _on_BodyCategory_pressed():
	clickAudio.play();
	$CanvasLayer/Bodies.visible = true
	$CanvasLayer/Hair.visible = false
	$CanvasLayer/Tops.visible = false
	$CanvasLayer/Bottoms.visible = false
	$CanvasLayer/Hair.visible = false
	$CanvasLayer/Acc.visible = false
	$CanvasLayer/HairColors.visible = false
	$CanvasLayer/ClothingColors.visible = false
	hairArrowLeftButton.visible = false
	hairArrowLeftButtonSprite.visible = false
	hairArrowRightButton.visible = false
	hairArrowRightButtonSprite.visible = false
	
	accArrowLeftButton.visible = false
	accArrowLeftButtonSprite.visible = false
	accArrowRightButton.visible = false
	accArrowRightButtonSprite.visible = false

func _on_HairCategory_pressed():
	clickAudio.play();
	$CanvasLayer/Bodies.visible = false
	$CanvasLayer/Hair.visible = true
	$CanvasLayer/Tops.visible = false
	$CanvasLayer/Bottoms.visible = false
	$CanvasLayer/Acc.visible = false
	$CanvasLayer/HairColors.visible = true
	$CanvasLayer/ClothingColors.visible = false
	hairArrowLeftButton.visible = false
	hairArrowLeftButtonSprite.visible = false
	hairArrowRightButton.visible = true
	hairArrowRightButtonSprite.visible = true
	
	accArrowLeftButton.visible = false
	accArrowLeftButtonSprite.visible = false
	accArrowRightButton.visible = false
	accArrowRightButtonSprite.visible = false


func _on_TopsCategory_pressed():
	clickAudio.play();
	$CanvasLayer/Bodies.visible = false
	$CanvasLayer/Hair.visible = false
	$CanvasLayer/Tops.visible = true
	$CanvasLayer/Bottoms.visible = false
	$CanvasLayer/Acc.visible = false
	$CanvasLayer/HairColors.visible = false
	$CanvasLayer/ClothingColors.visible = true
	hairArrowLeftButton.visible = false
	hairArrowLeftButtonSprite.visible = false
	hairArrowRightButton.visible = false
	hairArrowRightButtonSprite.visible = false
	
	accArrowLeftButton.visible = false
	accArrowLeftButtonSprite.visible = false
	accArrowRightButton.visible = false
	accArrowRightButtonSprite.visible = false


func _on_BottomsCategory_pressed():
	clickAudio.play();
	$CanvasLayer/Bodies.visible = false
	$CanvasLayer/Hair.visible = false
	$CanvasLayer/Tops.visible = false
	$CanvasLayer/Bottoms.visible = true
	$CanvasLayer/Acc.visible = false
	$CanvasLayer/HairColors.visible = false
	$CanvasLayer/ClothingColors.visible = true
	hairArrowLeftButton.visible = false
	hairArrowLeftButtonSprite.visible = false
	hairArrowRightButton.visible = false
	hairArrowRightButtonSprite.visible = false
	
	accArrowLeftButton.visible = false
	accArrowLeftButtonSprite.visible = false
	accArrowRightButton.visible = false
	accArrowRightButtonSprite.visible = false


func _on_AccCategory_pressed():
	clickAudio.play();
	$CanvasLayer/Bodies.visible = false
	$CanvasLayer/Hair.visible = false
	$CanvasLayer/Tops.visible = false
	$CanvasLayer/Bottoms.visible = false
	$CanvasLayer/Acc.visible = true
	$CanvasLayer/HairColors.visible = false
	$CanvasLayer/ClothingColors.visible = false
	hairArrowLeftButton.visible = false
	hairArrowLeftButtonSprite.visible = false
	hairArrowRightButton.visible = false
	hairArrowRightButtonSprite.visible = false
	
	accArrowLeftButton.visible = false
	accArrowLeftButtonSprite.visible = false
	accArrowRightButton.visible = true
	accArrowRightButtonSprite.visible = true


#SETTING BODY
func _on_SelectedBG1_pressed():
	clickItemAudio.play()
	bodySprite.texture = load(composite_sprites.body_spritesheets[0])
	Utils.data["bodySprite"] = composite_sprites.body_spritesheets[0]
func _on_SelectedBody2_pressed():
	clickItemAudio.play()
	bodySprite.texture = load(composite_sprites.body_spritesheets[1])
	Utils.data["bodySprite"] = composite_sprites.body_spritesheets[1]
func _on_SelectedBody3_pressed():
	clickItemAudio.play()
	bodySprite.texture = load(composite_sprites.body_spritesheets[2])
	Utils.data["bodySprite"] = composite_sprites.body_spritesheets[2]
func _on_SelectedBody4_pressed():
	clickItemAudio.play()
	bodySprite.texture = load(composite_sprites.body_spritesheets[3])
	Utils.data["bodySprite"] = composite_sprites.body_spritesheets[3]
func _on_SelectedBody5_pressed():	
	clickItemAudio.play()
	bodySprite.texture = load(composite_sprites.body_spritesheets[4])
	Utils.data["bodySprite"] = composite_sprites.body_spritesheets[4]
func _on_SelectedBody6_pressed():
	clickItemAudio.play()
	bodySprite.texture = load(composite_sprites.body_spritesheets[5])
	Utils.data["bodySprite"] = composite_sprites.body_spritesheets[5]
func _on_SelectedBody7_pressed():
	clickItemAudio.play()
	bodySprite.texture = load(composite_sprites.body_spritesheets[6])
	Utils.data["bodySprite"] = composite_sprites.body_spritesheets[6]
func _on_SelectedBody8_pressed():
	clickItemAudio.play()
	bodySprite.texture = load(composite_sprites.body_spritesheets[7])
	Utils.data["bodySprite"] = composite_sprites.body_spritesheets[7]


# SETTING HAIR
func _on_SelectedHair1_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[0])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[0]
func _on_SelectedHair2_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[1])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[1]
func _on_SelectedHair3_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[2])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[2]
func _on_SelectedHair4_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[3])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[3]
func _on_SelectedHair5_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[4])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[4]
func _on_SelectedHair6_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[5])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[5]
func _on_SelectedHair7_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[6])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[6]
func _on_SelectedHair8_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[7])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[7]
func _on_SelectedHair9_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[8])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[8]
func _on_SelectedHair10_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[9])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[9]
func _on_SelectedHair11_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[10])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[10]
func _on_SelectedHair12_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[11])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[11]
func _on_SelectedHair13_pressed():
	clickItemAudio.play()
	hairSprite.texture = load(composite_sprites.hair_spritesheets[12])
	Utils.data["hairSprite"] =composite_sprites.hair_spritesheets[12]

# SETTING TOPS
func _on_SelectedTop1_pressed():
	clickItemAudio.play()
	topsSprite.texture = load(composite_sprites.tops_spritesheets[0])
	Utils.data["topsSprite"] =composite_sprites.tops_spritesheets[0]
func _on_SelectedTop2_pressed():
	clickItemAudio.play()
	topsSprite.texture = load(composite_sprites.tops_spritesheets[1])
	Utils.data["topsSprite"] =composite_sprites.tops_spritesheets[1]
func _on_SelectedTop3_pressed():
	clickItemAudio.play()
	topsSprite.texture = load(composite_sprites.tops_spritesheets[2])
	Utils.data["topsSprite"] =composite_sprites.tops_spritesheets[2]
func _on_SelectedTop4_pressed():
	clickItemAudio.play()
	topsSprite.texture = load(composite_sprites.tops_spritesheets[3])
	Utils.data["topsSprite"] =composite_sprites.tops_spritesheets[3]
func _on_SelectedTop5_pressed():
	clickItemAudio.play()
	topsSprite.texture = load(composite_sprites.tops_spritesheets[4])
	Utils.data["topsSprite"] =composite_sprites.tops_spritesheets[4]
func _on_SelectedTop6_pressed():
	clickItemAudio.play()
	topsSprite.texture = load(composite_sprites.tops_spritesheets[5])
	Utils.data["topsSprite"] =composite_sprites.tops_spritesheets[5]
func _on_SelectedTop7_pressed():
	clickItemAudio.play()
	topsSprite.texture = load(composite_sprites.tops_spritesheets[6])
	Utils.data["topsSprite"] =composite_sprites.tops_spritesheets[6]

# SETTING BOTTOMS
func _on_SelectedBottom1_pressed():
	clickItemAudio.play()
	bottomSprite.texture = load(composite_sprites.bottoms_spritesheets[0])
	Utils.data["bottomsSprite"] =composite_sprites.bottoms_spritesheets[0]
func _on_SelectedBottom2_pressed():
	clickItemAudio.play()
	bottomSprite.texture = load(composite_sprites.bottoms_spritesheets[1])
	Utils.data["bottomsSprite"] =composite_sprites.bottoms_spritesheets[1]

# SETTING ACC
func _on_SelectedAcc1_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[0])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[0]
	accSprite.hframes = 112;
	Utils.data["accFrame"] = 112
func _on_SelectedAcc2_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[1])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[1]
	accSprite.hframes = 8;
	Utils.data["accFrame"] = 8
func _on_SelectedAcc3_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[2])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[2]
	accSprite.hframes = 8;
	Utils.data["accFrame"] = 8
func _on_SelectedAcc4_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[3])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[3]
	accSprite.hframes = 8;
	Utils.data["accFrame"] = 8
func _on_SelectedAcc5_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[4])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[4]
	accSprite.hframes = 8;
	Utils.data["accFrame"] = 8
func _on_SelectedAcc6_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[5])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[5]
	accSprite.hframes = 80;
	Utils.data["accFrame"] = 80
func _on_SelectedAcc7_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[6])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[6]
	accSprite.hframes = 80;
	Utils.data["accFrame"] = 80
func _on_SelectedAcc8_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[7])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[7]
	accSprite.hframes = 8;
	Utils.data["accFrame"] = 8
func _on_SelectedAcc9_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[8])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[8]
	accSprite.hframes = 8;
	Utils.data["accFrame"] = 8
func _on_SelectedAcc10_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[9])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[9]
	accSprite.hframes = 8;
	Utils.data["accFrame"] = 8
func _on_SelectedAcc11_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[10])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[10]
	accSprite.hframes = 8;
	Utils.data["accFrame"] = 8
func _on_SelectedAcc12_pressed():
	clickItemAudio.play()
	accSprite.texture = load(composite_sprites.acc_spritesheets[11])
	Utils.data["accSprite"] =composite_sprites.acc_spritesheets[11]
	accSprite.hframes = 8;
	Utils.data["accFrame"] = 8



func _on_ConfirmButton_pressed():
	get_node(NodePath("/root/SceneManager/ScreenTransition/ColorRect")).show()
	get_node(NodePath("/root/SceneManager")).transition_to_scene(target_scene)



func _on_HairLeftButton_pressed():
	clickAudio.play()
	$CanvasLayer/Hair/SelectedHair1.visible = true;
	$CanvasLayer/Hair/SelectedHair2.visible = true;
	$CanvasLayer/Hair/SelectedHair3.visible = true;
	$CanvasLayer/Hair/SelectedHair4.visible = true;
	$CanvasLayer/Hair/SelectedHair5.visible = true;
	$CanvasLayer/Hair/SelectedHair6.visible = true;
	$CanvasLayer/Hair/SelectedHair7.visible = true;
	$CanvasLayer/Hair/SelectedHair8.visible = true;
	$CanvasLayer/Hair/SelectedHair9.visible = false;
	$CanvasLayer/Hair/SelectedHair10.visible = false;
	$CanvasLayer/Hair/SelectedHair11.visible = false;
	$CanvasLayer/Hair/SelectedHair12.visible = false;

	hairArrowLeftButton.visible= false;
	hairArrowLeftButtonSprite.visible= false;
	hairArrowRightButton.visible=true;
	hairArrowRightButtonSprite.visible=true;


func _on_HairRightButton_pressed():
	clickAudio.play()
	$CanvasLayer/Hair/SelectedHair1.visible = false;
	$CanvasLayer/Hair/SelectedHair2.visible = false;
	$CanvasLayer/Hair/SelectedHair3.visible = false;
	$CanvasLayer/Hair/SelectedHair4.visible = false;
	$CanvasLayer/Hair/SelectedHair5.visible = false;
	$CanvasLayer/Hair/SelectedHair6.visible = false;
	$CanvasLayer/Hair/SelectedHair7.visible = false;
	$CanvasLayer/Hair/SelectedHair8.visible = false;
	$CanvasLayer/Hair/SelectedHair9.visible = true;
	$CanvasLayer/Hair/SelectedHair10.visible = true;
	$CanvasLayer/Hair/SelectedHair11.visible = true;
	$CanvasLayer/Hair/SelectedHair12.visible = true;
	hairArrowLeftButton.visible= true;
	hairArrowLeftButtonSprite.visible= true;
	hairArrowRightButton.visible=false;
	hairArrowRightButtonSprite.visible=false;


func _on_AccLeftButton_pressed():
	clickAudio.play()
	$CanvasLayer/Acc/SelectedAcc1.visible = true;
	$CanvasLayer/Acc/SelectedAcc2.visible = true;
	$CanvasLayer/Acc/SelectedAcc3.visible = true;
	$CanvasLayer/Acc/SelectedAcc4.visible = true;
	$CanvasLayer/Acc/SelectedAcc5.visible = true;
	$CanvasLayer/Acc/SelectedAcc6.visible = true;
	$CanvasLayer/Acc/SelectedAcc7.visible = true;
	$CanvasLayer/Acc/SelectedAcc8.visible = true;
	$CanvasLayer/Acc/SelectedAcc9.visible = false;
	$CanvasLayer/Acc/SelectedAcc10.visible = false;
	$CanvasLayer/Acc/SelectedAcc11.visible = false;
	$CanvasLayer/Acc/SelectedAcc12.visible = false;

	accArrowLeftButton.visible= false;
	accArrowLeftButtonSprite.visible= false;
	accArrowRightButton.visible=true;
	accArrowRightButtonSprite.visible=true;


func _on_AccRightButton_pressed():
	clickAudio.play()
	$CanvasLayer/Acc/SelectedAcc1.visible = false;
	$CanvasLayer/Acc/SelectedAcc2.visible = false;
	$CanvasLayer/Acc/SelectedAcc3.visible = false;
	$CanvasLayer/Acc/SelectedAcc4.visible = false;
	$CanvasLayer/Acc/SelectedAcc5.visible = false;
	$CanvasLayer/Acc/SelectedAcc6.visible = false;
	$CanvasLayer/Acc/SelectedAcc7.visible = false;
	$CanvasLayer/Acc/SelectedAcc8.visible = false;
	$CanvasLayer/Acc/SelectedAcc9.visible = true;
	$CanvasLayer/Acc/SelectedAcc10.visible = true;
	$CanvasLayer/Acc/SelectedAcc11.visible = true;
	$CanvasLayer/Acc/SelectedAcc12.visible = true;
	accArrowLeftButton.visible= true;
	accArrowLeftButtonSprite.visible= true;
	accArrowRightButton.visible=false;
	accArrowRightButtonSprite.visible=false;


func _on_Hair_Color_Button_pressed(which : Button):
	clickItemAudio.play()
	
	hairSprite.frame = 8*hair_button_parent.get_node(which.name).get_index()
	Utils.data['hairColorFrame'] = 8*hair_button_parent.get_node(which.name).get_index()
	print("changed hair frame is " , Utils.data['hairColorFrame'])

func _on_Clothing_Color_Button_pressed(which : Button):
	print(which)
	clickItemAudio.play()
	
	if ($CanvasLayer/Tops.visible == true):
		topsSprite.frame = 8*clothing_button_parent.get_node(which.name).get_index()
		Utils.data['topsColorFrame'] = 8*clothing_button_parent.get_node(which.name).get_index()
	if ($CanvasLayer/Bottoms.visible == true):
		bottomSprite.frame = 8*clothing_button_parent.get_node(which.name).get_index()
		Utils.data['bottomsColorFrame'] =8*clothing_button_parent.get_node(which.name).get_index()

