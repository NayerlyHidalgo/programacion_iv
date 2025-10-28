import React from "react";
import { View, Text, Button, StyleSheet } from "react-native";

export default function HomeScreen({ navigation }: any) {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>🏠 Home Screen</Text>
      <Button title="Ir a Detalles" onPress={() => navigation.navigate("Details")} />
      <Button title="Ir a Configuración" onPress={() => navigation.navigate("Settings")} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#0d1117",
  },
  title: {
    fontSize: 24,
    color: "#58a6ff",
    marginBottom: 20,
  },
});