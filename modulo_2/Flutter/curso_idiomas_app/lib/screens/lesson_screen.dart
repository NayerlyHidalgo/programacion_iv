import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../models/lesson.dart';

class LessonScreen extends StatefulWidget {
  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  String selectedCourse = 'Todos';

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Scaffold(
          body: Column(
            children: [
              // Header con filtros
              Container(
                padding: EdgeInsets.all(16),
                color: Color(0xFF2196F3),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lecciones',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: languageProvider.courses.length + 1,
                          itemBuilder: (context, index) {
                            final isAll = index == 0;
                            final courseName = isAll ? 'Todos' : languageProvider.courses[index - 1].name;
                            final isSelected = selectedCourse == courseName;
                            
                            return Container(
                              margin: EdgeInsets.only(right: 8),
                              child: FilterChip(
                                label: Text(
                                  courseName,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Color(0xFF2196F3),
                                    fontSize: 12,
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: (selected) {
                                  setState(() {
                                    selectedCourse = courseName;
                                  });
                                },
                                backgroundColor: Colors.white,
                                selectedColor: Color(0xFF1976D2),
                                checkmarkColor: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Lista de lecciones
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: languageProvider.lessons.length,
                  itemBuilder: (context, index) {
                    final lesson = languageProvider.lessons[index];
                    return LessonCard(
                      lesson: lesson,
                      onTap: () {
                        if (lesson.isUnlocked) {
                          _startLesson(context, lesson, languageProvider);
                        } else {
                          _showLockedDialog(context);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _startLesson(BuildContext context, Lesson lesson, LanguageProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(lesson.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(lesson.description),
            SizedBox(height: 12),
            Text(
              'Palabras en esta lección: ${lesson.words.length}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Tiempo estimado: ${lesson.estimatedMinutes} minutos',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              provider.startLesson(lesson.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('¡Lección ${lesson.title} iniciada!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text('Comenzar'),
          ),
        ],
      ),
    );
  }

  void _showLockedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Lección Bloqueada'),
        content: Text('Completa las lecciones anteriores para desbloquear esta.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Entendido'),
          ),
        ],
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final VoidCallback onTap;

  const LessonCard({
    Key? key,
    required this.lesson,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: lesson.isUnlocked ? 2 : 1,
      color: lesson.isCompleted ? Colors.green[50] : 
             lesson.isUnlocked ? Colors.white : Colors.grey[100],
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // Ícono de estado
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lesson.isCompleted ? Colors.green :
                         lesson.isUnlocked ? Color(0xFF2196F3) : Colors.grey,
                ),
                child: Icon(
                  lesson.isCompleted ? Icons.check :
                  lesson.isUnlocked ? Icons.play_arrow : Icons.lock,
                  color: Colors.white,
                ),
              ),
              
              SizedBox(width: 16),
              
              // Contenido de la lección
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: lesson.isUnlocked ? Colors.black : Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      lesson.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: lesson.isUnlocked ? Colors.grey[600] : Colors.grey[500],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        SizedBox(width: 4),
                        Text(
                          '${lesson.estimatedMinutes} min',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(width: 16),
                        Icon(
                          Icons.book,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        SizedBox(width: 4),
                        Text(
                          '${lesson.words.length} palabras',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Progreso
              if (lesson.isUnlocked) ...[
                SizedBox(width: 16),
                Column(
                  children: [
                    CircularProgressIndicator(
                      value: lesson.progress / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        lesson.isCompleted ? Colors.green : Color(0xFF2196F3),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${lesson.progress}%',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}