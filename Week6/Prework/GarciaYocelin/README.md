# Preguntas de Prework

## Swift:

>  Repasa el código de la sesión anterior y en un documento redacta todos los pasos para crear un UITableView. Incluye tanto los pasos en Swift como para el Storyboard.



### Swift

- Crear un archivo Emoji.swift que contendrá una estructura Emoji que será el modelo de datos que contendrá cada fila de la tabla. 
- Dentro del archivo *_EmojiTableViewController.swift_* se crea una variable *_emojis_* que será un arreglo de estructuras *_Emoji_* el cual funcionará como  una pequeña basa de datos
- Como parte de las configuraciones de la vista, se añaden configuraciones para los elementos del header de navegación:
  - navigationController?.navigationBar.prefersLargeTitles = true. Ayuda a configurar las preferencias de tamaño del titulo de la cabecera de navegación.
  - navigationItem.title = "Emoji Dictionary". Asigna un titulo a la cabecera de navegación
  - navigationItem.leftBarButtonItem = editButtonItem

​       	Añade un botón a la cabecera de navegación en su parte izquierda y le asigna las cualidades necesarias para que tenga el comportamiento de un botón de *_Edit_*  y *_Done_* a la vez para editar el emoji. todo esto al cargar la vista dentro del viewDidLoad

- Como parte de la fuente de datos, se usan los siguientes métodos:
  - La función *_numberOfSections_* nos permite indicar cuantas secciones tendrá el *_UITableView_* 
  - La función *_tableView_* con la función *_numberOfRowsInSection_* como parámetro, ayuda a que se especifique el  número de filas que se tendrá por sección y se le asignará el valor de la longitud del arreglo *_emojis_*, con lo que se asegura que solo tendamos tantas filas como emojis existen y evitar ingresar a un espacio del arreglo que no existe.
  - Con la función tableView usando como parámetro *_cellForRowAt_* es posible definir en tres pasos la información que deberá mostrar cada celda de la fila
    1. Crear la celda con el: *_tableView.dequeueReusableCell_* asignado a in identificador que debe de coincidir con el de la celda de nuestra tabla del storyboard y para el indexPath que corresponde a la celda para la que aplica el cambio
    2. Determinar el contenido de la celda: se encontrará el emoji correspondiente buscando dentro del array *_emojis_* en una determina posición que corresponda a la de una fila de la tabla. Además de asignará a las etiquetas de texto y detalle del texto, en su propiedad text el valor del símbolo con su nombre y la descripción del emoji, según corresponda. Adicionalmente se marca como true el valor *_showsReorderControl_* de la celda, el cual permitirá que se pueda hacer drag and drop de los elementos de la tabla para reordenarlos.
    3. Devolver el valor de la celda

- Como parte del delegado de la app, quien se encarga de gestionar las interacciones del usuario manejando acciones que se deben de tomar y modificaciones a la data.

  - _tableView_ con parámetro *_didSelectRowAt_* ejecuta una acción cuando se selecciona una fila de la tabla, para el caso, imprimir el símbolo del emoji

  -  _tabeView_ con parámetro *_moveRowAt_* gestiona el reordenamiento de las filas, para ello, elimina un emoji del arreglo y guarda lo que existía en esa posición en una variable, que luego insertará en el mismo arreglo en la posición hasta la cual se le arrastre. Finalmente ejecuta un reload de la tabla para actualizar la vista de la tabla
  -  *_tableView_* con parámetro __editingStyleForRowAt_ permite personalizar el mensaje que aparecerá en el botón que acompaña a cada fila de la tabla, en este caso, la etiqueta será "delete"
  - _table_View_ con parámetro *_editingStyle_* permite realizar acciones sobre cada fila cuando se oprime el botón visto en el punto anterior. En este caso, eliminará un emoji del arreglo de emojis, eliminará la fila de la tabla y por último hace reload de la vista de la tabla. 

Si se desea añadir más funcionalidad al proyecto:

