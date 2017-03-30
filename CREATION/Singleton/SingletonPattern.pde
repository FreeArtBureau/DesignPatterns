/*
 *
 */

 public static class SingletonPattern {
   private static SingletonPattern uniqueinstance;

   private SingletonPattern() {}


   public static SingletonPattern getInstance() {
     if(uniqueinstance == null) {
       uniqueinstance = new SingletonPattern();
     }
     return uniqueinstance;
   }

   public void displayMessage(){
     println("This is a single object.");
   }

 }
