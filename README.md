# Estructura_Scaffold

<img width="301" height="581" alt="image" src="https://github.com/user-attachments/assets/ccac4db0-8e53-4df6-8a66-ec142b8311fc" /> 
<img width="273" height="526" alt="image" src="https://github.com/user-attachments/assets/ba749619-fd5e-4285-93cc-d85f63bb7266" />
<img width="294" height="569" alt="image" src="https://github.com/user-attachments/assets/680e89be-2aed-4b3c-a4d6-7f71ad1df1ca" />

# 🧮 Flutter Calculator App

Una calculadora simple y elegante hecha con Flutter. Esta aplicación incluye:

- Funciones básicas de cálculo: suma, resta, multiplicación, división.
- Historial de operaciones realizadas.
- Interfaz amigable con soporte para tema claro.
- Barra de navegación inferior para acceder a diferentes secciones.
- Configuración rápida accesible mediante un menú lateral derecho (aún no implementado completamente).

---

## ✨ Capturas de pantalla

*(Agrega aquí imágenes si las tienes, por ejemplo)*

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

## 📦 Dependencias

Este proyecto usa únicamente las dependencias estándar de Flutter.

```yaml
flutter:
  sdk: flutter

