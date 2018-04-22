/*
 * ::::::::::::::::::::::::::::
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : FactorySortPattern
 *
 * Summary : A factory of object instances for applying sort algorithms
 * author : mw2018
 * web : https://bitbucket.org/mwebster_/algorithms
 */


import java.util.Random;

SortFactory SF;

void setup() {
  Timer timer = new Timer();
  
  SF = new SortFactory();
  Sort algo1 = SF.chooseSort("SHELL");
  Sort algo2 = SF.chooseSort("QUICK");
  
  String[] txt = loadStrings("Facebook.txt");
  String allWords = join(txt, " ").toLowerCase(); 
  String[] s = splitTokens(allWords, " ");

  algo1.sort(s);
  algo1.show(s);
  
  
  Double[] randNum = generateRand(100);
  algo2.sort(randNum);
  algo2.show(randNum);
  
  println(" ");
  println(":::: TIMER >>>");
  println("Calculation time: "+timer.elapsedTime());
}


void draw() {
}


///////////////// FUNCTIONS

Double[] generateRand(int N) {
  Random rand = new Random();
  Double[] r = new Double[N];
  for (int i=0; i<N; i++) {
    r[i] = rand.nextDouble();
  }
  return r;
}