-  Se añade una función prepare for segue, que se asignara al segue que conecta la tabla de emojis con la nueva vista donde se editara la info del emoji. En esta función, se envía a la vista de edición la información del emoji seleccionado. Esto se logra gracias a los siguientes pasos:
  - Identificar si el segue de esta conexión ha sido llamado
  - Crear una instancia (si existe) de la fila seleccionada
  - Guardar en una variable el valor del emoji seleccionado tomándolo directamente desde el arreglo de emojis.
  - Crear una instancia del *_UINavigationController_* para poder identificarla vista que esta en el nivel superior del flujo de navegación y después se castea como la clase controladora de la vista a la que se pasará la información, para este caso, *_AddEditTableViewController_*
  - Se asigna el emoji que se selecciono al controlador top en una propiedad llamada emoji. 



- Se añade la función *_unwindToEmojiTableViewController_*  para poder regresar a la vista con la lista de emojis cuando un nuevo emoji ha sido insertado o se ha actualizado la información de alguno en la segunda vista
  - Se identifica se ha hecho interacción con el segue correspondiente al botón
  -  Se crea una instancia del controlador de la segunda vista
  - Se guarda si existe una propiedad emoji que sea la misma que existe en la segunda vista
  - Si se edito un emoji en la segunda vista, significa que existirá un indexPath para una fila seleccionada, por tanto será posible asignar el emoji actualizado en el arreglo de emojis para la posición que indique el indexPath. Posteriormente es necesario actualizar la vista con el *_reloadRows_* en la posición del indexPath seleccionada de forma *_automática_*

- Si se añadió un nuevo emoji, se deberá crear un nuevo indexPath con la posición que continuaría en el arreglo de emojis, luego se añadirá en nuevo emoji al arreglo y se usará la propiedad *_insertRows_* del tableView para insertar en nuevo emoji a la tabla en la posición del nuevo indexPath. 

Dentro del archivo *_AddEditTableViewController.swift_* se encuentra la lógica para editar o añadir un emoji. Para lograr esto se debe:

- Crear IBOutlet para el campo de símbolo, nombre, descripción y uso de la nueva vista.

- Crear una propiedad emoji de tipo Emoji que es opcional

- Crear una función *_fillFields_* que asignará a las propiedades text de cada elemento (UI) de la vista las propiedades de correspondientes de la propiedad emoji. Esta propiedad viene transmitida por medio del segue de la vista principal o bien de los valores que escribe el usuario en la vista.

- Se crea la función IBAction asociada al botón cancel para deshacer las acciones que se realizaron en esta vista y regresar a donde la configuración del botón este programada.

- Se crea la función prepare for segue para el botón de *_Done_* que validara que si la interacción con el segue existe, se regresa una propiedad emoji con un nuevo Emoji que esta inicializado con los valores que tenga la vista.

### **Storyboard**



El StoryBoard ayuda a configurar toda la vista de la app. Para ello es necesario:

- Elimina la vista que viene por defecto en el proyecto
- Crea un tableViewController y se embebe en un navigationViewController
- Se configura el tableView para que solo tenga una sección y una celda por sección, a la que se le asigna un nombre de identificador que se usará para  la función del DataSource _cellForRowAt_ 
- Se le asigna a esta vista la clase controladora _EmojiTableViewController_
- Se agrega una segunda tableViewController embebida en un navigation controller y se crea una transición _PresentModaly_ para manejar el cambio de vista al hacer click en el botón de Edit/Done de la primera TableView para que cambie a mostrar la segunda vista. El segue que se genera se guardará con un nombre que será el que se use en el EmojiTableviewController en la función prepare for segue para mandar la información del emoji seleccionado a la segunda vista.  
- Se le asigna la clase controladora AddEditTableviewController a esta segunda vista. 
- En la segunda vista, se añaden los campos para añadir el símbolo, nombre, descripción y uso del emoji, y en la cabecera del navigationBar, se añaden dos botones, uno para el lado derecho ("Done") y otro para el lado izquierdo ("Cancel"),  el botón Cancel se conecta con el IBAction del AddEditTableViewController para la función dismiss,  también se conectará el botón "Done" a un segue conectado al exit de la vista. Se le asignara un nombre de identificador al segue, y ese se usará en el AddEditTableViewController para la función prepare for segue para poder transmitir la información de la segunda a la primer vista, este segue también se usará para recibir la información en el EmojiTableViewController. 