import React from 'react';
import { View, ActivityIndicator, Text, StyleSheet } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import GradientBg from './GradientBg';
import GlassCard from './GlassCard';
import { colors } from '../theme';

const LoadingScreen: React.FC = () => {
  return (
    <GradientBg variant="primary">
      <View style={styles.container}>
        <GlassCard style={styles.loadingCard}>
          <MaterialIcons name="school" size={48} color={colors.primary} />
          <Text style={styles.title}>Language Learning</Text>
          <ActivityIndicator size="large" color={colors.primary} style={styles.spinner} />
          <Text style={styles.text}>Preparando tu experiencia de aprendizaje...</Text>
        </GlassCard>
      </View>
    </GradientBg>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 40,
  },
  loadingCard: {
    alignItems: 'center',
    paddingVertical: 40,
    paddingHorizontal: 30,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: colors.text,
    marginTop: 16,
    marginBottom: 8,
    textAlign: 'center',
  },
  spinner: {
    marginVertical: 20,
  },
  text: {
    fontSize: 16,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: 22,
  },
});

export default LoadingScreen;