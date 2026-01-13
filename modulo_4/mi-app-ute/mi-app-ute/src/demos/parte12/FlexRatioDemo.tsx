import { StyleSheet, Text, View } from "react-native";

export function FlexRatioDemo() {
  return (
    <View style={styles.container}>
      <View style={[styles.item, { flex: 1 }]}><Text style={styles.text}>1</Text></View>
      <View style={[styles.item, { flex: 2 }]}><Text style={styles.text}>2</Text></View>
      <View style={[styles.item, { flex: 1 }]}><Text style={styles.text}>1</Text></View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    flexDirection: "row",
    padding: 16,
  },
  item: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 12,
    alignItems: "center",
    justifyContent: "center",
    marginRight: 10,
  },
  text: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 18,
  },
});