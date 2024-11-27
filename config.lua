Config = {}

Config.Showzone = false

Config.MicrophoneZones = {
    [1] = {
        name = "cityhall_courtroom_center", 
        coords = vector3(-572.97, -208.06, 38.27),
        length = 1.0,
        width = 1.0,
        prop = "v_ilev_fos_mic",
        spawnProp = false, -- if set to true, it will let you spawn the prop at location
        data = {
                range = 50.0 -- range for the voice
        }

    },
    [2] = {
        name = "cityhall_courtroom_judge", 
        coords = vector3(-576.33, -210.02, 38.56),
        length = 1.0,
        width = 1.0,
        prop = "v_ilev_fos_mic",
        spawnProp = false, -- if set to true, it will let you spawn the prop at location
        data = {
                range = 50.0 -- range for the voice
        }
    },
    [3] = {
        name = "cityhall_courtroom_witnessleft", 
        coords = vector3(-577.35, -208.08, 38.4),
        length = 1.0,
        width = 1.0,
        prop = "v_ilev_fos_mic",
        spawnProp = false, -- if set to true, it will let you spawn the prop at location
        data = {
                range = 50.0 -- range for the voice
        }
    },
    [4] = {
        name = "cityhall_courtroom_witnessright", 
        coords = vector3(-575.39, -212.04, 38.37),
        length = 1.0,
        width = 1.0,
        prop = "v_ilev_fos_mic",
        spawnProp = false, -- if set to true, it will let you spawn the prop at location
        data = {
                range = 50.0 -- range for the voice
        }
    }
}

