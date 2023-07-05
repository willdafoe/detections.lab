# rocker/r-md docker image
FROM rocker/r-rmd:latest

# Copy entry point script to container
COPY entrypoint.sh render.R /

# Script to execute when the container starts
ENTRYPOINT ["/entrypoint.sh"]