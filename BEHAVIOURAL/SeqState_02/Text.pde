/*
 * Class for displaying textual information
 *
 */

class Text {

  PFont f;
  String[] greetings = {
    "Bonjour", "Hello", "Yo !", "Salut ;-)", "Greetings", "Howdie", "Hi"
  };
  String greeting;  
  float x, y;

  Text() {
    this.x = 0;
    this.y = 0; 
    greeting = newGreeting();
    f = createFont("FiraSans-ExtraBold", 100);
    //textFont(f, 100);
    textAlign(CENTER, CENTER);
  }

  /*
   * Displays greeting text (random message taken from greetings array list
   *
   */
  void displayGreeting(float _x, float _y, float s) {
    x=_x;
    y =_y;
    textFont(f, s);
    fill(255, 0, 255);
    text(greeting, x, y);
  }

  /*
   * Displays another text
   *
   */
  void displayText(float _x, float _y, float s, String tx) {
    x=_x;
    y =_y;
    textFont(f, s);
    fill(255, 0, 255);
    text(tx, x, y);
  }

  String newGreeting() {
    String s = greetings[(int)random(greetings.length)];
    return s;
  }
}