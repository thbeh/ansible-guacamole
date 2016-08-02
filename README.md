# ansible-guacamole

Current guacamole version: **0.9.9**
 
Current tomcat version: **tomcat7** (Ubuntu), **tomcat** (CentOS)

## Issues:

1. Need to variablize a lot of the database setup
	- JDBC and guacamole-jdbc.jar versions
	- paths
2. Need to figure out how to add connection passwords directly into the database
 

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
	- `install-guacamole-client/defaults/main.yml`: `VNC_USER` and `VNC_PASS`
	- `install-guacamole-server/defaults/main.yml`: `CLIENTS` and `USERS` dictionaries

2. Fill out `hosts` file with correct information
3. Navigate to the `ansible-guacamole` directory
4. Run `guacamole_server_pb.yml` on the server machine:

	`ansible-playbook playbooks/guacamole_server_pb.yml`

5. Run `guacamole_client_pb.yml` on all client machines:

	`ansible-playbook playbooks/guacamole_client_pb.yml`

6. Visit `your-hostname:8080/guacamole` and login (using credentials set in `USERS` dictionary)
7. Use `Alt+Shift+Ctrl` to view the Guacamole menu

This branch uses database authentication rather than `user-mapping.xml` 

Default credentials are:

	Username: guacadmin

	Password: guacadmin


`INSERT INTO guacamole_user (username, password_salt, password_hash) VALUES ('newuser2','$2a$08$ZYAIE6Zs2C8McZ4m0VuToe', digest(crypt('password', '$2a$08$ZYAIE6Zs2C8McZ4m0VuToe'), 'sha256'));`

`select password_salt from guacamole_user where username='newuser2';`

`update guacamole_user set password_hash =\x1e250b87359eba6a216eb099e81e2cbf59505528b08aeaea13fa440f73f2e038' where username='myuser';`

`update guacamole_user set password_salt = gen_salt('bf',8)::bytea;`


