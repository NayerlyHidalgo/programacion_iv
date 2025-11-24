import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class DailyGoalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final user = userProvider.currentUser;
        if (user == null) {
          return SizedBox.shrink();
        }

        final progress = user.dailyGoalMinutes > 0 
            ? user.weeklyStudyMinutes / user.dailyGoalMinutes 
            : 0.0;
        final progressClamped = progress.clamp(0.0, 1.0);

        return Card(
          elevation: 2,
          color: Colors.green[50],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.flag,
                  color: Colors.green,
                  size: 32,
                ),
                SizedBox(height: 8),
                Text(
                  '${user.weeklyStudyMinutes}/${user.dailyGoalMinutes}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  'minutos',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green[700],
                  ),
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progressClamped,
                  backgroundColor: Colors.green[100],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                SizedBox(height: 4),
                Text(
                  'Meta Diaria',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}