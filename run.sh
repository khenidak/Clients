# !/bin/bash

# builds and starts the web tier

set -e 
# because we get the API_HOST at runtime
# we sed it in the client side file
# and build the entire thing
# This will slow down container startup 
# but will make sure it runs every where locally or by an orchestrator


printf "Modifying Server Config with $API_HOST \n" 
sed -i "s/API_HOST/$API_HOST/g" /app/Web/js/serverconfig.js

printf "++ Server Config - Modeifed \n"
cat /app/Web/js/serverconfig.js


/app/gradlew build
cp /app/build/libs/mrp.war /usr/local/tomcat/webapps/


catalina.sh run

