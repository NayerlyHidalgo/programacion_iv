// src/components/AppButton.tsx
import React from 'react';
import { 
  Pressable, 
  Text, 
  StyleSheet, 
  ViewStyle, 
  TextStyle,
  ActivityIndicator
} from 'react-native';

type AppButtonProps = {
  title: string;
  onPress: () => void;
  disabled?: boolean;
  loading?: boolean;
  variant?: 'primary' | 'secondary' | 'outline';
  style?: ViewStyle;
  textStyle?: TextStyle;
  testID?: string;
};

export function AppButton({
  title,
  onPress,
  disabled = false,
  loading = false,
  variant = 'primary',
  style,
  textStyle,
  testID
}: AppButtonProps) {
  
  // Función auxiliar para determinar colores según variante
  const getVariantStyles = () => {
    switch (variant) {
      case 'secondary':
        return {
          bg: '#21262d',
          border: '#30363d',
          text: '#c9d1d9'
        };
      case 'outline':
        return {
          bg: 'transparent',
          border: '#58a6ff',
          text: '#58a6ff'
        };
      case 'primary':
      default:
        return {
          bg: '#58a6ff',
          border: '#58a6ff',
          text: '#0d1117'
        };
    }
  };
  
  const colors = getVariantStyles();
  
  return (
    <Pressable
      testID={testID}
      onPress={onPress}
      disabled={disabled || loading}
      style={({ pressed }) => [
        styles.button,
        {
          backgroundColor: colors.bg,
          borderColor: colors.border,
          opacity: disabled ? 0.5 : (pressed ? 0.8 : 1),
        },
        style,
      ]}
      accessibilityLabel={title}
      accessibilityState={{ disabled: disabled || loading }}
    >
      {loading ? (
        <ActivityIndicator 
          size="small" 
          color={variant === 'primary' ? '#0d1117' : '#58a6ff'} 
        />
      ) : (
        <Text style={[styles.text, { color: colors.text }, textStyle]}>
          {title}
        </Text>
      )}
    </Pressable>
  );
}

const styles = StyleSheet.create({
  button: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    paddingHorizontal: 20,
    borderRadius: 8,
    borderWidth: 1,
    minHeight: 48,
  },
  text: {
    fontSize: 16,
    fontWeight: '600',
    textAlign: 'center',
  },
});

export default AppButton;


