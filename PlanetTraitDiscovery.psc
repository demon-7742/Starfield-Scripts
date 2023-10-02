ScriptName PlanetTraitDiscovery extends Actor

spaceshipreference Property PlayerShip Auto

Event OnInit()
	PlayerShip = Game.GetPlayerHomeSpaceShip()
	Debug.Trace("Scan Script Loaded", 0)
	RegisterForRemoteEvent(PlayerShip, "OnShipScan")
;	RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
	planet curPlanet = Game.GetPlayer().GetCurrentPlanet()
EndEvent

Event spaceshipreference.OnShipScan(spaceshipreference akSender, Location aPlanet, ObjectReference[] aMarkersArray)
	Debug.Trace("Ship scanned: " + aPlanet, 0)
	ScanPlanetComplete(aPlanet.GetCurrentPlanet())
EndEvent

;Event spaceshipreference.OnLocationChange(spaceshipreference akSource, Location akOldLoc, Location akNewLoc)
	;planet planetToCheck = akNewLoc.GetCurrentPlanet()
	;Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(44)
	;If matchingKeywords.Length > 0
	;	Int knownTraits = 0
	;	Int I = matchingKeywords.Length - 1
	;	While I > -1
	;		If planetToCheck.IsTraitKnown(matchingKeywords[I])
	;			knownTraits += 1
	;		EndIf
	;		I += -1
	;	EndWhile
	;	If knownTraits != matchingKeywords.Length >= 1
	;	EndIf
	;EndIf
	;ok I have no idea how to make a planet re-scannable
;EndEvent

Function ScanPlanetComplete(planet planetToCheck) global
	If planetToCheck == None
		planetToCheck = Game.GetPlayer().GetCurrentPlanet()
	EndIf
	Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(44)
	If matchingKeywords.Length > 0
		Int I = matchingKeywords.Length - 1
		While I > -1
			If planetToCheck.IsTraitKnown(matchingKeywords[I])
				matchingKeywords.remove(I, 1)
			EndIf
			I += -1
		EndWhile
		While matchingKeywords.Length >= 1
			Int randomKeyword = Utility.RandomInt(0, matchingKeywords.Length - 1)
			Keyword keywordToCheck = matchingKeywords[randomKeyword]
			matchingKeywords.remove(randomKeyword, 1)
			Debug.Trace(planetToCheck + " learned new trait: " + keywordToCheck, 0)
			planetToCheck.SetTraitKnown(keywordToCheck, true)
		EndWhile
	EndIf
EndFunction

