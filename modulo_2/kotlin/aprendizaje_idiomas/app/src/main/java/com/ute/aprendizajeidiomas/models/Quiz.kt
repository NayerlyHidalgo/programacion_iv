package com.ute.aprendizajeidiomas.models

data class QuizQuestion(
    val word: Word,
    val questionType: QuestionType,
    val options: List<String>,
    val correctAnswer: String
)

enum class QuestionType {
    SPANISH_TO_ENGLISH,
    ENGLISH_TO_SPANISH,
    SPANISH_TO_FRENCH,
    FRENCH_TO_SPANISH,
    MULTIPLE_CHOICE,
    FILL_BLANK
}

data class QuizResult(
    val totalQuestions: Int,
    val correctAnswers: Int,
    val timeSpent: Long,
    val category: WordCategory?
) {
    val score: Float
        get() = (correctAnswers.toFloat() / totalQuestions) * 100
}