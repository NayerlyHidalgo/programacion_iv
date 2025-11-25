class Palabra {
  final String palabra;
  final String traduccion;
  final String categoria;
  final String pronunciacion;
  final String? audio;
  final int dificultad; // 1 = fácil, 2 = medio, 3 = difícil
  
  const Palabra({
    required this.palabra,
    required this.traduccion,
    required this.categoria,
    required this.pronunciacion,
    this.audio,
    this.dificultad = 1,
  });
}

// Datos de ejemplo
class DataPalabras {
  static List<Palabra> palabras = [
    // Saludos
    const Palabra(
      palabra: "Hello",
      traduccion: "Hola",
      categoria: "Saludos",
      pronunciacion: "/həˈloʊ/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Good morning",
      traduccion: "Buenos días",
      categoria: "Saludos",
      pronunciacion: "/ɡʊd ˈmɔːrnɪŋ/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Good evening",
      traduccion: "Buenas tardes/noches",
      categoria: "Saludos",
      pronunciacion: "/ɡʊd ˈiːvnɪŋ/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "How are you?",
      traduccion: "¿Cómo estás?",
      categoria: "Saludos",
      pronunciacion: "/haʊ ɑr ju/",
      dificultad: 2,
    ),
    
    // Números
    const Palabra(
      palabra: "One",
      traduccion: "Uno",
      categoria: "Números",
      pronunciacion: "/wʌn/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Two",
      traduccion: "Dos",
      categoria: "Números",
      pronunciacion: "/tu/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Three",
      traduccion: "Tres",
      categoria: "Números",
      pronunciacion: "/θri/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Ten",
      traduccion: "Diez",
      categoria: "Números",
      pronunciacion: "/tɛn/",
      dificultad: 1,
    ),
    
    // Colores
    const Palabra(
      palabra: "Red",
      traduccion: "Rojo",
      categoria: "Colores",
      pronunciacion: "/rɛd/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Blue",
      traduccion: "Azul",
      categoria: "Colores",
      pronunciacion: "/blu/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Green",
      traduccion: "Verde",
      categoria: "Colores",
      pronunciacion: "/ɡrin/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Yellow",
      traduccion: "Amarillo",
      categoria: "Colores",
      pronunciacion: "/ˈjɛloʊ/",
      dificultad: 1,
    ),
    
    // Familia
    const Palabra(
      palabra: "Mother",
      traduccion: "Madre",
      categoria: "Familia",
      pronunciacion: "/ˈmʌðər/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Father",
      traduccion: "Padre",
      categoria: "Familia",
      pronunciacion: "/ˈfɑðər/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Brother",
      traduccion: "Hermano",
      categoria: "Familia",
      pronunciacion: "/ˈbrʌðər/",
      dificultad: 1,
    ),
    const Palabra(
      palabra: "Sister",
      traduccion: "Hermana",
      categoria: "Familia",
      pronunciacion: "/ˈsɪstər/",
      dificultad: 1,
    ),
  ];
  
  static List<String> categorias = [
    "Saludos",
    "Números", 
    "Colores",
    "Familia"
  ];
  
  static List<Palabra> getPalabrasPorCategoria(String categoria) {
    return palabras.where((p) => p.categoria == categoria).toList();
  }
}