import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../providers/language_provider.dart';
import '../widgets/course_card.dart';
import '../widgets/progress_card.dart';
import '../widgets/daily_goal_card.dart';
import '../widgets/streak_card.dart';
import 'lesson_screen.dart';
import 'profile_screen.dart';
import 'practice_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LanguageMaster'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Mostrar notificaciones
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildHomeTab(),
          _buildLessonsTab(),
          _buildPracticeTab(),
          _buildProgressTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        selectedItemColor: Color(0xFF2196F3),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Lecciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Práctica',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Progreso',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return Consumer2<UserProvider, LanguageProvider>(
      builder: (context, userProvider, languageProvider, child) {
        final user = userProvider.currentUser;
        if (user == null) {
          return Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saludo personal
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFF21CBF3)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¡Hola, ${user.name}!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '¿Listo para aprender ${user.learningLanguages.join(", ")}?',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Tarjetas de estado
              Row(
                children: [
                  Expanded(child: StreakCard()),
                  SizedBox(width: 12),
                  Expanded(child: DailyGoalCard()),
                ],
              ),
              SizedBox(height: 20),

              // Progreso general
              ProgressCard(),
              SizedBox(height: 20),

              // Cursos disponibles
              Text(
                'Tus Cursos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: languageProvider.courses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      margin: EdgeInsets.only(right: 16),
                      child: CourseCard(
                        course: languageProvider.courses[index],
                        onTap: () {
                          _pageController.animateToPage(
                            1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),

              // Palabras para repasar
              if (languageProvider.wordsToReview.isNotEmpty) ...[
                SizedBox(height: 20),
                Text(
                  'Repaso Diario',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2196F3),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange[200]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.refresh, color: Colors.orange),
                          SizedBox(width: 8),
                          Text(
                            '${languageProvider.wordsToReview.length} palabras para repasar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[700],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Es importante repasar para no olvidar lo aprendido',
                        style: TextStyle(color: Colors.orange[600]),
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          _pageController.animateToPage(
                            2,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Comenzar Repaso'),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildLessonsTab() {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        if (languageProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return LessonScreen();
      },
    );
  }

  Widget _buildPracticeTab() {
    return PracticeScreen();
  }

  Widget _buildProgressTab() {
    return Consumer2<UserProvider, LanguageProvider>(
      builder: (context, userProvider, languageProvider, child) {
        final user = userProvider.currentUser;
        if (user == null) {
          return Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tu Progreso',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),
              SizedBox(height: 20),
              
              // Estadísticas generales
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildStatRow('Puntos Totales', '${user.totalPoints}', Icons.stars),
                      Divider(),
                      _buildStatRow('Racha Actual', '${user.streak} días', Icons.local_fire_department),
                      Divider(),
                      _buildStatRow('Palabras Aprendidas', '${languageProvider.learnedWords.length}', Icons.check_circle),
                      Divider(),
                      _buildStatRow('Lecciones Completadas', '${languageProvider.lessons.where((l) => l.isCompleted).length}', Icons.school),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Logros
              Text(
                'Logros',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              
              if (user.achievements.isEmpty)
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Icon(Icons.emoji_events, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          'Aún no tienes logros',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '¡Sigue estudiando para desbloquearlos!',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )
              else
                ...user.achievements.map((achievement) => Card(
                  child: ListTile(
                    leading: Icon(Icons.emoji_events, color: Colors.amber),
                    title: Text(achievement),
                    trailing: Icon(Icons.check, color: Colors.green),
                  ),
                )).toList(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFF2196F3)),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2196F3),
          ),
        ),
      ],
    );
  }
}
