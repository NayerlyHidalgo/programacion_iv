import 'package:flutter/material.dart';
import '../models/palabra.dart';

class PalabraCard extends StatefulWidget {
  final Palabra palabra;

  const PalabraCard({super.key, required this.palabra});

  @override
  State<PalabraCard> createState() => _PalabraCardState();
}

class _PalabraCardState extends State<PalabraCard> {
  bool _mostrarTraduccion = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              _getDifficultyColor().withValues(alpha: 0.1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Categoría y dificultad
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getDifficultyColor(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getDifficultyIcon(),
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.palabra.categoria,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Botón de sonido
                  IconButton(
                    onPressed: () {
                      // Aquí puedes implementar Text-to-Speech
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Pronunciando: ${widget.palabra.palabra}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    icon: const Icon(Icons.volume_up),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Palabra principal
              Text(
                widget.palabra.palabra,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Pronunciación
              Text(
                widget.palabra.pronunciacion,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Traducción (mostrar/ocultar)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: _mostrarTraduccion
                    ? Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Traducción:',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.palabra.traduccion,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              
              const SizedBox(height: 16),
              
              // Botón para mostrar/ocultar traducción
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _mostrarTraduccion = !_mostrarTraduccion;
                    });
                  },
                  icon: Icon(_mostrarTraduccion ? Icons.visibility_off : Icons.visibility),
                  label: Text(_mostrarTraduccion ? 'Ocultar traducción' : 'Ver traducción'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDifficultyColor() {
    switch (widget.palabra.dificultad) {
      case 1:
        return const Color(0xFF10B981); // Verde - Fácil
      case 2:
        return const Color(0xFFF59E0B); // Amarillo - Medio
      case 3:
        return const Color(0xFFEF4444); // Rojo - Difícil
      default:
        return const Color(0xFF6B7280); // Gris - Por defecto
    }
  }

  IconData _getDifficultyIcon() {
    switch (widget.palabra.dificultad) {
      case 1:
        return Icons.sentiment_very_satisfied;
      case 2:
        return Icons.sentiment_satisfied;
      case 3:
        return Icons.sentiment_dissatisfied;
      default:
        return Icons.sentiment_neutral;
    }
  }
}