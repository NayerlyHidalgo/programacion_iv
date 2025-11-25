import 'package:flutter/material.dart';
import 'dart:math';
import '../models/palabra.dart';

class QuizPage extends StatefulWidget {
  final String categoria;

  const QuizPage({super.key, required this.categoria});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Palabra> palabras = [];
  int preguntaActual = 0;
  int puntuacion = 0;
  String? respuestaSeleccionada;
  bool mostrarRespuesta = false;
  bool quizTerminado = false;
  late List<String> opciones;

  @override
  void initState() {
    super.initState();
    _inicializarQuiz();
  }

  void _inicializarQuiz() {
    palabras = DataPalabras.getPalabrasPorCategoria(widget.categoria);
    palabras.shuffle(); // Mezclar las preguntas
    if (palabras.length > 5) {
      palabras = palabras.take(5).toList(); // Máximo 5 preguntas
    }
    _generarOpciones();
  }

  void _generarOpciones() {
    if (preguntaActual >= palabras.length) return;
    
    final palabraActual = palabras[preguntaActual];
    final todasPalabras = DataPalabras.palabras;
    
    // Crear lista de opciones incorrectas
    final opcionesIncorrectas = todasPalabras
        .where((p) => p.traduccion != palabraActual.traduccion)
        .map((p) => p.traduccion)
        .toList();
    
    opcionesIncorrectas.shuffle();
    
    // Tomar 3 opciones incorrectas
    opciones = opcionesIncorrectas.take(3).toList();
    opciones.add(palabraActual.traduccion); // Añadir respuesta correcta
    opciones.shuffle(); // Mezclar todas las opciones
  }

  void _seleccionarRespuesta(String respuesta) {
    if (mostrarRespuesta) return;
    
    setState(() {
      respuestaSeleccionada = respuesta;
      mostrarRespuesta = true;
      
      if (respuesta == palabras[preguntaActual].traduccion) {
        puntuacion++;
      }
    });
  }

  void _siguientePregunta() {
    setState(() {
      preguntaActual++;
      respuestaSeleccionada = null;
      mostrarRespuesta = false;
      
      if (preguntaActual >= palabras.length) {
        quizTerminado = true;
      } else {
        _generarOpciones();
      }
    });
  }

  void _reiniciarQuiz() {
    setState(() {
      preguntaActual = 0;
      puntuacion = 0;
      respuestaSeleccionada = null;
      mostrarRespuesta = false;
      quizTerminado = false;
      _inicializarQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quizTerminado) {
      return _buildResultadosPage();
    }

    final palabra = palabras[preguntaActual];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz: ${widget.categoria}'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Progreso
                LinearProgressIndicator(
                  value: (preguntaActual + 1) / palabras.length,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Contador de preguntas
                Text(
                  'Pregunta ${preguntaActual + 1} de ${palabras.length}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 40),
                
                // Pregunta
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        const Text(
                          '¿Cuál es la traducción de:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF6B7280),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          palabra.palabra,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          palabra.pronunciacion,
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Opciones
                Expanded(
                  child: ListView.builder(
                    itemCount: opciones.length,
                    itemBuilder: (context, index) {
                      final opcion = opciones[index];
                      final esCorrecta = opcion == palabra.traduccion;
                      final estaSeleccionada = opcion == respuestaSeleccionada;
                      
                      Color? colorBoton;
                      if (mostrarRespuesta) {
                        if (esCorrecta) {
                          colorBoton = Colors.green;
                        } else if (estaSeleccionada) {
                          colorBoton = Colors.red;
                        }
                      }
                      
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => _seleccionarRespuesta(opcion),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorBoton ?? Colors.white,
                              foregroundColor: colorBoton != null ? Colors.white : Colors.black87,
                              elevation: estaSeleccionada ? 8 : 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: estaSeleccionada 
                                      ? Theme.of(context).colorScheme.primary 
                                      : Colors.grey[300]!,
                                  width: estaSeleccionada ? 2 : 1,
                                ),
                              ),
                            ),
                            child: Text(
                              opcion,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // Botón siguiente
                if (mostrarRespuesta)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: _siguientePregunta,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        preguntaActual < palabras.length - 1 
                            ? 'Siguiente Pregunta' 
                            : 'Ver Resultados',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultadosPage() {
    final porcentaje = (puntuacion / palabras.length * 100).round();
    String mensaje;
    IconData icono;
    Color color;
    
    if (porcentaje >= 80) {
      mensaje = '¡Excelente trabajo!';
      icono = Icons.emoji_events;
      color = Colors.amber;
    } else if (porcentaje >= 60) {
      mensaje = '¡Bien hecho!';
      icono = Icons.thumb_up;
      color = Colors.green;
    } else {
      mensaje = '¡Sigue practicando!';
      icono = Icons.school;
      color = Colors.blue;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados del Quiz'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color.withOpacity(0.1),
              color.withOpacity(0.05),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Icon(
                          icono,
                          size: 80,
                          color: color,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          mensaje,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Tu puntuación:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '$puntuacion / ${palabras.length}',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '$porcentaje%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Botones de acción
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _reiniciarQuiz,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Repetir Quiz'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Volver a Aprender'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}