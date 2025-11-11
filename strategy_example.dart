/// Strategy Design Pattern Example
/// 
/// The Strategy pattern defines a family of algorithms, encapsulates each one,
/// and makes them interchangeable. It lets the algorithm vary independently
/// from clients that use it.

// Strategy interface
abstract class PaymentStrategy {
  void pay(int amount);
}

// Concrete strategies
class CreditCardPayment implements PaymentStrategy {
  final String cardNumber;
  final String name;

  CreditCardPayment(this.cardNumber, this.name);

  @override
  void pay(int amount) {
    print('Paid \$$amount using Credit Card ending in ${cardNumber.substring(cardNumber.length - 4)}');
  }
}

class PayPalPayment implements PaymentStrategy {
  final String email;

  PayPalPayment(this.email);

  @override
  void pay(int amount) {
    print('Paid \$$amount using PayPal account: $email');
  }
}

class CashPayment implements PaymentStrategy {
  @override
  void pay(int amount) {
    print('Paid \$$amount in cash');
  }
}

// Context
class ShoppingCart {
  PaymentStrategy? paymentStrategy;

  void setPaymentStrategy(PaymentStrategy strategy) {
    paymentStrategy = strategy;
  }

  void checkout(int amount) {
    if (paymentStrategy == null) {
      print('Please select a payment method');
      return;
    }
    paymentStrategy!.pay(amount);
  }
}

void main() {
  var cart = ShoppingCart();

  // Pay with credit card
  cart.setPaymentStrategy(CreditCardPayment('1234567890123456', 'John Doe'));
  cart.checkout(100);

  // Pay with PayPal
  cart.setPaymentStrategy(PayPalPayment('john@example.com'));
  cart.checkout(50);

  // Pay with cash
  cart.setPaymentStrategy(CashPayment());
  cart.checkout(75);
}
