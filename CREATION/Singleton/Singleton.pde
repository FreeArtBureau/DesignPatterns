/*
 * ::::::::::::::::::::::::::::
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : Singleton
 *
 * Summary : A pattern for creating a unique object
 */


/////////////////////////// GLOBALS ////////////////////////////

SingletonPattern theSingleton;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  //size(640, 640);
  background(0);
  theSingleton = SingletonPattern.getInstance(); // only once instance
  theSingleton.displayMessage();

  //@params : size / step / angle

}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(255);

}

/////////////////////////// FUNCTIONS ////////////////////////////
