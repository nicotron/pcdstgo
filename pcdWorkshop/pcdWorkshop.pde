// 26 Enero 2019
// Processing Community Day Santiago @pcd.stgo
// Nicolás Troncoso López @nicotron

// Introducción a Processing: Creación, repeticón, y gráfica aleatoria.

/*
El código que hay en este archivo está en gran parte comentado, por medio de
cambiar el estado del código y descomentar ciertas líneas o párrafos el programa
cambiará el resultado.
A medida que el workshop avance se activarán líneas y párrafos que configurarán un
programa más complejo.

Comentar código sirve para desactivar texto para el programa, pero también sirve
para dejar texto para nosotros, traducir la línea a nuestros lenguaje para en el
futuro releer el programa y entender de mejor manera.

*/

// Con dos slash se comenta una línea, el programa no lo lee pero nosotros sí
/*
Texto o código entre un slash más un asterísco y
un asterísco y un slash
sive para crear comentarios de bloque o párrafos
*/

/* LO BÁSICO: Processing tiene dos ámbitos {}, uno corre una sola vez y "setea"
los valores iniciales, y el segundo corre hasta que el programa se caiga, se
cierre por alguna orden, o se le acabe la bateria al dispositivo que lo contiene.
*/

// A---------------------------------------------------------------------------
// // primer ámbito
// void setup() {
//     // dentro de este ámbito ocurren las ordenes "funciones" que utilizarémos
//     // para: 1 usar funciones propias del ámbito, 2 inicializar variables*
//     size(800, 600); // función que crea el tamaño de la ventana
//
//
// }
//
// // segundo ámbito
// void draw() {
//     // fondo con diferentes opciones
//     background(0);          // un parámetro 0-255 0 negro, 255 blanco
//     background(255, 255);   // dos parámetros grises, alfa
//     background(0, 0, 0);    // tres R, G, B
//     background(0, 0, 0, 0); // cuatro R, G, B, Alfa
//     background(#3446AA);    // hexadecimal
//
//     color fondo = color(0, 0, 255);  // variable de tipo color
//     background(fondo);
//
//     // es importante que el nombre de las variables diga de su uso,
//     // ayudará a una mejor lectura
//     color azul = color(0, 0, 255);  // variable de tipo color
//     background(azul);               // el fondo es de color azul
// }

// B ---------------------------------------------------------------------------
// void setup() {
//   size(800, 600);
// }
//
// void draw() {
//     color azul = color(0, 0, 255);
//     background(azul);
//
//     /*
//     funciones de forma: tipo de forma, posición, y tamaño
//     funciones de color: contorno y relleno
//     En general se describen así:
//     "un círculo blanco de contono negro en el centro de la pantalla"
//     En cuanto al código el orden es diferente, sirve la analogía de primero
//     tomar el lápiz (color), y luego dibujar la figura (función)
//     */
//
//     //"un círculo blanco de contono negro en el centro de la pantalla"
//     color blanco = color(255);
//     fill(blanco);                    // relleno blanco
//     color rojo = color(255, 0, 0);
//     stroke(rojo);                   // contorno rojo
//
//     // ¿el centro de la pantalla?
//     ellipse(400, 300);              // el centro según el canvas
//     ellipse(width/2, height/2);     // según cualquier canvas
//     ellipse(width*0.5, height*0.5); // cualquier posición en función de cualquier canvas
//
//     // ¿y el tamaño?
//     ellipse(width*0.5, height*0.5, 40, 40); // 3, 4 parámetro tamaño en x, en y
// }

// C---------------------------------------------------------------------------
// float x, y; // variables de tipo número decimal         // 1:DECLARACION
//
// void setup() {
//   size(800, 600);
//   x = width*0.3;                                        // 2:INICIALIZACION
//   y = 0;
// }
//
// void draw() {
//     color azul = color(0, 0, 255);
//     background(azul);
//
//     color blanco = color(255);
//     fill(blanco);
//     color rojo = color(255, 0, 0);
//     stroke(rojo);
//
//     strokeWeight(5);                // grosor en px
//
//     ellipse(width*0.5, height*0.5, 40, 40);
//     ellipse(mouseX, mouseY, 40, 40);
//     ellipse(x, y, 40, 40);                              // 3:USO
//
//     /* Las variables son FUNDAMENTALES porque son un puntero hacia la memoria
//     en donde vive un valor (número, letra, texto, color, Objeto) el cual lo
//     podemos modificar con un orden general que afecte el programa
//     */
//
//     // suma 1 a y
//     y +=1;
//
//     /* Con estas modificaciones a los valores de las variables o podemos crear
//     condiciones: "si pasa B, ejcuta B"
//     */
//     // si el círculo sale por abajo, aparece por arriba
//     if (y > height) {
//         y = 0;
//     }
// }

