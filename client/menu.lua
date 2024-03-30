-- RegisterCommand('+rent', function()
--   TriggerEvent('S45_rental:Sandy')
-- end, false)

RegisterNetEvent('S45_rental:Sandy', function()
  TriggerEvent('nh-context:sendMenu', {
      {
          id = 1,
          header = "Sandy Rental",
          txt = ""
      },
      {
          id = 2,
          header = "Sanchez",
          txt = "",
          params = {
              event = "S45_Rental:RentVehicle",
              args = {
                veh = 'sanchez'
              }
          }
      },
  })
end)
