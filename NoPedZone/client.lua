local function isPointInPoly(point, poly)
    local inside = false
    local j = #poly
    for i = 1, #poly do
        if ((poly[i].y > point.y) ~= (poly[j].y > point.y)) and
            (point.x < (poly[j].x - poly[i].x) * (point.y - poly[i].y) / (poly[j].y - poly[i].y) + poly[i].x) then
            inside = not inside
        end
        j = i
    end
    return inside
end

local function getZoneBounds(zone)
    local points = zone.points
    local minX, minY, minZ = points[1].x, points[1].y, points[1].z
    local maxX, maxY, maxZ = points[1].x, points[1].y, points[1].z
    for i = 2, #points do
        minX = math.min(minX, points[i].x)
        minY = math.min(minY, points[i].y)
        minZ = math.min(minZ, points[i].z)
        maxX = math.max(maxX, points[i].x)
        maxY = math.max(maxY, points[i].y)
        maxZ = math.max(maxZ, points[i].z)
    end
    return minX, minY, minZ, maxX, maxY, maxZ
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    for _, zone in ipairs(polyzones) do
        local minX, minY, minZ, maxX, maxY, maxZ = getZoneBounds(zone)
        if zone.disableRoads then
            SetRoadsInArea(minX, minY, minZ, maxX, maxY, maxZ, false, false)
        end
        if zone.disablePedPaths then
            SetPedPathsInArea(minX, minY, minZ, maxX, maxY, maxZ, false)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(pedDeletionWait)
        local playerPed = PlayerPedId()
        local handle, ped = FindFirstPed()
        local success
        repeat
            success = false
            if DoesEntityExist(ped) and GetEntityType(ped) == 1 and ped ~= playerPed then
                local pedCoords = GetEntityCoords(ped)
                local pedPoint = {x = pedCoords.x, y = pedCoords.y}
                for _, zone in ipairs(polyzones) do
                    if zone.enabledPedDeletion and isPointInPoly(pedPoint, zone.points) then
                        DeleteEntity(ped)
                        break
                    end
                end
            end
            success, ped = FindNextPed(handle)
        until not success
        EndFindPed(handle)
    end
end)