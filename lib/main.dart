import 'package:flutter/material.dart';
import 'QuotesApp/quote.dart';
import 'QuotesApp/quote_card.dart';
//import 'package:flutter/services.dart';

//LANDSCAPE (MUTED IN IOS!)
/*Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);*/

//runApp(const MyFirstApp()); //encapsulate app into widget
/*class MyFirstApp extends StatelessWidget {
  const MyFirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'MyFirstFlutterApp',
      home: GamePage(),
    );
  }
}*/


void main() => runApp(MaterialApp(
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(text: 'Be yourself; everyone else is already taken', author: 'Oscar'),
    Quote(text: 'I have nothing to declare except my genius', author: 'Oscar'),
    Quote(text: 'The truth is rarely pure and never simple', author: 'Oscar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(

        children: quotes.map((quote) => QuoteCard(quote: quote)).toList(),

        //the moment we access a property of an object inside string we need curly braces
        //children: quotes.map((quote) => Text('${quote.text} - ${quote.author}')).toList(),
      ),
    );
  }
}

