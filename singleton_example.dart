/// Singleton Design Pattern Example
/// 
/// The Singleton pattern ensures that a class has only one instance
/// and provides a global point of access to that instance.

class Singleton {
  // Private constructor
  Singleton._privateConstructor();

  // Static instance variable
  static final Singleton _instance = Singleton._privateConstructor();

  // Factory constructor that returns the same instance
  factory Singleton() {
    return _instance;
  }

  // Example method
  void doSomething() {
    print('Singleton instance is doing something');
  }
}

void main() {
  // Creating instances
  var instance1 = Singleton();
  var instance2 = Singleton();

  // Both instances are the same
  print('Are instances identical? ${identical(instance1, instance2)}');
  
  instance1.doSomething();
}
