import { StyleSheet, Text, View, Pressable } from "react-native";

export function HeaderDemo() {
  return (
    <View style={styles.header}>
      <Text style={styles.title}>Mis Productos</Text>

      <Pressable style={styles.btn}>
        <Text style={styles.btnText}>+ Nuevo</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  header: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    backgroundColor: "#0d1117",
    paddingVertical: 12,
    paddingHorizontal: 16,
    borderBottomColor: "#30363d",
    borderBottomWidth: 1,
  },
  title: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 18,
  },
  btn: {
    backgroundColor: "#21262d",
    borderColor: "#58a6ff",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 8,
    paddingHorizontal: 12,
  },
  btnText: {
    color: "#58a6ff",
    fontWeight: "800",
  },
});