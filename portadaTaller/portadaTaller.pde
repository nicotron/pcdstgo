// Processing Community Day Santiago @pcd.stgo
// Nicolás Troncoso López @nicotron

// Portada para taller:
// Introducción a Processing: Creación, repeticón, y gráfica aleatoria.

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
