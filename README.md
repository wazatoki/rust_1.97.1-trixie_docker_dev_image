# rust_1.97.1-trixie_docker_dev_image
A development environment based on rust1.97.1-trixie. SSH and vim are pre-installed.

# image build
execute tools\windows\build_image.bat

# docker run
execute tools\windows\start_up_container.bat

# stop & remove container
execute tools\windows\stop_container.bat

# attach on running container
execute tools\windows\attach_on_running_container.bat
or
docker exec --user dev -it my_ssh_container /bin/bash

# Connect to a running container via SSH
ssh dev@localhost -p 2222