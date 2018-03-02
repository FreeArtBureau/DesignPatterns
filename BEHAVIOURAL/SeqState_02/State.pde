/*
 * State interface & classes
 */

public interface State {
  public void executeState();
  public int returnElapsedTime();
  public String getType();
}

////////////////////////////////////////////////////// The algorithms

public class MainTitle implements State {
  Text theTitle;
  Timer theTimer;
  String type;

  public MainTitle() {
    theTitle = new Text();
    theTimer = new Timer(9000);
    type = "MainTitle";
    println("State 1 : This is the main menu");
  }

  public String getType() {
    return type;
  }

  public int returnElapsedTime() {
    int t = (int)theTimer.elapsedSeconds();
    return t;
  }  

  @Override
    public void executeState() {
    theTitle.displayGreeting(width/2, height/2.3, 133);
  }
}

public class ReceiveData implements State {
  Text theMsg;
  Timer theTimer;
  String type;

  public ReceiveData() {
    theMsg = new Text();
    theTimer = new Timer(9000);
    type = "ReceiveData";
    println("State 2 : We are now listening for incoming dial data");
  }

  public String getType() {
    return type;
  }

  public int returnElapsedTime() {
    int t = (int)theTimer.elapsedSeconds();
    return t;
  }

  @Override
    public void executeState() {
    if (theTimer.sequence(1000, 2000)) {  
      theMsg.displayText(width/2, height/2, 33, "MERCI...");
    }
    if (theTimer.sequence(3000, 6000)) {  
      theMsg.displayText(width/2, height/2, 33, "COMPOSER VOTRE NUMÉRO \n LENTEMENT");
    }

    if (mousePressed) {
      fill(0, 200, 255);
      noStroke();
      ellipse(mouseX, mouseY, sin(frameCount*0.05)*25, sin(frameCount*0.05)*25);
    }
  }
}

public class DisplaySketch implements State {

  Text theMsg;
  Timer theTimer;
  String type;

  public DisplaySketch() {
    theMsg = new Text();
    theTimer = new Timer(10000);
    type = "DisplaySketch";
    println("State 3 : We are now displaying the sketch dialed");
  }

  public String getType() {
    return type;
  }  

  public int returnElapsedTime() {
    int t = (int)theTimer.elapsedSeconds();
    return t;
  }

  @Override
    public void executeState() {
    if (theTimer.sequence(1000, 3000)) {  
      theMsg.displayText(width/2, height/2, 33, "VOUS AVEZ COMPOSÉ \n 123");
    }
    if (theTimer.sequence(3000, 10000)) { 
      fill(200, 255, 0);
      noStroke();
      ellipse(width/2 + cos(frameCount*0.03) * width/4, height/2, sin(frameCount*0.20)*75, sin(frameCount*0.15)*75);
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
    public String getType() {
    return this.myState.getType();
  }
  @Override
    public int returnElapsedTime() {
    int t = this.myState.returnElapsedTime();
    return t;
  }

  @Override
    public void executeState() {
    this.myState.executeState();
  }
}