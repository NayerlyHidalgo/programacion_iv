package com.ute.aprendizajeidiomas.models

data class Progress(
    val wordId: Int,
    val correctAnswers: Int,
    val totalAttempts: Int,
    val lastStudied: Long,
    val isLearned: Boolean
) {
    val accuracy: Float
        get() = if (totalAttempts > 0) correctAnswers.toFloat() / totalAttempts else 0f
}