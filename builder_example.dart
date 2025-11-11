/// Builder Design Pattern Example
/// 
/// The Builder pattern separates the construction of a complex object
/// from its representation, allowing the same construction process
/// to create different representations.

class Pizza {
  final String size;
  final bool cheese;
  final bool pepperoni;
  final bool mushrooms;

  Pizza._builder(PizzaBuilder builder)
      : size = builder.size,
        cheese = builder.cheese,
        pepperoni = builder.pepperoni,
        mushrooms = builder.mushrooms;

  @override
  String toString() {
    return 'Pizza(size: $size, cheese: $cheese, pepperoni: $pepperoni, mushrooms: $mushrooms)';
  }
}

class PizzaBuilder {
  String size = 'medium';
  bool cheese = false;
  bool pepperoni = false;
  bool mushrooms = false;

  PizzaBuilder setSize(String size) {
    this.size = size;
    return this;
  }

  PizzaBuilder addCheese() {
    cheese = true;
    return this;
  }

  PizzaBuilder addPepperoni() {
    pepperoni = true;
    return this;
  }

  PizzaBuilder addMushrooms() {
    mushrooms = true;
    return this;
  }

  Pizza build() {
    return Pizza._builder(this);
  }
}

void main() {
  var pizza = PizzaBuilder()
      .setSize('large')
      .addCheese()
      .addPepperoni()
      .addMushrooms()
      .build();

  print(pizza);
}
