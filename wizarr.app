#!/bin/bash

# ================================ DEFAULT VALUES ================================ #

default_variables() {
port_number=5690
time_zone=America/New_York
appdata_path=/pg/appdata/wizarr/database
version_tag=latest
expose=
}

# ================================ CONTAINER DEPLOYMENT ================================ #
deploy_container() {

# Function to create Docker Compose file
create_docker_compose() {
    cat << EOF > /pg/ymals/${app_name}/docker-compose.yml
services:
  ${app_name}:
    image: ghcr.io/wizarrrr/wizarr:${version_tag}
    container_name: ${app_name}
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=${time_zone}
    ports:
      - "${expose}${port_number}:5690"
    volumes:
      - ${appdata_path}:/data/database
    restart: unless-stopped
    networks:
      - plexguide

networks:
  plexguide:
    external: true
EOF
}

}

# ================================ MENU GENERATION ================================ #
# NOTE: List menu options in order of appears and place a this for naming #### Item Title


# ================================ EXTRA FUNCTIONS ================================ #
# NOTE: Extra Functions for Script Organization