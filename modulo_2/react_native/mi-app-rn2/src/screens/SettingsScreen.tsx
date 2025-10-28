import React from "react";
import { View, Text, StyleSheet } from "react-native";

export default function SettingsScreen() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>⚙️ Configuración</Text>
      <Text style={styles.subtitle}>Aquí podrás modificar tus preferencias</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#0d1117",
    padding: 20,
  },
  title: {
    fontSize: 24,
    color: "#58a6ff",
    marginBottom: 10,
  },
  subtitle: {
    color: "#c9d1d9",
    fontSize: 16,
    textAlign: "center",
  },
});