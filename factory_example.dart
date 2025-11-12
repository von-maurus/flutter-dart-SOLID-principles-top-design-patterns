/// Factory Design Pattern Example
/// 
/// The Factory pattern provides an interface for creating objects
/// without specifying their concrete classes.
/// Parametrized Factory method pattern (Simple Factory Method) and the classic Factory method (GoF)
abstract class Vehicle {
  void drive();
}

class Car implements Vehicle {
  @override
  void drive() {
    print('Driving a car');
  }
}

class Bike implements Vehicle {
  @override
  void drive() {
    print('Riding a bike');
  }
}

class VehicleFactory {
  static Vehicle createVehicle(String type) {
    switch (type.toLowerCase()) {
      case 'car':
        return Car();
      case 'bike':
        return Bike();
      default:
        throw ArgumentError('Unknown vehicle type: $type');
    }
  }
}

void main() {
  var car = VehicleFactory.createVehicle('car');
  car.drive();

  var bike = VehicleFactory.createVehicle('bike');
  bike.drive();
}
