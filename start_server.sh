#!/bin/bash
# Conan Exiles Dedicated Server Start Script

# Make sure SteamCMD is updated
/opt/steamcmd/steamcmd.sh +quit

# Install/update server with SteamCMD
/opt/steamcmd/steamcmd.sh +force_install_dir /conanexiles +login anonymous +app_update 443030 validate +quit

# Start the server
echo "----------Debug Starts----------"
echo "$PWD"
ls -la
echo "----------Debug Ends----------"
./ConanSandboxServer -log -server -clusterid=MyCluster -Port=7777 -QueryPort=27015 -MaxPlayers=40 -SessionName="My Conan Exiles Server" -AdminPassword="admin123" -ServerPassword="" -NoBattlEye
