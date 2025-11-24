import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile.dart';
import 'dart:convert';

class UserProvider with ChangeNotifier {
  UserProfile? _currentUser;
  bool _isAuthenticated = false;
  bool _isLoading = false;

  // Getters
  UserProfile? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> initializeUser() async {
    setLoading(true);
    
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userJson = prefs.getString('user_profile');
      
      if (userJson != null) {
        Map<String, dynamic> userMap = json.decode(userJson);
        _currentUser = UserProfile.fromJson(userMap);
        _isAuthenticated = true;
      } else {
        // Crear usuario por defecto para demostración
        await createDefaultUser();
      }
    } catch (e) {
      print('Error al cargar usuario: $e');
      await createDefaultUser();
    }
    
    setLoading(false);
  }

  Future<void> createDefaultUser() async {
    _currentUser = UserProfile(
      id: 'user_1',
      name: 'Usuario Demo',
      email: 'demo@example.com',
      nativeLanguage: 'Español',
      learningLanguages: ['Inglés'],
      courseIds: ['course_1'],
      lastStudyDate: DateTime.now(),
      dailyGoals: {'Inglés': 30},
      weeklyProgress: {'Inglés': 0},
      achievements: [],
    );
    _isAuthenticated = true;
    await saveUserProfile();
  }

  Future<void> saveUserProfile() async {
    if (_currentUser != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userJson = json.encode(_currentUser!.toJson());
      await prefs.setString('user_profile', userJson);
    }
  }

  void updateStudyTime(String language, int minutes) {
    if (_currentUser != null) {
      _currentUser!.addStudyTime(language, minutes);
      
      // Verificar logros
      if (_currentUser!.streak == 7) {
        _currentUser!.addAchievement('Racha de 7 días');
      }
      if (_currentUser!.totalPoints >= 500) {
        _currentUser!.addAchievement('500 puntos');
      }
      
      saveUserProfile();
      notifyListeners();
    }
  }

  void addPoints(int points) {
    if (_currentUser != null) {
      _currentUser!.totalPoints += points;
      saveUserProfile();
      notifyListeners();
    }
  }

  void updateDailyGoal(String language, int minutes) {
    if (_currentUser != null) {
      _currentUser!.dailyGoals[language] = minutes;
      saveUserProfile();
      notifyListeners();
    }
  }

  void toggleSound() {
    if (_currentUser != null) {
      _currentUser!.soundEnabled = !_currentUser!.soundEnabled;
      saveUserProfile();
      notifyListeners();
    }
  }

  void toggleNotifications() {
    if (_currentUser != null) {
      _currentUser!.notificationsEnabled = !_currentUser!.notificationsEnabled;
      saveUserProfile();
      notifyListeners();
    }
  }

  void updatePreferredStudyTime(String time) {
    if (_currentUser != null) {
      _currentUser!.preferredStudyTime = time;
      saveUserProfile();
      notifyListeners();
    }
  }

  void logout() {
    _currentUser = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
