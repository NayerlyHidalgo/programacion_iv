import React from "react";
import { View, Text, Button, StyleSheet } from "react-native";

export default function DetailsScreen({ navigation }: any) {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>📄 Details Screen</Text>
      <Button title="Volver al Home" onPress={() => navigation.navigate("Home")} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#161b22",
  },
  title: {
    fontSize: 22,
    color: "#58a6ff",
    marginBottom: 20,
  },
});