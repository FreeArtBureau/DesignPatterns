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

void setup() {
  size(640, 420);
  background(0);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();


}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if(mousePressed){
    fill(frameCount*0.15%360, 100, 100);
    float dia = sin(frameCount*0.15)*27;
    ellipse(mouseX, mouseY, dia, dia);
  }
  fill(0,0,0);
  rect(10, height-45, 400, 60);
  fill(0,0,100);
  text("Draw something with the mouse", 15, height-35);
  text("Press keys 1/2/3 to choose different file format exports", 15, height-15);


}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed(){
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
