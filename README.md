# ip-logger
A small script for periodic logging of public IP address or DNS records

This small script can be used to log your public IP or the DNS records of a hostname. Further a timecheck to verify your correct local time is possible.

# Usage:
### Configuration:
- ```logfile="./ip.log"```  File to log into, must be defined!!
- ```apiurl="https://api.ipify.org"```  API used for getting public IP address, will be skipped if ```""```
- ```hostname="github.com"``` Hostname to log DNS records, will be skipped if ```""```

### Running:
Call the script manually to check functionality:
- On first run, make the script executable: ```chmod +x ip-logger.sh```
- Normal execution (without checking correct local time): ```./ip-logger.sh```
- Extended execution (checking correct local time): ```./ip-logger.sh timecheck```

# Periodically execution of script using a cronjob:

- Open crontable with ```crontab -e```

- Place:
```bash
# m h  dom mon dow   command
0 *  * * *   /home/username/ip-logger/ip-logger.sh timecheck
```

Remove ```timecheck``` for execution without timecheck.

- Save using Ctrl + O, Return, Ctrl + X
