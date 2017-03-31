/*
 * ::::::::::::::::::::::::::::
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : Decorator Pattern
 *
 * Summary : Used for dynamically changing the responsibilites of objects at runtime
 *
 */


/////////////////////////// GLOBALS ////////////////////////////

Message myMSG = new SimpleMessage("In the beginning...");
/////////////////////////// SETUP ////////////////////////////

void setup() {
  //size(340, 340);
  background(0,0,33);
  myMSG.displayMSG();
  ShortNote note = new ShortNote(myMSG);
  note.addNote("side note");
  myMSG.displayMSG();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed(){


}

/////////////////////////// CLASS ////////////////////////////

public abstract class Message{
  public String msg;

  String getMSG(){
    return msg;
  }
  public abstract void displayMSG();
}

public class SimpleMessage extends Message{
  SimpleMessage(String _m){
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

  public void displayMSG(){
    theMSG.displayMSG();
    println("Note: "+theMSG);
  }
}
