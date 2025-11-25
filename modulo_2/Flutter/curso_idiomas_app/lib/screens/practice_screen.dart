import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../models/word.dart';
import 'dart:math';

class PracticeScreen extends StatefulWidget {
  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int currentWordIndex = 0;
  bool showAnswer = false;
  int score = 0;
  String selectedMode = 'Tarjetas';
  List<String> modes = ['Tarjetas', 'Opción Múltiple', 'Escritura'];

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        final wordsToReview = languageProvider.wordsToReview;
        
        return Scaffold(
          body: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(16),
                color: Color(0xFF2196F3),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Práctica',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Puntos: $score',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      // Selector de modo
                      Container(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: modes.length,
                          itemBuilder: (context, index) {
                            final mode = modes[index];
                            final isSelected = selectedMode == mode;
                            
                            return Container(
                              margin: EdgeInsets.only(right: 8),
                              child: FilterChip(
                                label: Text(
                                  mode,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Color(0xFF2196F3),
                                    fontSize: 12,
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: (selected) {
                                  setState(() {
                                    selectedMode = mode;
                                    currentWordIndex = 0;
                                    showAnswer = false;
                                  });
                                },
                                backgroundColor: Colors.white,
                                selectedColor: Color(0xFF1976D2),
                                checkmarkColor: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Contenido
              Expanded(
                child: wordsToReview.isEmpty
                    ? _buildNoWordsView()
                    : _buildPracticeContent(wordsToReview, languageProvider),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNoWordsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            size: 80,
            color: Colors.green,
          ),
          SizedBox(height: 16),
          Text(
            '¡Excelente trabajo!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'No tienes palabras pendientes de repaso',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeContent(List<Word> words, LanguageProvider provider) {
    if (currentWordIndex >= words.length) {
      return _buildCompletionView();
    }

    final currentWord = words[currentWordIndex];

    return Column(
      children: [
        // Progreso
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (currentWordIndex + 1) / words.length,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
              ),
              SizedBox(height: 8),
              Text(
                '${currentWordIndex + 1} / ${words.length}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        
        // Contenido de práctica
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: _buildModeContent(currentWord, provider),
          ),
        ),
      ],
    );
  }

  Widget _buildModeContent(Word word, LanguageProvider provider) {
    switch (selectedMode) {
      case 'Tarjetas':
        return _buildFlashcardMode(word, provider);
      case 'Opción Múltiple':
        return _buildMultipleChoiceMode(word, provider);
      case 'Escritura':
        return _buildTypingMode(word, provider);
      default:
        return _buildFlashcardMode(word, provider);
    }
  }

  Widget _buildFlashcardMode(Word word, LanguageProvider provider) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (!showAnswer) {
                setState(() {
                  showAnswer = true;
                });
              }
            },
            child: Card(
              elevation: 4,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!showAnswer) ...[
                      Text(
                        word.spanish,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32),
                      Text(
                        'Toca para ver la traducción',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ] else ...[
                      Text(
                        word.english,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2196F3),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (word.pronunciation.isNotEmpty) ...[
                        SizedBox(height: 16),
                        Text(
                          '/${word.pronunciation}/',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                      if (word.exampleSentence.isNotEmpty) ...[
                        SizedBox(height: 24),
                        Text(
                          '"${word.exampleSentence}"',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        
        if (showAnswer) ...[
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _handleAnswer(false, provider),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.close),
                      SizedBox(width: 8),
                      Text('Difícil'),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _handleAnswer(true, provider),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      SizedBox(width: 8),
                      Text('Fácil'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildMultipleChoiceMode(Word word, LanguageProvider provider) {
    // Generar opciones
    final allWords = provider.allWords;
    final incorrectOptions = allWords
        .where((w) => w.id != word.id && w.english != word.english)
        .map((w) => w.english)
        .toList();
    
    incorrectOptions.shuffle();
    final options = [word.english, ...incorrectOptions.take(3)].toList();
    options.shuffle();

    return Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  '¿Cómo se dice en inglés?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  word.spanish,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        
        SizedBox(height: 24),
        
        Expanded(
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              final isCorrect = option == word.english;
              
              return Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Card(
                  child: InkWell(
                    onTap: () => _handleMultipleChoiceAnswer(isCorrect, provider),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        option,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTypingMode(Word word, LanguageProvider provider) {
    final controller = TextEditingController();
    
    return Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'Escribe la traducción',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  word.spanish,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (word.exampleSentence.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Text(
                    '"${word.exampleSentence}"',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
        
        SizedBox(height: 24),
        
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Tu respuesta',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                final isCorrect = controller.text.trim().toLowerCase() == 
                    word.english.toLowerCase();
                _handleTypingAnswer(isCorrect, word.english, provider);
              },
            ),
          ),
          onSubmitted: (value) {
            final isCorrect = value.trim().toLowerCase() == 
                word.english.toLowerCase();
            _handleTypingAnswer(isCorrect, word.english, provider);
          },
        ),
      ],
    );
  }

  Widget _buildCompletionView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_events,
            size: 80,
            color: Colors.amber,
          ),
          SizedBox(height: 16),
          Text(
            '¡Sesión Completada!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.amber[700],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Puntuación final: $score',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentWordIndex = 0;
                score = 0;
                showAnswer = false;
              });
            },
            child: Text('Practicar de Nuevo'),
          ),
        ],
      ),
    );
  }

  void _handleAnswer(bool isCorrect, LanguageProvider provider) {
    if (isCorrect) {
      setState(() {
        score += 10;
      });
    }
    
    _nextWord();
  }

  void _handleMultipleChoiceAnswer(bool isCorrect, LanguageProvider provider) {
    if (isCorrect) {
      setState(() {
        score += 15;
      });
    }
    
    // Mostrar feedback visual
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? '¡Correcto!' : 'Incorrecto'),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        duration: Duration(seconds: 1),
      ),
    );
    
    Future.delayed(Duration(milliseconds: 1500), () {
      _nextWord();
    });
  }

  void _handleTypingAnswer(bool isCorrect, String correctAnswer, LanguageProvider provider) {
    if (isCorrect) {
      setState(() {
        score += 20;
      });
    }
    
    // Mostrar feedback
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isCorrect ? '¡Correcto!' : 'Respuesta Correcta'),
        content: Text(isCorrect ? '¡Bien hecho!' : 'La respuesta correcta es: $correctAnswer'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _nextWord();
            },
            child: Text('Continuar'),
          ),
        ],
      ),
    );
  }

  void _nextWord() {
    setState(() {
      currentWordIndex++;
      showAnswer = false;
    });
  }
}