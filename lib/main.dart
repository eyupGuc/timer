import 'package:flutter/material.dart';
import 'package:timer/zikirler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String _secilenZikir = 'ALLAH 66';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _incrementCounterReset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Container(
                color: Colors.green,
                child: DropdownButton<String>(
                  alignment: AlignmentDirectional.center,
                  underline: Container(),
                  isExpanded: true,
                  iconSize: 45,
                  items: Zikirler.zikirTopluListe.map((event) {
                    return DropdownMenuItem<String>(
                      value: event,
                      child: Text(
                        event,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                  onChanged: (s) {
                    setState(() {
                      _secilenZikir = s ?? '';
                    });
                  },
                  hint: const Text('Seçiniz'),
                  value: _secilenZikir,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/aksa.jpg',),)),
              child: Center(
                child: Text(' $_counter',
                    style: const TextStyle(
                      fontSize: 80,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: _incrementCounter,
                  child: const Text(
                    '+',
                    style: TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _incrementCounterReset();
                  },
                  child: const Text(
                    'Sıfırla',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
