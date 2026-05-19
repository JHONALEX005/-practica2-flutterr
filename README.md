# Practica 2 - CRUD Simulado en Flutter


- JHON ALEXANDER RODRIGUEZ TAMAYO

## Descripcion del modulo
Esta app es un modulo de gestion de productos hecho en Flutter.
Permite agregar productos con nombre y precio, verlos en una lista y eliminarlos.
Los datos se guardan en memoria mientras la app esta abierta, simulando como si fuera un backend real.

## Pantallas
- **Home**: pantalla de bienvenida con un boton para entrar al modulo
- **Lista de productos**: muestra todos los productos guardados, con boton para eliminar cada uno y boton + para agregar
- **Formulario**: formulario con validaciones para agregar un nuevo producto

## Tecnologias usadas
- Flutter
- Dart
- Libreria `uuid` para generar IDs unicos por cada producto

## Por que use uuid
Use la libreria uuid porque el reto pide que cada registro tenga un ID alfanumerico unico,
no un contador simple como 1, 2, 3. Con uuid.v4() cada producto recibe un ID como:
`a3f8c2d1-4b2e-11ec-81d3-0242ac130003`

## Como ejecutar el proyecto
1. Abrir FlutLab en flutlab.io
2. Importar el ZIP del proyecto con "Import project"
3. Esperar que carguen las dependencias
4. Presionar el boton Play para compilar
5. Probar la app en la vista previa del lado derecho

## Estructura del proyecto
```
lib/
  models/
    product_model.dart       - define los campos del producto (id, nombre, precio)
  services/
    product_service.dart     - lista en memoria, guardar y eliminar con Future.delayed
  pages/
    home_page.dart           - pantalla de bienvenida
    product_list_page.dart   - listado de productos con opcion de eliminar
    product_form_page.dart   - formulario con validaciones para crear producto
  utils/
    form_validators.dart     - funciones de validacion reutilizables
  main.dart                  - punto de entrada de la app
```

## Evidencia del flujo
1. Al abrir la app aparece la pantalla de bienvenida
2. Al presionar "Ver productos" navega al listado (aparece mensaje de vacio si no hay nada)
3. Al presionar el boton + abre el formulario
4. Si se intenta guardar sin llenar los campos aparecen los errores de validacion
5. Al guardar correctamente aparece un SnackBar de confirmacion y regresa al listado
6. El producto aparece en la lista con nombre y precio
7. Al presionar el icono de eliminar el producto desaparece de la lista
