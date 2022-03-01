import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _getAnsware(int score) {
    _totalScore += score;
    if (_currentIndex < _myQuestion.length) {
      setState(() {
        _currentIndex++;
      });
    } else {
      print('There is no more question');
    }
  }

  void _getInfo() {
    print('you are pressing long');
  }

  void ResetTheQuiz() {
    setState(() {
      _currentIndex = 0;
      _totalScore = 0;
    });
  }

  int _currentIndex = 0;
  int _totalScore = 0;
  final _myQuestion = const [
    {
      'QuestionText': 'what is your favorite player',
      'Answare': [
        {'text': 'sakib', 'score': 1},
        {'text': 'rizwan', 'score': 10},
        {'text': 'babar', 'score': 5},
        {'text': 'kaliya', 'score': 3}
      ],
    },
    {
      'QuestionText': 'what is your favorite name',
      'Answare': [
        {'text': 'sakib', 'score': 1},
        {'text': 'rizwan', 'score': 10},
        {'text': 'babar', 'score': 5},
        {'text': 'kaliya', 'score': 3}
      ],
    },
    {
      'QuestionText': 'what is your favorite name',
      'Answare': [
        {'text': 'sakib', 'score': 1},
        {'text': 'rizwan', 'score': 10},
        {'text': 'babar', 'score': 5},
        {'text': 'kaliya', 'score': 3}
      ],
    },
    {
      'QuestionText': 'what is your favorite name',
      'Answare': [
        {'text': 'sakib', 'score': 1},
        {'text': 'rizwan', 'score': 10},
        {'text': 'babar', 'score': 5},
        {'text': 'kaliya', 'score': 3}
      ],
    },
    {
      'QuestionText': 'what is your favorite name',
      'Answare': [
        {'text': 'sakib', 'score': 1},
        {'text': 'rizwan', 'score': 10},
        {'text': 'babar', 'score': 5},
        {'text': 'kaliya', 'score': 3}
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QUIZ APP'),
          backgroundColor: Colors.deepOrange,
        ),
        body: _currentIndex < _myQuestion.length
            ? ShowQuestion(
                queston: _myQuestion,
                currentIndex: _currentIndex,
                getAnsware: _getAnsware,
                getInfo: _getInfo)
            : Final_Answare(
                score: _totalScore,
                reset: ResetTheQuiz,
              ),
      ),
    );
  }
}

class Final_Answare extends StatelessWidget {
  int? score;
  final VoidCallback? reset;
  Final_Answare({required this.score, this.reset});

  String? get resultText {
    late String? text;
    if (score! <= 5) {
      text = 'you are good';
    } else if (score! <= 8) {
      text = 'you are medium';
    } else if (score! <= 15) {
      text = 'you are nothing';
    } else {
      text = 'noting to show';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            resultText!,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Buttons_Preset(
            onPress: reset,
            buttonName: 'Reset',
          ),
        ],
      ),
    );
  }
}

class Buttons_Preset extends StatelessWidget {
  Buttons_Preset({this.onPress, this.longPress, this.buttonName});
  final VoidCallback? onPress;
  final VoidCallback? longPress;
  final String? buttonName;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      elevation: 10.0,
      borderRadius: const BorderRadius.all(
        Radius.circular(20.0),
      ),
      child: MaterialButton(
        child: Text(buttonName!),
        onPressed: onPress!,
        onLongPress: longPress,
        minWidth: 150,
        height: 50.0,
        textColor: Colors.white,
      ),
    );
  }
}

class Questions extends StatelessWidget {
  final String? question;
  Questions(this.question);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(15.0),
        child: Text(
          question!,
          style: TextStyle(fontSize: 25.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ShowQuestion extends StatelessWidget {
  ShowQuestion(
      {required this.queston,
      required this.currentIndex,
      required this.getAnsware,
      required this.getInfo});
  final List<Map<String, Object>>? queston;
  final int? currentIndex;
  final Function getAnsware;
  final VoidCallback getInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Questions(
          queston![currentIndex!]['QuestionText'] as String,
        ),
        ...(queston![currentIndex!]['Answare'] as List<Map<String, Object>>)
            .map(
          (answare) {
            return Buttons_Preset(
              onPress: () => getAnsware(answare['score']),
              longPress: getInfo,
              buttonName: answare['text'].toString(),
            );
          },
        ).toList()
      ],
    );
  }
}
