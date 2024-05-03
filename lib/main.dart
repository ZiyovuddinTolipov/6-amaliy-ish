import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title =
      'Bosing va pul toping kuniga 500\$ gacha daromad';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white, // Set background color to white
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController _textEditingController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter += 4;
      // Show a SnackBar message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('+4 bosganda yana bitta qo`shildi'),
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuniga 500\$ gacha daromad qilish'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Text(
            'Bosing va pul toping kuniga 500\$',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Puligiz har bosganda 1\btk ga ortadi:',
                  ),
                  Text(
                    '$_counter btk',
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'btk ishlash',
                    child: Icon(Icons.add), // Use Icon instead of Image.network
                    backgroundColor:
                        Colors.teal, // Set background color to teal
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60), // Make it larger
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter amount',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter +=
                            int.tryParse(_textEditingController.text) ?? 0;
                        _textEditingController.clear();
                      });
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // Align button to center vertically
    );
  }
}
