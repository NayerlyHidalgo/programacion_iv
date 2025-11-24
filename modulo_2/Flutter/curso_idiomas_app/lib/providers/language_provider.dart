import 'package:flutter/foundation.dart';
import '../models/word.dart';
import '../models/lesson.dart';
import '../models/user_profile.dart';

class LanguageProvider with ChangeNotifier {
  List<Word> _words = [];
  List<Lesson> _lessons = [];
  List<Course> _courses = [];
  String _currentLanguage = 'Inglés';
  bool _isLoading = false;

  // Getters
  List<Word> get words => _words;
  List<Lesson> get lessons => _lessons;
  List<Course> get courses => _courses;
  String get currentLanguage => _currentLanguage;
  bool get isLoading => _isLoading;

  // Palabras para repasar
  List<Word> get wordsToReview {
    return _words.where((word) => word.needsReview()).toList();
  }

  // Palabras aprendidas
  List<Word> get learnedWords {
    return _words.where((word) => word.isLearned).toList();
  }

  // Getter para todas las palabras
  List<Word> get allWords => _words;

  // Método para iniciar una lección
  void startLesson(String lessonId) {
    final lesson = _lessons.firstWhere((l) => l.id == lessonId);
    lesson.progress = 0.1; // Marcar como iniciada
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setCurrentLanguage(String language) {
    _currentLanguage = language;
    loadLanguageData(language);
    notifyListeners();
  }

  Future<void> loadLanguageData(String language) async {
    setLoading(true);
    
    // Simular carga de datos
    await Future.delayed(Duration(seconds: 1));
    
    _words = _getDefaultWords(language);
    _lessons = _getDefaultLessons(language);
    _courses = _getDefaultCourses(language);
    
    setLoading(false);
  }

  void markWordAsLearned(String wordId) {
    final wordIndex = _words.indexWhere((word) => word.id == wordId);
    if (wordIndex != -1) {
      _words[wordIndex].markAsLearned();
      notifyListeners();
    }
  }

  void reviewWord(String wordId) {
    final wordIndex = _words.indexWhere((word) => word.id == wordId);
    if (wordIndex != -1) {
      _words[wordIndex].review();
      notifyListeners();
    }
  }

  void completeLesson(String lessonId) {
    final lessonIndex = _lessons.indexWhere((lesson) => lesson.id == lessonId);
    if (lessonIndex != -1) {
      _lessons[lessonIndex].updateProgress(1.0);
      notifyListeners();
    }
  }

  List<Word> _getDefaultWords(String language) {
    if (language == 'Inglés') {
      return [
        Word(
          id: '1',
          original: 'Hello',
          translation: 'Hola',
          language: 'Inglés',
          category: 'Saludos',
          pronunciation: '/həˈloʊ/',
        ),
        Word(
          id: '2',
          original: 'Water',
          translation: 'Agua',
          language: 'Inglés',
          category: 'Sustantivos',
          pronunciation: '/ˈwɔːtər/',
        ),
        Word(
          id: '3',
          original: 'Thank you',
          translation: 'Gracias',
          language: 'Inglés',
          category: 'Expresiones',
          pronunciation: '/θæŋk juː/',
        ),
        Word(
          id: '4',
          original: 'Good morning',
          translation: 'Buenos días',
          language: 'Inglés',
          category: 'Saludos',
          pronunciation: '/ɡʊd ˈmɔːrnɪŋ/',
        ),
        Word(
          id: '5',
          original: 'House',
          translation: 'Casa',
          language: 'Inglés',
          category: 'Sustantivos',
          pronunciation: '/haʊs/',
        ),
      ];
    }
    return [];
  }

  List<Lesson> _getDefaultLessons(String language) {
    if (language == 'Inglés') {
      return [
        Lesson(
          id: 'lesson_1',
          title: 'Saludos Básicos',
          description: 'Aprende saludos y presentaciones en inglés',
          level: 'Principiante',
          language: 'Inglés',
          wordIds: ['1', '4'],
          phrases: [
            'How are you? - ¿Cómo estás?',
            'My name is... - Mi nombre es...',
            'Nice to meet you - Mucho gusto',
          ],
          order: 1,
        ),
        Lesson(
          id: 'lesson_2',
          title: 'Vocabulario Básico',
          description: 'Palabras esenciales para el día a día',
          level: 'Principiante',
          language: 'Inglés',
          wordIds: ['2', '5'],
          phrases: [
            'Where is the...? - ¿Dónde está...?',
            'I need... - Necesito...',
            'Can you help me? - ¿Puedes ayudarme?',
          ],
          order: 2,
        ),
      ];
    }
    return [];
  }

  List<Course> _getDefaultCourses(String language) {
    if (language == 'Inglés') {
      return [
        Course(
          id: 'course_1',
          name: 'Inglés para Principiantes',
          targetLanguage: 'Inglés',
          nativeLanguage: 'Español',
          description: 'Curso completo para comenzar a aprender inglés desde cero',
          imageUrl: 'assets/images/english_flag.png',
          lessonIds: ['lesson_1', 'lesson_2'],
          createdAt: DateTime.now(),
          lastAccessed: DateTime.now(),
        ),
      ];
    }
    return [];
  }
}
