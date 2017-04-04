# RETO_12

Esta actividad consiste en analizar datos usando Apache Flink y Zeppelin.

Se proporciona un docker-compose.yml en este repositorio que lanza las dos herramientas. Los pasos para arrancar el entorno son:
1 - Entrar en una maquina linux con git, docker y docker-compose instalados.
2 - Clonar este repositorio "git clone https://github.com/germanblanco/RETO_12.git"
3 - Construir las imagenes docker "cd RETO_12; docker-compose build". Este paso tarda un rato y aparece el error "localhost [127.0.0.1] 8080 (http-alt) : Connection refused" varias veces (entre 5 y 20). Esto es normal.
4 - Lanzar el entorno con "docker-compose up"

Para el resto de los ejercicios, Zeppelin esta accesible en la URL: http://<IP de la maquina Linux donde se hizo docker-compose up>:8888

Una vez hecho esto, crear un interprete de Flink en Zeppelin y hacer una prueba como indican estas instrucciones https://zeppelin.apache.org/docs/0.7.0/interpreter/flink.html.

El reto final sera buscarse unos datos majos en internet y presentar algunos graficos usando Zeppelin. Por ejemplo del Registro Vasco de emisiones y fuentes contaminantes del 2015 http://opendata.euskadi.eus/w79-home/es o de los indicadores de desarrollo del Banco Mundial http://data.worldbank.org/data-catalog/world-development-indicators

Si tengo tiempo esta tarde agrego un ejemplo completo.
