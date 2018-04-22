/**
 * Selection Sort
 */


public class Selection implements Sort{

  public void sort(Comparable[] a) {
    int N = a.length;               // array length
    // Exchange a[i] with smallest entry in a[i+1...N).
    for (int i = 0; i < N; i++) {  
      int min = i;                 // index of minimal entr.
      for (int j = i+1; j < N; j++)
        if (less(a[j], a[min])) min = j;
      swap(a, i, min);
    }
  }

  private boolean less(Comparable v, Comparable w) {
    return v.compareTo(w) < 0;
  }

  private void swap(Comparable[] a, int i, int j) {
    Comparable t = a[i]; 
    a[i] = a[j]; 
    a[j] = t;
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