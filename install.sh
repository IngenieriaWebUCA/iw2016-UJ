#!/bin/bash

echo "*** Instalación de el proyecto web IW2016-UJ ***"
echo "Obteniendo proyecto del repositorio git"
git clone https://github.com/IngenieriaWebUCA/iw2016-UJ.git
cd iw2016-UJ/
echo "Creación de la base de datos."
read -p "Nombre de usuario BD:" usuario
mysql -u $usuario -p < Database/iw2016UJ.sql
echo "Aplicación desplegada. Dirijase a http://localhost:8080/iw2016-UJ/UJ_2016"
echo "Desplegando aplicación..."
cd UJ_2016/
sudo mvn tomcat7:run
