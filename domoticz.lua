t1 = os.time()
s = uservariables_lastupdate['PlexAction']

year = string.sub(s, 1, 4)
month = string.sub(s, 6, 7)
day = string.sub(s, 9, 10)
hour = string.sub(s, 12, 13)
minutes = string.sub(s, 15, 16)
seconds = string.sub(s, 18, 19)


commandArray = {}

-- Plex stoped --
t2 = os.time{year=year, month=month, day=day, hour=hour, min=minutes, sec=seconds}
plexTimeSeconds = uservariables['PlexTime'] * 60
difference = (os.difftime (t1, t2))
if (uservariables['PlexTime'] > 0 and otherdevices['Fönster vardagsrum'] == 'Off' and difference > plexTimeSeconds) then
   print ("Plex stoped");
   commandArray['Fönster vardagsrum'] = 'On';
   commandArray['Variable:PlexAction'] = "Stop";
   commandArray['Variable:PlexTime'] = "0";
end 

-- Plex play --
if (otherdevices['Fönster vardagsrum'] == 'On' and uservariables['PlexAction'] == "Play") then
   print ("Playing Plex til " .. uservariables['PlexTime']);
   commandArray['Fönster vardagsrum'] = 'Off';
end


return commandArray