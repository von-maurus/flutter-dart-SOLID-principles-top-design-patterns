/// State Design Pattern Example
/// 
/// The State pattern allows an object to alter its behavior when its
/// internal state changes. The object will appear to change its class.

// State interface
abstract class VendingMachineState {
  void insertCoin(VendingMachine machine);
  void selectProduct(VendingMachine machine);
  void dispense(VendingMachine machine);
}

// Concrete States
class NoCoinState implements VendingMachineState {
  @override
  void insertCoin(VendingMachine machine) {
    print('Coin inserted');
    machine.setState(HasCoinState());
  }

  @override
  void selectProduct(VendingMachine machine) {
    print('Please insert a coin first');
  }

  @override
  void dispense(VendingMachine machine) {
    print('Please insert a coin first');
  }
}

class HasCoinState implements VendingMachineState {
  @override
  void insertCoin(VendingMachine machine) {
    print('Coin already inserted');
  }

  @override
  void selectProduct(VendingMachine machine) {
    print('Product selected');
    machine.setState(DispensingState());
  }

  @override
  void dispense(VendingMachine machine) {
    print('Please select a product first');
  }
}

class DispensingState implements VendingMachineState {
  @override
  void insertCoin(VendingMachine machine) {
    print('Please wait, dispensing product');
  }

  @override
  void selectProduct(VendingMachine machine) {
    print('Please wait, dispensing product');
  }

  @override
  void dispense(VendingMachine machine) {
    print('Dispensing product...');
    machine.setState(NoCoinState());
  }
}

// Context
class VendingMachine {
  VendingMachineState _state;

  VendingMachine() : _state = NoCoinState();

  void setState(VendingMachineState state) {
    _state = state;
  }

  void insertCoin() {
    _state.insertCoin(this);
  }

  void selectProduct() {
    _state.selectProduct(this);
  }

  void dispense() {
    _state.dispense(this);
  }
}

void main() {
  var machine = VendingMachine();

  print('=== Attempting to buy a product ===');
  machine.selectProduct(); // Should fail - no coin

  print('\n=== Normal flow ===');
  machine.insertCoin();
  machine.selectProduct();
  machine.dispense();

  print('\n=== Trying to insert coin twice ===');
  machine.insertCoin();
  machine.insertCoin(); // Should notify coin already inserted
  machine.selectProduct();
  machine.dispense();
}
