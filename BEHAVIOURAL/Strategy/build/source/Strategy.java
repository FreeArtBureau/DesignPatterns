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

public class Strategy extends PApplet {

/*
 * ::::::::::::::::::::::::::::
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : Strategy Pattern
 *
 * Summary : Used to encapsulate a family of 'algorithms'
 *           Keeps behaviours separate from the concrete
 *           parent class
 */


/////////////////////////// GLOBALS ////////////////////////////

ExportFile myExport;
/////////////////////////// SETUP ////////////////////////////

public void setup() {
  
  background(0);
  colorMode(HSB, 360, 100, 100);
  
  noStroke();


}

/////////////////////////// DRAW ////////////////////////////
public void draw() {
  if(mousePressed){
    fill(frameCount*0.15f%360, 100, 100);
    float dia = sin(frameCount*0.15f)*27;
    ellipse(mouseX, mouseY, dia, dia);
  }
  fill(0,0,0);
  rect(10, height-45, 400, 60);
  fill(0,0,100);
  text("Draw something with the mouse", 15, height-35);
  text("Press keys 1/2/3 to choose different file format exports", 15, height-15);


}

/////////////////////////// FUNCTIONS ////////////////////////////
public void keyPressed(){
    myExport = new ExportFile();
    if(key == '1'){
      myExport.setFileFormat(new JPEGExport());
      myExport.exportFile("Export_###");
    }
    if(key == '2'){
      myExport.setFileFormat(new PNGExport());
      myExport.exportFile("Export_###");
    }
    if(key == '3'){
      myExport.setFileFormat(new TIFFExport());
      myExport.exportFile("Export_###");
    }

}

/////////////////////////// CLASS ////////////////////////////

 public class ExportFile {
      private FileFormat theFileFormat;

      public void setFileFormat(FileFormat _ff){
        this.theFileFormat = _ff;
      }

      public void exportFile(String _s){
        theFileFormat.exportFileStrategy(_s);
      }

}

public interface FileFormat{
  public void exportFileStrategy(String _s);
}

public class JPEGExport implements FileFormat {
  public void exportFileStrategy(String _s){
    saveFrame(_s+".jpg");
  }
}

public class PNGExport implements FileFormat {
  public void exportFileStrategy(String _s){
    saveFrame(_s+".png");
  }
}

public class TIFFExport implements FileFormat {
  public void exportFileStrategy(String _s){
    saveFrame(_s+".tif");
  }
}
  public void settings() {  size(640, 420);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Strategy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
