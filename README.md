# ansible-guacamole

Current guacamole version: **0.9.9**
 
Current tomcat version: **tomcat7** (Ubuntu), **tomcat** (CentOS)

## Issues:

1. The user on the server is root, should change to be a guacamole user
2. Find a way to deal with the user's login password. Same as atmo? if so, how to get it?
 

----------------------------------------------------------------------------------
## GUACAMOLE_HOME

[From "Configuring Guacamole":](http://guacamole.incubator.apache.org/doc/gug/configuring-guacamole.html)
> Guacamole reads files from its own configuration directory by default, resorting to the classpath only when this directory cannot be found. When locating this directory, Guacamole will try, in order:

>	- The directory specified within the system property guacamole.home.
>	- The directory specified within the environment variable GUACAMOLE_HOME.
>	- The directory .guacamole, located within the home directory of the user running the servlet container.

We will use the third option, with the configuration directory `/usr/share/{{ TOMCAT_VERSION }}/.guacamole`

You can easily change this with the `GUACAMOLE_HOME` variable

----------------------------------------------------------------------------------
