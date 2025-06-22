-- INSTRUCTIONS:
-- 1. Set 'pedDeletionWait' to control how often (in ms) the script checks for and deletes peds in enabled zones.
-- 2. Add or edit polyzones in the 'polyzones' table below. Each polyzone is a table with:
--    - points: a list of vec3(x, y, z) coordinates outlining the zone (in order, forming a polygon).
--    - disableRoads: set to true to disable vehicle traffic in the zone (bounding box).
--    - disablePedPaths: set to true to disable ped pathing/spawning in the zone (bounding box).
--    - enabledPedDeletion: set to true to actively delete peds in the zone, or false to disable deletion for that zone.
--      NOTE: enabledPedDeletion does NOT control disablePedPaths. It is just a failsafe to remove any peds that might still spawn due to edge cases or script reloads.
-- 3. Only edit this file to change settings or add new zones. Do not edit the main script for configuration.
--
-- Example polyzone:
-- {
--   points = {
--     vec3(100.0, 100.0, 30.0),
--     vec3(150.0, 100.0, 30.0),
--     vec3(150.0, 150.0, 30.0),
--     vec3(100.0, 150.0, 30.0)
--   },
--   disableRoads = true,
--   disablePedPaths = true,
--   enabledPedDeletion = true
-- }

pedDeletionWait = 1000

polyzones = {
    { -- Nudist/Altruists Camp
        points = {
            vec3(-1190.39, 4885.55, 237.9),
            vec3(-1192.88, 4934.58, 235.19),
            vec3(-1144.86, 4981.6, 230.12),
            vec3(-1059.43, 4977.13, 210.65),
            vec3(-1029.06, 4900.31, 220.28),
            vec3(-1077.35, 4870.69, 227.02),
            vec3(-1112.15, 4848.05, 224.91),
            vec3(-1157.26, 4861.53, 239.71)
        },
        disableRoads = false,
        disablePedPaths = true,
        enabledPedDeletion = false
    },
    { -- Tequi-La-La
        points = {
            vec3(-566.05, 277.22, 83.14),
            vec3(-552.28, 277.12, 82.18),
            vec3(-550.04, 279.92, 82.98),
            vec3(-549.24, 289.91, 82.18),
            vec3(-555.58, 292.24, 82.61),
            vec3(-576.44, 294.26, 79.37),
            vec3(-577.05, 286.25, 95.13)
        },
        disableRoads = false,
        disablePedPaths = true,
        enabledPedDeletion = false
    }
}
