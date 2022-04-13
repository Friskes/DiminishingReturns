local addon = DiminishingReturns
if not addon then return end

-- FrameXMLXXX is a internal fake to have this working like other support
addon:RegisterAddonSupport('FrameXMLParty', function()

	local db = addon.db:RegisterNamespace('Blizzard_Party', {profile={
		enabled = false,
		iconSize = 30,
		direction = 'RIGHT',
		spacing = 2,
		anchorPoint = 'LEFT',
		relPoint = 'RIGHT',
		xOffset = 0,
		yOffset = 5,
		-- categories
		["cheapshot"] = true,
		["scatters"] = true,
		["ctrlstun"] = true,
		["rndroot"] = true,
		["charge"] = true,
		["disarm"] = true,
		["rndstun"] = true,
		["ctrlroot"] = true,
		["cyclone"] = true,
		["disorient"] = true,
		["taunt"] = true,
		["sleep"] = true,
		["entrapment"] = true,
		["banish"] = true,
		["silence"] = true,
		["horror"] = true,
		["fear"] = true,
		["mc"] = true,
	}})

	local function GetDatabase() 
		return db.profile, db
	end

	addon:RegisterFrameConfig(addon.L['Party'], GetDatabase)

	local function SetupFrame(frame)
		return addon:SpawnFrame(frame, frame, GetDatabase)
	end

	for i = 1,4 do
		addon:RegisterFrame('PartyMemberFrame'..i, SetupFrame)
	end
end)
