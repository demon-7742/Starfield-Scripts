ScriptName UnarmedScalingScript extends ReferenceAlias

GlobalVariable Property FistDamageMult Auto
Actor Property PlayerRef Auto

Event OnInit()
	ScaleUnarmedDamage()
	RegisterForRemoteEvent(Game.GetForm(0x29E181) as Quest, "OnStoryIncreaseLevel")
EndEvent

Event OnPlayerLoadGame()
	ScaleUnarmedDamage()
EndEvent

Event Quest.OnStoryIncreaseLevel(Quest aksender, int aiNewLevel)
	Debug.Trace("ScaleUnarmedDamage - Player Level Up", 0)
	ScaleUnarmedDamage()
EndEvent

Function ScaleUnarmedDamage() Auto
	float damageMult = FistDamageMult.GetValue()
	float newval = Game.GetPlayerLevel() * damageMult
	ActorValue UnarmedDamageAV = Game.GetForm(0x0002DF) as ActorValue
	PlayerRef.SetValue(UnarmedDamageAV, newval)
EndFunction
