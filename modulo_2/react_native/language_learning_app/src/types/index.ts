export interface Word {
  id: string;
  original: string;
  translation: string;
  language: string;
  category: WordCategory;
  pronunciation: string;
  audioPath?: string;
  isLearned: boolean;
  timesReviewed: number;
  lastReview?: Date;
  difficulty: Difficulty;
  learningStreak: number;
}

export interface Lesson {
  id: string;
  title: string;
  description: string;
  level: LearningLevel;
  language: string;
  wordIds: string[];
  phrases: Phrase[];
  exercises: Exercise[];
  order: number;
  isCompleted: boolean;
  progress: number;
  points: number;
  estimatedDurationMinutes: number;
}

export interface Phrase {
  id: string;
  original: string;
  translation: string;
  context: string;
  audioPath?: string;
}

export interface Exercise {
  id: string;
  type: ExerciseType;
  question: string;
  options: string[];
  correctAnswer: string;
  explanation?: string;
  points: number;
}

export interface Course {
  id: string;
  name: string;
  targetLanguage: string;
  nativeLanguage: string;
  description: string;
  imageUrl: string;
  lessonIds: string[];
  progress: number;
  estimatedHours: number;
  level: LearningLevel;
}

export interface UserProfile {
  id: string;
  name: string;
  email: string;
  nativeLanguage: string;
  learningLanguages: string[];
  totalPoints: number;
  streak: number;
  lastStudyDate: Date;
  dailyGoalMinutes: number;
  weeklyStudyMinutes: number;
  achievements: string[];
  preferences: UserPreferences;
}

export interface UserPreferences {
  soundEnabled: boolean;
  notificationsEnabled: boolean;
  studyReminders: boolean;
  preferredStudyTime: 'morning' | 'afternoon' | 'evening';
  difficultyLevel: 'easy' | 'medium' | 'hard' | 'automatic';
  darkMode: boolean;
  language: string;
}

export interface AppState {
  user: {
    profile: UserProfile | null;
    isAuthenticated: boolean;
    isLoading: boolean;
  };
  language: {
    currentLanguage: string;
    words: Word[];
    lessons: Lesson[];
    courses: Course[];
    isLoading: boolean;
  };
  practice: {
    currentMode: PracticeMode;
    currentExercise: Exercise | null;
    score: number;
    timeSpent: number;
  };
  settings: {
    theme: 'light' | 'dark';
    language: string;
  };
}

export enum WordCategory {
  GREETINGS = 'greetings',
  FAMILY = 'family',
  FOOD = 'food',
  TRAVEL = 'travel',
  WORK = 'work',
  EMOTIONS = 'emotions',
  COLORS = 'colors',
  NUMBERS = 'numbers',
  TIME = 'time',
  WEATHER = 'weather',
  SHOPPING = 'shopping',
  HEALTH = 'health',
  EDUCATION = 'education',
  TECHNOLOGY = 'technology',
  NATURE = 'nature',
  SPORTS = 'sports',
  MUSIC = 'music',
  ANIMALS = 'animals',
  CLOTHING = 'clothing',
  TRANSPORTATION = 'transportation'
}

export enum Difficulty {
  VERY_EASY = 1,
  EASY = 2,
  MEDIUM = 3,
  HARD = 4,
  VERY_HARD = 5
}

export enum LearningLevel {
  BEGINNER = 'beginner',
  INTERMEDIATE = 'intermediate',
  ADVANCED = 'advanced'
}

export enum ExerciseType {
  MULTIPLE_CHOICE = 'multiple_choice',
  TRANSLATION = 'translation',
  LISTENING = 'listening',
  PRONUNCIATION = 'pronunciation',
  FILL_BLANK = 'fill_blank',
  MATCHING = 'matching',
  SPEAKING = 'speaking'
}

export enum PracticeMode {
  REVIEW = 'review',
  NEW_WORDS = 'new_words',
  DIFFICULT = 'difficult',
  RANDOM = 'random',
  PRONUNCIATION = 'pronunciation',
  LISTENING = 'listening'
}

export interface LessonProgress {
  lessonId: string;
  completedExercises: string[];
  currentExerciseIndex: number;
  score: number;
  startTime: Date;
  endTime?: Date;
}

export interface StudySession {
  id: string;
  date: Date;
  duration: number; // en minutos
  wordsLearned: number;
  exercisesCompleted: number;
  points: number;
  language: string;
}

export interface Achievement {
  id: string;
  title: string;
  description: string;
  icon: string;
  unlockedAt?: Date;
  progress: number;
  target: number;
}
