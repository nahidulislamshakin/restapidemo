/// category : "society_and_culture"
/// id : "622a1c357cc59eab6f94fcd1"
/// correctAnswer : "Afroasiatic"
/// incorrectAnswers : ["Turkic","Austroasiatic","Japonic"]
/// question : {"text":"The language 'North Levantine Arabic' belongs to which language family?"}
/// tags : ["language","society_and_culture"]
/// type : "text_choice"
/// difficulty : "hard"
/// regions : []
/// isNiche : false

// class QuestionModel {
//   String? _category;
//   String? _id;
//   String? _correctAnswer;
//   List<String>? _incorrectAnswers;
//   Question? _question;
//   List<String>? _tags;
//   String? _type;
//   String? _difficulty;
//   List<dynamic>? _regions;
//   bool? _isNiche;
//
//   QuestionModel({
//     String? category,
//     String? id,
//     String? correctAnswer,
//     List<String>? incorrectAnswers,
//     Question? question,
//     List<String>? tags,
//     String? type,
//     String? difficulty,
//     List<dynamic>? regions,
//     bool? isNiche,
//   }) {
//     _category = category;
//     _id = id;
//     _correctAnswer = correctAnswer;
//     _incorrectAnswers = incorrectAnswers;
//     _question = question;
//     _tags = tags;
//     _type = type;
//     _difficulty = difficulty;
//     _regions = regions;
//     _isNiche = isNiche;
//   }
//
//   QuestionModel.fromJson(dynamic json) {
//     _category = json['category'];
//     _id = json['id'];
//     _correctAnswer = json['correctAnswer'];
//     _incorrectAnswers = json['incorrectAnswers'] != null
//         ? json['incorrectAnswers'].cast<String>()
//         : [];
//     _question = json['question'] != null
//         ? new Question.fromJson(json['question'])
//         : null;
//     _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
//     _type = json['type'];
//     _difficulty = json['difficulty'];
//     if (json['regions'] != null) {
//       _regions = [];
//       _regions = json['regions'];
//       // json['regions'].forEach((v) {
//       //   _regions?.add(Dynamic.fromJson(v));
//       // });
//     }
//     _isNiche = json['isNiche'];
//   }
//
//   QuestionModel copyWith({
//     String? category,
//     String? id,
//     String? correctAnswer,
//     List<String>? incorrectAnswers,
//     Question? question,
//     List<String>? tags,
//     String? type,
//     String? difficulty,
//     List<dynamic>? regions,
//     bool? isNiche,
//   }) =>
//       QuestionModel(
//         category: category ?? _category,
//         id: id ?? _id,
//         correctAnswer: correctAnswer ?? _correctAnswer,
//         incorrectAnswers: incorrectAnswers ?? _incorrectAnswers,
//         question: question ?? _question,
//         tags: tags ?? _tags,
//         type: type ?? _type,
//         difficulty: difficulty ?? _difficulty,
//         regions: regions ?? _regions,
//         isNiche: isNiche ?? _isNiche,
//       );
//   String? get category => _category;
//   String? get id => _id;
//   String? get correctAnswer => _correctAnswer;
//   List<String>? get incorrectAnswers => _incorrectAnswers;
//   Question? get question => _question;
//   List<String>? get tags => _tags;
//   String? get type => _type;
//   String? get difficulty => _difficulty;
//   List<dynamic>? get regions => _regions;
//   bool? get isNiche => _isNiche;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['category'] = _category;
//     map['id'] = _id;
//     map['correctAnswer'] = _correctAnswer;
//     map['incorrectAnswers'] = _incorrectAnswers;
//     if (_question != null) {
//       map['question'] = _question?.toJson();
//     }
//     map['tags'] = _tags;
//     map['type'] = _type;
//     map['difficulty'] = _difficulty;
//     if (_regions != null) {
//       map['regions'] = _regions?.map((v) => v.toJson()).toList();
//     }
//     map['isNiche'] = _isNiche;
//     return map;
//   }
// }

/// text : "The language 'North Levantine Arabic' belongs to which language family?"

// class Question {
//   Question({
//     String? text,
//   }) {
//     _text = text;
//   }
//
//   Question.fromJson(dynamic json) {
//     _text = json['text'];
//   }
//   String? _text;
//   Question copyWith({
//     String? text,
//   }) =>
//       Question(
//         text: text ?? _text,
//       );
//   String? get text => _text;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['text'] = _text;
//     return map;
//   }
// }

class QuestionModel {
  String? category;
  String? id;
  String? correctAnswer;
  List<String>? incorrectAnswers;
  Question? question;
  List<String>? tags;
  String? type;
  String? difficulty;
  List<dynamic>? regions;
  bool? isNiche;

  QuestionModel({
    this.category,
    this.id,
    this.correctAnswer,
    this.incorrectAnswers,
    this.question,
    this.tags,
    this.type,
    this.difficulty,
    this.regions,
    this.isNiche,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      category: json['category'],
      id: json['id'],
      correctAnswer: json['correctAnswer'],
      incorrectAnswers: json['incorrectAnswers'] != null
          ? List<String>.from(json['incorrectAnswers'])
          : [],
      question: json['question'] != null
          ? Question.fromJson(json['question'])
          : null,
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      type: json['type'],
      difficulty: json['difficulty'],
      regions: json['regions'] != null ? List<dynamic>.from(json['regions']) : [],
      isNiche: json['isNiche'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['id'] = id;
    map['correctAnswer'] = correctAnswer;
    map['incorrectAnswers'] = incorrectAnswers;
    if (question != null) {
      map['question'] = question!.toJson();
    }
    map['tags'] = tags;
    map['type'] = type;
    map['difficulty'] = difficulty;
    map['regions'] = regions;
    map['isNiche'] = isNiche;
    return map;
  }
}


class Question {
  String? text;

  Question({this.text});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    return map;
  }
}
