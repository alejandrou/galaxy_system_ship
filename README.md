<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Tabla de contenidos</summary>
  <ol>
    <li>
      <a href="#Autor">Autor</a>
    </li>
    <li>
      <a href="#Trabajo realizado">Trabajo realizado</a>
    </li>
    <li><a href="#decisiones-adoptadas">Decisiones adoptadas</a></li>
    <li><a href="#referencias">Referencias</a></li>
    <li><a href="#herramientas">Herramientas</a></li>
    <li><a href="#resultado">Resultado</a></li>
  </ol>
</details>




## Autor

El autor de este proyecto es el estudiante Alejandro Daniel Herrera Cárdenes para la asignatura Creando Interfaces de Usuario (CIU) para el profesor Modesto Fernando Castrillón Santana. 


## Trabajo realizado

El trabajo se basa en hacer un sistema planetario que contenga una nave que tenga movimiento en el programa Processing.

## Decisiones adoptadas

Las mayores decisiones tomadas y las que mas pruebas requirieron fue realizar la "primera persona" de la nave con movimiento


* Método que permite crear los planetas con forma de esfera que luego permitirá cargar las imágenes con la función setTexture().
  ```
  void drawSolarSystem(){
  
    beginShape();
  
    sun = createShape(SPHERE,60);
    sun.setStroke(255);
    sun.setTexture(sunImage);
  
    earth = createShape(SPHERE,12);
    earth.setStroke(255);
    earth.setTexture(earthImage);
  
    mercury = createShape(SPHERE,8);
    mercury.setStroke(255);
    mercury.setTexture(mercuryImage);
  
    venus = createShape(SPHERE,15);
    venus.setStroke(255);
    venus.setTexture(venusImage);
  
    moon = createShape(SPHERE,5);
    moon.setStroke(255);
    moon.setTexture(moonImage);
  
    jupiter = createShape(SPHERE,20);
    jupiter.setStroke(255);
    jupiter.setTexture(jupiterImage);
  
    mars = createShape(SPHERE,20);
    mars.setStroke(255);
    mars.setTexture(marsImage);
  
    endShape();  
  }
* Método que hace girar sobre un eje de rotación alrededor de un punto, en este caso el sol, con cierta velocidad y distancia respecto a las otras esferas.

  ```
  void setSolarSystemRotatio(){
  
    pushMatrix();
    rotateY(radians(angleSun));
    shape(sun);
    angleSun=(angleSun%360)+0.1;
    popMatrix();
  
    pushMatrix();
    rotateZ(radians(angleEarth));
    translate(175,0);
    rotateY(radians(angleEarth));
    shape(earth);
    text("Tierra", 11, 2);
    angleEarth=(angleEarth%360)+0.4;
  
    rotateZ(radians(angleMoon));
    translate(23, 0);
    rotateY(radians(angleMoon));
    shape(moon);
    text("Luna", 11, 2);
    angleMoon=(angleMoon%360)+0.2;
    popMatrix();
  
    pushMatrix();
    rotateZ(radians(angleMercury));
    translate(80,0);
    rotateY(radians(angleMercury));
    shape(mercury);
    text("Mercurio", 11, 2);
    angleMercury=(angleMercury%360)+0.8;
    popMatrix();
  
    pushMatrix();
    rotateZ(radians(angleVenus));
    translate(125,0);
    rotateY(radians(angleVenus)); 
    shape(venus);
    text("Venus", 15, 2);
    angleVenus=(angleVenus%360)+0.75;
    popMatrix();
  
    pushMatrix();
    rotateZ(radians(angleJupiter));
    translate(280,0);
    rotateY(radians(angleJupiter));
    shape(jupiter);
    text("Jupiter", 21, 2);
    angleJupiter=(angleJupiter%360)+0.2;
    popMatrix();
  
    pushMatrix();
    rotateZ(radians(angleMars));
    translate(200,0);
    rotateY(radians(angleMars));
    shape(mars);
    text("Marte", 21, 2);
    angleMars=(angleMars%360)+0.2;
    popMatrix();
  }
  ```
 <p align="center"><img src="images/sistema_solar.png" alt="Sistema Solar" width="500" height="500"></br>Pantalla final</p>
 


## Referencias

Para ayudarme en la realización de esta aplicación usé la API que te proporciona [Processing](https://www.processing.org/).

* [Documentación de clase](https://ncvt-aep.ulpgc.es/cv/ulpgctp21/pluginfile.php/412240/mod_resource/content/40/CIU_Pr_cticas.pdf).

* [Processing](https://www.processing.org/)




## Resultado

Añado un GIF con el resultado de la aplicación final con el sistema planetario.

  * Resultado
  <p align="center"><img src="images/sistema_solar.gif" alt="Figura" width="500" height="500"></br>Gif resultado final</p>
