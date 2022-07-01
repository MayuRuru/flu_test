class Quote {
  String? text;
  String? author;

/*  Quote(String text, String author){
    this.text = text;
    this.author = author;
  }*/
  //constructor using named parameters (you don't need THIS):

Quote({this.text, this.author});

}

//Instanciating new object using named parameters:
//Quote myQuote = Quote(text: 'teeeext' , author: 'authooor');