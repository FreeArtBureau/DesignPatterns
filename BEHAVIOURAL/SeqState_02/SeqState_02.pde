/*
 * ::::::::::::::::::::::::::::
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : SeqState_02
 * Author : mw_2018
 *
 * Summary : Used for changing the state for an object
 *           at runtime. Builds on Sequenced State_01
 *           Each state has a timer & a type.
 *           A listener function enables change of state. 
 *
 */


/////////////////////////// GLOBALS ////////////////////////////
StateManager currentState;
State theState;
int maxTime = 10; // max seconds for displaying sketch

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 420);
  background(0);
  smooth();
  noStroke();
  currentState = new StateManager();
  theState = new MainTitle();
  currentState.setState(theState);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);

  currentState.executeState();
  stateListener();
}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed() {
  if (key == '1') {
    theState = new MainTitle();
    currentState.setState(theState);
  }

  if (key == '2') {
    theState = new ReceiveData();
    currentState.setState(theState);
  }

  if (key == '3') {
    theState = new DisplaySketch();
    currentState.setState(theState);
  }
}

/**
 * Simple listener for updating in real-time 
 */
void stateListener() {
  // If at the end of state DisplaySketch, return to main menu  
  if ((currentState.equals("DisplaySketch"))&&(currentState.returnElapsedTime()>=maxTime)) {
    setup();
  }
  // If idle in any state for over 20 seconds, return to main menu  
  if (currentState.returnElapsedTime()>=20) {
    setup();
  }
}