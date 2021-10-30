class CharacterQuote {
  int? quoteId;
  String? quote;
  String? author;
  String? series;

  CharacterQuote({this.quoteId, this.quote, this.author, this.series});

  CharacterQuote.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id'];
    quote = json['quote'];
    author = json['author'];
    series = json['series'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quote_id'] = quoteId;
    map['quote'] = quote;
    map['author'] = author;
    map['series'] = series;
    return map;
  }
}
