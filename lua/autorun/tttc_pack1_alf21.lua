if SERVER then
    AddCSLuaFile()
    
    -- add other addons
    -- ghost knife
    resource.AddWorkshop("1326662749")
    
    -- blink
    resource.AddWorkshop("802015788")
    
    -- cloaking device
    resource.AddWorkshop("922599473")
    
    -- manipulator
    resource.AddWorkshop("671603913")
end

hook.Add("TTT2_PreClassesInit", "InitClassPackOne", function()
    AddCustomClass("MANIPULATOR", {
        --color = Color(),
        name = "manipulator"
    })

    AddCustomClass("GHOST", {
        --color = Color(),
        name = "ghost"
    })

    AddCustomClass("SPEEDER", {
        --color = Color(),
        name = "speeder"
    })
end)

hook.Add("TTT2_FinishedClassesSync", "TTT2ClassPackInit", function(ply, first)
	if CLIENT and first then -- just on client and first init !

		-- setup here is not necessary but if you want to access the role data, you need to start here
		-- setup basic translation !
		LANG.AddToLanguage("English", CLASSES.MANIPULATOR.name, "Manipulator")
		LANG.AddToLanguage("English", CLASSES.GHOST.name, "Ghost")
		LANG.AddToLanguage("English", CLASSES.SPEEDER.name, "Speeder")
        
        -- just this language too
		LANG.AddToLanguage("Deutsch", CLASSES.MANIPULATOR.name, "Manipulierer")
		LANG.AddToLanguage("Deutsch", CLASSES.GHOST.name, "Geist")
		LANG.AddToLanguage("Deutsch", CLASSES.SPEEDER.name, "Speeder")
    end
end)

if SERVER then
    hook.Add("TTT2_ReceiveCustomClass", "TTT2ClassPackSetup", function(ply)
        if ply:Alive() and ply:HasCustomClass() then
            local cls = ply:GetCustomClass()
            
            if cls == CLASSES.MANIPULATOR.index then
                ply:GiveClassWeapon("weapon_ttt_satm")
            elseif cls == CLASSES.GHOST.index then
                ply:GiveClassWeapon("weapon_ttt_cloak")
                ply:GiveClassWeapon("weapon_ttt_ghostknife")
            elseif cls == CLASSES.SPEEDER.index then
                ply:GiveClassWeapon("weapon_vadim_blink")
            end
        end
    end)
end