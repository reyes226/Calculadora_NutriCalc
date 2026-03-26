#[NutriCalc]Calculadora nutricional

Estructura del proyecto reorganizada para mejor mantenimiento y escalabilidad.

## 📁 Estructura de Carpetas

```
/Calculadora
│
├── esquema.xsd                       # Script de estructura dentro de xml
├── estilo.xsl                        # Script con el estilo implementado
├── recetas.xml                       # Script principal  
└── README.md                         # Este archivo
│
```

## 🚀 Cómo Usar

### 1. Ingresar alimentos
- Ingresar cada ingrediente con su proteina,carbohidrato y grasas
-  La pagina se encargar de calcular las calorias por cada 100mg

### 2. Crear recetar
- Completamos cada campo titulo,una descripción detallada o no, utensilios, pasos y ingredientes
- Guardamos las recetas

### 3. Ver o eliminar recetas
- Ahora podemos ver cada receta, modificarla o eliminarla

## Requisitos

- XML
- HTML / CSS
- Javascript

Instalar dependencias:
```bash
pip install pandas openpyxl
```

## 📄 Notas

-Se cuenta con boton para exportar xml con recetas y guardar recetas
-Se cuenta con boton para cargar xml con recetas
