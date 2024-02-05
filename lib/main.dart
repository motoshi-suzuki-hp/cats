import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.black),
      ),
      home: const CatListPage(),
    );
  }
}

class CatListPage extends StatelessWidget {
  const CatListPage({super.key});
  static const List<int> error = [
    100, 101, 102, 103, 
    200, 201, 202, 203, 204, 205, 206, 207, 208, 218, 226, 
    300, 301, 302, 303, 304, 305, 306, 307, 308, 
    400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 428, 429, 430, 431, 440, 444, 449, 450, 451, 460, 463, 464, 494, 495, 496, 497, 498, 499, 
    500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 520, 521, 522, 523, 524, 525, 526, 527, 529, 530, 561, 598, 599,
    999,
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HTTP errors',
          style: TextStyle(color: Colors.white),
          ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: error.length,
        itemBuilder: (context, index) {
          // ボタンを表示
          return GestureDetector(
            // title: Text('${error[index]}'),
            // ボタンが押されたときの処理
            onTap: () {
              // 遷移先のページに数字を渡して画面遷移
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatPage(errorId: error[index]),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 97, 97, 97), // Set the background color of the button
                borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
              ),
              child: Center(
                child: Text(
                  '${error[index]}',
                  style: TextStyle(
                    color: Colors.white, // Set the text color
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



class CatPage extends StatelessWidget {
  final int errorId;
  final Key? key;

  const CatPage({required this.errorId, this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$errorId',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          )
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 400,
              height: 700,
              // child: Image.network(
              //     'https://http.dog/$errorId.jpg'
              //     ),
                child: ListView(
                  children: [
                    Image.network(
                      'https://httpcats.com/$errorId.jpg',
                    ),
                    Image.network(
                      'https://http.dog/$errorId.jpg',
                    ),
                    Image.network(
                      'https://httpducks.com/$errorId.jpg',
                    ),
                  ],
                ),
            ),
            TextButton(
              child: const Text(
                'return',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  backgroundColor: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },

              style: TextButton.styleFrom(
                fixedSize: Size(200, 100),
                alignment: Alignment.topCenter,
                )
            ),
          ],
        ),
        
      ),
    );
  }
}