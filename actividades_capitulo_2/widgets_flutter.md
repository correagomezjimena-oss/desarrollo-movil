# Investigación de widgets fundamentales en Flutter

**Nombre del estudiante:** Jimena Correa <br>
**Curso:** Lenguajes de programacion para moviles <br>
**Fecha:** 14 de mayo de 2026<br>

---

## 1. `Row`

### Descripción

El widget `Row` permite organizar varios widgets de forma horizontal, es decir, uno al lado del otro en una misma fila. Es uno de los widgets de diseño más utilizados en Flutter y resulta esencial cuando se necesita mostrar elementos en paralelo dentro de una pantalla.

Es útil en situaciones como: mostrar un ícono junto a un texto, crear una barra de acciones, organizar botones horizontalmente, o construir encabezados con elementos distribuidos a lo largo del ancho disponible.

`Row` acepta una lista de widgets hijos a través de la propiedad `children`, y permite controlar su alineación y distribución mediante propiedades como `mainAxisAlignment` y `crossAxisAlignment`.

### Ejemplo de código

```dart
Row(
  children: [
    Icon(Icons.star, color: Colors.amber),
    Text('Flutter es genial'),
  ],
)
```

### Explicación del ejemplo

En este ejemplo, el widget `Row` contiene dos hijos: un `Icon` con una estrella de color ámbar y un `Text` con el mensaje "Flutter es genial". Ambos elementos se muestran horizontalmente, uno al lado del otro, en el orden en que están definidos dentro de `children`.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `mainAxisAlignment` | Controla cómo se distribuyen los hijos a lo largo del eje horizontal. | `MainAxisAlignment.spaceEvenly` |
| `crossAxisAlignment` | Controla la alineación vertical de los hijos. | `CrossAxisAlignment.center` |
| `children` | Lista de widgets que se mostrarán en la fila. | `children: [Text('A'), Text('B')]` |
| `mainAxisSize` | Define si la fila ocupa el espacio máximo o mínimo. | `MainAxisSize.min` |

### Ejemplo con personalización

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Icon(Icons.home, size: 30, color: Colors.blue),
    Icon(Icons.search, size: 30, color: Colors.green),
    Icon(Icons.person, size: 30, color: Colors.red),
  ],
)
```

### Explicación de la personalización

En este ejemplo personalizado, el widget `Row` distribuye tres íconos de manera uniforme a lo largo del eje horizontal usando `MainAxisAlignment.spaceEvenly`. Esto provoca que los íconos se separen con espacios iguales entre ellos, logrando una apariencia más equilibrada. También se aplica `crossAxisAlignment: CrossAxisAlignment.center` para centrar los íconos verticalmente dentro de la fila.

### Conclusión

El widget `Row` es fundamental en Flutter porque permite crear diseños horizontales de forma sencilla y flexible. Sin él, sería muy difícil organizar elementos en paralelo dentro de la interfaz. Su combinación con `Column` es la base del sistema de diseño en la mayoría de las aplicaciones Flutter.

---

## 2. `Column`

### Descripción

El widget `Column` organiza sus widgets hijos de manera vertical, apilándolos uno encima del otro. Es el complemento natural de `Row` y juntos forman la base del sistema de diseño por composición en Flutter.

Se utiliza en situaciones como: apilar un título, una descripción y un botón, crear formularios verticales, construir listas de opciones, o estructurar el contenido principal de una pantalla de arriba hacia abajo.

Al igual que `Row`, acepta múltiples hijos en su propiedad `children` y permite controlar la distribución y alineación de dichos elementos.

### Ejemplo de código

```dart
Column(
  children: [
    Text('Título principal'),
    Text('Subtítulo o descripción'),
    ElevatedButton(
      onPressed: null,
      child: Text('Aceptar'),
    ),
  ],
)
```

### Explicación del ejemplo

En este ejemplo, el widget `Column` apila verticalmente tres elementos: dos textos (un título y un subtítulo) y un botón. Los elementos se muestran en el orden en que están definidos dentro de `children`, de arriba hacia abajo.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `mainAxisAlignment` | Controla cómo se distribuyen los hijos a lo largo del eje vertical. | `MainAxisAlignment.center` |
| `crossAxisAlignment` | Controla la alineación horizontal de los hijos. | `CrossAxisAlignment.start` |
| `children` | Lista de widgets que se mostrarán en la columna. | `children: [Text('A'), Text('B')]` |
| `mainAxisSize` | Define si la columna ocupa el espacio máximo o mínimo disponible. | `MainAxisSize.max` |

### Ejemplo con personalización

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Bienvenido a Flutter',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10),
    Text(
      'Aprende a construir apps desde cero.',
      style: TextStyle(fontSize: 16, color: Colors.grey),
    ),
    SizedBox(height: 20),
    ElevatedButton(
      onPressed: () {},
      child: Text('Comenzar'),
    ),
  ],
)
```

