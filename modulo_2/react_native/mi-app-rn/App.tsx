import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";

import SaludoSimple from "./src/Saludo";
import SaludoConProps from "./src/SaludoProps";

export default function App() {
  return (
    <View style={styles.container}>
      <SaludoSimple />
      <SaludoConProps nombre="Francisco" />
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    alignItems: "center",
    justifyContent: "center",
    padding: 20,
  },
});