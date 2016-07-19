# ansible-guacamole

Current guacamole version: **0.9.9**

Current tomcat version: **tomcat7** (Ubuntu), **tomcat** (CentOS)

## Issues:

1. Need to add `with_first_found` for finding variables to use different versions of Ubuntu and CentOS
2. To improve multi-user capability:
	- Add `authorized-users` list in the `CLIENTS` dictionary and an if statement in `user-mapping.xml.j2` template so the for loop will only add clients if `CLIENTS[item].authoried-users` contains `USERS[thing].name`
	
	**OR**
	
	- Add `boxes` list in the `USERS` dictionary containing the keys from the `CLIENTS` dictionary and then iterate over that dictionary using those keys: `{% for item in USERS[thing].boxes %}` so each "item" will be a key for `CLIENTS`

----------------------------------------------------------------------------------

## Changes:

1. Now works with CentOS 6
2. Added dictionary for multiple user capabilities


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
## How to use it:

####Verify files:

```
calvinmclean$ openssl md5 guacamole-0.9.9.war 
MD5(guacamole-0.9.9.war)= 324c17aa305a077a2127378a2d0a7a51
```
```
calvinmclean$ openssl md5 guacamole-server-0.9.9.tar.gz 
MD5(guacamole-server-0.9.9.tar.gz)= cce818bfcba35fe0456b45d988118893
```

Run the commands above to verify the md5 checksum. If the result is the same as mine, the files are valid.

####Run the Ansible:

**Step 0:** *If there is a [newer version of Guacamole](http://guacamole.incubator.apache.org/releases/) out, replace the files in the* `roles/install-guacamole-server/files/` *directory and change* `GUACAMOLE_VERSION` *var to match the new version.*

1. Replace all `< >` wrapped variables with desired values

2. Fill out `hosts` file with correct information
3. Run `guacamole_server_pb.yml` on the server machine:

	`ansible-playbook -l guac-server playbooks/guacamole_server_pb.yml`

4. Run `guacamole_client_pb.yml` on all client machines:

	`ansible-playbook -l guac-clients playbooks/guacamole_client_pb.yml`

5. Visit `your-hostname:8080/guacamole` and login (using `USERS` dictionary)
6. Use `Alt+Shift+Ctrl` to view the Guacamole menu