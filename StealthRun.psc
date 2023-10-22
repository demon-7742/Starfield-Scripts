ScriptName StealthRun extends Actor

GlobalVariable Property StealthSpeed Auto

Event OnEnterSneaking()
  speedUp()
EndEvent

Function speedUp()
	Actor player = Game.GetPlayer()
	float newSpeed = StealthSpeed.GetValue()
	float newAnimSpeed = ((newSpeed - 100) * 0.3) + 100
	ActorValue speedMult = Game.GetForm(0x0002DA) as ActorValue
	ActorValue animSpeed = Game.GetForm(0x0002D2) as ActorValue
	player.SetValue(speedMult, newSpeed)
	While player.IsSneaking()
		If player.GetAnimationVariableBool("IsFirstPerson")
			If player.GetValue(animSpeed) != 100.0
				player.SetValue(animSpeed, 100.0)
			EndIf
		Else
			If player.GetValue(animSpeed) != newAnimSpeed
				player.SetValue(animSpeed, newAnimSpeed)
			EndIf
		EndIf
;		Utility.Wait(0.1)
	EndWhile
	player.SetValue(animSpeed, 100.0)
	player.SetValue(speedMult, 100.0)
EndFunction
