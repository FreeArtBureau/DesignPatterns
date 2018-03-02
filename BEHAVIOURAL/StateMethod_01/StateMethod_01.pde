/*
 * :::::::::::::::::::::::::::: 
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : StateMethod_01
 * Author : mw_2018
 *
 * Summary : Used for changing the state for an object
 *           & doing something accordingly
 *           Good for implementing different algorithms
 *           & avoiding long if/else expressions 
 */


/////////////////////////// GLOBALS ////////////////////////////
StateManager currentState;
State theState;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 420);
  background(0, 0, 33);
  smooth();
  noStroke();
  rectMode(CENTER);
  currentState = new StateManager();
  theState = new DrawSquare();
  currentState.setState( theState );
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0, 0, 33);

  currentState.executeState();
  showInfo();
}


/////////////////////////// FUNCTIONS ////////////////////////////

void showInfo() {

  fill(255);
  textSize(12);
  text("Use keys 1 | 2 | 3 to change state", 15, height-20);
}

void keyPressed() {
  if (key == '1') {
    theState = new DrawSquare();
    currentState.setState(theState);
  }

  if (key == '2') {
    theState = new DrawRotatingSquare();
    currentState.setState(theState);
  }

  if (key == '3') {
    theState = new DrawSillySquare();
    currentState.setState(theState);
  }
}