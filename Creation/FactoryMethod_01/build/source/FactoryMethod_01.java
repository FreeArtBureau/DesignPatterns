import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import geomerative.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FactoryMethod_01 extends PApplet {

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

public void setup() {
  
  background(0);
  
  noStroke();

  myShape1.draw();
  myShape2.draw();


}

/////////////////////////// DRAW ////////////////////////////
public void draw() {
  //background(255);
}

/////////////////////////// FUNCTIONS ////////////////////////////



public interface Shape {
	public void draw();
}
//////////////////////////

public class Circle implements Shape {

	public void draw(){
			fill(0,0,255);
			ellipse(width/2, height/2, 300, 300);
	}

}

public class Polygon implements Shape {

	public void draw(){
		rectMode(CENTER);
		fill(255,200,0);
		rect(width/2, height/2, 200, 200);

	}

}


//////////////////////////

public class ShapeFactory {
	public Shape createShape(String _shapeType){
		if(_shapeType == null){
			return null;
		}

		if(_shapeType.equalsIgnoreCase("CIRCLE")){
			println("A Circle object has been created");
			return new Circle();
		}

		else if(_shapeType.equalsIgnoreCase("POLYGON")){
		println("A Polygon object has been created");
			return new Polygon();
		}
		return null;
	}
}
  public void settings() {  size(600, 600);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FactoryMethod_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
