import { StyleSheet, Text, View } from "react-native";

export function ColumnDemo() {
  return (
    <View style={styles.container}>
      <View style={styles.box}><Text style={styles.text}>A</Text></View>
      <View style={styles.box}><Text style={styles.text}>B</Text></View>
      <View style={styles.box}><Text style={styles.text}>C</Text></View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    padding: 16,
    justifyContent: "center",
    alignItems: "center",
  },
  box: {
    width: 70,
    height: 70,
    borderRadius: 12,
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    alignItems: "center",
    justifyContent: "center",
    marginBottom: 10,
  },
  text: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 18,
  },
});