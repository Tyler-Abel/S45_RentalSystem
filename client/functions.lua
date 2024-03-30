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

function isPlayerInsideMarker(playerPed, markerCoords, radiusSquared)
  local playerCoords = GetEntityCoords(playerPed)
  local distanceSquared = Vdist2(playerCoords.x, playerCoords.y, playerCoords.z, markerCoords.x, markerCoords.y, markerCoords.z)
  return distanceSquared <= radiusSquared
end