package com.ute.aprendizajeidiomas.utils

import com.ute.aprendizajeidiomas.data.WordRepository
import com.ute.aprendizajeidiomas.models.*

class QuizGenerator {
    
    fun generateQuiz(
        category: WordCategory? = null,
        difficulty: Difficulty? = null,
        questionCount: Int = 10,
        questionType: QuestionType? = null
    ): List<QuizQuestion> {
        
        val words = when {
            category != null && difficulty != null -> {
                WordRepository.getWordsByCategory(category)
                    .filter { it.difficulty == difficulty }
            }
            category != null -> WordRepository.getWordsByCategory(category)
            difficulty != null -> WordRepository.getWordsByDifficulty(difficulty)
            else -> WordRepository.getAllWords()
        }.shuffled().take(questionCount)
        
        return words.map { word ->
            val qType = questionType ?: QuestionType.values().random()
            generateQuestion(word, qType)
        }
    }
    
    private fun generateQuestion(word: Word, questionType: QuestionType): QuizQuestion {
        return when (questionType) {
            QuestionType.SPANISH_TO_ENGLISH -> {
                val options = generateOptions(word.english, getRandomEnglishWords())
                QuizQuestion(word, questionType, options, word.english)
            }
            QuestionType.ENGLISH_TO_SPANISH -> {
                val options = generateOptions(word.spanish, getRandomSpanishWords())
                QuizQuestion(word, questionType, options, word.spanish)
            }
            QuestionType.SPANISH_TO_FRENCH -> {
                val options = generateOptions(word.french, getRandomFrenchWords())
                QuizQuestion(word, questionType, options, word.french)
            }
            QuestionType.FRENCH_TO_SPANISH -> {
                val options = generateOptions(word.spanish, getRandomSpanishWords())
                QuizQuestion(word, questionType, options, word.spanish)
            }
            QuestionType.MULTIPLE_CHOICE -> {
                val options = generateOptions(word.english, getRandomEnglishWords())
                QuizQuestion(word, questionType, options, word.english)
            }
            QuestionType.FILL_BLANK -> {
                QuizQuestion(word, questionType, emptyList(), word.english)
            }
        }
    }
    
    private fun generateOptions(correctAnswer: String, wrongAnswers: List<String>): List<String> {
        val options = mutableListOf(correctAnswer)
        options.addAll(wrongAnswers.shuffled().take(3))
        return options.shuffled()
    }
    
    private fun getRandomEnglishWords(): List<String> {
        return WordRepository.getAllWords().map { it.english }.shuffled()
    }
    
    private fun getRandomSpanishWords(): List<String> {
        return WordRepository.getAllWords().map { it.spanish }.shuffled()
    }
    
    private fun getRandomFrenchWords(): List<String> {
        return WordRepository.getAllWords().map { it.french }.shuffled()
    }
}