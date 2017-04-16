scp = {}
scp.__list 	= {}
scp.__index = scp

function scp:Start (strName, strClass)
	self 			= {}
	self ["name"] 	= strName
	-- self ["class"] 	= strClass
	setmetatable (self, scp)

	scp.__list [strName] = self

	return self
end

function scp:GetAll ()
	return scp.__list
end

function scp:OnPlayerSpawnBase (pActor)
	pActor:UnSpectate 		()
	pActor:GodDisable 		()
	pActor:StripWeapons 	()
	pActor:RemoveAllAmmo 	()
	pActor:SetTeam      	(TEAM_SCP)
	pActor:AllowFlashlight 	(false)
	pActor:SetNoTarget 		(true)

	pActor.WasTeam 			= TEAM_SCP
	pActor.canblink 		= false
	pActor.handsmodel 		= nil
	pActor.BaseStats 		= nil
	pActor.UsingArmor 		= nil
end

function scp:OnPlayerSpawn 		(pActor)						return end
function scp:OnPlayerDeath 		(pActor, etWeapon, pAttacker) 	return end
function scp:OnPlayerAttack 	(pVictim, dmgInfo) 				return end
function scp:OnPlayerAttacked 	(pActor, dmgInfo) 				return end
function scp:OnRoundInit 		(pActor) 						return end
function scp:OnRoundStart 		(pActor) 						return end
function scp:OnRoundFinish 		(pActor) 						return end