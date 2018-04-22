/**
 * Timer - used for measuring computation time
 */

public class Timer {
  private final long start;

  /**
   * Initializes a new stopwatch.
   */
  public Timer() {
    start = System.currentTimeMillis();
  } 


  /**
   * Returns the elapsed CPU time (in seconds) since the stopwatch was created.
   *
   * @return elapsed CPU time (in seconds) since the stopwatch was created
   */
  public double elapsedTime() {
    long now = System.currentTimeMillis();
    return (now - start) / 1000.0;
  }
}