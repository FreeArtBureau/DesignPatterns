/**
 * Shell Sort
 */

public class Shell implements Sort  {
  
  public void sort(Comparable[] a) {
    int N = a.length;  
    int h = 1;
    // sort a[i] into increasing order.
    while(h < N/3) h = 3*h + 1; // 1, 4, 13, 40 ...
     while(h >=1) {
      for (int i = h; i < N; i++) {
        for(int j=i; j >= h && less(a[j], a [j-h]); j-=h)
        swap(a, j, j-h);
    }
    h = h/3;
  }
}

  /**
   * returns true when the item v is less than item w
   */
  private boolean less(Comparable v, Comparable w) {
    return v.compareTo(w) < 0; // (-1 v<w || 0 v=w || 1 v>w : These are the values from compareTo)
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