// LOOPS ); -------------------------------------------------------------------------
float x, y;
color azul, blanco, rojo;

void setup() {
  size(800, 600);
  x = width*0.3;
  y = height*0.3;
  azul = color(0, 0, 255);
  blanco = color(255);
  rojo = color(255, 0, 0);
}

void draw() {
    background(azul);

    // un "for loop" es un contador con inicio, fin, y un update
    // desde 0 a 10, cada 1 (++)
    for (int i = 0; i < 10; i ++) {
        fill(blanco);
        stroke(rojo);
        strokeWeight(5);
        x = map(i, 0, 10, width*.3, width*.6);
        ellipse(x+i, y, 40, 40);        // uso de la variable LOCAL del contador
    }
} // FIN DEL LOOP ----------------

        // se puede modificar la variable x con los valores de i convertidos
        //x = map(i, 0, 10, width*.3, width*.6);
        //ellipse(x, y, 40, 40);        // uso de la variable LOCAL del contador

        // se puede anidar un loop dentro de otro y repetir lo anterior para obtener
        // una grilla
        // for (int i = 0; i < 10; i ++) {
        //     for (int j = 0; j < 5; j ++) {
        //         fill(blanco);
        //         stroke(rojo);
        //         strokeWeight(5);
        //         x = map(i, 0, 10, width*.3, width*.6);
        //         y = map(j, 0, 5, height*.3, height*.6);
        //         ellipse(x, y, 40, 40);        // uso de la variable LOCAL del contador
        //     }
        // }
/*
color[] paleta = new color[6];
int fondo, xTotal, yTotal;

void setup() {
    size(800, 600);
    smooth();
    paleta[0] = color(#FF789A);
    paleta[1] = color(#05000A);

    paleta[2] = color(#00FFF6);

    paleta[3] = color(#DDA2FF);
    paleta[4] = color(#FFE929);
    paleta[5] = color(#003CFF);

    fondo = (int)random(paleta.length);
    xTotal = 24;
    yTotal = 20;
}

void draw() {
    background(paleta[fondo]);

    for (int x = 0; x < xTotal; x++) {
        for (int y = 0; y < yTotal; y++) {
            float x2 = map(x, 0, xTotal, width * .1, width * .9);
            float y2 = map(y, 0, yTotal, height * .1, height * .9);
            int modulo = (int)map(noise(x2 + y2), 0, 1, 0, 5);
            estrella(x2, y2, 10, 13, 8, modulo, 1);
        }
    }
    for (int x = 0; x < xTotal / 2; x++) {
        for (int y = 0; y < yTotal / 2; y++) {
            float x2 = map(x, 0, (xTotal/2), width * .1, width * .9);
            float y2 = map(y, 0, (yTotal/2), height * .1, height * .9);
            int modulo = (int)map(noise(x2 + y2), 0, 1, 0, 5);
            estrella(x2, y2, 10, 13, 8, modulo, 2);
        }
    }
    noLoop();
}
void keyPressed() {
    if (key == 'x') {
        xTotal++;
    }
    if (key == 'z') {
        xTotal--;
    }
    if (key == 's') {
        yTotal++;
    }
    if (key == 'a') {
        yTotal--;
    }
    if (key == ' ') {
        redraw();
        fondo = (int)random(paleta.length);
        saveFrame("files/"+frameCount+".png");
    }
}
void estrella(float x, float y, float radius1, float radius2, int npoints, int modulo, int n) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle / 2.0;

    if (n == 1) {
        noStroke();
        fill(paleta[modulo]);
    }
    if (n == 2) {
        noFill(); strokeWeight(1);
        stroke(paleta[(int)random(modulo)]);
    }

    beginShape();
    float sx=0;
    float sy=0;
    for (float a = 0; a < TWO_PI; a += angle) {
        if (n == 2) {
             sx = x + cos(a) * (radius2-2);
             sy = y + sin(a) * (radius2-2);
        } else {
             sx = x + cos(a) * radius2;
             sy = y + sin(a) * radius2;
        }
        vertex(sx, sy);
        if (n == 2) {
            sx = x + cos(a + halfAngle) * (radius1-2);
            sy = y + sin(a + halfAngle) * (radius1-2);
        } else {
            sx = x + cos(a + halfAngle) * radius1;
            sy = y + sin(a + halfAngle) * radius1;
        }
        vertex(sx, sy);
    }
    endShape(CLOSE);
}
*/
