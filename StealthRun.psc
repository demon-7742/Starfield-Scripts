ScriptName StealthRunScript extends ReferenceAlias

GlobalVariable Property StealthSpeed Auto
Actor Property PlayerRef Auto

Event OnInit()
	RegisterForRemoteEvent(PlayerRef, "OnEnterSneaking")
EndEvent

Event Actor.OnEnterSneaking(Actor aksender)
	Debug.Trace("Stealth run 3", 0)
	speedUp()
EndEvent

Function speedUp()
	float newSpeed = StealthSpeed.GetValue()
	float newAnimSpeed = ((newSpeed - 100) * 0.3) + 100
	ActorValue speedMult = Game.GetForm(0x0002DA) as ActorValue
	ActorValue animSpeed = Game.GetForm(0x0002D2) as ActorValue
	PlayerRef.SetValue(speedMult, newSpeed)
	While PlayerRef.IsSneaking()
		If PlayerRef.GetAnimationVariableBool("IsFirstPerson")
			If PlayerRef.GetValue(animSpeed) != 100.0
				PlayerRef.SetValue(animSpeed, 100.0)
			EndIf
		Else
			If PlayerRef.GetValue(animSpeed) != newAnimSpeed
				PlayerRef.SetValue(animSpeed, newAnimSpeed)
			EndIf
		EndIf
;		Utility.Wait(0.1)
	EndWhile
	PlayerRef.SetValue(animSpeed, 100.0)
	PlayerRef.SetValue(speedMult, 100.0)
EndFunction
