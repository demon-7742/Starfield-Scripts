ScriptName ShipUnlockerScript extends ReferenceAlias

Actor Property PlayerRef Auto

Function OnInit()
	unlockShips()
	RegisterForRemoteEvent(PlayerRef, "OnHomeShipSet")
EndFunction

Event Actor.OnHomeShipSet(Actor akSender, spaceshipreference akShip, spaceshipreference akPrevious)
	Debug.Trace("New home ship set: " + akship, 0)
	unlockShips()
EndEvent

Function unlockShips() global
	Keyword locked = Game.GetForm(0x3413F2) as Keyword
	spaceshipreference[] ownedShips = Game.GetPlayerOwnedShips()
	Int I = 0
	While I < ownedShips.length
		ObjectReference ship = ownedShips[I] as ObjectReference
		if (ship.HasKeyword(locked))
			Debug.Trace("Player has a locked ship: " + ship, 0)
			ship.RemoveKeyword(locked)
		EndIf
		I = I + 1
	EndWhile
EndFunction
