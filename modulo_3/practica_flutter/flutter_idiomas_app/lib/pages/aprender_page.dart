import 'package:flutter/material.dart';
import '../models/palabra.dart';
import '../widgets/palabra_card.dart';
import 'quiz_page.dart';

class AprenderPage extends StatelessWidget {
  final String categoria;

  const AprenderPage({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    final palabras = DataPalabras.getPalabrasPorCategoria(categoria);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoria),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(categoria: categoria),
                ),
              );
            },
            icon: const Icon(Icons.quiz),
            tooltip: 'Hacer quiz',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
            ],
          ),
        ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Aprende $categoria',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${palabras.length} palabras para aprender',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            
            // Lista de palabras
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: palabras.length,
                itemBuilder: (context, index) {
                  return PalabraCard(palabra: palabras[index]);
                },
              ),
            ),
            
            // Botón de quiz
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage(categoria: categoria),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz),
                  label: const Text('Hacer Quiz'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}