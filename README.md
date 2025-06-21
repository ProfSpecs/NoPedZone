NoPedZone is a lightweight, configurable FiveM resource that prevents pedestrian and vehicle spawns in custom polyzones.
It is ideal for server owners who want to keep certain areas clear of ambient peds and traffic, such as event zones, interiors, or custom maps.

Features:  
Block peds and vehicles from spawning in any area you define.  
Supports multiple, custom-shaped polyzones (not just rectangles).  
Toggle ped deletion, road disabling, and ped path disabling per zone.  
Easy configuration via config.lua.  
Minimal performance impact

How It Works:  
Define your zones and settings in config.lua.  
The script disables roads and ped paths (if enabled) in those zones.  
Any peds that still spawn in the area are automatically deleted as a failsafe.  

Installation:
Download or clone this repository into your server’s resources folder.  
Edit config.lua to set up your zones and preferences.  
Add ensure NoPedZone to your server.cfg.  

Configuration:  
All settings are in config.lua.

Each zone can have:  
Custom polygon shape (list of vec3 points).  
disableRoads (true/false).  
disablePedPaths (true/false).  
enabledPedDeletion (true/false, for failsafe deletion).  

Credits:
Script by Specs, with help from GitHub Copilot.
