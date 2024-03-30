function spawnCar(veh, coords, heading)

  local car = GetHashKey(veh)

  RequestModel(car)
  while not HasModelLoaded(car) do
    RequestModel(car)
    Wait(50)
  end

  local vehicle = CreateVehicle(car, coords, heading, true, false)
  SetPedIntoVehicle(PlayerPedId(), vehicle, -1)

  SetEntityAsNoLongerNeeded(vehicle)
  SetModelAsNoLongerNeeded(vehicleName)
end

function help(msg)
  BeginTextCommandDisplayHelp("THREESTRINGS") -- DON'T CHANGE THIS
  AddTextComponentSubstringPlayerName(msg)
  EndTextCommandDisplayHelp(0, false, false, 0)
end

function Draw3DText(x, y, z, scl_factor, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov * scl_factor
  if onScreen then
      SetTextScale(0.0, scale)
      SetTextFont(0)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 215)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(2, 0, 0, 0, 150)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x, _y)
  end
end

function DrawGroundMarker(x, y, z)
DrawMarker(25, x, y, z - 1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 3, 15, 250, 75, false, true, 2, nil, nil, false)
end