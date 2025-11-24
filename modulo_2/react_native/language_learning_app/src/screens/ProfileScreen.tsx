import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import GradientBg from '../components/GradientBg';
import GlassCard from '../components/GlassCard';
import AppButton from '../components/AppButton';
import { colors } from '../theme';

const ProfileScreen: React.FC = () => {
  const achievements = [
    {
      id: 1,
      title: 'Primera palabra',
      description: 'Aprendiste tu primera palabra',
      icon: 'star',
      unlocked: true,
      color: colors.success,
    },
    {
      id: 2,
      title: 'Racha de 7 días',
      description: 'Mantuviste una racha de 7 días',
      icon: 'local-fire-department',
      unlocked: true,
      color: colors.streak,
    },
    {
      id: 3,
      title: 'Maestro de saludos',
      description: 'Completaste la categoría de saludos',
      icon: 'emoji-events',
      unlocked: false,
      color: colors.warning,
    },
    {
      id: 4,
      title: 'Políglota',
      description: 'Aprende 100 palabras',
      icon: 'language',
      unlocked: false,
      color: colors.info,
    },
  ];

  const stats = [
    { label: 'Palabras aprendidas', value: '47', icon: 'school' },
    { label: 'Días consecutivos', value: '15', icon: 'calendar-today' },
    { label: 'Tiempo total', value: '8h 32m', icon: 'access-time' },
    { label: 'Precisión promedio', value: '87%', icon: 'target' },
  ];

  return (
    <GradientBg variant="secondary">
      <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
        {/* Profile Header */}
        <View style={styles.header}>
          <View style={styles.profileSection}>
            <View style={styles.avatar}>
              <MaterialIcons name="person" size={40} color={colors.primary} />
            </View>
            <View style={styles.userInfo}>
              <Text style={styles.userName}>Estudiante</Text>
              <Text style={styles.userLevel}>Nivel principiante</Text>
              <View style={styles.levelProgress}>
                <View style={[styles.levelBar, { width: '65%' }]} />
              </View>
            </View>
          </View>
        </View>

        {/* Statistics */}
        <GlassCard style={styles.statsSection}>
          <Text style={styles.sectionTitle}>Estadísticas</Text>
          <View style={styles.statsGrid}>
            {stats.map((stat, index) => (
              <View key={index} style={styles.statItem}>
                <MaterialIcons name={stat.icon as any} size={24} color={colors.primary} />
                <Text style={styles.statValue}>{stat.value}</Text>
                <Text style={styles.statLabel}>{stat.label}</Text>
              </View>
            ))}
          </View>
        </GlassCard>

        {/* Achievements */}
        <GlassCard style={styles.achievementsSection}>
          <Text style={styles.sectionTitle}>Logros</Text>
          <View style={styles.achievementsList}>
            {achievements.map((achievement) => (
              <View key={achievement.id} style={[
                styles.achievementItem,
                !achievement.unlocked && styles.achievementLocked
              ]}>
                <View style={[
                  styles.achievementIcon,
                  { backgroundColor: achievement.color + '20' }
                ]}>
                  <MaterialIcons 
                    name={achievement.icon as any} 
                    size={24} 
                    color={achievement.unlocked ? achievement.color : colors.textMuted} 
                  />
                </View>
                <View style={styles.achievementInfo}>
                  <Text style={[
                    styles.achievementTitle,
                    !achievement.unlocked && styles.lockedText
                  ]}>
                    {achievement.title}
                  </Text>
                  <Text style={[
                    styles.achievementDescription,
                    !achievement.unlocked && styles.lockedText
                  ]}>
                    {achievement.description}
                  </Text>
                </View>
                {achievement.unlocked && (
                  <MaterialIcons name="check-circle" size={20} color={colors.success} />
                )}
              </View>
            ))}
          </View>
        </GlassCard>

        {/* Settings */}
        <GlassCard style={styles.settingsSection}>
          <Text style={styles.sectionTitle}>Configuración</Text>
          <View style={styles.settingsList}>
            <View style={styles.settingItem}>
              <MaterialIcons name="notifications" size={24} color={colors.textSecondary} />
              <Text style={styles.settingText}>Notificaciones</Text>
              <MaterialIcons name="chevron-right" size={24} color={colors.textMuted} />
            </View>
            <View style={styles.settingItem}>
              <MaterialIcons name="language" size={24} color={colors.textSecondary} />
              <Text style={styles.settingText}>Idioma de la app</Text>
              <MaterialIcons name="chevron-right" size={24} color={colors.textMuted} />
            </View>
            <View style={styles.settingItem}>
              <MaterialIcons name="volume-up" size={24} color={colors.textSecondary} />
              <Text style={styles.settingText}>Audio y pronunciación</Text>
              <MaterialIcons name="chevron-right" size={24} color={colors.textMuted} />
            </View>
          </View>
        </GlassCard>

        {/* Sign out button */}
        <View style={styles.signOutSection}>
          <AppButton
            label="Cerrar sesión"
            onPress={() => console.log('Cerrando sesión')}
            variant="outline"
            icon={<MaterialIcons name="logout" size={20} color={colors.danger} />}
          />
        </View>
      </ScrollView>
    </GradientBg>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 20,
  },
  header: {
    marginTop: 50,
    marginBottom: 30,
  },
  profileSection: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  avatar: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: colors.glass,
    justifyContent: 'center',
    alignItems: 'center',
    borderWidth: 3,
    borderColor: colors.glassBorder,
    marginRight: 20,
  },
  userInfo: {
    flex: 1,
  },
  userName: {
    fontSize: 24,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: 4,
  },
  userLevel: {
    fontSize: 16,
    color: colors.textSecondary,
    marginBottom: 8,
  },
  levelProgress: {
    height: 6,
    backgroundColor: colors.border,
    borderRadius: 3,
    overflow: 'hidden',
  },
  levelBar: {
    height: '100%',
    backgroundColor: colors.primary,
    borderRadius: 3,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: 16,
  },
  statsSection: {
    marginBottom: 20,
  },
  statsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'space-between',
  },
  statItem: {
    width: '48%',
    alignItems: 'center',
    padding: 16,
    backgroundColor: colors.glass,
    borderRadius: 12,
    marginBottom: 12,
  },
  statValue: {
    fontSize: 24,
    fontWeight: 'bold',
    color: colors.text,
    marginTop: 8,
    marginBottom: 4,
  },
  statLabel: {
    fontSize: 12,
    color: colors.textSecondary,
    textAlign: 'center',
  },
  achievementsSection: {
    marginBottom: 20,
  },
  achievementsList: {
    gap: 12,
  },
  achievementItem: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 12,
    backgroundColor: colors.glass,
    borderRadius: 12,
  },
  achievementLocked: {
    opacity: 0.6,
  },
  achievementIcon: {
    width: 48,
    height: 48,
    borderRadius: 24,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 16,
  },
  achievementInfo: {
    flex: 1,
  },
  achievementTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: 2,
  },
  achievementDescription: {
    fontSize: 14,
    color: colors.textSecondary,
  },
  lockedText: {
    color: colors.textMuted,
  },
  settingsSection: {
    marginBottom: 20,
  },
  settingsList: {
    gap: 4,
  },
  settingItem: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 16,
    backgroundColor: colors.glass,
    borderRadius: 12,
    marginBottom: 8,
  },
  settingText: {
    flex: 1,
    fontSize: 16,
    color: colors.text,
    marginLeft: 16,
  },
  signOutSection: {
    marginBottom: 40,
  },
});

export default ProfileScreen;