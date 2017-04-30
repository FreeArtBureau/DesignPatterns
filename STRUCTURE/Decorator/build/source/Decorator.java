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

public class Decorator extends PApplet {

/*
 * ::::::::::::::::::::::::::::
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : Decorator Pattern
 *
 * Summary : Dynamically changes the responsibilites
 *           of objects at runtime.
 *           Often used to add extra functionalities
 *           to an abstract component class.
 *
 */


/////////////////////////// GLOBALS ////////////////////////////

Message myMSG = new SimpleMessage();
/////////////////////////// SETUP ////////////////////////////

public void setup() {
  //size(340, 340);
  background(0,0,33);
  myMSG.addMSG("In the beginning...");
  myMSG.displayMSG();
  ShortNote note = new ShortNote(myMSG);
  note.addNote("side note");
  myMSG.displayMSG();
}

/////////////////////////// DRAW ////////////////////////////
public void draw() {

}

/////////////////////////// FUNCTIONS ////////////////////////////
public void keyPressed(){


}

/////////////////////////// CLASS ////////////////////////////

public abstract class Message{
  public String msg;

  public String getMSG(){
    return msg;
  }
  public abstract void addMSG(String _m);
  public abstract void displayMSG();
}

public class SimpleMessage extends Message{

  public SimpleMessage(){}

  public void addMSG(String _m){
    msg = _m;
  }

  public void displayMSG(){
    println("This is the simple message: " + msg);
  }
}


public abstract class Note extends Message {
  public abstract void addNote(String _n);
  public abstract String getNote();
}


public class ShortNote extends Note {
  Message theMSG;

  public ShortNote(Message _m){
    this.theMSG = _m;
    //println(getMSG());
  }

  public void addNote(String _n){
    theMSG.msg+=_n;
    println("New note added");
  }

  public String getNote(){
    return theMSG.msg + " with a new note";
  }

  public void addMSG(String _m){
    msg = _m;
  }

  public void displayMSG(){
    theMSG.displayMSG();
    println("Note: "+theMSG);
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Decorator" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
