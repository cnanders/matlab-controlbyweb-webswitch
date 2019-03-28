# matlab-controlbyweb-webswitch
MATLAB Communication with Control by Web WebSwitch Remote Power Switch via HTTP

The default IP Address is `ip` = 192.168.1.2.  The following URLs are relative to `ip`.

- Get the XML state of the device `/state.xml`
- Turn on relay 1 `/state.xml?relay1State=1`
- Turn off relay 1 `/state.xml?relay1State=0`
- Turn on relay 2 `/state.xml?relay2State=1`
- Turn off relay 2 `/state.xml?relay2State=0`


Change the IP `/setup.html` 
- username: admin
- password: webswitch


Manual: https://www.controlbyweb.com/webswitch/webswitch_users_manual.pdf