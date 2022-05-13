extends Control

onready var chatLog = get_node("VBoxContainer/RichTextLabel")
onready var inputLabel = get_node("VBoxContainer/HBoxContainer/Label")
onready var inputField = get_node("VBoxContainer/HBoxContainer/LineEdit")
onready var gameManager = get_node("/root/Game");
onready var player = get_node("/root/Game/Player");

var groups = [
	{'name': 'Friends', 'color': '#000'},
	{'name': 'Community', 'color': '#ffffff'}
]

var group_index = 0
var user_name = "";
var message = ""

func _ready():
	inputField.connect("text_entered", self,'text_entered')
	user_name = "Me";
	change_group(0)

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ENTER:
			inputField.grab_focus()
		if event.pressed and event.scancode == KEY_ESCAPE:
			inputField.release_focus()
		if event.pressed and event.scancode == KEY_TAB:
			change_group(1)

func change_group(value):
	group_index += value
	if group_index > (groups.size() - 1):
		group_index = 0
	inputLabel.text = '[' + groups[group_index]['name'] + ']'
	inputLabel.set("custom_colors/font_color", Color(groups[group_index]['color']))
	
func add_message(username, text, group = 0, color = ''):
	chatLog.bbcode_text += '\n' 
	if color == '':
		chatLog.bbcode_text += '[color=' + groups[group]['color'] + ']'
	else:
		chatLog.bbcode_text += '[color=' + color + ']'
	if username != '':
		chatLog.bbcode_text += '[' + username + ']: '
	chatLog.bbcode_text += text
	chatLog.bbcode_text += '[/color]'


func text_entered(text):
	if text != '':
		message = text;
		print(Utils.data.message)
		print("chatboxmessage " , message)
		add_message(user_name, text, group_index)
		# Here you have to send the message to the server
		Utils.data.message = text
		Utils.data.groupIndex = group_index
		print("my message is this: ",message)
		print(text)
		inputField.text = ''
		message = ''
