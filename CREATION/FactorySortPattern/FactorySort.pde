/**
 * Factory Strategy for sorting algorithms
 */



public interface Sort {

  void sort(Comparable[] a);
  void show(Comparable[] a);
}


public class SortFactory {

  public Sort chooseSort(String sortAlgo) {
    if (sortAlgo == null) {
      return null;
    }
    if (sortAlgo.equalsIgnoreCase("QUICK")) {
      println("Chosen algorithm: Quick Sort");
      return new Quick();
    }

    if (sortAlgo.equalsIgnoreCase("SELECTION")) {
      println("Chosen algorithm: Selection Sort");
      return new Selection();
    }
    
    if (sortAlgo.equalsIgnoreCase("SHELL")) {
      println("Chosen algorithm: Shell Sort");
      return new Shell();
    }
    
    println("Error: String not recognised");
    return null;
  }
}