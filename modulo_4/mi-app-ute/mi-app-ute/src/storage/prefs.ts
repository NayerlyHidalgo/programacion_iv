import AsyncStorage from "@react-native-async-storage/async-storage";

export type ThemeMode = "dark" | "light";

const KEY_THEME = "pref_theme_mode";

export async function getThemeMode(): Promise<ThemeMode> {
  const value = await AsyncStorage.getItem(KEY_THEME);
  return value === "light" ? "light" : "dark";
}

export async function setThemeMode(mode: ThemeMode): Promise<void> {
  await AsyncStorage.setItem(KEY_THEME, mode);
}