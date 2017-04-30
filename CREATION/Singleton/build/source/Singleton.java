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

public class Singleton extends PApplet {

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

public void setup() {
  //size(640, 640);
  background(0);
  theSingleton = SingletonPattern.getInstance(); // only once instance
  theSingleton.displayMessage();

  //@params : size / step / angle

}

/////////////////////////// DRAW ////////////////////////////
public void draw() {
  //background(255);

}

/////////////////////////// FUNCTIONS ////////////////////////////
/*
 *
 */

 public static class SingletonPattern {
   private static SingletonPattern uniqueinstance;

   private SingletonPattern() {}


   public static SingletonPattern getInstance() {
     if(uniqueinstance == null) {
       uniqueinstance = new SingletonPattern();
     }
     return uniqueinstance;
   }

   public void displayMessage(){
     println("This is a single object.");
   }

 }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Singleton" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