### Explicación de la personalización

En este ejemplo, la `Column` centra su contenido verticalmente con `MainAxisAlignment.center` y lo alinea al inicio horizontalmente con `CrossAxisAlignment.start`. Se utilizan widgets `SizedBox` para agregar espacios entre los elementos, lo que mejora la legibilidad. El resultado es una sección de bienvenida típica en aplicaciones móviles.

### Conclusión

El widget `Column` es indispensable en Flutter para construir diseños verticales. Junto con `Row`, forma el núcleo del sistema de composición de interfaces, permitiendo estructurar pantallas completas de manera ordenada, legible y flexible.

---

## 3. `Text`

### Descripción

El widget `Text` se utiliza para mostrar texto en pantalla. Es uno de los widgets más básicos e imprescindibles de Flutter, ya que prácticamente toda aplicación necesita presentar algún tipo de contenido textual al usuario.

Se usa en situaciones como: mostrar títulos, descripciones, etiquetas, mensajes de error, valores numéricos, o cualquier información que deba ser leída por el usuario. A través de la propiedad `style`, el texto puede personalizarse ampliamente en cuanto a fuente, tamaño, color, peso y más.

### Ejemplo de código

```dart
Text('Hola, mundo!')
```

### Explicación del ejemplo

Este es el uso más básico del widget `Text`. Simplemente recibe una cadena de texto como primer argumento posicional y la muestra en pantalla con el estilo predeterminado de la aplicación.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `style` | Permite aplicar un estilo visual al texto. | `style: TextStyle(fontSize: 18)` |
| `textAlign` | Controla la alineación del texto. | `textAlign: TextAlign.center` |
| `maxLines` | Limita el número de líneas visibles. | `maxLines: 2` |
| `overflow` | Define qué sucede si el texto no cabe. | `overflow: TextOverflow.ellipsis` |
| `softWrap` | Indica si el texto puede hacer saltos de línea. | `softWrap: true` |

### Ejemplo con personalización

```dart
Text(
  'Flutter: el framework del futuro',
  textAlign: TextAlign.center,
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple,
    letterSpacing: 1.5,
  ),
)
```

### Explicación de la personalización

En este ejemplo, el texto se muestra centrado, con un tamaño de fuente de 20 puntos, negrita, color púrpura oscuro y un espaciado entre letras de 1.5. La propiedad `maxLines: 1` limita el texto a una sola línea, y `overflow: TextOverflow.ellipsis` agrega puntos suspensivos si el texto es demasiado largo para caber en el espacio disponible.

### Conclusión

El widget `Text` es el elemento más básico para comunicar información al usuario en Flutter. Su propiedad `style` lo hace enormemente versátil, permitiendo construir desde textos simples hasta títulos y encabezados altamente personalizados que se adaptan a cualquier diseño visual.

---

## 4. `ElevatedButton`

### Descripción

El widget `ElevatedButton` representa un botón con relieve visual (elevación o sombra) que responde a la interacción del usuario. Es el tipo de botón principal en Flutter y se utiliza cuando se quiere destacar la acción más importante de una pantalla.

Este widget es útil en situaciones como: enviar formularios, confirmar acciones, navegar a otra pantalla, iniciar sesión, o ejecutar cualquier función como respuesta a una pulsación del usuario. Se compone principalmente de dos propiedades: `onPressed` (la acción a ejecutar) y `child` (el contenido visual del botón, generalmente un `Text` o un `Icon`).

### Ejemplo de código

```dart
ElevatedButton(
  onPressed: () {
    print('Botón presionado');
  },
  child: Text('Guardar'),
)
```

### Explicación del ejemplo

