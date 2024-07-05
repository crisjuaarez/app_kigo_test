# App Kigo Test

Prueba de aplicación con Flutter, para Kigo Parkimovil.

## Descripción

API de [FakeStore](https://fakestoreapi.com/)

Este proyecto utiliza el framework [Flutter](https://flutter.dev/) y la librería [Provider](https://pub.dev/packages/provider) para gestionarel estado de la aplicación.

Para hacer las llamadas a la API de FakeStore, se utiliza la librería [http](https://pub.dev/packages/http).


## Autenticación mediante email y contraseña

Para autenticar el usuario, solo necesita un email válido y una contraseña mayor o igual a 6 caracteres.

## Autenticación mediante biometricos

Se utiliza la librería [local_auth](https://pub.dev/packages/local_auth) para autenticar el usuario.

Para autenticar el usuario, se utiliza la clase `BiometricHelper` que se encarga de verificar si el dispositivo tiene o no el tipo de autenticación que se solicita.


## Estructura de directorios

## lib/
El directorio `lib/` es el directorio principal donde se encuentra el código fuente de la aplicación Flutter.

### src/
La carpeta `src/` contiene todo el código fuente de la aplicación, organizada en diferentes módulos y componentes.

#### core/
La carpeta `core/` contiene utilidades y configuraciones que son utilizadas en toda la aplicación. Generalmente incluye:
- **Utils**: Clases y funciones utilitarias que son usadas en múltiples partes de la aplicación.
- **Constants**: Valores constantes que se utilizan en la aplicación.

#### features/
La carpeta `features/` organiza el código en módulos basados en las funcionalidades principales de la aplicación.

##### home/
La carpeta `home/` contiene el código relacionado con la pantalla o funcionalidad principal de la aplicación.

##### login/
La carpeta `login/` contiene el código relacionado con la funcionalidad de autenticación e inicio de sesión.

##### products/
La carpeta `products/` contiene el código relacionado con la gestión de productos. Se subdivide en las siguientes subcarpetas:
- **data/**: Contiene modelos de datos, fuentes de datos (como repositorios y servicios API) y cualquier otra clase relacionada con la gestión de datos.
- **domain/**: Incluye entidades de negocio, casos de uso y repositorios abstractos que definen la lógica de negocio.
- **ui/**: Contiene widgets, pantallas y otros componentes de la interfaz de usuario específicos para la gestión de productos.

#### profile/
La carpeta `profile/` contiene el código relacionado con la gestión del perfil del usuario.

#### shared/
La carpeta `shared/` contiene código compartido entre diferentes funcionalidades, como widgets comunes, temas y otros componentes reutilizables.

### ui/
La carpeta `ui/` contiene componentes de la interfaz de usuario que pueden ser compartidos a lo largo de la aplicación.

#### alerts/
La carpeta `alerts/` contiene widgets y clases relacionadas con la visualización de alertas y notificaciones.

#### theme/
La carpeta `theme/` incluye configuraciones y definiciones de temas, como colores, estilos de texto y temas de la aplicación.

#### widgets/
La carpeta `widgets/` contiene widgets reutilizables organizados en subcarpetas según su tipo o propósito.
- **button/**: Widgets relacionados con botones.
- **common/**: Widgets comunes y reutilizables en diferentes partes de la aplicación.
- **form/**: Widgets específicos para formularios, como campos de texto y validaciones.

### my_app.dart
El archivo `my_app.dart` contiene la configuración principal de la aplicación, el widget padre.

### main.dart
El archivo `main.dart` es el punto de entrada de la aplicación Flutter. Aquí es donde se llama a `runApp()` y se inicia la aplicación.


## Manual de para correr la aplicación
### Requerimientos
- Android Studio o Visual Studio Code
- Flutter SDK
- Dart SDK
- Android SDK
- Android Emulator

### Instalación
1. Abrir Android Studio o Visual Studio Code, en mi caso estoy usando Visual Studio Code.
2. Abrir la carpeta de la aplicación.
3. Correr el comando `flutter pub get` en la terminal.
5. Abrir el emulador Android.
6. Seleccionar el dispositivo Android.
7. Correr el comando `flutter run` en la terminal.

##  Manual de instalación de la aplicación 
### Requerimientos
- Dispositivo Android

### Instalación
1. Descargar el apk que se encuentra en el zip llamado `app_kigo_test.zip`.
2. Extraer el archivo zip en la carpeta de la aplicación.
3. Habilitar fuentes desconocidas en el dispositivo Android.
3. Instalar el apk en el dispositivo Android.





          

