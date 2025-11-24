class Word {
  final String id;
  final String original;
  final String translation;
  final String language;
  final String category;
  final String pronunciation;
  final String? audioPath;
  bool isLearned;
  int timesReviewed;
  DateTime? lastReview;
  int difficulty; // 1-5 scale
  String exampleSentence; // Oración de ejemplo

  // Getters para compatibilidad con la UI
  String get spanish => original;
  String get english => translation;

  Word({
    required this.id,
    required this.original,
    required this.translation,
    required this.language,
    required this.category,
    required this.pronunciation,
    this.audioPath,
    this.isLearned = false,
    this.timesReviewed = 0,
    this.lastReview,
    this.difficulty = 3,
    this.exampleSentence = '',
  });

  void markAsLearned() {
    isLearned = true;
    timesReviewed++;
    lastReview = DateTime.now();
  }

  void review() {
    timesReviewed++;
    lastReview = DateTime.now();
  }

  bool needsReview() {
    if (lastReview == null) return true;
    
    // Base de días según dificultad
    int baseDays = [1, 2, 3, 5, 7][difficulty - 1];
    
    // Incrementa el tiempo entre repasos según las veces revisada
    int reviewMultiplier = (timesReviewed ~/ 3) + 1;
    int daysBetweenReviews = baseDays * reviewMultiplier;
    
    return DateTime.now().difference(lastReview!).inDays >= daysBetweenReviews;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original': original,
      'translation': translation,
      'language': language,
      'category': category,
      'pronunciation': pronunciation,
      'audioPath': audioPath,
      'isLearned': isLearned,
      'timesReviewed': timesReviewed,
      'lastReview': lastReview?.toIso8601String(),
      'difficulty': difficulty,
    };
  }

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'],
      original: json['original'],
      translation: json['translation'],
      language: json['language'],
      category: json['category'],
      pronunciation: json['pronunciation'],
      audioPath: json['audioPath'],
      isLearned: json['isLearned'] ?? false,
      timesReviewed: json['timesReviewed'] ?? 0,
      lastReview: json['lastReview'] != null 
          ? DateTime.parse(json['lastReview']) 
          : null,
      difficulty: json['difficulty'] ?? 3,
    );
  }
}
