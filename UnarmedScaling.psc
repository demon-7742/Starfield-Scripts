ScriptName UnarmedScaling extends Actor

GlobalVariable Property FistDamageMult Auto

Event OnInit()
	ScaleUnarmedDamage()
EndEvent

Event OnPlayerLoadGame()
	ScaleUnarmedDamage()
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	ScaleUnarmedDamage()
EndEvent

Function ScaleUnarmedDamage() Auto
	float damageMult = FistDamageMult.GetValue()
	Actor player = Game.GetPlayer()
	float newval = Game.GetPlayerLevel() * damageMult
	ActorValue UnarmedDamageAV = Game.GetForm(0x0002DF) as ActorValue
	player.SetValue(UnarmedDamageAV, newval)
EndFunction
