# ELK5.0 SIEM with Bro IDS

#Setup
Set the interface for Bro and Suricata in the following locations. <br />
Bro:<br/>

Edit the "node.cfg" file in the /ELK/conf.d/bro/ directory.<br/>
Change the "interface=ens33" to reflect the interface you want to span"<br/>

#Usage
Run "docker-compose up -d" from the /ELK directory to start the applications.<br/>

Browse to Kibana:  http://HOST_IP:5601 <br/>

Configure the index using "bro-*"<br/>
Click discover to start browsing the logs.
