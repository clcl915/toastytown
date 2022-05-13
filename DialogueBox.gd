extends Control

export var dialogPath=""
export(float) var textSpeed = 0.03
 
var dialog
 
var phraseNum = 0
var finished = false

func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()
	get_parent().get_child(1).play()
	
func _process(_delta):
	$ArrowBeigeRight.visible = finished
	if Input.is_action_just_pressed("ui_right"):
		if finished:
			nextPhrase()
		else:
			$Text.visible_characters = len($Text.text)
 
func getDialog() -> Array:
	var f = File.new()
	#assert(f.file_exists(dialogPath), "File path does not exist")
	
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
 
func nextPhrase() -> void:
	if phraseNum >= len(dialog):
		queue_free()
		get_parent().get_child(1).stop()
		get_tree().paused = false;
		return
	
	finished = false
	
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	var f = File.new()
	var img = "assets/sprites/acc/"+dialog[phraseNum]["Acc"]+ ".png"
	var hairImg = "assets/sprites/hair/"+dialog[phraseNum]["Hair"]+ ".png"
	var TopImg = "assets/sprites/clothes/tops/"+dialog[phraseNum]["Tops"]+ ".png"
	if f.file_exists(img):
		$Node2D/Acc.texture = load(img)
		$Node2D/Hair.texture = load(hairImg)
		$Node2D/Tops.texture = load(TopImg)
	#else: $Acc.texture = null
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer, "timeout")
	
	finished = true
	phraseNum += 1
	return
