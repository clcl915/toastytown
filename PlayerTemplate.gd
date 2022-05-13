extends KinematicBody2D


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
