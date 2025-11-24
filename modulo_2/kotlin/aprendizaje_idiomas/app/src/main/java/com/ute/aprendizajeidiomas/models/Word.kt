package com.ute.aprendizajeidiomas.models

data class Word(
    val id: Int,
    val spanish: String,
    val english: String,
    val french: String,
    val pronunciation: String,
    val category: WordCategory,
    val difficulty: Difficulty
)

enum class WordCategory {
    GREETINGS,
    NUMBERS,
    COLORS,
    ANIMALS,
    FOOD,
    FAMILY,
    TIME,
    TRAVEL
}

enum class Difficulty {
    BEGINNER,
    INTERMEDIATE,
    ADVANCED
}