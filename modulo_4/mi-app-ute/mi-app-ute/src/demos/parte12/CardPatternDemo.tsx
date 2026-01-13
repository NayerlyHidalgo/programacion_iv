import { StyleSheet, Text, View, Pressable } from "react-native";

export function CardPatternDemo() {
  return (
    <View style={styles.card}>
      <Text style={styles.cardTitle}>Curso RN</Text>
      <Text style={styles.cardBody}>Layout con Flexbox + TypeScript</Text>

      <View style={styles.actions}>
        <Pressable style={styles.actionBtn}>
          <Text style={styles.actionText}>Ver</Text>
        </Pressable>
        <Pressable style={styles.actionBtn}>
          <Text style={styles.actionText}>Editar</Text>
        </Pressable>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 12,
    padding: 14,
  },
  cardTitle: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 16,
    marginBottom: 6,
  },
  cardBody: {
    color: "#c9d1d9",
    opacity: 0.9,
    lineHeight: 20,
  },
  actions: {
    marginTop: 12,
    flexDirection: "row",
    justifyContent: "flex-end",
  },
  actionBtn: {
    backgroundColor: "#21262d",
    borderColor: "#58a6ff",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 8,
    paddingHorizontal: 12,
    marginLeft: 10,
  },
  actionText: {
    color: "#58a6ff",
    fontWeight: "800",
  },
});