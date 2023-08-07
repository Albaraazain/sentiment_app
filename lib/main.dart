// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SentimentAnalysisPage(),
    );
  }
}

class SentimentAnalysisPage extends StatefulWidget {
  @override
  _SentimentAnalysisPageState createState() => _SentimentAnalysisPageState();
}

class _SentimentAnalysisPageState extends State<SentimentAnalysisPage> {
  TextEditingController _controller = TextEditingController();
  String _sentiment = '';

  Future<void> analyzeSentiment() async {
    final response = await http.post(
      Uri.parse(
          'https://sentiment-flutter-app-e93b1e50a313.herokuapp.com/analyze'),
      body: jsonEncode({'text': _controller.text}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      setState(() {
        _sentiment = jsonDecode(response.body)['sentiment'];
      });
    } else {
      throw Exception('Failed to analyze sentiment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sentiment Analysis App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter a sentence or phrase',
              ),
            ),
            ElevatedButton(
              onPressed: analyzeSentiment,
              child: Text('Analyze'),
            ),
            Text(
              'Sentiment: $_sentiment',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
