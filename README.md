# ansible-guacamole

Current guacamole version: 0.9.9

Current tomcat version: tomcat7 (Ubuntu), tomcat (CentOS)

## ISSUES:

1. Does not yet work with CentOS
2. Need to add `with_first_found` for finding variables to use different versions of Ubuntu and CentOS
3. I could make a dictionary for multiple user/pass combos
4. CentOS guacamole-client doesn't work, CentOS guacamole-server is untested

----------------------------------------------------------------------------------
## GUACAMOLE_HOME

[From "Configuring Guacamole":](http://guacamole.incubator.apache.org/doc/gug/configuring-guacamole.html)
> Guacamole reads files from its own configuration directory by default, resorting to the classpath only when this directory cannot be found. When locating this directory, Guacamole will try, in order:

>	- The directory specified within the system property guacamole.home.
>	- The directory specified within the environment variable GUACAMOLE_HOME.
>	- The directory .guacamole, located within the home directory of the user running the servlet container.

We will use the third option, with the configuration directory `/usr/share/tomcat7/.guacamole`

----------------------------------------------------------------------------------
## How To

1. Replace all < > wrapped variables with desired values
2. Fill out hosts file with correct information
3. Run guacamole_server_pb.yml on the server machine
4. Run guacamole_client_pb.yml on all client machines
5. Visit `your-hostname:8080/guacamole` and login
6. Use `Atl+Shift+Ctrl` to view the guacamole menu