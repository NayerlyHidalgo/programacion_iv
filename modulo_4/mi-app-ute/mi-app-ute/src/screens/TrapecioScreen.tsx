import { useMemo, useState } from "react";
import {
  Alert,
  KeyboardAvoidingView,
  Platform,
  Pressable,
  StyleSheet,
  Text,
  TextInput,
  View,
  ScrollView,
} from "react-native";

// Tipado del formulario
type TrapezoidForm = {
  baseMayor: string;
  baseMenor: string;
  altura: string;
};

type FormErrors = Partial<Record<keyof TrapezoidForm, string>>;

export function TrapezoidAreaScreen() {
  const [form, setForm] = useState<TrapezoidForm>({
    baseMayor: "",
    baseMenor: "",
    altura: "",
  });
  const [errors, setErrors] = useState<FormErrors>({});
  const [submitted, setSubmitted] = useState<boolean>(false);

  // Paleta de colores Dark
  const bg = "#0d1117";
  const card = "#161b22";
  const border = "#30363d";
  const text = "#c9d1d9";
  const primary = "#58a6ff";
  const danger = "#f85149";

  // Lógica de validación
  function validate(next: TrapezoidForm): FormErrors {
    const e: FormErrors = {};
    const bM = parseFloat(next.baseMayor);
    const bm = parseFloat(next.baseMenor);
    const h = parseFloat(next.altura);

    if (!next.baseMayor || isNaN(bM) || bM <= 0) e.baseMayor = "Base mayor inválida";
    if (!next.baseMenor || isNaN(bm) || bm <= 0) e.baseMenor = "Base menor inválida";
    if (!next.altura || isNaN(h) || h <= 0) e.altura = "Altura inválida";

    return e;
  }

  const isOk = useMemo(() => {
    const e = validate(form);
    return Object.keys(e).length === 0;
  }, [form]);

  // Función onChange genérica exacta a tu estilo
  function onChange<K extends keyof TrapezoidForm>(key: K, value: TrapezoidForm[K]) {
    const nextForm = { ...form, [key]: value };
    setForm(nextForm);
    if (submitted) {
      setErrors(validate(nextForm));
    }
  }

  function clear() {
    setForm({ baseMayor: "", baseMenor: "", altura: "" });
    setErrors({});
    setSubmitted(false);
  }

  function submit() {
    setSubmitted(true);
    const e = validate(form);
    setErrors(e);

    if (Object.keys(e).length > 0) return;

    const bM = parseFloat(form.baseMayor);
    const bm = parseFloat(form.baseMenor);
    const h = parseFloat(form.altura);
    const area = ((bM + bm) * h) / 2;

    Alert.alert("📐 Resultado", `El área del trapecio es: ${area.toFixed(2)} unidades²`);
  }

  return (
    <KeyboardAvoidingView
      style={{ flex: 1, backgroundColor: bg }}
      behavior={Platform.OS === "ios" ? "padding" : undefined}
    >
      <ScrollView contentContainerStyle={styles.container}>
        <Text style={[styles.title, { color: primary }]}>Área del Trapecio</Text>

        

[Image of area of a trapezoid formula]


        <View style={[styles.card, { backgroundColor: card, borderColor: border }]}>
          
          {/* Base Mayor */}
          <Text style={[styles.label, { color: text }]}>Base Mayor (B)</Text>
          <TextInput
            value={form.baseMayor}
            onChangeText={(t) => onChange("baseMayor", t)}
            placeholder="Ej: 10"
            placeholderTextColor="#8b949e"
            keyboardType="numeric"
            style={[
              styles.input,
              { backgroundColor: card, borderColor: errors.baseMayor ? danger : border, color: text },
            ]}
          />
          {errors.baseMayor && <Text style={[styles.error, { color: danger }]}>{errors.baseMayor}</Text>}

          {/* Base Menor */}
          <Text style={[styles.label, { color: text, marginTop: 10 }]}>Base Menor (b)</Text>
          <TextInput
            value={form.baseMenor}
            onChangeText={(t) => onChange("baseMenor", t)}
            placeholder="Ej: 5"
            placeholderTextColor="#8b949e"
            keyboardType="numeric"
            style={[
              styles.input,
              { backgroundColor: card, borderColor: errors.baseMenor ? danger : border, color: text },
            ]}
          />
          {errors.baseMenor && <Text style={[styles.error, { color: danger }]}>{errors.baseMenor}</Text>}

          {/* Altura */}
          <Text style={[styles.label, { color: text, marginTop: 10 }]}>Altura (h)</Text>
          <TextInput
            value={form.altura}
            onChangeText={(t) => onChange("altura", t)}
            placeholder="Ej: 8"
            placeholderTextColor="#8b949e"
            keyboardType="numeric"
            style={[
              styles.input,
              { backgroundColor: card, borderColor: errors.altura ? danger : border, color: text },
            ]}
          />
          {errors.altura && <Text style={[styles.error, { color: danger }]}>{errors.altura}</Text>}

          {/* Botón Calcular */}
          <Pressable
            style={[
              styles.btn,
              { borderColor: primary, opacity: isOk ? 1 : 0.6 },
            ]}
            onPress={submit}
          >
            <Text style={[styles.btnText, { color: primary }]}>Calcular Área</Text>
          </Pressable>

          {/* Botón Limpiar */}
          <Pressable style={[styles.btnGhost, { borderColor: border }]} onPress={clear}>
            <Text style={[styles.btnText, { color: text }]}>Limpiar Campos</Text>
          </Pressable>

          <Text style={[styles.hint, { color: text }]}>
            Fórmula: ((B + b) * h) / 2
          </Text>
        </View>
      </ScrollView>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    padding: 16,
    justifyContent: "center",
  },
  title: {
    fontWeight: "900",
    fontSize: 22,
    marginBottom: 10,
    textAlign: "center",
  },
  card: {
    borderWidth: 1,
    borderRadius: 12,
    padding: 14,
  },
  label: {
    fontWeight: "800",
    opacity: 0.9,
    marginBottom: 6,
  },
  input: {
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 12,
  },
  error: {
    marginTop: 6,
    fontWeight: "800",
    fontSize: 12,
  },
  btn: {
    marginTop: 14,
    backgroundColor: "#21262d",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 12,
    alignItems: "center",
  },
  btnGhost: {
    marginTop: 10,
    backgroundColor: "transparent",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 12,
    alignItems: "center",
  },
  btnText: {
    fontWeight: "900",
  },
  hint: {
    marginTop: 15,
    opacity: 0.6,
    textAlign: "center",
    fontSize: 12,
  },
});