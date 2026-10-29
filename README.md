# Clarity Theme for Enlightenment

**Clarity** es un tema personalizado para el entorno de escritorio **Enlightenment (E)**, diseñado con un enfoque limpio, moderno y funcional. Cuenta con soporte nativo para dos variantes visuales: **Dark** y **Light**.

---

## 🎨 Vista Previa (Preview)

A continuación se muestran los módulos y gadgets diseñados para ambas variantes visuales:

| Gadget | Dark | Light |
| :--- | :---: | :---: |
| **Batería** | ![Battery Dark](assets/Battery_Dark.png) | ![Battery Light](assets/Battery_Light.png) |
| **Bluetooth** | ![Bluetooth Dark](assets/Bluetooth_Dark.png) | ![Bluetooth Light](assets/Bluetooth_Light.png) |
| **Brillo** | ![Brightness Dark](assets/Brightness_Dark.png) | ![Brightness Light](assets/Brightness_Light.png) |
| **Calendario** | ![Calendar Dark](assets/Calendar_Dark.png) | ![Calendar Light](assets/Calendar_Light.png) |
| **Mezclador de Audio** | ![Mixer Dark](assets/Mixer_Dark.png) | ![Mixer Light](assets/Mixer_Light.png) |
| **Control de Música** | ![Music Control Dark](assets/MusicControl_Dark.png) | ![Music Control Light](assets/MusicControl_Light.png) |
| **Red (Network)** | ![Network Dark](assets/Network_Dark.png) | ![Network Light](assets/Network_Light.png) |
| **Filemanager** | ![Filemanager Dark](assets/E_filemanager_Dark.png) | ![Filemanager Light](assets/E_filemanager_Light.png) |
| **Everything Launcher** | ![Everything Launcher Dark](assets/EverythingLauncher_Dark.png) | ![Everything Launcher Light](assets/EverythingLauncher_Light.png) |

---

## 🛠️ Compilación e Instalación

### Requisitos previos

Asegúrate de contar con las bibliotecas básicas de desarrollo de Enlightenment (**EFL** y herramientas como `edje_cc`) instaladas en tu sistema.

### Pasos para compilar

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/tu-usuario/clarity-theme.git
   cd clarity-theme
   ```

2. Otorga permisos de ejecución al script de compilación (si aún no los tiene):
   ```bash
   chmod +x .build
   ```

3. Ejecuta el script de compilación `.build`:
   ```bash
   ./.build
   ```

---

## 🚀 Aplicar el Tema

Una vez compilado el archivo `.edj` resultante:

1. Copia el archivo `.edj` generado a tu directorio de temas de Enlightenment:
   ```bash
   cp Clarity.edj ~/.e/e/themes/
   ```
2. Ve al menú principal de **Enlightenment** > **Configuración** > **Tema**.
3. Selecciona **Clarity** en la lista y presiona **Aplicar**.

---

## 🤝 Contribuciones

¡Las sugerencias, correcciones de errores e *issues* son más que bienvenidos! Si encuentras algún detalle visual o quieres colaborar, siéntete libre de abrir un *pull request*.

---

## 📄 Licencia

Este proyecto se distribuye bajo la licencia **MIT**.
