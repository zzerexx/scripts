# Aimblox Gui  
  
## Features  
### Silent Aim  
### SILENT AIM IS PATCHED  
Enabled - Enables/Disables Silent Aim  
Target Type - The targeting method  
Target Part - The part that silent aim will hit  
Visible Check - Checks for player visibility    
Hit Chance - How often silent aim will hit players  
Fov - The radius of the fov circle  
Fov Sides - The number of sides the fov circle has  
Use Fov Circle - Limits the silent aim to only hit in the fov circle  
Dynamic Fov - Changes the fov size based on your camera's field of view  
Fov Visible - The fov circle visibility  
Fov Transparency - The fov circle transparency  
Fov Color - The fov circle color  
Rainbow Fov - Makes the fov circle cycle through colors  
Whitelist Players - Silent aim will ignore players that are in this list  
  
### ESP  
Boxes - Displays a box around the player  
Tracers - Draws a line from the top of the screen to the player  
Names - Displays the player's name  
Skeletons - Draws a line for each body part in the player's character  
Look Tracers - Draws a line that shows where the player is looking  
Team Check - Determines whether esp will display on teammates  
Transparency - The esp transparency  
Use Team Color - Uses the team's color  
Color - The esp color  
Show Distance - Shows the player's distance  
Show Health - Shows the player's health  
  
## Gun Mods  
Infinite Ammo - Gives your weapon an infinite amount of ammo  
No Recoil - Removes gun recoil and camera shake  
No Spread - Removes bullet spread  
No Gun Bob - Removes gun bob  
Instant Equip - Allows you to equip your weapon without a delay  
Instant Reload - Allows you to reload your weapon without a delay  
Instant Kill - Kills players with 1 shot (Silent Aim must be enabled)  
Bullet Speed - Determines how fast the bullet travels  
Fire Rate - Determines how fast your weapon shoots  
Firing Mode - Changes your weapon's firing mode  
Gun Rotation - Changes your weapon's rotation  
Custom Mods - Apply any weapon mod with any value  
  
### Stages  
Aim Assist - Moves your mouse to the targets  
Strength - How strong the aim assist is  
Require ADS - Determines whether it requires ADS to use aim assist  
  
### Player  
WalkSpeed - Changes your character's movement speed  
Infinite Jump - Allows you to jump infinitely  
Field Of View - Changes your camera's field of view  
Third Person - View your character while in first-person mode  
Third Person Distance - Changes how far your camera is from your character  
Show Weapon in 3P - Determines whether your weapon is visible in third person  
Character Material - Changes your character's material  
Character Color - Changes your character's color  
Rainbow Character - Makes your character cycle through colors  
Hide Accessories - Determines whether your accessories are visible or not  
Spoof Stance - Spoofs your character's stance  
Teleport to Player - Teleports you to the specified player  
  
### Misc  
Teleport to Lobby - Teleports to the lobby  
Teleport to Competitive - Teleports to the competitive mode  
Redeem All Codes - Redeems all available codes  
Rejoin Game - Rejoins the current server  
Sound Replication - Determines whether sound will replicate to the server  
Bullet Tracers - Shows bullet trajectory  
Bullet Tracer Transparency - The bullet tracer transparency  
Bullet Tracer Duration - How long the bullet tracer lasts  
Bullet Tracer Color1 - The first color of the bullet tracer  
Bullet Tracer Color2 - The second color of the bullet tracer  
Impact Points - Shows bullet impacts  
Impact Point Transparency - The impact point transparency  
Impact Point Duration - How long the impact point lasts  
Impact Point Color - The color of the impact point  
Impact Point Size - The size of the impact point  
Impact Point Material - The material of the impact point  
Gun Material - Changes your weapon's material  
Gun Reflectance - Changes your weapon's reflectance  
Gun Color - Changes your weapon's color  
Rainbow Gun - Makes your weapon cycle through colors  
Arm Material - Changes your arms' material  
Arm Reflectance - Changes your arms' reflectance  
Arm Color - Changes your arms' color  
Rainbow Arms - Makes your arms cycle through colors  
Hide Gloves - Determines whether your gloves are visible or not  
Join Team - Joins the selected team  
Skybox - Changes the skybox    
  
### Settings  
Auto Save - Automatically saves your settings  
Auto Save Intervals - Changes how often auto save will save  
Last Save - Shows the last time you saved your settings  
Delete Save - Deletes your save file  
Safe Mode - Checks if Aimblox has updated before loading Aimblox Gui. Hopefully this will prevent any newly-added detections  
UI Style - Changes the UI style (1-3)  
UI Theme - Changes the UI theme  

## Required Functions  
Your exploit must have the following functions to run aimblox gui.  
- getgenv  
- getgc  
- setreadonly  
- loadstring  
- readfile  
- writefile  
- isfile  
- delfile  
- hookfunction  
- hookmetamethod  
- Drawing.new  

## Error Codes  
Sometimes aimblox gui will error, a message box should appear with an error message and code.  
  
### 0  
"Failed to load save file"  
Your save file is probably messed up, please delete "aimbloxsettings.json" and try again.  
  
### 1  
"Universal ESP failed to load"  
I use my Universal ESP script to make things easier.  
This means that Universal ESP errored, or Github is down.  
  
### 2 - 7  
"___ page failed to load"  
This means that one of the pages has an error, please report this to zzerexx#3970.  
  
### 8  
"Failed to hook _FireInternal function"  
Make sure your exploit has "hookfunction"  

### 9  
"Failed to hook __namecall method"  
Make sure your exploit has "hookmetamethod"  
