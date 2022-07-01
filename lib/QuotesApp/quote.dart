class Quote {
  final String text;
  final String author;


  //normal constructor:
/* Quote(String text, String author){
    this.text = text;
    this.author = author;
  }*/

  //constructor using named parameters (you don't need THIS):
//  Quote({ String author, String text }){
//    this.text = text;
//    this.author = author;
//  }

// constructor with named parameters & automatically assigns named arguments to class properties

 Quote( this.text, this.author );

}

//Instanciating new object using named parameters:
//Quote myQuote = Quote(text: 'teeeext' , author: 'authooor');