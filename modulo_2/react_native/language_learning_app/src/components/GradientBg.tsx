import React from "react";
import { LinearGradient } from "expo-linear-gradient";
import { View, StyleSheet } from "react-native";
import { gradients } from "../theme/gradients";

interface GradientBgProps {
  children: React.ReactNode;
  variant?: 'primary' | 'secondary' | 'learning';
}

export default function GradientBg({ children, variant = 'primary' }: GradientBgProps) {
  const gradient = gradients[variant];
  
  return (
    <View style={styles.container}>
      <LinearGradient
        colors={gradient.colors}
        start={gradient.start}
        end={gradient.end}
        style={StyleSheet.absoluteFillObject}
      />
      {children}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});