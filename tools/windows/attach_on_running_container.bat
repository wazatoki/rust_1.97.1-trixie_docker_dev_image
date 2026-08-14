rem attach on running container

cd /d %~dp0
docker compose -f ..\docker\docker-compose.yml --env-file ..\..\.env exec --user dev rust_1.97.1_ssh_container /bin/bash