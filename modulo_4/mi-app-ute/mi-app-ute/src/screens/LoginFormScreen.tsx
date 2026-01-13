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
} from "react-native";
import { isValidEmail, minLen } from "@/utils/validators";

type LoginForm = {
  email: string;
  password: string;
};

type LoginErrors = Partial<Record<keyof LoginForm, string>>;

export function LoginFormScreen() {
  const [form, setForm] = useState<LoginForm>({ email: "", password: "" });
  const [errors, setErrors] = useState<LoginErrors>({});
  const [submitted, setSubmitted] = useState<boolean>(false);

  const bg = "#0d1117";
  const card = "#161b22";
  const border = "#30363d";
  const text = "#c9d1d9";
  const primary = "#58a6ff";
  const danger = "#f85149";

  function validate(next: LoginForm): LoginErrors {
    const e: LoginErrors = {};

    if (!isValidEmail(next.email)) {
      e.email = "Email inválido";
    }
    if (!minLen(next.password, 6)) {
      e.password = "Mínimo 6 caracteres";
    }

    return e;
  }

  const isOk = useMemo(() => {
    const e = validate(form);
    return Object.keys(e).length === 0;
  }, [form]);

  function onChange<K extends keyof LoginForm>(key: K, value: LoginForm[K]) {
    setForm((prev) => ({ ...prev, [key]: value }));
    if (submitted) {
      setErrors(validate({ ...form, [key]: value } as LoginForm));
    }
  }

  function clear() {
    setForm({ email: "", password: "" });
    setErrors({});
    setSubmitted(false);
  }

  function submit() {
    setSubmitted(true);
    const e = validate(form);
    setErrors(e);

    if (Object.keys(e).length > 0) return;

    Alert.alert("✅ OK", `Login simulado para: ${form.email}`);
  }

  return (
    <KeyboardAvoidingView
      style={{ flex: 1, backgroundColor: bg }}
      behavior={Platform.OS === "ios" ? "padding" : undefined}
    >
      <View style={styles.container}>
        <Text style={[styles.title, { color: primary }]}>Login Form</Text>

        <View style={[styles.card, { backgroundColor: card, borderColor: border }]}>
          <Text style={[styles.label, { color: text }]}>Email</Text>
          <TextInput
            value={form.email}
            onChangeText={(t) => onChange("email", t)}
            placeholder="correo@ejemplo.com"
            placeholderTextColor="#8b949e"
            autoCapitalize="none"
            keyboardType="email-address"
            style={[
              styles.input,
              { backgroundColor: card, borderColor: errors.email ? danger : border, color: text },
            ]}
          />
          {errors.email ? (
            <Text style={[styles.error, { color: danger }]}>{errors.email}</Text>
          ) : null}

          <Text style={[styles.label, { color: text, marginTop: 10 }]}>Password</Text>
          <TextInput
            value={form.password}
            onChangeText={(t) => onChange("password", t)}
            placeholder="••••••"
            placeholderTextColor="#8b949e"
            secureTextEntry
            style={[
              styles.input,
              { backgroundColor: card, borderColor: errors.password ? danger : border, color: text },
            ]}
          />
          {errors.password ? (
            <Text style={[styles.error, { color: danger }]}>{errors.password}</Text>
          ) : null}

          <Pressable
            style={[
              styles.btn,
              { borderColor: primary, opacity: isOk ? 1 : 0.6 },
            ]}
            onPress={submit}
          >
            <Text style={[styles.btnText, { color: primary }]}>Entrar</Text>
          </Pressable>

          <Pressable style={[styles.btnGhost, { borderColor: border }]} onPress={clear}>
            <Text style={[styles.btnText, { color: text }]}>Limpiar</Text>
          </Pressable>

          <Text style={[styles.hint, { color: text }]}>
            Tip: escribe un email inválido y prueba "Entrar" para ver errores.
          </Text>
        </View>
      </View>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    justifyContent: "center",
  },
  title: {
    fontWeight: "900",
    fontSize: 22,
    marginBottom: 10,
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
  },
  btn: {
    marginTop: 14,
    backgroundColor: "#21262d",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 14,
    alignItems: "center",
  },
  btnGhost: {
    marginTop: 10,
    backgroundColor: "transparent",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 14,
    alignItems: "center",
  },
  btnText: {
    fontWeight: "900",
  },
  hint: {
    marginTop: 12,
    opacity: 0.85,
    lineHeight: 20,
  },
});