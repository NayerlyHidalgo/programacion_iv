class UserProfile {
  final String id;
  final String name;
  final String email;
  final String nativeLanguage;
  final List<String> learningLanguages;
  final List<String> courseIds;
  int totalPoints;
  int streak; // Días consecutivos estudiando
  DateTime lastStudyDate;
  Map<String, int> dailyGoals; // minutos por día por idioma
  Map<String, int> weeklyProgress; // minutos estudiados esta semana
  List<String> achievements;
  String preferredStudyTime; // morning, afternoon, evening
  bool soundEnabled;
  bool notificationsEnabled;
  int level; // Nivel del usuario
  int dailyGoalMinutes; // Meta diaria en minutos
  int weeklyStudyMinutes; // Minutos estudiados esta semana

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.nativeLanguage,
    required this.learningLanguages,
    required this.courseIds,
    this.totalPoints = 0,
    this.streak = 0,
    required this.lastStudyDate,
    required this.dailyGoals,
    required this.weeklyProgress,
    required this.achievements,
    this.preferredStudyTime = 'evening',
    this.soundEnabled = true,
    this.notificationsEnabled = true,
    this.level = 1,
    this.dailyGoalMinutes = 30,
    this.weeklyStudyMinutes = 0,
  });

  void updateStreak() {
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(Duration(days: 1));
    
    if (isSameDay(lastStudyDate, today)) {
      // Ya estudió hoy, no cambiar streak
      return;
    } else if (isSameDay(lastStudyDate, yesterday)) {
      // Estudió ayer, incrementar streak
      streak++;
    } else {
      // Rompió la racha
      streak = 1;
    }
    
    lastStudyDate = today;
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }

  void addAchievement(String achievement) {
    if (!achievements.contains(achievement)) {
      achievements.add(achievement);
    }
  }

  void addStudyTime(String language, int minutes) {
    String today = DateTime.now().toString().split(' ')[0];
    weeklyProgress[language] = (weeklyProgress[language] ?? 0) + minutes;
    updateStreak();
  }

  bool hasMetDailyGoal(String language) {
    int goal = dailyGoals[language] ?? 30;
    int studied = weeklyProgress[language] ?? 0;
    return studied >= goal;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'nativeLanguage': nativeLanguage,
      'learningLanguages': learningLanguages,
      'courseIds': courseIds,
      'totalPoints': totalPoints,
      'streak': streak,
      'lastStudyDate': lastStudyDate.toIso8601String(),
      'dailyGoals': dailyGoals,
      'weeklyProgress': weeklyProgress,
      'achievements': achievements,
      'preferredStudyTime': preferredStudyTime,
      'soundEnabled': soundEnabled,
      'notificationsEnabled': notificationsEnabled,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      nativeLanguage: json['nativeLanguage'],
      learningLanguages: List<String>.from(json['learningLanguages']),
      courseIds: List<String>.from(json['courseIds']),
      totalPoints: json['totalPoints'] ?? 0,
      streak: json['streak'] ?? 0,
      lastStudyDate: DateTime.parse(json['lastStudyDate']),
      dailyGoals: Map<String, int>.from(json['dailyGoals']),
      weeklyProgress: Map<String, int>.from(json['weeklyProgress']),
      achievements: List<String>.from(json['achievements']),
      preferredStudyTime: json['preferredStudyTime'] ?? 'evening',
      soundEnabled: json['soundEnabled'] ?? true,
      notificationsEnabled: json['notificationsEnabled'] ?? true,
    );
  }
}