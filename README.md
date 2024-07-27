# Number Guessing Game

Este proyecto es un juego de adivinanza de números utilizando una base de datos PostgreSQL.

## Archivos

- `create_db.sh`: Script para crear la base de datos.
- `number_guess.sh`: Script principal del juego.
- `number_guess.sql`: Script SQL para configurar la base de datos.

## Requisitos

- PostgreSQL 12.17 o superior
- Bash

## Instalación

1. Clona el repositorio:
    ```sh
    git clone https://github.com/illeiva2/NumberGuessing.git
    cd numberguessing
    ```

2. Crea la base de datos ejecutando el script `number_guess.sql`:
    ```sh
    psql -U <TU_USUARIO> -f number_guess.sql
    ```

3. Configura la base de datos ejecutando el script `create_db.sh`:
    ```sh
    ./create_db.sh
    ```

## Uso

1. Ejecuta el script principal del juego:
    ```sh
    ./number_guess.sh
    ```

2. Sigue las instrucciones en pantalla para jugar.

## Descripción del Juego

El juego consiste en adivinar un número generado aleatoriamente por el sistema. El jugador tiene que ingresar sus intentos hasta adivinar el número correcto.

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request para discutir cualquier cambio.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.