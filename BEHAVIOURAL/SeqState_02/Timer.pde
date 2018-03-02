/*
 * Timer class
 * Original written by David Bouchard
 * http://www.deadpixel.ca
 *
 * Modified by MW_01142016
 */

class Timer {
  long startTime;
  int timeout; // in milliseconds

  Timer(int timeout) {
    this.timeout = timeout;
    this.startTime = millis();
  }

  // Returns the time elapsed since the timer started (in millis)
  long elapsedMillis() {
    return millis() - startTime;
  }

  // Returns the time elapsed since the timer started (in seconds)
  long elapsedSeconds() {
    return (millis() - startTime)/1000;
  }

  ////////////////////////////////////////// SEQUENCED 

  /* Return true if the timer reaches a certain time 
   * Also returns false after a certain duration of time 
   *
   * @param : t = start time / d = duration of sequence
   */
  boolean sequence(int t, int d) {
    long duration = t + d;
    boolean result = false;

    if (elapsedMillis() > t) {
      result = true;
    } else {
      result = false;
    }

    if (elapsedMillis() > duration) { 
      result = false;
    }
    return result;
  }



  // Return true if the timer is finished
  boolean finished() {
    if (elapsedMillis() > timeout) return true;
    return false;
  }

  // Reset the timer
  void reset() {
    this.startTime = millis();
  }

  // Reset the timer and provide a new timeout 
  // Note: we can have two functions with the same name within a class
  // as long as they have different parameters...
  void reset(int newTimeout) {
    this.reset();  // call reset() without any parameter
    timeout = newTimeout;  // update the timeout
  }
}