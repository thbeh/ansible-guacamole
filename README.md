# ansible-guacamole

*adding this here to test if new branch is real*

Current guacamole version: 0.9.9

Current tomcat version: tomcat6 (Ubuntu), tomcat (CentOS)

## ISSUES:

----------------------------------------------------------------------------------

- Need to find a way to configure clients and servers with shared credentials/connections (LDAP probably)
- From the server, my additional connections show up but cannot connect (need to change tightvncserver creds)
	- after changing the specified port in user-mapping.xml on server, no longer says I am unable to connect but also is not connecting (no timeout)
	- localhost VNC does work on server
- I need to add tightvnc setup to Ansible bc I am doing that manually right now (focusing on guacamole)

[From "Configuring Guacamole":](http://guacamole.incubator.apache.org/doc/gug/configuring-guacamole.html)
> Guacamole reads files from its own configuration directory by default, resorting to the classpath only when this directory cannot be found. When locating this directory, Guacamole will try, in order:

>	- The directory specified within the system property guacamole.home.
>	- The directory specified within the environment variable GUACAMOLE_HOME.
>	- The directory .guacamole, located within the home directory of the user running the servlet container.

We will use the third option, with the configuration directory `/usr/share/tomcat6/.guacamole`

----------------------------------------------------------------------------------

## Use
1. add to user-mapping.xml on the server
  	```
  <connection name="atmoVM">
     <protocol>vnc</protocol>
     <param name="hostname">128.196.64.70</param>
     <param name="port">5901</param>
     <param name="password">password</param>
  </connection>
  ```

2. On client machines, change guacd-hostname in `guacamole.properties` to match the address of your server
3. Use the command `tightvncpasswd` to set new password that matches that in user-mapping.xml
4. 