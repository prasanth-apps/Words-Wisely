class QuoteModel {
  final String q;
  final String a;

  QuoteModel({required this.q, required this.a});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(q: json["q"], a: json["a"]);
  }
}
