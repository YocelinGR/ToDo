# Preguntas de Prework
## Swift:

> Repasa el código de la sesión anterior y en un documento redacta todos los pasos para crear un UITableView. Incluye tanto los pasos en Swift como para el Storyboard.

### Swift
* Crear un archivo Emoji.swift que contendrá una estructura Emoji que será el modelo de datos que contendrá cada fila de la tabla. 

* Dentro del archivo _EmojiTableViewController.swift_ se crea una variable _emojis_ que será un arreglo de estruturas _Emoji_ el cual funcionará como  una pequeña basa de datos

* Como parte de la fuente de datos, se usan los siguientes métodos:
    - La función _numberOfSections_ nos permite indicar cuantas secciones tendrá el _UITableView_ 
    - La función _tableView_ con la función _numberOfRowsInSection_ como parámetro, ayuda a que se especifique el  número de filas que se tendrá por sección y se le asignará el valor de la longitud del arreglo _emojis_, con lo que se asegura que solo tendamos tantas filas como emojis existen y evitar igresar a un espacio del arreglo que no existe.
    - Con la función tableView usando como parámetro _cellForRowAt_ es posible definir en tres pasos la información que deberá mostrar cada celda de la fila
        1. Crear la celda con el: _tableView.dequeueReusableCell_ asignado a in identificador que debe de coincidir con el de la celda de nuestra tabla del storiboard y para el indexPath que corresponde a la celda para la que aplca el cambio
        2. Determinar el contenido de la celda: se encontrará el emoji correspondiente buscando dentro del array _emojis_ en una determina posición que corresponda a la de una fila de la tabla. Además de asignará a las etiquetas de texto y detalle del texto, en su propiedad text el valor del símbolo con su nombre y la descripción del emoji, segun corresponda.
        Adicionalmente se marca como true el valor _showsReorderControl_ de la celda, el cual permitira que se pueda hacer drag and drop de los elementos de la tabla para reordenarlos.
        3. Devolver el valor de la celda
* Como parte del delegado de la app, quien se encarga de gesstionar las interacciones del usuario manejando acciones que se deben de tomar y modificaciones a la data.
    - _tableView_ con parámetro _didSelectRowAt_ ejecuta una acción cuando se selecciona una fila de la tabla, para el caso, imprimir el simbolo del emoji
    - _tabeView_ con parámetro _moveRowAt_ gestiona el reordenamiento de las filas, paa ello, elimina un emoji del arreglo y guarda lo que existia en esa posición en una variable, que luego insertará en el mismo arreglo en la poicion hasta la cual se le arrastre.
    Finalmente ejecuta un reload de la tabla para actualizar la vista de la tabla
    - _tableView_ con parámetro __editingStyleForRowAt_ permite personalizar el mensaje que aparecera en el boton que acompaña a cada fila de la tabla, en este caso, la etiqueta será "delete"
    - _table_View_ con parámetro _editingStyle_ permite realizar acciones sobre cada fila cuando se oprime el botón visto en el punto anterior. En este caso, eliminará un emoji delarreglo de emojis, eliminará la fila de la tabla y por último hace reload de la vista de la tabla. 

Si se desea añadir más funcionalidad al proyecto:
* se configura el tamaño y nombre del titulo del navigationController y se configura que cada que se oprima el boton de la izquierda, este sea para editar el emoji. todo esto al cargar la vista dentro del viewDidLoad
* Se añade una funcion prepare for segue, que se asignara al segue que conecta la tabla de emojis con la nueva vista donde se editara la info del emoji.
En esta funcion, se envia a la vista de edicion la informaciòn del emoji seleccionado

* se añade la funcion _unwindToEmojiTableViewController_ 
### Storyboard