/*
 *
 */

import geomerative.*;

public interface Shape {
	void draw();
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
