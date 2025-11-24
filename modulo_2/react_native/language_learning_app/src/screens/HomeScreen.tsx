import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import GradientBg from '../components/GradientBg';
import GlassCard from '../components/GlassCard';
import AppButton from '../components/AppButton';
import WordCard from '../components/WordCard';
import { colors } from '../theme';

const HomeScreen: React.FC = () => {
  const mockWords = [
    {
      word: "Hello",
      translation: "Hola", 
      pronunciation: "/həˈloʊ/",
      category: "GREETINGS",
      reviewCount: 5,
      streakCount: 3,
      difficulty: 'easy' as const
    },
    {
      word: "Goodbye", 
      translation: "Adiós",
      pronunciation: "/ɡʊdˈbaɪ/",
      category: "GREETINGS",
      reviewCount: 2,
      streakCount: 1,
      difficulty: 'medium' as const
    },
    {
      word: "Beautiful",
      translation: "Hermoso",
      pronunciation: "/ˈbjuːtɪfəl/", 
      category: "ADJECTIVES",
      reviewCount: 8,
      streakCount: 0,
      difficulty: 'hard' as const
    }
  ];

  return (
    <GradientBg variant="primary">
      <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
        {/* Header */}
        <View style={styles.header}>
          <View style={styles.welcomeSection}>
            <Text style={styles.greeting}>¡Hola!</Text>
            <Text style={styles.subtitle}>Continúa tu aprendizaje</Text>
          </View>
          <View style={styles.profileIcon}>
            <MaterialIcons name="person" size={24} color={colors.primary} />
          </View>
        </View>

        {/* Stats Cards */}
        <View style={styles.statsSection}>
          <View style={styles.statsRow}>
            <GlassCard style={styles.statCard} variant="highlight">
              <MaterialIcons name="flash-on" size={24} color={colors.streak} />
              <Text style={styles.statNumber}>15</Text>
              <Text style={styles.statLabel}>Racha actual</Text>
            </GlassCard>
            
            <GlassCard style={styles.statCard} variant="learning">
              <MaterialIcons name="school" size={24} color={colors.accent} />
              <Text style={styles.statNumber}>47</Text>
              <Text style={styles.statLabel}>Palabras aprendidas</Text>
            </GlassCard>
          </View>
        </View>

        {/* Quick Actions */}
        <GlassCard style={styles.actionsSection}>
          <Text style={styles.sectionTitle}>Acciones rápidas</Text>
          <View style={styles.buttonRow}>
            <AppButton 
              label="Nueva lección" 
              onPress={() => console.log('Nueva lección')}
              variant="primary"
              icon={<MaterialIcons name="play-arrow" size={20} color={colors.text} />}
            />
            <AppButton 
              label="Repasar" 
              onPress={() => console.log('Repasar')}
              variant="outline"
              icon={<MaterialIcons name="refresh" size={20} color={colors.primary} />}
            />
          </View>
        </GlassCard>

        {/* Word Cards Section */}
        <View style={styles.wordsSection}>
          <Text style={styles.sectionTitle}>Palabras recientes</Text>
          {mockWords.map((wordData, index) => (
            <WordCard 
              key={index}
              {...wordData}
              onPress={() => console.log(`Pressed: ${wordData.word}`)}
            />
          ))}
        </View>

        {/* Continue Learning Button */}
        <View style={styles.continueSection}>
          <AppButton 
            label="Continuar aprendiendo" 
            onPress={() => console.log('Continuar')}
            variant="secondary"
            size="large"
            icon={<MaterialIcons name="arrow-forward" size={24} color={colors.text} />}
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
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: 50,
    marginBottom: 30,
  },
  welcomeSection: {
    flex: 1,
  },
  greeting: {
    fontSize: 32,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: 4,
  },
  subtitle: {
    fontSize: 16,
    color: colors.textSecondary,
  },
  profileIcon: {
    width: 50,
    height: 50,
    borderRadius: 25,
    backgroundColor: colors.glass,
    justifyContent: 'center',
    alignItems: 'center',
    borderWidth: 2,
    borderColor: colors.glassBorder,
  },
  statsSection: {
    marginBottom: 30,
  },
  statsRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    gap: 15,
  },
  statCard: {
    flex: 1,
    alignItems: 'center',
    paddingVertical: 20,
  },
  statNumber: {
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
  actionsSection: {
    marginBottom: 30,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: 16,
  },
  buttonRow: {
    flexDirection: 'row',
    gap: 12,
  },
  wordsSection: {
    marginBottom: 30,
  },
  continueSection: {
    marginBottom: 40,
  },
});

export default HomeScreen;