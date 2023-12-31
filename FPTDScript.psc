ScriptName FPTDScript extends Quest

Actor Property PlayerRef Auto

Event OnInit()
	Debug.Trace("FPTD Script Loaded", 0)
	spaceshipreference playerShip = Game.GetPlayerHomeSpaceShip()
	RegisterForRemoteEvent(playerShip, "OnShipScan")
	RegisterForRemoteEvent(PlayerRef, "OnHomeShipSet")
	planet curPlanet = Game.GetPlayer().GetCurrentPlanet()
EndEvent

Event Actor.OnHomeShipSet(Actor akSender, spaceshipreference akShip, spaceshipreference akPrevious)
	Debug.Trace("FPTD new home ship set: " + akship, 0)
	UnregisterForRemoteEvent(akPrevious, "OnShipScan")
	RegisterForRemoteEvent(akShip, "OnShipScan")
EndEvent

Event spaceshipreference.OnShipScan(spaceshipreference akSender, Location aPlanet, ObjectReference[] aMarkersArray)
	Debug.Trace("Ship scanned: " + aPlanet, 0)
	ScanPlanetComplete(aPlanet.GetCurrentPlanet())
EndEvent

Function ScanPlanetComplete(planet akPlanet) global
	planet planetToCheck
	sq_parentscript SQ_Parent = Game.GetForm(0x007092C) as sq_parentscript
	GlobalVariable vChance = Game.GetForm(0x2508F2) as GlobalVariable
	float originalChance = vChance.GetValue()
	If akPlanet == None
		planetToCheck = Game.GetPlayer().GetCurrentPlanet()
	Else
		planetToCheck = akPlanet
	EndIf
	Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(44)
	vChance.SetValue(100.0)
	If matchingKeywords.Length > 0
		SQ_Parent.OnPlayerScanPlanet(planetToCheck)
		SQ_Parent.OnPlayerScanPlanet(planetToCheck)
		SQ_Parent.OnPlayerScanPlanet(planetToCheck)
		SQ_Parent.OnPlayerScanPlanet(planetToCheck)
		SQ_Parent.OnPlayerScanPlanet(planetToCheck)
		Debug.Trace(planetToCheck + " learned new traits: " + matchingKeywords, 0)
	EndIf
	vChance.SetValue(originalChance)
EndFunction
