import { DefaultTheme } from 'react-native-paper';
import colors from './colors';

export const theme = {
  ...DefaultTheme,
  colors: {
    ...DefaultTheme.colors,
    primary: colors.primary,
    secondary: colors.secondary,
    accent: colors.accent,
    background: colors.bg,
    surface: colors.card,
    text: colors.text,
    onSurface: colors.textSecondary,
    disabled: colors.textMuted,
    placeholder: colors.textMuted,
    backdrop: 'rgba(0, 0, 0, 0.7)',
    success: colors.success,
    warning: colors.warning,
    danger: colors.danger,
    info: colors.info,
  },
  roundness: 16,
};

export { colors };
export { gradients } from './gradients';