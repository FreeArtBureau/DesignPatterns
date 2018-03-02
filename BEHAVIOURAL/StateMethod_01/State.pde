/*
 * State interface & classes
 */

public interface State {
  public void executeState();
}

////////////////////////////////////////////////////// The algorithms

public class DrawSquare implements State {

  public DrawSquare() {
    println("State 1 : This state draws a blue square");
  }

  @Override
    public void executeState() {
    fill(0, 0, 255);
    rect(width/2, height/2, 200, 200);
  }
}

public class DrawRotatingSquare implements State {
  public DrawRotatingSquare() {
    println("State 2 : This state draws a rotating pink square");
  }

  @Override
    public void executeState() {
    fill(255, 0, 255);
    translate(width/2, height/2);
    rotate(-frameCount*0.05);
    rect(0, 0, 200, 200);
  }
}

public class DrawSillySquare implements State {
  public DrawSillySquare() {
    println("State 3 : We are now displaying a silly square");
  }
  @Override
    public void executeState() {
    fill(255, 255, 0);
    translate(width/2, height/2);
    rotate(frameCount*0.05);
    rect(0, 0, sin(frameCount*0.095)*280, sin(frameCount*0.075)*300);
    //ellipse(width/2 + cos(frameCount*0.03) * width/4, height/2, sin(frameCount*0.20)*75, sin(frameCount*0.15)*75);
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