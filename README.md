# ansible-guacamole

Current guacamole version: 0.9.9

Current tomcat version: tomcat7 (Ubuntu), tomcat (CentOS)

## ISSUES:

1. Does not yet work with CentOS
2. Need to add `with_first_found` for finding variables to use different versions of Ubuntu and CentOS
3. I could make a dictionary for multiple user/pass combos
4. Need to download guacamole files and include them in ansible rather than downloading directly

----------------------------------------------------------------------------------

- Need to find a way to configure clients and servers with shared credentials/connections (LDAP probably)
- I need to add tightvnc setup to Ansible bc I am doing that manually right now.
- When there are connection issues, first go to the client and close al VNC and run `tightvncserver` again

[From "Configuring Guacamole":](http://guacamole.incubator.apache.org/doc/gug/configuring-guacamole.html)
> Guacamole reads files from its own configuration directory by default, resorting to the classpath only when this directory cannot be found. When locating this directory, Guacamole will try, in order:

>	- The directory specified within the system property guacamole.home.
>	- The directory specified within the environment variable GUACAMOLE_HOME.
>	- The directory .guacamole, located within the home directory of the user running the servlet container.

We will use the third option, with the configuration directory `/usr/share/tomcat7/.guacamole`

----------------------------------------------------------------------------------

