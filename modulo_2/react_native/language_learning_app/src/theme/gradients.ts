export const gradients = {
  primary: {
    colors: ["#0a0025", "#130b3a", "#7c3aed"] as const,
    start: { x: 0, y: 0 },
    end: { x: 1, y: 1 }
  },
  secondary: {
    colors: ["#7c3aed", "#a855f7", "#f59e0b"] as const,
    start: { x: 0, y: 0 },
    end: { x: 1, y: 0 }
  },
  learning: {
    colors: ["#4f46e5", "#7c3aed", "#a855f7"] as const,
    start: { x: 0, y: 0 },
    end: { x: 0, y: 1 }
  },
  card: {
    colors: ["rgba(124,58,237,0.3)", "rgba(168,85,247,0.2)", "rgba(245,158,11,0.1)"] as const,
    start: { x: 0, y: 0 },
    end: { x: 1, y: 1 }
  }
};

export default gradients;