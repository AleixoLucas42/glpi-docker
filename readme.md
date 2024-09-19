# GLPI Docker

## Setup
- Change if you want the environment variable `MARIADB_ROOT_PASSWORD` on [docker compose file](docker-compose.yaml)
- Then, in repository root run:
> docker compose up
- Access [http://\<your-ip\>:8080/glpi](http://localhost:8080/glpi) and proceed with a new instalation

|   Setup form   |        Value            |
| -------------- | ----------------------- |
| Mysql Address  | mariadb                 |
| Sql user       | root                    |
| Sql password   | PasswordS3Cur3          |
| Database       | Use existing one `glpi` |

***If you change the root password on docker compose file, you should fill with the new value.**

- Default users

|   User    |    Password   |        Function        |
| --------- | ------------- | -----------------------|
| glpi      | glpi          | Super admin            |
| tech      | tech          | Tech account           |
| normal    | normal        | Normal user            |
| post-only | post-only     | Account for post only  |

## Links
- [Github](https://github.com/AleixoLucas42/glpi-docker)
- [Docker hub](https://hub.docker.com/repository/docker/aleixolucas/glpi)