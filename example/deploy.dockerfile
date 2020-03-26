FROM drcrook/ubuntubuildimage

COPY . /example

WORKDIR /example/terraform
CMD ["/bin/bash", "./deploy.sh"]