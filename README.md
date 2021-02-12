# Terraform

## Multicloud provision

## Tools
* Atlantis
* Sentinel
* IAC testing 
* vault
* nomad

Por qué se debe usar terraform: 

* Se integra al flujo de trabajo devops: Esto significa que  la infraestructura queda como descrita código, lo que indica que se pueden hacer pruebas sobre el mismo además de tener una descripción y replicabilidad sencilla de los ambientes.
 
* Los cambios en la descripción de infraestructura de los proyectos no se hacen directamente en la interfaz de GCP, si no a través de un api,
lo que evita posibles riesgos de seguridad. 

* Alta tolerancia a fallos:  En caso de fallos graves de infraestructura, los ambientes se pueden desplegar rápidamente haciendo fácil la reimplementación de los mismos. 

* Los tres puntos anteriores tienen como consecuencia que sea sencillo integrar cambios fundamentales a toda la infraestructura existente.  

## TF automation 
* https://learn.hashicorp.com/tutorials/terraform/automate-terraform?in=terraform/automation&utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS

## TFE automation

Encaso del uso de Terraform enterprise se pueden realizar automatizaciones interactuando con su API:

* https://github.com/hashicorp/terraform-guides/tree/master/operations/automation-script

## GCP examples

* https://github.com/hashicorp/hashicat-gcp
* https://learn.hashicorp.com/terraform/kubernetes/provision-gke-cluster

## Local development
* localstack.
