/*
 * ::::::::::::::::::::::::::::
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : FactoryMethod_01
 *
 * Summary :
 * A factory of object instances for creating geometric shapes
 */


/////////////////////////// GLOBALS ////////////////////////////
ShapeFactory shapeFactory = new ShapeFactory();
Shape myShape1 = shapeFactory.createShape("CIRCLE");
Shape myShape2 = shapeFactory.createShape("POLYGON");
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 600);
  background(0);
  smooth();
  noStroke();

  myShape1.draw();
  myShape2.draw();


}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(255);
}

/////////////////////////// FUNCTIONS ////////////////////////////
