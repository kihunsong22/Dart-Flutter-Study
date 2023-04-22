// String sayHello(
//     {required String name, String country = 'wakanda', int age = 10}) {
//   return "Hello $name $age $country";
// }

// void main() {
//   // print(sayHello(age: 12, country: 'cuba', name: 'potato'));
//   String? name;
//   name ??= 'default_name';
// }

// typedef ListOfInts = List<int>;

// // ListOfInts
// ListOfInts reverseListOfNumbers(ListOfInts list) {
//   var reversed = list.reversed;
//   return reversed.toList();
// }

// void main() {
//   ListOfInts a = [1, 2, 3, 4, 5];
//   print(reverseListOfNumbers(a));
// }

// class Player {
//   final String name;
//   int xp;

//   Player(this.name, this.xp);

//   // Player(String name, int xp) {
//   //   this.name = name;
//   //   this.xp xp;
//   // }

//   void sayHello() {
//     print("hey, I'm $name");
//   }
// }

// void main() {
//   var player = Player();

//   player.name = 'nico';

//   print(player.name);
// }

// class Player {
//   String name;
//   int xp;

//   // Player(this.name, this.xp);
//   Player({required this.name, required this.xp});
// }

// abstract class Human {
//   void walk();
// }

// enum Team { red, blue }

// class Player extends Human {
//   String name;
//   int xp;
//   Team team;

//   Player({required this.name, required this.xp, required this.team});

//   // Player.fromJson(Map<String, dynamic> playerJson)
//   //     : name = playerJson['name'],
//   //       xp = playerJson['xp'],
//   //       team = playerJson['team'];

//   void sayHello() {
//     print("I'm $name, xp: $xp, team: $team");
//   }

//   void walk() {
//     print("I'm walking");
//   }
// }

// void main() {
//   var nico = Player(name: 'nico', xp: 1500, team: Team.red)
//     ..name = 'las'
//     ..xp = 12000
//     ..team = Team.blue;
//   // var apiData = [
//   //   {
//   //     "name": "nico",
//   //     "team": "red",
//   //     "xp": 0,
//   //   },
//   //   {
//   //     "name": "lynn",
//   //     "team": "red",
//   //     "xp": 0,
//   //   },
//   //   {
//   //     "name": "hun",
//   //     "team": "red",
//   //     "xp": 0,
//   //   },
//   // ];

//   // apiData.forEach((playerJson) {
//   //   var player = Player.fromJson(playerJson);
//   //   player.sayHello();
//   // });
// }

// class Strong {
//   final double strengthLevel = 1500.99;
// }

// class QuickRunner {
//   void runQuick() {
//     print('runnnnniiiinngg!');
//   }
// }

// class Tall {
//   final double height = 1.99;
// }

// class Human {
//   final String name;
//   Human(this.name);
//   void sayHello() => print("Hi my name is $name");
// }

// enum Team { blue, red }

// class Player extends Human with Strong, QuickRunner, Tall {
//   final Team team;
//   int xp = 100;
//   Player({required this.team, required String name}) : super(name);
//   // sends name to Human class
//   @override
//   void sayHello() {
//     super.sayHello(); // extends parent class
//     print('my XP is ${this.xp}');
//     print('and I play for $team');
//   }
// }

// void main() {
//   var player = Player(team: Team.red, name: 'nico');
//   player.sayHello();
// }

void main() {
  // var addNum = (int a, int b) {
  //   var sum = a + b;
  //   print(sum);
  // };

  var addNum = (int a, int b) => print(a + b);

  addNum(2, 5);
}
