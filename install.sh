#!/bin/bash
echo "Creación de la base de datos."
echo "Introduzca nombre de usuario ya existente en la BD con permisos de administración (root): "
read  usuario
mysql -u $usuario -p<iw2016UJ.sql
echo "Aplicación desplegada. Dirijase a http://localhost:8080/iw2016-UJ/UJ_2016"
echo "Desplegando aplicación..."
cd UJ_2016/
sudo mvn tomcat7:run