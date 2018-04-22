/**
 * Quick Sort
 */


public class Quick implements Sort {   
  public void sort(Comparable[] a) {
    shuffle(a);
    sort(a, 0, a.length-1);
  }

  private void sort(Comparable[] a, int low, int hi) {
    if (hi <= low) return;
    int j = partition(a, low, hi);
    sort(a, low, j-1);
    sort(a, j+1, hi);
  }

  private int partition(Comparable[] a, int low, int hi) {

    int i = low, j = hi+1;
    Comparable v = a[low];
    while (true) {
      while (less(a[++i], v)) if (i == hi) break;
      while (less(v, a[--j])) if (i == low) break;
      if (i >= j) break;
      swap(a, i, j);
    }
    swap(a, low, j);
    return j;
  }

  /**
   * Swaps two elements in an array
   * @param   a      the array with the two elements to swap
   * @param   i      index of one of the elements
   * @param   j      index of the other element
   */
  private void swap(Comparable[] a, int i, int j) {
    Comparable t = a[i]; 
    a[i] = a[j]; 
    a[j] = t;
  }

  private void shuffle(Comparable[] a) {
    int N = a.length;
    Random rand = new Random();
    for (int i=0; i<N; i++) {
      int r = rand.nextInt(i+1); // random element
      swap(a, i, r); // swap current element with the randomly chosen one
    }
  }

  /**
   * returns true when the item v is less than item w
   */
  private boolean less(Comparable v, Comparable w) {
    return v.compareTo(w) < 0; // (-1 v<w || 0 v=w || 1 v>w : These are the values from compareTo)
  }

  public void show(Comparable[] a) {
    for (int i=0; i<a.length; i++) 
      println(a[i] + " ");
  }

  public boolean isSorted(Comparable[] a) {
    println("Number of items sorted: "+a.length);
    for (int i=1; i<a.length; i++)
      if (less(a[i], a[i-1])) 
        return false;
    return true;
  }
}