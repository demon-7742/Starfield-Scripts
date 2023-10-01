ScriptName UnarmedScaling extends Actor

Event OnInit()
	ScaleUnarmedDamage()
EndEvent

Event OnPlayerLoadGame()
	ScaleUnarmedDamage()
EndEvent

Function ScaleUnarmedDamage() global
	Actor player = Game.GetPlayer()
	float newval = Game.GetPlayerLevel() * 1.5
	ActorValue UnarmedDamageAV = Game.GetForm(0x0002DF) as ActorValue
	player.SetValue(UnarmedDamageAV, newval)
EndFunction
