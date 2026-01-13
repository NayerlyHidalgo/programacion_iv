import { StyleSheet, Text, View } from "react-native";

export function RowDemo() {
  return (
    <View style={styles.container}>
      <View style={styles.row}>
        <View style={styles.box}><Text style={styles.text}>1</Text></View>
        <View style={styles.box}><Text style={styles.text}>2</Text></View>
        <View style={styles.box}><Text style={styles.text}>3</Text></View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    justifyContent: "center",
    padding: 16,
  },
  row: {
    flexDirection: "row",
    justifyContent: "space-between",
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
  },
  text: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 18,
  },
});