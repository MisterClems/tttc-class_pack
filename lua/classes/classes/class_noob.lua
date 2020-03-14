CLASS.AddClass("NOOB", {
	color = Color(60, 60, 80, 255),
	passiveItems = {

	},
	onClassSet = function(ply)
		if SERVER then
			ply:GiveArmor(60)
			ply:SetHealth(50)
			ply:SetMaxHealth(50)
		end
	end,
	onClassUnset = function(ply)
		if SERVER then
			ply:RemoveArmor(60)
			ply:SetHealth(100)
			ply:SetMaxHealth(100)
		end
	end,
	passiveWeapons = {
		"swep_homingpigeon",
		"weapon_ttt_mirrorfate"
	},
	lang = {
		name = {
			English = "Noob",
			Deutsch = "Anfänger"
		},
		desc = {
			English = "Yep, you're a noob...",
			Deutsch = "Jap, du bist ein Noob..."
		}
	}
}, {random = 15})