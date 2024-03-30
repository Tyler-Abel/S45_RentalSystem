RegisterNetEvent('S45_Rental:RentVehicle')
AddEventHandler('S45_Rental:RentVehicle', function(data)
  print('Button works')
  spawnCar(data.veh, vector3(331.7, 3385.68, 36.4), 111.02)
end)

---- Blip and Marker Logic ----
Citizen.CreateThread(function()
    blip = AddBlipForCoord(Config.SandyLocs.x, Config.SandyLocs.y, Config.SandyLocs.z)
    SetBlipSprite(blip, Config.SandyBlip)
    SetBlipColour(blip, Config.SandyBlipColor)
    SetBlipDisplay(blip, 6)
    SetBlipScale(blip, Config.SandyBlipScale)
    AddTextEntry('SANDY', 'Sandy Shores Offroad Rental')
    BeginTextCommandSetBlipName('SANDY')
    SetBlipCategory(blip, 2)
    EndTextCommandSetBlipName(blip)
    print('Blip Init: '..blip)
end)

Citizen.CreateThread(function()
	while not NetworkIsSessionStarted() do -- Wait for the user to load
		Wait(500)
	end

	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())

		-- Check the markers
    while #(GetEntityCoords(PlayerPedId()) - Config.SandyLocs) <= 1.0 do
      Citizen.Wait(0)
      Draw3DText(Config.SandyLocs.x, Config.SandyLocs.y, Config.SandyLocs.z, 0.75, "Press ~y~[E]~w~ to open menu")
      DrawGroundMarker(Config.SandyLocs.x, Config.SandyLocs.y, Config.SandyLocs.z)
      if IsControlJustReleased(0, 51) then
        -- DO WHATEVER YOU WANT HERE
      end
    end
	end
end)