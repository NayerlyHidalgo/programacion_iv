import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../providers/language_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color(0xFF2196F3),
        foregroundColor: Colors.white,
      ),
      body: Consumer2<UserProvider, LanguageProvider>(
        builder: (context, userProvider, languageProvider, child) {
          final user = userProvider.currentUser;
          if (user == null) {
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Información del usuario
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFF2196F3),
                          child: Text(
                            user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          user.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          user.email,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatColumn('Puntos', '${user.totalPoints}'),
                            _buildStatColumn('Racha', '${user.streak} días'),
                            _buildStatColumn('Nivel', '${user.level}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 16),
                
                // Idiomas que está aprendiendo
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Idiomas que estás aprendiendo',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          children: user.learningLanguages.map((language) {
                            return Chip(
                              label: Text(language),
                              backgroundColor: Color(0xFF2196F3).withOpacity(0.1),
                              labelStyle: TextStyle(color: Color(0xFF2196F3)),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 16),
                
                // Meta diaria
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Meta Diaria',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () => _showEditGoalDialog(context, userProvider),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: user.dailyGoalMinutes > 0 
                              ? (user.weeklyStudyMinutes / user.dailyGoalMinutes).clamp(0.0, 1.0)
                              : 0.0,
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${user.weeklyStudyMinutes} / ${user.dailyGoalMinutes} minutos',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 16),
                
                // Logros
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Logros Recientes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        if (user.achievements.isEmpty)
                          Text(
                            'Aún no tienes logros. ¡Sigue estudiando!',
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        else
                          ...user.achievements.take(3).map((achievement) => 
                            ListTile(
                              leading: Icon(Icons.emoji_events, color: Colors.amber),
                              title: Text(achievement),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ).toList(),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 16),
                
                // Configuración
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.notifications),
                        title: Text('Notificaciones'),
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {
                            // Implementar toggle de notificaciones
                          },
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.volume_up),
                        title: Text('Sonido'),
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {
                            // Implementar toggle de sonido
                          },
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Ayuda y Soporte'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navegar a ayuda
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text('Acerca de'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          _showAboutDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2196F3),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  void _showEditGoalDialog(BuildContext context, UserProvider userProvider) {
    final controller = TextEditingController(
      text: userProvider.currentUser?.dailyGoalMinutes.toString() ?? '30',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Cambiar Meta Diaria'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Minutos por día',
            suffixText: 'min',
          ),
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              final newGoal = int.tryParse(controller.text) ?? 30;
              userProvider.updateDailyGoal('Inglés', newGoal);
              Navigator.pop(context);
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'LanguageMaster',
      applicationVersion: '1.0.0',
      applicationIcon: Icon(
        Icons.language,
        size: 48,
        color: Color(0xFF2196F3),
      ),
      children: [
        SizedBox(height: 16),
        Text(
          'LanguageMaster es una aplicación para aprender idiomas '
          'de manera efectiva y divertida.',
        ),
      ],
    );
  }
}