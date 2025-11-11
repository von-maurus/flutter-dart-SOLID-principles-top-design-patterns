/// Observer Design Pattern Example
/// 
/// The Observer pattern defines a one-to-many dependency between objects
/// so that when one object changes state, all its dependents are notified
/// and updated automatically.

// Observer interface
abstract class Observer {
  void update(String message);
}

// Subject interface
abstract class Subject {
  void attach(Observer observer);
  void detach(Observer observer);
  void notify(String message);
}

// Concrete Subject
class NewsAgency implements Subject {
  final List<Observer> _observers = [];
  String _latestNews = '';

  @override
  void attach(Observer observer) {
    _observers.add(observer);
    print('Observer attached. Total observers: ${_observers.length}');
  }

  @override
  void detach(Observer observer) {
    _observers.remove(observer);
    print('Observer detached. Total observers: ${_observers.length}');
  }

  @override
  void notify(String message) {
    for (var observer in _observers) {
      observer.update(message);
    }
  }

  void setNews(String news) {
    _latestNews = news;
    print('\nNews Agency: Breaking news - $_latestNews');
    notify(_latestNews);
  }
}

// Concrete Observers
class NewsChannel implements Observer {
  final String name;

  NewsChannel(this.name);

  @override
  void update(String message) {
    print('$name received update: $message');
  }
}

void main() {
  var newsAgency = NewsAgency();

  var channel1 = NewsChannel('Channel 1');
  var channel2 = NewsChannel('Channel 2');
  var channel3 = NewsChannel('Channel 3');

  newsAgency.attach(channel1);
  newsAgency.attach(channel2);
  newsAgency.attach(channel3);

  newsAgency.setNews('Major event happening!');

  print('\n--- Channel 2 unsubscribes ---');
  newsAgency.detach(channel2);

  newsAgency.setNews('Another important update!');
}
