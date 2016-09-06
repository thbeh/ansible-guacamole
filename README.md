# ansible-guacamole

install apache guacamole server with ansible.
it install mysql and ldap extension.
Current guacamole version: **0.9.9**
Current guacamole client version: including war  and extensions: **0.9.10-incubator**
Current tomcat version: **tomcat8** (Ubuntu), **tomcat** (CentOS)

this project is derived from https://github.com/calvinmclean/ansible-guacamole

GUACAMOLE_HOME is default to `/usr/share/{{ TOMCAT_VERSION }}/.guacamole`, it's also soft link to /etc/guacamole.