En este ejemplo, el `ElevatedButton` muestra el texto "Guardar". Al ser presionado, ejecuta la función definida en `onPressed`, que en este caso imprime un mensaje en la consola. Si `onPressed` se establece como `null`, el botón queda deshabilitado y no responde a interacciones.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `onPressed` | Función que se ejecuta al presionar el botón. | `onPressed: () {}` |
| `child` | Widget que se muestra dentro del botón. | `child: Text('Enviar')` |
| `style` | Permite cambiar el color, forma, tamaño y más. | `style: ElevatedButton.styleFrom(...)` |
| `icon` | Se puede usar `ElevatedButton.icon` para agregar un ícono. | `icon: Icon(Icons.send)` |

### Ejemplo con personalización

```dart
ElevatedButton(
  onPressed: () {
    print('Formulario enviado');
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  ),
  child: Text('Enviar formulario'),
)
```

### Explicación de la personalización

En este ejemplo, el botón tiene un fondo de color verde azulado (`teal`), texto blanco en negrita, bordes redondeados y un relleno amplio que lo hace más cómodo de presionar. El uso de `ElevatedButton.styleFrom()` es la forma moderna y recomendada en Flutter para personalizar los botones de manera legible y organizada.

### Conclusión

El widget `ElevatedButton` es esencial para la interactividad de cualquier aplicación Flutter. Al ser el botón de acción principal, su diseño comunica al usuario cuál es la operación más importante en la pantalla. Su sistema de estilos flexible permite adaptarlo a cualquier identidad visual de la aplicación.

---

## 5. `TextField`

### Descripción

El widget `TextField` permite al usuario ingresar texto a través del teclado del dispositivo. Es el widget de entrada de datos más importante en Flutter y se utiliza en prácticamente cualquier aplicación que requiera interacción del usuario, como formularios de registro, campos de búsqueda, chats, inicios de sesión, entre otros.

Para capturar y manipular el texto ingresado, se utiliza un `TextEditingController`, que actúa como puente entre el widget y la lógica de la aplicación. También permite mostrar sugerencias, validar entradas y controlar el tipo de teclado que aparece.

### Ejemplo de código

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Escribe tu nombre',
  ),
)
```

### Explicación del ejemplo

En este ejemplo básico, el `TextField` muestra una etiqueta flotante con el texto "Escribe tu nombre". Al tocar el campo, aparece el teclado y el usuario puede comenzar a escribir. La propiedad `decoration` permite agregar etiquetas, íconos, bordes y mensajes de ayuda al campo.

### Personalización

| Propiedad | Descripción | Ejemplo |
|---|---|---|
| `controller` | Permite leer y controlar el texto ingresado. | `controller: _controller` |
| `decoration` | Configura la apariencia visual del campo (label, hint, íconos, borde). | `decoration: InputDecoration(...)` |
| `keyboardType` | Define el tipo de teclado que aparece. | `keyboardType: TextInputType.email` |
| `obscureText` | Oculta el texto (útil para contraseñas). | `obscureText: true` |
| `maxLength` | Limita la cantidad de caracteres que puede ingresar el usuario. | `maxLength: 50` |
| `onChanged` | Función que se ejecuta cada vez que el texto cambia. | `onChanged: (value) {}` |

### Ejemplo con personalización

```dart
final TextEditingController _emailController = TextEditingController();

TextField(
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
  maxLength: 60,
  decoration: InputDecoration(
    labelText: 'Correo electrónico',
    hintText: 'ejemplo@correo.com',
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  onChanged: (value) {
    print('Texto actual: $value');
  },
)
```

### Explicación de la personalización

En este ejemplo, el `TextField` está configurado para ingresar una dirección de correo electrónico. Se usa `keyboardType: TextInputType.emailAddress` para que el teclado muestre el símbolo `@` de forma visible. La decoración incluye una etiqueta, un texto de sugerencia, un ícono de correo al inicio del campo y un borde redondeado. El `controller` permite recuperar el valor ingresado en cualquier momento, y `onChanged` imprime el texto en tiempo real.

### Conclusión

El widget `TextField` es imprescindible para cualquier aplicación que necesite recibir datos del usuario. Su gran cantidad de opciones de personalización permite construir campos de texto simples o complejos, adaptados a distintos tipos de información como nombres, contraseñas, correos electrónicos o búsquedas, haciendo de él uno de los widgets más versátiles de Flutter.
