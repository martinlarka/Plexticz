import requests, sys
MYMACHINEID = "[machineid]"
DOMOTICZIP = 'http://127.0.0.1:8080'
plexAction = sys.argv[1] #Action
plexMachineId = sys.argv[2] #Machine_id
plexPlayTime = sys.argv[3] # Remaning time
if plexMachineId == MYMACHINEID and int( float( plexPlayTime ) ) > 45:
	print "Sending"
	r = requests.get( DOMOTICZIP + '/json.htm?type=command&param=updateuservariable&vname=PlexTime&vtype=4&vvalue='+ plexPlayTime )
	r = requests.get( DOMOTICZIP + '/json.htm?type=command&param=updateuservariable&vname=PlexAction&vtype=2&vvalue='+ plexAction )
