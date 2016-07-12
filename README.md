# ansible-guacamole

Current guacamole version: 0.9.9

Current tomcat version: tomcat6 (Ubuntu), tomcat (CentOS)

## ISSUES:

----------------------------------------------------------------------------------

- Need to find a way to configure clients and servers with shared credentials/connections (LDAP probably)
- I need to add tightvnc setup to Ansible bc I am doing that manually right now.
- When there are connection issues, first go to the client and close al VNC and run `tightvncserver` again

[From "Configuring Guacamole":](http://guacamole.incubator.apache.org/doc/gug/configuring-guacamole.html)
> Guacamole reads files from its own configuration directory by default, resorting to the classpath only when this directory cannot be found. When locating this directory, Guacamole will try, in order:

>	- The directory specified within the system property guacamole.home.
>	- The directory specified within the environment variable GUACAMOLE_HOME.
>	- The directory .guacamole, located within the home directory of the user running the servlet container.

We will use the third option, with the configuration directory `/usr/share/tomcat6/.guacamole`

----------------------------------------------------------------------------------

## Use

1. Use the command `tightvncpasswd` to set new password that matches that in user-mapping.xml

Currently the only user is root. I need to add `become_user:` make VNC sign in as other users