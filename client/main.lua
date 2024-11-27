local oldProximity = 0.0

CreateThread(function()
    for k, v in pairs(Config.MicrophoneZones) do

        local phoneZone = lib.zones.box({
        coords = v.coords,
        radius = v.data.range,
        debug = Config.Showzone
        })
        
        function phoneZone:onEnter()
            exports["pma-voice"]:overrideProximityRange(v.data.range, true)
        end
    
        function phoneZone:onExit()
            exports["pma-voice"]:clearProximityOverride()
        end


        --"microphone_"..v.name, v.coords, v.length, v.width, v.data)


        
        --[[RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
            if string.starts(ZoneName, "microphone_") then
                oldProximity =  LocalPlayer.state['proximity'].distance
                exports["pma-voice"]:overrideProximityRange(ZoneData.range, true)
            end
        end)
        
        RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
            if string.starts(ZoneName, "microphone_") then
                exports["pma-voice"]:clearProximityOverride()
            end
        end)]]
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(7)
        inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        for k,v in ipairs(Config.MicrophoneZones) do
            if v.spawnProp then
                local dist = #(pos - v.coords)
                if dist <= 150.0 then
                    if v.obj == nil then
                        local obj = CreateObject(GetHashKey(Config.MicrophoneZones.prop), vector3(v.coords.x, v.coords.y, v.coords.z - 1.0), false)
                        if v.data.heading ~= nil then
                            SetEntityHeading(obj, v.heading)
                        end
                        FreezeEntityPosition(obj, true)
                        v.obj = obj
                    end
                else
                    if v.obj then
                        DeleteEntity(v.obj)
                        v.obj = nil
                    end
                end
            end
        end

		if not inRange then
			Citizen.Wait(500)
		end
	end
end)



AddEventHandler('onResourceStop', function(resource)
	if (GetCurrentResourceName() ~= resource) then return end
    for k, v in pairs(Config.MicrophoneZones) do
        if v.obj then
            DeleteEntity(v.obj)
            v.obj = nil
        end
    end
end)