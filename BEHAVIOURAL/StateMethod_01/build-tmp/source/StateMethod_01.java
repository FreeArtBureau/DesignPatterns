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

public class StateMethod_01 extends PApplet {

/*
 * :::::::::::::::::::::::::::: 
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : StateMethod_01
 *
 * Summary : Used for changing the state for an object
 *           & doing something accordingly
 *           Good for implementing different algorithms
 *           & avoiding long if/else expressions 
 */


/////////////////////////// GLOBALS ////////////////////////////
DrawingManager drawAlgo1;
State myState;
/////////////////////////// SETUP ////////////////////////////

public void setup() {
  size(640, 420);
  background(0);
  smooth();
  noStroke();
  drawAlgo1 = new DrawingManager();
  myState = new DotToDot();
  drawAlgo1.setState(myState);
  drawAlgo1.executeDrawing();

}

/////////////////////////// DRAW ////////////////////////////
public void draw() {
  //background(255);
}

/////////////////////////// FUNCTIONS ////////////////////////////

/*
 * State interface & classes
 * !!!! USE THIS WITH PENUP/PENDOWN ? Depending on state we have a pen up or a pen down ?
 */

public interface State {
	
	public void executeDrawing();
}

////////////////////////////////////////////////////// The algorithms

public class JoinDots implements State{


	@Override
	public void executeDrawing(){
		println("JoinDots is a simple join the dots algorithm");
	}
}

public class DotToDot implements State{


	@Override
	public void executeDrawing(){
		println("DotToDot is a simple dot by dot algorithm");
	}
}

//////////////////////////////////////////////////////

public class DrawingManager implements State{

	private State myState;
	public void setState(State _theState){
		this.myState = _theState;
	}
	public State getState(){
		return this.myState;
	}
	@Override
	public void executeDrawing(){
		this.myState.executeDrawing();
	}

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "StateMethod_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
