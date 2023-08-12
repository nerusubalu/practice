// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Login'),
//     );
//   }
// }
//
// class Album {
//   final int userId;
//   final int id;
//   final String title;
//
//   const Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   bool _bool=false;
//   int _counter = 0;
//   bool _secureText = true;
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   // obtain shared preferences
//
//   late Future<String> futureAlbum;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//     // futureAlbum = authentication();
//     // print(futureAlbum);
//     // print(futureAlbum);
//     // Start listening to changes.
//     // emailController.addListener(_printLatestValue);
//   }
//
//   Future<void> _loadData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       // _bool = prefs.getBool('login')!;
//       print(_bool);
//       if (_bool){
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const SecondRoute()),
//         );
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   void _printLatestValue() {
//     print('Second text field: ${emailController.text}');
//   }
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   Future<void> storeData(auth) async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       prefs.setBool('login', auth);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text("Drawer Header"),
//             ),
//             ListTile(
//               title: const Text("Item 1"),
//               onTap: () {
//
//               },
//             ),
//             ListTile(
//               title: const Text("Item 2"),
//               onTap: () {
//
//               },
//             ),
//             ListTile(
//               title: const Text("Item 2"),
//               onTap: () {
//
//               },
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Image(image: AssetImage('images/business card_final.png')),
//             // Image.network('https://picsum.photos/250?image=9'),
//             const Text(
//               'Login', style: TextStyle(fontSize: 28),
//             ),
//             ConstrainedBox(constraints: const BoxConstraints(minHeight: 10)),
//             TextField(
//               autofocus: true,
//               controller: emailController,
//               decoration: const InputDecoration(hintText: "Email" ,border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//                   constraints: BoxConstraints(maxWidth: 320),
//                   contentPadding: EdgeInsets.all(20),
//                   icon: Icon(Icons.person)
//               ),
//             ),
//             ConstrainedBox(constraints: const BoxConstraints(minHeight: 20)),
//             TextField(
//               controller: passwordController,
//               obscureText: _secureText,
//               decoration: InputDecoration(hintText: "Password",border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//                 constraints: const BoxConstraints(maxWidth: 320),
//                 contentPadding: const EdgeInsets.all(20),
//                 icon: const Icon(Icons.lock),
//                 suffixIcon: IconButton(
//                   icon: Icon(_secureText
//                       ? Icons.visibility_off
//                       : Icons.visibility),
//                   onPressed: () {
//                     setState(() {
//                       _secureText = !_secureText;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             ConstrainedBox(constraints: const BoxConstraints(minHeight: 20)),
//             FilledButton(onPressed: () async {
//                   bool response = await authenticate(emailController.text, passwordController.text);
//                   if (response){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const SecondRoute()),
//                     );
//                   }
//             },
//               child: const Text("Login", style: TextStyle(fontSize: 24, color: Colors.white)),
//             ),
//             // Center(
//             //   child: FutureBuilder<String>(
//             //     future: futureAlbum,
//             //     builder: (context, snapshot) {
//             //       if (snapshot.hasData) {
//             //         storeData(true);
//             //         return Text(snapshot.data!.toString());
//             //       } else if (snapshot.hasError) {
//             //         return Text('${snapshot.error}');
//             //       }
//             //
//             //       // By default, show a loading spinner.
//             //       return CircularProgressIndicator();
//             //     },
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.favorite_border_outlined),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//   Future<bool> authenticate(String username, String password) async {
//
//     var headers = {
//       'Content-Type': 'application/json'
//     };
//     var body = json.encode({
//       "username": username,
//       "password": password
//     });
//
//     final response = await http.post(Uri.parse('https://atbcamg9e2.execute-api.us-east-1.amazonaws.com/V1/auth'),body: body, headers: headers);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       print(data['username']);
//       if (data['username']==null){
//         return false;
//       } else {
//         return true;
//       }
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//   Future<String> authentication() async {
//
//     Future<void> _storeData(auth) async {
//       final prefs = await SharedPreferences.getInstance();
//       prefs.setBool('login', auth);
//     }
//
//     var headers = {
//       'Content-Type': 'application/json'
//     };
//     var body = json.encode({
//       "username": "username",
//       "password": "password"
//     });
//
//     final response = await http.post(Uri.parse('https://atbcamg9e2.execute-api.us-east-1.amazonaws.com/V1/auth'),body: body, headers: headers);
//
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       print(data['username']);
//       // _storeData(true);
//       return data['username'];
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
// }
//
//
//
//
// class FirstRoute extends StatelessWidget {
//   const FirstRoute({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Route'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Open route'),
//           onPressed: () {
//             // Navigate to second route when tapped.
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class SecondRoute extends StatelessWidget {
//   const SecondRoute({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Route'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Navigate back to first route when tapped.
//             Navigator.pop(context);
//           },
//           child: const Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: FutureBuilder<bool>(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasError) {
              // Handle error case
            }
            if (snapshot.data == true) {
              return const SecondRoute();
            } else {
              return const MyHomePage(title: 'Login');
            }
          }
        },
      ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('login') ?? false;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _secureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('login') ?? false;
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SecondRoute()),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login',
              style: TextStyle(fontSize: 28),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    contentPadding: EdgeInsets.all(20),
                    constraints: BoxConstraints(maxWidth: 340)
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                obscureText: _secureText,
                decoration: const InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    contentPadding: EdgeInsets.all(20),
                    constraints: BoxConstraints(maxWidth: 340)
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await authenticateAndStore(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: const Text("Login", style: TextStyle(fontSize: 28),),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> authenticateAndStore(String username, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({"username": username, "password": password, 'name': 'balu'});

    final response = await http.post(
      Uri.parse('https://atbcamg9e2.execute-api.us-east-1.amazonaws.com/V1/auth'),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      bool isAuthenticated = data['body'] != null;
      if (isAuthenticated) {
        await storeData(true); // Store login status in SharedPreferences
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SecondRoute()),
        );
      } else {
        throw Exception('Authentication failed');
      }
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  Future<void> storeData(bool auth) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', auth);
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
    );
  }
}



//https://atbcamg9e2.execute-api.us-east-1.amazonaws.com/V1/auth