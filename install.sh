#!/bin/bash
echo "Creación de la base de datos."
read -p "Nombre de usuario BD:" usuario
mysql -u $usuario -p < Database/iw2016UJ.sql
echo "Aplicación desplegada. Dirijase a http://localhost:8080/iw2016-UJ/UJ_2016"
echo "Desplegando aplicación..."
cd UJ_2016/
sudo mvn tomcat7:run
