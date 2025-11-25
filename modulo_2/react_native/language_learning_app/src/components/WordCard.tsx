import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Dimensions,
} from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import { LinearGradient } from 'expo-linear-gradient';
import GlassCard from './GlassCard';
import { colors } from '../theme';
import { gradients } from '../theme/gradients';

const { width } = Dimensions.get('window');

interface WordCardProps {
  word?: string;
  translation?: string;
  pronunciation?: string;
  category?: string;
  reviewCount?: number;
  streakCount?: number;
  difficulty?: 'easy' | 'medium' | 'hard';
  onPress?: () => void;
}

const WordCard: React.FC<WordCardProps> = ({
  word = "Hello",
  translation = "Hola", 
  pronunciation = "/həˈloʊ/",
  category = "GREETINGS",
  reviewCount = 5,
  streakCount = 3,
  difficulty = 'easy',
  onPress
}) => {
  const handlePress = () => {
    onPress?.();
    console.log('WordCard pressed!');
  };

  const getDifficultyColor = () => {
    switch (difficulty) {
      case 'easy': return colors.success;
      case 'medium': return colors.warning; 
      case 'hard': return colors.danger;
      default: return colors.accent;
    }
  };

  const getDifficultyIcon = () => {
    switch (difficulty) {
      case 'easy': return 'sentiment-very-satisfied';
      case 'medium': return 'sentiment-satisfied';
      case 'hard': return 'sentiment-dissatisfied';
      default: return 'sentiment-neutral';
    }
  };

  return (
    <TouchableOpacity onPress={handlePress} style={styles.container}>
      <GlassCard style={styles.card} variant="default">
        <LinearGradient
          colors={gradients.card.colors}
          start={gradients.card.start}
          end={gradients.card.end}
          style={styles.gradientOverlay}
        >
          <View style={styles.header}>
            <View style={[styles.categoryBadge, { backgroundColor: getDifficultyColor() + '20', borderColor: getDifficultyColor() }]}>
              <Text style={[styles.categoryText, { color: getDifficultyColor() }]}>{category}</Text>
            </View>
            <MaterialIcons 
              name={getDifficultyIcon()} 
              size={20} 
              color={getDifficultyColor()} 
            />
          </View>

          <View style={styles.content}>
            <Text style={styles.originalWord}>{word}</Text>
            <Text style={styles.pronunciation}>{pronunciation}</Text>
            <Text style={styles.translation}>{translation}</Text>
          </View>

          <View style={styles.footer}>
            <View style={styles.statsContainer}>
              <View style={styles.statItem}>
                <MaterialIcons name="repeat" size={16} color={colors.textSecondary} />
                <Text style={styles.statText}>{reviewCount}</Text>
              </View>
              <View style={styles.statItem}>
                <MaterialIcons name="local-fire-department" size={16} color={colors.streak} />
                <Text style={styles.statText}>{streakCount}</Text>
              </View>
            </View>
            <View style={[styles.difficultyIndicator, { backgroundColor: getDifficultyColor() }]} />
          </View>
        </LinearGradient>
      </GlassCard>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  container: {
    width: width * 0.9,
    marginVertical: 8,
    alignSelf: 'center',
  },
  card: {
    overflow: 'hidden',
  },
  gradientOverlay: {
    padding: 16,
    borderRadius: 16,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 16,
  },
  categoryBadge: {
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 20,
    borderWidth: 1,
  },
  categoryText: {
    fontSize: 12,
    fontWeight: '700',
    letterSpacing: 0.5,
  },
  content: {
    alignItems: 'center',
    marginBottom: 16,
  },
  originalWord: {
    fontSize: 32,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: 4,
    textAlign: 'center',
  },
  pronunciation: {
    fontSize: 16,
    color: colors.textSecondary,
    fontStyle: 'italic',
    marginBottom: 8,
  },
  translation: {
    fontSize: 20,
    fontWeight: '600',
    color: colors.primary,
    textAlign: 'center',
  },
  footer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  statsContainer: {
    flexDirection: 'row',
    gap: 16,
  },
  statItem: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    backgroundColor: colors.glass,
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 12,
  },
  statText: {
    fontSize: 14,
    fontWeight: '600',
    color: colors.textSecondary,
  },
  difficultyIndicator: {
    width: 8,
    height: 8,
    borderRadius: 4,
  },
});

export default WordCard;