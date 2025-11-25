import React from "react";
import { View, ViewStyle, StyleSheet } from "react-native";
import colors from "../theme/colors";

interface GlassCardProps {
  children: React.ReactNode;
  style?: ViewStyle;
  variant?: 'default' | 'highlight' | 'learning';
}

export default function GlassCard({ children, style, variant = 'default' }: GlassCardProps) {
  const getVariantStyles = () => {
    switch (variant) {
      case 'highlight':
        return {
          backgroundColor: "rgba(124,58,237,0.15)",
          borderColor: colors.primary,
          borderWidth: 1.5,
        };
      case 'learning':
        return {
          backgroundColor: "rgba(16,185,129,0.12)",
          borderColor: colors.accent,
          borderWidth: 1,
        };
      default:
        return {
          backgroundColor: colors.glass,
          borderColor: colors.glassBorder,
          borderWidth: 1,
        };
    }
  };

  return (
    <View
      style={[
        styles.container,
        getVariantStyles(),
        style
      ]}
    >
      {children}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 16,
    borderRadius: 16,
  },
});