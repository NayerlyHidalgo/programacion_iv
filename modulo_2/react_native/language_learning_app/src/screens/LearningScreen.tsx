import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import GradientBg from '../components/GradientBg';
import GlassCard from '../components/GlassCard';
import AppButton from '../components/AppButton';
import { colors } from '../theme';

const LearningScreen: React.FC = () => {
  const categories = [
    {
      title: 'Saludos',
      description: '¡Aprende a saludar!',
      icon: 'waving-hand',
      progress: 85,
      wordsCount: 12,
      color: colors.success,
    },
    {
      title: 'Números',
      description: 'Cuenta del 1 al 100',
      icon: 'calculate',
      progress: 60,
      wordsCount: 25,
      color: colors.info,
    },
    {
      title: 'Colores',
      description: 'Mundo colorido',
      icon: 'palette',
      progress: 40,
      wordsCount: 15,
      color: colors.warning,
    },
    {
      title: 'Familia',
      description: 'Miembros de la familia',
      icon: 'family-restroom',
      progress: 25,
      wordsCount: 18,
      color: colors.danger,
    },
  ];

  const renderProgressBar = (progress: number) => (
    <View style={styles.progressBarContainer}>
      <View style={[styles.progressBar, { width: `${progress}%` }]} />
    </View>
  );

  return (
    <GradientBg variant="learning">
      <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
        {/* Header */}
        <View style={styles.header}>
          <Text style={styles.title}>Categorías</Text>
          <Text style={styles.subtitle}>Elige una categoría para aprender</Text>
        </View>

        {/* Categories */}
        <View style={styles.categoriesSection}>
          {categories.map((category, index) => (
            <GlassCard key={index} style={styles.categoryCard}>
              <View style={styles.categoryHeader}>
                <View style={[styles.iconContainer, { backgroundColor: category.color + '20' }]}>
                  <MaterialIcons name={category.icon as any} size={28} color={category.color} />
                </View>
                <View style={styles.categoryInfo}>
                  <Text style={styles.categoryTitle}>{category.title}</Text>
                  <Text style={styles.categoryDescription}>{category.description}</Text>
                  <Text style={styles.wordsCount}>{category.wordsCount} palabras</Text>
                </View>
                <View style={styles.progressInfo}>
                  <Text style={[styles.progressText, { color: category.color }]}>
                    {category.progress}%
                  </Text>
                </View>
              </View>
              
              {renderProgressBar(category.progress)}
              
              <View style={styles.categoryActions}>
                <AppButton
                  label={category.progress > 0 ? "Continuar" : "Empezar"}
                  onPress={() => console.log(`Iniciando categoría: ${category.title}`)}
                  variant={category.progress > 0 ? "primary" : "outline"}
                  size="medium"
                />
              </View>
            </GlassCard>
          ))}
        </View>

        {/* Daily Challenge */}
        <GlassCard style={styles.challengeCard} variant="highlight">
          <View style={styles.challengeHeader}>
            <MaterialIcons name="emoji-events" size={32} color={colors.streak} />
            <View style={styles.challengeInfo}>
              <Text style={styles.challengeTitle}>Desafío diario</Text>
              <Text style={styles.challengeDescription}>
                Completa 5 palabras nuevas hoy
              </Text>
            </View>
          </View>
          <View style={styles.challengeProgress}>
            <Text style={styles.challengeProgressText}>3/5 completadas</Text>
            {renderProgressBar(60)}
          </View>
          <AppButton
            label="Continuar desafío"
            onPress={() => console.log('Iniciando desafío')}
            variant="secondary"
            icon={<MaterialIcons name="play-arrow" size={20} color={colors.text} />}
          />
        </GlassCard>
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
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: 8,
  },
  subtitle: {
    fontSize: 16,
    color: colors.textSecondary,
  },
  categoriesSection: {
    gap: 16,
    marginBottom: 30,
  },
  categoryCard: {
    padding: 20,
  },
  categoryHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 16,
  },
  iconContainer: {
    width: 56,
    height: 56,
    borderRadius: 28,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 16,
  },
  categoryInfo: {
    flex: 1,
  },
  categoryTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: 4,
  },
  categoryDescription: {
    fontSize: 14,
    color: colors.textSecondary,
    marginBottom: 4,
  },
  wordsCount: {
    fontSize: 12,
    color: colors.textMuted,
  },
  progressInfo: {
    alignItems: 'flex-end',
  },
  progressText: {
    fontSize: 16,
    fontWeight: 'bold',
  },
  progressBarContainer: {
    height: 6,
    backgroundColor: colors.border,
    borderRadius: 3,
    marginBottom: 16,
    overflow: 'hidden',
  },
  progressBar: {
    height: '100%',
    backgroundColor: colors.primary,
    borderRadius: 3,
  },
  categoryActions: {
    alignItems: 'flex-end',
  },
  challengeCard: {
    padding: 20,
    marginBottom: 40,
  },
  challengeHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 16,
  },
  challengeInfo: {
    marginLeft: 16,
    flex: 1,
  },
  challengeTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: 4,
  },
  challengeDescription: {
    fontSize: 14,
    color: colors.textSecondary,
  },
  challengeProgress: {
    marginBottom: 20,
  },
  challengeProgressText: {
    fontSize: 14,
    color: colors.textSecondary,
    marginBottom: 8,
  },
});

export default LearningScreen;