class Lesson {
  final String id;
  final String title;
  final String description;
  final String level; // Principiante, Intermedio, Avanzado
  final String language;
  final List<String> wordIds;
  final List<String> phrases;
  final int order;
  bool isCompleted;
  int points;
  double progress;
  bool isUnlocked;
  int estimatedMinutes;
  List<dynamic> words; // Lista de palabras de la lección

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.language,
    required this.wordIds,
    required this.phrases,
    required this.order,
    this.isCompleted = false,
    this.points = 0,
    this.progress = 0.0,
    this.isUnlocked = true,
    this.estimatedMinutes = 15,
    this.words = const [],
  });

  void updateProgress(double newProgress) {
    progress = newProgress;
    if (progress >= 1.0) {
      isCompleted = true;
      points = 100 + (level == 'Avanzado' ? 50 : level == 'Intermedio' ? 25 : 0);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'level': level,
      'language': language,
      'wordIds': wordIds,
      'phrases': phrases,
      'order': order,
      'isCompleted': isCompleted,
      'points': points,
      'progress': progress,
    };
  }

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      level: json['level'],
      language: json['language'],
      wordIds: List<String>.from(json['wordIds']),
      phrases: List<String>.from(json['phrases']),
      order: json['order'],
      isCompleted: json['isCompleted'] ?? false,
      points: json['points'] ?? 0,
      progress: json['progress']?.toDouble() ?? 0.0,
    );
  }
}

class Course {
  final String id;
  final String name;
  final String targetLanguage;
  final String nativeLanguage;
  final String description;
  final String imageUrl;
  final List<String> lessonIds;
  int totalPoints;
  String currentLevel; // Principiante, Intermedio, Avanzado
  DateTime createdAt;
  DateTime lastAccessed;

  Course({
    required this.id,
    required this.name,
    required this.targetLanguage,
    required this.nativeLanguage,
    required this.description,
    required this.imageUrl,
    required this.lessonIds,
    this.totalPoints = 0,
    this.currentLevel = 'Principiante',
    required this.createdAt,
    required this.lastAccessed,
  });

  double get progressPercentage {
    if (lessonIds.isEmpty) return 0.0;
    // Este cálculo se haría con datos reales de lecciones completadas
    return 0.0; // Placeholder
  }

  void addPoints(int points) {
    totalPoints += points;
    updateLevel();
    lastAccessed = DateTime.now();
  }

  void updateLevel() {
    if (totalPoints >= 2000 && currentLevel == 'Intermedio') {
      currentLevel = 'Avanzado';
    } else if (totalPoints >= 500 && currentLevel == 'Principiante') {
      currentLevel = 'Intermedio';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'targetLanguage': targetLanguage,
      'nativeLanguage': nativeLanguage,
      'description': description,
      'imageUrl': imageUrl,
      'lessonIds': lessonIds,
      'totalPoints': totalPoints,
      'currentLevel': currentLevel,
      'createdAt': createdAt.toIso8601String(),
      'lastAccessed': lastAccessed.toIso8601String(),
    };
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      targetLanguage: json['targetLanguage'],
      nativeLanguage: json['nativeLanguage'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      lessonIds: List<String>.from(json['lessonIds']),
      totalPoints: json['totalPoints'] ?? 0,
      currentLevel: json['currentLevel'] ?? 'Principiante',
      createdAt: DateTime.parse(json['createdAt']),
      lastAccessed: DateTime.parse(json['lastAccessed']),
    );
  }
}