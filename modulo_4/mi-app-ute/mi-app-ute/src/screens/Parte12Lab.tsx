import { StyleSheet, Text, View } from "react-native";
import { ColumnDemo } from "../demos/parte12/ColumnDemo";
import { RowDemo } from "@/demos/parte12/RowDemo";
import { FlexRatioDemo } from "@/demos/parte12/FlexRatioDemo";
import { WrapDemo } from "@/demos/parte12/WrapDemo";
import { HeaderDemo } from "@/demos/parte12/HeaderDemo";
import { CardPatternDemo } from "@/demos/parte12/CardPatternDemo";

export function Parte12Lab() {
  return (
    <View style={styles.container}>
      <Text style={styles.h1}>Parte 12 Lab — Flexbox</Text>

      <View style={styles.stage}>
        <HeaderDemo />
        <CardPatternDemo />
      </View>
      <Text style={styles.help}>
        Cambia el import y el componente renderizado para probar: RowDemo, FlexRatioDemo, WrapDemo, etc.
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    padding: 16,
  },
  h1: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 18,
    marginBottom: 12,
  },
  stage: {
    flex: 1,
    borderRadius: 12,
    overflow: "hidden",
    borderWidth: 1,
    borderColor: "#30363d",
  },
  help: {
    marginTop: 12,
    color: "#8b949e",
    lineHeight: 18,
  },
});