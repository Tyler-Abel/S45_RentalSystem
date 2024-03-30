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
  while true do
    Wait(0)
    DrawMarker(Config.SandyMarker, Config.SandyLocs.x, Config.SandyLocs.y, Config.SandyLocs.z-1, 0.0, 0.0, 0.0,0.0,0.0,0.0, 1.0,1.0,1.0, Config.SandyMarkerColor.r, Config.SandyMarkerColor.g, Config.SandyMarkerColor.b, Config.SandyMarkerColor.a, false, true, 2, false, nil, nil, false)
  end
    
        
  local playerCoords = GetEntityCoords(PlayerPedId())
  for k, v in ipairs(Config.SandyLocs) do
    local RentalLocation = (v.x, v.y, v.z)

    while #(playerCoords - RentalLocation) <= Config.SandyMarkerScale do
      Wait(1)
      print('Works')
    end
  end
end)