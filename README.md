# RETO_12

Esta actividad consiste en ejecutar unas lineas de prueba con Apache Flink y Zeppelin.

Se proporciona un docker-compose.yml en este repositorio que lanza un Zeppelin que incluye un interprete para Flink. Los pasos para arrancar el entorno son:

1 - Entrar en una maquina linux con git, docker y docker-compose instalados.

2 - Clonar este repositorio "git clone https://github.com/germanblanco/RETO_12.git"

3 - Construir las imagenes docker "cd RETO_12; docker-compose build". Este paso tarda un rato y aparece el error "localhost [127.0.0.1] 8080 (http-alt) : Connection refused" varias veces (entre 5 y 20). Esto es normal.

4 - Lanzar el entorno con "docker-compose up"

Para el resto de los ejercicios, Zeppelin esta accesible en la URL: http://\<IP de la maquina Linux donde se hizo docker-compose up\>:8888

A continuacion, vamos a realizar un WordCount sobre un texto siguiendo el ejemplo en https://www.slideshare.net/tillrohrmann/data-analysis-49806564.

1 - Entrar en la URL de Zeppelin y hacer click en "Notebook" -> "Create a new note"

2 - Elegir un nombre cualquiera y "flink" como "default interpreter"

3 - Descargarse un libro. Para ello introducir las siguientes líneas en el campo editable del notebook y ejecutarlas con "Shift-Enter":

<pre><code>
%sh
rm 10.txt.utf-8
wget http://www.gutenberg.org/ebooks/10.txt.utf-8
</code></pre>

4 - Contar las apariciones de cada palabra, usando estas lineas:

<pre><code>
%flink
case class WordCount(word: String, frequency: Int)
val bible:DataSet[String] = benv.readTextFile("10.txt.utf-8")
val partialCounts: DataSet[WordCount] = bible.flatMap{
    line => """\b\w+\b""".r.findAllIn(line).map(word => WordCount(word, 1))
}
val wordCounts = partialCounts.groupBy("word").reduce{
    (left, right) => WordCount(left.word, left.frequency + right.frequency)
}
val result10 = wordCounts.first(10).collect()
</code></pre>

5 - Poner el resultado en un grafico con el siguiente codigo y eligiendo el tipo de grafico.

<pre><code>
%flink
val result = wordCounts.collect()
println("%table Word\tFrequency\n" + result.map(x => x.word + "\t" + x.frequency).mkString("\n"))
</code></pre>
