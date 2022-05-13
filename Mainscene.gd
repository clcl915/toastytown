extends Node2D


var ws = WebSocketClient.new()
var URL = "ws://localhost:9001/"
var playerCharacter = preload("res://Player.tscn")
var playerTemplate = preload("res://PlayerTemplate.tscn")

var lastMessageReceived = '';
var lastDataFromServer=[];
var allPlayersId = []
var playerLocation = []

func _ready():
	ws.connect('connection_closed', self, '_closed')
	ws.connect('connection_error', self, '_closed')
	ws.connect('connection_established', self, '_connected')
	ws.connect('data_received', self, '_on_data')
	$YSort/Player.update()
	$YSort/Player/AnimationTree.active = true;
	var err = ws.connect_to_url(URL)
	if err != OK:
		print('connection refused')

func _closed():
	print("connection closed")
	
func _connected():
	print("connected to host")
	
func _on_data():
	var payload = JSON.parse(ws.get_peer(1).get_packet().get_string_from_utf8()).result
	#print(payload)
	if lastDataFromServer.hash() == payload.hash():
		#print(lastDataFromServer, " is same ", payload)
		#print("same")
		return
	else:
		print("-------------------------")
		"""for player in allPlayers:
			player.queue_free()
		allPlayers = []"""
		for player in payload:
			#print("playerdata", Vector2(player['x'],player['y']))
			
			# if the received player doesn't equal this player
			if player.id != Utils.data["id"]:
				"""var p = playerCharacter.instance()
				p.position = Vector2(player["x"], player["y"])
				allPlayers.append(p)
				p.id = player.id
				add_child(p)"""
				# if new player has joined, create new player to scene print message "has joined"
				if allPlayersId.has(str(player["id"]))==false:
					$Camera2D/ChatBox.add_message(str(player["name"]), player["message"],player["groupIndex"])
					lastMessageReceived = player["message"];
					allPlayersId.append(str(player["id"]));
					var new_player = playerTemplate.instance()
					#p.position = Vector2(player["x"], player["y"])
					new_player.position = Vector2(player["x"], player["y"])
					new_player.name = str(player.id)
					#p.id = player.id
					#add_child(p)
					new_player.get_child(0).text = player["name"]
					new_player.get_child(2).get_child(0).texture = load(str(player["bodySprite"]))
					new_player.get_child(3).get_child(0).texture = load(str(player["hairSprite"]))
					#new_player.get_child(3).get_child(0).frame= player["hairColorFrame"]
					print("haircolorgrame" , player["hairColorFrame"])
					print("setframeto " , new_player.get_child(3).get_child(0).frame)
					new_player.get_child(5).get_child(0).texture = load(str(player["bottomsSprite"]))
					#new_player.get_child(5).get_child(0).frame = player["bottomsColorFrame"]
					new_player.get_child(6).get_child(0).texture = load(str(player["topsSprite"]))
					#new_player.get_child(6).get_child(0).frame =player["topsColorFrame"]
					new_player.get_child(7).get_child(0).texture = load(str(player["accSprite"]))
					get_node("YSort/OtherPlayers").add_child(new_player)
					get_node("YSort/OtherPlayers").get_node(str(player.id)).get_child(3).get_child(0).frame= player["hairColorFrame"]
					get_node("YSort/OtherPlayers").get_node(str(player.id)).get_child(5).get_child(0).frame = player["bottomsColorFrame"]
					get_node("YSort/OtherPlayers").get_node(str(player.id)).get_child(6).get_child(0).frame =player["topsColorFrame"]
					get_node("YSort/OtherPlayers").get_node(str(player.id))._setAnimationPlayerFrames(player["hairColorFrame"],player["bottomsColorFrame"],player["topsColorFrame"])
				
				else:
					print("printing ")
					for i in range(lastDataFromServer.size()):
						if lastDataFromServer[i].get("id") == player["id"]:
							if lastDataFromServer[i].get("message") != player["message"]:
								print("this hasnt been printed yet")
								print(player["id"], " " , player["message"])
								$Camera2D/ChatBox.add_message(str(player["name"]), player["message"],player["groupIndex"])
							if lastDataFromServer[i].get("x") != player["x"] || lastDataFromServer[i].get("y") != player["y"]:
								print("datax", lastDataFromServer[i].get("x"))
								print("new" , player["x"] )
								print(get_node("YSort/OtherPlayers").get_node(str(player.id)).position)
								get_node("YSort/OtherPlayers").get_node(str(player.id)).position = Vector2(player["x"], player["y"])
						print("before change ", lastDataFromServer)
					lastDataFromServer = payload;
					print("after change " , lastDataFromServer)
				
func _process(delta):
	Utils.data["x"] = $YSort/Player.position.x
	Utils.data["y"] = $YSort/Player.position.y
	ws.get_peer(1).put_packet(JSON.print(Utils.data).to_utf8())
	ws.poll()
	

"""func _spawnNewPlayer(player_id,spawn_position):
	if player_id != Utils.data["id"]:
		pass
	else:
		
"""
