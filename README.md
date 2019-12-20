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
