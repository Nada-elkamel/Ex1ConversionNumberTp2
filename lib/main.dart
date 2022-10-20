import 'package:flutter/material.dart';
import 'package:neonpen/neonpen.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

void main() {
  runApp(const MyApp());
}

final TextStyle inputStyle = TextStyle(
  fontSize: 20,
  color: Color.fromARGB(255, 0, 0, 0),
);
final TextStyle labelStyle = TextStyle(
  fontSize: 24,
  color: Color.fromARGB(255, 0, 0, 0),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Number to words - Mehdi Ayed DSI31'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late double numberForm = 0;
  String s1 = '';
  String s2 = '';
  String displayName = "";
  String s3 = '';
  String s4 = '';

  @override
  void initState() {
    numberForm = 0;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(255, 94, 151, 144),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Neonpen(
                text: Text(
                  'Tp 2 : Convert Number to Text',
                  style: labelStyle,
                ),
                color: Color.fromARGB(255, 94, 151, 144),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                opacity: 0.3,
                emphasisWidth: 10,
                emphasisOpacity: 0.3,
                emphasisAngleDegree: 2,
                enableLineZiggle: true,
                lineZiggleLevel: 2,
                isDoubleLayer: false,
              ),
              const Text(
                '',
              ),
              TextField(
                style: inputStyle,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Enter a number ",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Color.fromARGB(255, 94, 151, 144),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Color.fromARGB(255, 94, 151, 144),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onChanged: (text) {
                  var v = double.tryParse(text);
                  if (v != null)
                    setState(() {
                      numberForm = v;
                    });
                },
              ),
              SizedBox(height: 30),
              Text(
                numberForm.toString(),
                style: labelStyle,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    s1 = '';
                    s2 = '';
                    displayName = '';
                    s1 = numberForm.toString().split('.')[0];
                    s2 = numberForm.toStringAsFixed(2).split('.')[1];
                    displayName =
                        NumberToWordsEnglish.convert(int.parse(s1)) + '';
                    displayName +=
                        NumberToWordsEnglish.convert(int.parse(s2)) + '';
                  });
                },
                child: Text("convert to english"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
              ),
              Text(
                displayName,
                style: labelStyle,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    s3 = '';
                    s4 = '';
                    displayName = '';
                    s3 = numberForm.toString().split('.')[0];
                    s4 = numberForm.toStringAsFixed(2).split('.')[1];
                    displayName = Tafqeet.convert(s3) + ' ';
                    displayName += Tafqeet.convert(s4) + '';
                  });
                },
                child: Text("convert to arabic"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
