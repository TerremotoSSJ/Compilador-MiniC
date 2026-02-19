# Compilador miniC a MIPS 🚀

Este proyecto consiste en el diseño e implementación de un compilador completo para el lenguaje fuente **miniC**, capaz de traducir código de alto nivel a lenguaje ensamblador **MIPS**. 

El desarrollo se ha realizado en un entorno **Linux**, integrando herramientas clásicas de construcción de compiladores para cubrir todas las fases de traducción.



## 🛠️ Herramientas y Tecnologías

Para la construcción de este compilador se han utilizado las siguientes herramientas:

* **Lenguaje:** C
* **Analizador Léxico:** `flex` (Fast Lexical Analyzer Generator)
* **Analizador Sintáctico:** `bison` (GNU Bison - Generador de analizadores LALR)
* **Compilador C:** `gcc`
* **Automatización:** `make`
* **Entorno:** Linux (Ubuntu/Debian recomendado)

## 📋 Fases del Compilador

El proceso de traducción está dividido en las siguientes etapas integradas:

1.  **Análisis Léxico:** Reconocimiento de tokens a partir de expresiones regulares definidas en Flex.
2.  **Análisis Sintáctico:** Validación de la estructura del programa mediante gramáticas libres de contexto procesadas por Bison.
3.  **Análisis Semántico:** Comprobación de tipos, declaración de variables y coherencia lógica del programa.
4.  **Generación de Código MIPS:** Traducción final del código fuente a instrucciones ensamblador compatibles con simuladores como SPIM o MARS.

## 🚀 Instalación y Uso

### Prerrequisitos

Asegúrate de tener instaladas las herramientas necesarias en tu sistema Linux:

```bash
sudo apt update
sudo apt install flex bison build-essential