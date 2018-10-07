# domain-to-webapp
A simple bash script for finding web application hosted within a domain

<h1>Requirements</h1>
<ul>
  <li><a href="https://github.com/curl/curl">curl</a></li>
  <li><a href="https://github.com/subfinder/subfinder#running-in-a-docker-container">Subfinder docker image</a></li>
</ul>

<h1>Usage</h1>

<pre>
<code>
$sudo ./webAppChecker.sh businesssolutions.com
 ____                        _         _         __        __   _       _                
|  _ \  ___  _ __ ___   __ _(_)_ __   | |_ ___   \ \      / /__| |__   / \   _ __  _ __  
| | | |/ _ \| '_ ` _ \ / _` | | '_ \  | __/ _ \   \ \ /\ / / _ \ '_ \ / _ \ | '_ \| '_ \ 
| |_| | (_) | | | | | | (_| | | | | | | || (_) |   \ V  V /  __/ |_) / ___ \| |_) | |_) |
|____/ \___/|_| |_| |_|\__,_|_|_| |_|  \__\___/     \_/\_/ \___|_.__/_/   \_\ .__/| .__/ 
                                                                            |_|   |_|    
[+] Started subfinder for businesssolutions.com 
[!] Please be patient this might take while depending on the domain: businesssolutions.com 
[+] Successfully completed subfinder for businesssolutions.com
20www.businesssolutions.com
audit360.businesssolutions.com
autoconfig.us.businesssolutions.com
autodiscover.businesssolutions.com
careers.businesssolutions.com
chennareddy.businesssolutions.com
confluence.businesssolutions.com
cpanel.businesssolutions.com
drupal.businesssolutions.com
exchange.businesssolutions.com
helpdesk.businesssolutions.com
incontrol.businesssolutions.com
it.businesssolutions.com
jira.businesssolutions.com
jiratest.businesssolutions.com
lyncdiscover.businesssolutions.com
mail.businesssolutions.com
pop.businesssolutions.com
praveen.chennareddy.businesssolutions.com
sip.businesssolutions.com
supportng.businesssolutions.com
us.businesssolutions.com
waf.businesssolutions.com
webcast.businesssolutions.com
webdisk.businesssolutions.com
webmail.businesssolutions.com
www.businesssolutions.com
www.us.businesssolutions.com
www.webcast.businesssolutions.com

[+] IP Address Lookup Started for above sub-domains 
audit360.businesssolutions.com                                52.66.93.63                                                 
autoconfig.us.businesssolutions.com                           192.185.46.78                                               
autod.ms-acdc.office.com                                    40.100.137.56                                               
www2.jobdiva.com                                            173.251.125.134                                             
confluence.businesssolutions.com                              13.232.169.63                                               
cpanel.businesssolutions.com                                  192.185.46.78                                               
helpdesk.businesssolutions.com                                182.72.97.74                                                
incontrol.businesssolutions.com                               13.127.69.79                                                
jira.businesssolutions.com                                    35.154.173.102                                              
jiratest.businesssolutions.com                                13.232.205.62                                               
webdir.online.lync.com                                      52.113.67.14                                                
aadg.windows.net.nsatc.net                                  104.211.216.40                                              
sipdir.online.lync.com                                      52.113.67.75                                                
us.businesssolutions.com                                      192.185.46.78                                               
waf.businesssolutions.com                                     13.68.199.55                                                
webcast.businesssolutions.com                                 54.169.201.80                                               
webdisk.businesssolutions.com                                 192.185.46.78                                               
webmail.businesssolutions.com                                 192.185.46.78                                               
businesssolutions.com                                         13.232.136.27                                               
www.us.businesssolutions.com                                  192.185.46.78                                               
www.webcast.businesssolutions.com                             54.169.201.80                                               

[+] Checking WebApplication for above sub-domains 
Online Domains Are:
https://autod.ms-acdc.office.com/owa/
https://incontrol.businesssolutions.com/
https://jira.businesssolutions.com/secure/Dashboard.jspa
https://jira.businesssolutions.com/secure/MyJiraHome.jspa
https://jiratest.businesssolutions.com/secure/Dashboard.jspa
https://jiratest.businesssolutions.com/secure/MyJiraHome.jspa
https://www.businesssolutions.com/
http://www.businesssolutions.com

[+] Output saved to businesssolutions.com_webapps.lst
</code>
</pre>

<h1>Thanks to</h1>
<ul>
  <li><a href="https://github.com/subfinder/subfinder">Subfinder</h1></li>
</ul>
