/*
 * ::::::::::::::::::::::::::::
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : FactoryMethod_02
 *
 * Summary : A factory of object instances for creating geometric shapes
 *           In this sketch we move on to actually computing & displaying
 *           the shapes we have created.
 */


/////////////////////////// GLOBALS ////////////////////////////
ShapeFactory shapeFactory = new ShapeFactory();
Shape myShape1 = shapeFactory.createShape("LINE");
Shape myShape2 = shapeFactory.createShape("CIRCLE");
Shape myShape3 = shapeFactory.createShape("POLYGON");

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 640);
  background(0);

  //@params : size / step / angle
  myShape1.computeShape(770, 30, 45);
  myShape2.computeShape(370, 50, 0);
  myShape3.computeShape(100, 3, 45);

    //@params : central position / contourON/OFF
    PVector pos = new PVector(width/2, height/2);
    myShape1.drawShape(pos, false);
    myShape2.drawShape(pos, false);
    strokeWeight(9);
    stroke(255,200,0);
    myShape3.drawShape(pos, true);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(255);
}

/////////////////////////// FUNCTIONS ////////////////////////////