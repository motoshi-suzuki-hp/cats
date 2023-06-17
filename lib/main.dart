import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const CatListPage(),
    );
  }
}

class CatListPage extends StatelessWidget {
  const CatListPage({super.key});
  static const List<int> error = [100, 101, 102];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lists'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => IdButton(error[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const CatPage();
            })
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class IdButton extends StatelessWidget {
  final int errorId;
  const IdButton(this.errorId, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => const CatPage(),
            )
          ),
        },
        child: Text(errorId.toString()),
    );
  }
}


class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('return'),
        ),
      ),
    );
  }
}