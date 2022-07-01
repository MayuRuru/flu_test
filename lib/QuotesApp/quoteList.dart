import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(author: 'Oscar', text: 'Be yourself; everyone else is already taken'),
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

        children: quotes.map((quote) => QuoteCard(
            quote: quote,
            delete: (){
              setState((){
                quotes.remove(quote);
              });
            }
        )).toList(),

        //the moment we access a property of an object inside string we need curly braces
        //children: quotes.map((quote) => Text('${quote.text} - ${quote.author}')).toList(),
      ),
    );
  }
}

