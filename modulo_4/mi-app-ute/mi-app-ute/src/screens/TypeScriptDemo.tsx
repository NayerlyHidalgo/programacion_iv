import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';

export function TypeScriptDemo() {
  // ===== EJEMPLO 1: TIPOS BÁSICOS =====
  const appName: string = "MiApp React Native";
  const version: number = 3.0;
  const isActive: boolean = true;
  const tags: string[] = ["react", "native", "typescript"];
  const scores: Record<string, number> = { 
    "juan": 95, 
    "ana": 88 
  };

  type Status = "IDLE" | "LOADING" | "SUCCESS" | "ERROR";
  const currentStatus: Status = "SUCCESS";

  return (
    <ScrollView style={styles.container}>
      <Text style={styles.title}>Demo TypeScript en React Native</Text>
      
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>1. Tipos Básicos</Text>
        
        <View style={styles.card}>
          <Text style={styles.label}>App Name:</Text>
          <Text style={styles.value}>{appName}</Text>
          
          <Text style={styles.label}>Version:</Text>
          <Text style={styles.value}>{version}</Text>
          
          <Text style={styles.label}>¿Activo?:</Text>
          <Text style={styles.value}>{isActive ? "Sí" : "No"}</Text>
          
          <Text style={styles.label}>Tags:</Text>
          <Text style={styles.value}>{tags.join(", ")}</Text>
          
          <Text style={styles.label}>Estado actual:</Text>
          <Text style={[
            styles.value,
            currentStatus === "SUCCESS" && styles.success
            // currentStatus === "ERROR" && styles.error
          ]}>
            {currentStatus}
          </Text>
        </View>
        
        <Text style={styles.codeComment}>
          // Mira la consola para ver los scores
        </Text>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#0d1117',
    padding: 20,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#58a6ff',
    marginBottom: 20,
    textAlign: 'center',
  },
  section: {
    marginBottom: 30,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#c9d1d9',
    marginBottom: 10,
    borderLeftWidth: 3,
    borderLeftColor: '#58a6ff',
    paddingLeft: 10,
  },
  card: {
    backgroundColor: '#161b22',
    borderWidth: 1,
    borderColor: '#30363d',
    borderRadius: 8,
    padding: 16,
  },
  label: {
    color: '#8b949e',
    fontSize: 14,
    marginTop: 8,
  },
  value: {
    color: '#c9d1d9',
    fontSize: 16,
    fontWeight: '500',
  },
  success: {
    color: '#3fb950',
  },
  error: {
    color: '#f85149',
  },
  codeComment: {
    color: '#8b949e',
    fontStyle: 'italic',
    fontSize: 12,
    marginTop: 8,
  },
});

export default TypeScriptDemo;