import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SequencedState_01 extends PApplet {

/*
 * ::::::::::::::::::::::::::::
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : SequencedState_01
 * Author : mw_2018
 *
 * Summary : Used for changing the state for an object
 *           at runtime.Good for implementing different
 *           menus for a sequenced interactive system
 *           & avoiding long if/else expressions.
 *
 */


/////////////////////////// GLOBALS ////////////////////////////
StateManager currentState;
State theState;
/////////////////////////// SETUP ////////////////////////////

public void setup() {
  
  background(0);
  
  noStroke();
  currentState = new StateManager();
  theState = new MainTitle();
  currentState.setState(theState);


}

/////////////////////////// DRAW ////////////////////////////
public void draw() {
  background(0);

  currentState.executeState();

}

/////////////////////////// FUNCTIONS ////////////////////////////

public void keyPressed(){
  if(key == '1'){
    theState = new MainTitle();
    currentState.setState(theState);
  }

    if(key == '2'){
    theState = new ReceiveData();
    currentState.setState(theState);
  }

    if(key == '3'){
    theState = new DisplaySketch();
    currentState.setState(theState);
  }

}
/*
 * State interface & classes
 */

public interface State {
  public void executeState();
}

////////////////////////////////////////////////////// The algorithms

public class MainTitle implements State {
  Text theTitle;

  public MainTitle() {
    theTitle = new Text();
    println("State 1 : This is the main menu");
  }

  @Override
    public void executeState() {
    theTitle.displayGreeting(width/2, height/2.3f, 133);
  }
}

public class ReceiveData implements State {
  Text theMsg;
  Timer theTimer;

  public ReceiveData() {
    theMsg = new Text();
    theTimer = new Timer(9000);
    println("State 2 : We are now listening for incoming dial data");
  }

  @Override
    public void executeState() {
    if (theTimer.sequence(1000, 2000)) {  
      theMsg.displayText(width/2, height/2, 33, "MERCI...");
    }
    if (theTimer.sequence(3000, 6000)) {  
      theMsg.displayText(width/2, height/2, 33, "COMPOSER VOTRE NUM\u00c9RO \n LENTEMENT");
    }

    if (mousePressed) {
      fill(0, 200, 255);
      noStroke();
      ellipse(mouseX, mouseY, sin(frameCount*0.05f)*25, sin(frameCount*0.05f)*25);
    }
  }
}

public class DisplaySketch implements State {

  Text theMsg;
  Timer theTimer;

  public DisplaySketch() {
    theMsg = new Text();
    theTimer = new Timer(9000);
    println("State 3 : We are now displaying the sketch dialed");
  }

  @Override
    public void executeState() {
    if (theTimer.sequence(1000, 2000)) {  
      theMsg.displayText(width/2, height/2, 33, "VOUS AVEZ COMPOS\u00c9 \n 123");
    }else {
      fill(200, 255, 0);
      noStroke();
      ellipse(width/2 + cos(frameCount*0.03f) * width/4, height/2, sin(frameCount*0.20f)*75, sin(frameCount*0.15f)*75);
    }
  }
}

//////////////////////////////////////////////////////

public class StateManager implements State {

  private State myState;

  public void setState(State _theState) {
    this.myState = _theState;
  }
  public State getState() {
    return this.myState;
  }
  @Override
    public void executeState() {
    this.myState.executeState();
  }
}
/*
 * Class for displaying textual information
 *
 */

class Text {

  PFont f;
  String[] greetings = {
    "Bonjour", "Hello", "Yo !", "Salut ;-)", "Greetings", "Howdie", "Hi"
  };
  String greeting;  
  float x, y;

  Text() {
    this.x = 0;
    this.y = 0; 
    greeting = newGreeting();
    f = createFont("FiraSans-ExtraBold", 100);
    //textFont(f, 100);
    textAlign(CENTER, CENTER);
  }

  /*
   * Displays greeting text (random message taken from greetings array list
   *
   */
  public void displayGreeting(float _x, float _y, float s) {
    x=_x;
    y =_y;
    textFont(f, s);
    fill(255, 0, 255);
    text(greeting, x, y);
  }

  /*
   * Displays another text
   *
   */
  public void displayText(float _x, float _y, float s, String tx) {
    x=_x;
    y =_y;
    textFont(f, s);
    fill(255, 0, 255);
    text(tx, x, y);
  }

  public String newGreeting() {
    String s = greetings[(int)random(greetings.length)];
    return s;
  }
}
/*
 * Timer class
 * Original written by David Bouchard
 * http://www.deadpixel.ca
 *
 * Modified by MW_01142016
 */

class Timer {
  long startTime;
  int timeout; // in milliseconds

  Timer(int timeout) {
    this.timeout = timeout;
    this.startTime = millis();
  }

  // Returns the time elapsed since the timer started (in millis)
  public long elapsedMillis() {
    return millis() - startTime;
  }

  // Returns the time elapsed since the timer started (in seconds)
  public long elapsedSeconds() {
    return (millis() - startTime)/1000;
  }

  ////////////////////////////////////////// SEQUENCED 

  /* Return true if the timer reaches a certain time 
   * Also returns false after a certain duration of time 
   *
   * @param : t = start time / d = duration of sequence
   */
  public boolean sequence(int t, int d) {
    long duration = t + d;
    boolean result = false;

    if (elapsedMillis() > t) {
      result = true;
    } else {
      result = false;
    }

    if (elapsedMillis() > duration) { 
      result = false;
    }
    return result;
  }



  // Return true if the timer is finished
  public boolean finished() {
    if (elapsedMillis() > timeout) return true;
    return false;
  }

  // Reset the timer
  public void reset() {
    this.startTime = millis();
  }

  // Reset the timer and provide a new timeout 
  // Note: we can have two functions with the same name within a class
  // as long as they have different parameters...
  public void reset(int newTimeout) {
    this.reset();  // call reset() without any parameter
    timeout = newTimeout;  // update the timeout
  }
}
  public void settings() {  size(640, 420);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#000000", "--hide-stop", "SequencedState_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
