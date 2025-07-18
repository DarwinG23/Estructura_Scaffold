# Estructura_Scaffold

<img width="423" height="789" alt="image" src="https://github.com/user-attachments/assets/7e9b055e-142f-4372-9617-b4f308b305f8" />
<img width="439" height="794" alt="image" src="https://github.com/user-attachments/assets/f851c5fc-bfb3-417b-af68-01e858967328" /> 
<img width="456" height="810" alt="image" src="https://github.com/user-attachments/assets/78d6bd6b-7882-4207-87be-cbb93410b2bf" />



# 🧮 Flutter Calculator App

Una calculadora simple y elegante hecha con Flutter. Esta aplicación incluye:

- Funciones básicas de cálculo: suma, resta, multiplicación, división.
- Historial de operaciones realizadas.
- Interfaz amigable con soporte para tema claro.
- Barra de navegación inferior para acceder a diferentes secciones.
- Configuración rápida accesible mediante un menú lateral derecho (aún no implementado completamente).


---

## 🚀 Funcionalidades

- ✅ Interfaz de calculadora moderna.
- ✅ Operaciones básicas con decimales.
- ✅ Historial de operaciones.
- ✅ Diseño responsivo.
- 🛠️ Sección de ajustes (parcialmente implementada).
- 📑 Menú desplegable con opciones futuras (modo científica, tema, precisión).

---

## 🛠️ Estructura del Proyecto

- `main.dart`: Código principal de la aplicación.
- `CalculatorApp`: Widget principal que inicia la app.
- `CalculatorHomePage`: Página principal con calculadora y ajustes.
- `Scaffold`: Usa `drawer` para historial y `endDrawer` para ajustes.
- `BottomNavigationBar`: Permite cambiar entre calculadora y página de ajustes.

---


```yaml
flutter:
  sdk: flutter

