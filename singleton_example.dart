/// Singleton Design Pattern Example
/// 
/// The Singleton pattern ensures that a class has only one instance
/// and provides a global point of access to that instance.

void main() {
  // I prefer lazy in this case because I don't have clear view on how and where I'm going to
  // be using this singleton, so I don't have to use memory unnecesary

  final nextNumber = NumberSingletonLazy();
  print(nextNumber.getNextNumber());
  print(nextNumber.getNextNumber());
  print(nextNumber.getNextNumber());

  final nextNumberEager = NumberSingletonEager();
  print(nextNumberEager.getNextNumber());
  print(nextNumberEager.getNextNumber());
}

/// Lazy Init Singleton
class NumberSingletonLazy {
  NumberSingletonLazy._internal();
  static NumberSingletonLazy? _instance;
  factory NumberSingletonLazy() => _instance ?? NumberSingletonLazy._internal();

  int position = 0;
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  int getNextNumber() {
    final nextNumber = numbers[position];
    position += 1;
    return nextNumber;
  }
}

/// Eager Init Singleton
class NumberSingletonEager {
  NumberSingletonEager._internal();
  static final NumberSingletonEager _instance =
      NumberSingletonEager._internal();

  factory NumberSingletonEager() {
    print('Create NumberSingletonEager');
    return _instance;
  }
  int position = 0;
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  int getNextNumber() {
    final nextNumber = numbers[position];
    position += 1;
    return nextNumber;
  }
}
