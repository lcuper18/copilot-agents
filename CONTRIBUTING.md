# Guía de Contribución

¡Gracias por tu interés en contribuir a este repositorio de agentes personalizados para GitHub Copilot!

## Cómo Contribuir

### Reportar un Problema (Issue)

Si encuentras un error, una inconsistencia o tienes una sugerencia de mejora:
1. Verifica que el issue no haya sido reportado ya en la [lista de issues](https://github.com/lcuper18/copilot-agents/issues).
2. Crea un nuevo issue con una descripción clara, pasos para reproducir (si aplica) y contexto relevante.

### Proponer un Nuevo Agente

Si quieres agregar un nuevo agente especializado:
1. Asegúrate de que el agente no esté ya cubierto por los existentes.
2. Discute la idea abriendo un issue para recibir feedback.
3. Sigue la plantilla de agente (detallada abajo).
4. Envía un Pull Request con el archivo `.agent.md` correspondiente.

### Mejorar un Agente Existente

Puedes mejorar las instrucciones, corregir errores, agregar ejemplos o actualizar herramientas:
1. Lee la documentación del agente para entender su propósito.
2. Edita el archivo `.agent.md` siguiendo las convenciones de escritura.
3. Asegúrate de no romper la funcionalidad existente.
4. Envía un Pull Request describiendo los cambios.

## Estándares para Agentes

### Estructura del Archivo

Cada agente debe tener:

1. **Frontmatter YAML** con los campos:
   - `name`: Nombre único del agente (sin espacios, en CamelCase o con underscores).
   - `description`: Descripción concisa (1-2 líneas) del propósito.
   - `argument-hint` (opcional): Indicación del tipo de entrada que espera.
   - `tools`: Lista de herramientas permitidas. Usa la lista simplificada: `['vscode', 'execute', 'read', 'agent', 'edit', 'search', 'web', 'todo']` a menos que se justifique lo contrario.

2. **Contenido** organizado en secciones como:
   - **Scope**: Áreas de expertise y responsabilidades.
   - **Working Rules**: Reglas de interacción, preguntas de contexto, formatos de respuesta.
   - **Methodologies/Templates**: Metodologías específicas, plantillas reutilizables.
   - **Best Practices**: Recomendaciones clave para el dominio.

### Convenciones de Escritura

- **Claridad**: Instrucciones específicas, no ambiguas.
- **Ejemplos**: Incluir ejemplos concretos de uso y salidas esperadas.
- **Idioma**: Usar español o inglés según el público objetivo, ser consistente.
- **Formato**: Usar encabezados Markdown, listas, código con sintaxis adecuada.

### Herramientas

Evita listas excesivas de herramientas específicas. Prefiere las categorías generales:
- `vscode`: Interacción con el editor VS Code.
- `execute`: Ejecutar comandos en terminal.
- `read`: Leer archivos y directorios.
- `agent`: Invocar subagentes.
- `edit`: Editar archivos.
- `search`: Buscar en el código y contenido.
- `web`: Acceder a internet.
- `todo`: Gestionar listas de tareas.

## Proceso de Pull Request

1. **Fork** el repositorio.
2. **Crea una rama** descriptiva (`git checkout -b feature/nuevo-agente`).
3. **Realiza tus cambios** siguiendo los estándares.
4. **Prueba** el agente en un proyecto local con `bash install.sh` y verifica que funcione en Copilot Chat.
5. **Commit** con mensaje claro (`git commit -m "Agrega agente X"`).
6. **Push** a tu fork (`git push origin feature/nuevo-agente`).
7. **Abre un Pull Request** en el repositorio original.
   - Describe los cambios y su propósito.
   - Menciona cualquier issue relacionado.
8. **Revisión**: Los mantenedores revisarán el PR y podrán solicitar ajustes.

## Validación

Antes de enviar un PR, ejecuta el script de validación (si está disponible) para comprobar la sintaxis del frontmatter:

```bash
python3 validate_agents.py
```

## Código de Conducta

Al participar en este proyecto, aceptas seguir nuestro Código de Conducta (por definir). Sé respetuoso y constructivo.

## Preguntas

Si tienes dudas, abre un issue o contacta a los mantenedores.

---

¡Gracias por hacer estos agentes más útiles para toda la comunidad!
