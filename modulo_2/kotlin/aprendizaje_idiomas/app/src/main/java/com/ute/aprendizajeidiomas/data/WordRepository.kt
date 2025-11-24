package com.ute.aprendizajeidiomas.data

import com.ute.aprendizajeidiomas.models.*

object WordRepository {
    
    private val words = listOf(
        // Greetings
        Word(1, "Hola", "Hello", "Bonjour", "OH-lah", WordCategory.GREETINGS, Difficulty.BEGINNER),
        Word(2, "Adiós", "Goodbye", "Au revoir", "ah-DYOHS", WordCategory.GREETINGS, Difficulty.BEGINNER),
        Word(3, "Gracias", "Thank you", "Merci", "GRAH-thyahs", WordCategory.GREETINGS, Difficulty.BEGINNER),
        Word(4, "Por favor", "Please", "S'il vous plaît", "por fah-BOHR", WordCategory.GREETINGS, Difficulty.BEGINNER),
        Word(5, "De nada", "You're welcome", "De rien", "deh NAH-dah", WordCategory.GREETINGS, Difficulty.BEGINNER),
        
        // Numbers
        Word(6, "Uno", "One", "Un", "OO-noh", WordCategory.NUMBERS, Difficulty.BEGINNER),
        Word(7, "Dos", "Two", "Deux", "dohs", WordCategory.NUMBERS, Difficulty.BEGINNER),
        Word(8, "Tres", "Three", "Trois", "trehs", WordCategory.NUMBERS, Difficulty.BEGINNER),
        Word(9, "Cuatro", "Four", "Quatre", "KWAH-troh", WordCategory.NUMBERS, Difficulty.BEGINNER),
        Word(10, "Cinco", "Five", "Cinq", "SEEN-koh", WordCategory.NUMBERS, Difficulty.BEGINNER),
        
        // Colors
        Word(11, "Rojo", "Red", "Rouge", "ROH-hoh", WordCategory.COLORS, Difficulty.BEGINNER),
        Word(12, "Azul", "Blue", "Bleu", "ah-SOOL", WordCategory.COLORS, Difficulty.BEGINNER),
        Word(13, "Verde", "Green", "Vert", "BEHR-deh", WordCategory.COLORS, Difficulty.BEGINNER),
        Word(14, "Amarillo", "Yellow", "Jaune", "ah-mah-REE-yoh", WordCategory.COLORS, Difficulty.BEGINNER),
        Word(15, "Negro", "Black", "Noir", "NEH-groh", WordCategory.COLORS, Difficulty.BEGINNER),
        
        // Animals
        Word(16, "Perro", "Dog", "Chien", "PEH-rroh", WordCategory.ANIMALS, Difficulty.BEGINNER),
        Word(17, "Gato", "Cat", "Chat", "GAH-toh", WordCategory.ANIMALS, Difficulty.BEGINNER),
        Word(18, "Pájaro", "Bird", "Oiseau", "PAH-hah-roh", WordCategory.ANIMALS, Difficulty.INTERMEDIATE),
        Word(19, "Pez", "Fish", "Poisson", "pehs", WordCategory.ANIMALS, Difficulty.BEGINNER),
        Word(20, "Caballo", "Horse", "Cheval", "kah-BAH-yoh", WordCategory.ANIMALS, Difficulty.INTERMEDIATE),
        
        // Food
        Word(21, "Pan", "Bread", "Pain", "pahn", WordCategory.FOOD, Difficulty.BEGINNER),
        Word(22, "Agua", "Water", "Eau", "AH-gwah", WordCategory.FOOD, Difficulty.BEGINNER),
        Word(23, "Manzana", "Apple", "Pomme", "mahn-SAH-nah", WordCategory.FOOD, Difficulty.BEGINNER),
        Word(24, "Leche", "Milk", "Lait", "LEH-cheh", WordCategory.FOOD, Difficulty.BEGINNER),
        Word(25, "Carne", "Meat", "Viande", "KAHR-neh", WordCategory.FOOD, Difficulty.BEGINNER),
        
        // Family
        Word(26, "Madre", "Mother", "Mère", "MAH-dreh", WordCategory.FAMILY, Difficulty.BEGINNER),
        Word(27, "Padre", "Father", "Père", "PAH-dreh", WordCategory.FAMILY, Difficulty.BEGINNER),
        Word(28, "Hermano", "Brother", "Frère", "ehr-MAH-noh", WordCategory.FAMILY, Difficulty.BEGINNER),
        Word(29, "Hermana", "Sister", "Sœur", "ehr-MAH-nah", WordCategory.FAMILY, Difficulty.BEGINNER),
        Word(30, "Hijo", "Son", "Fils", "EE-hoh", WordCategory.FAMILY, Difficulty.BEGINNER),
        
        // Time
        Word(31, "Hoy", "Today", "Aujourd'hui", "oy", WordCategory.TIME, Difficulty.BEGINNER),
        Word(32, "Mañana", "Tomorrow", "Demain", "mah-NYAH-nah", WordCategory.TIME, Difficulty.BEGINNER),
        Word(33, "Ayer", "Yesterday", "Hier", "ah-YEHR", WordCategory.TIME, Difficulty.BEGINNER),
        Word(34, "Semana", "Week", "Semaine", "seh-MAH-nah", WordCategory.TIME, Difficulty.INTERMEDIATE),
        Word(35, "Año", "Year", "Année", "AH-nyoh", WordCategory.TIME, Difficulty.BEGINNER),
        
        // Travel
        Word(36, "Hotel", "Hotel", "Hôtel", "oh-TEHL", WordCategory.TRAVEL, Difficulty.BEGINNER),
        Word(37, "Aeropuerto", "Airport", "Aéroport", "ah-eh-roh-PWEHR-toh", WordCategory.TRAVEL, Difficulty.INTERMEDIATE),
        Word(38, "Estación", "Station", "Gare", "ehs-tah-SYOHN", WordCategory.TRAVEL, Difficulty.INTERMEDIATE),
        Word(39, "Taxi", "Taxi", "Taxi", "TAHK-see", WordCategory.TRAVEL, Difficulty.BEGINNER),
        Word(40, "Maleta", "Suitcase", "Valise", "mah-LEH-tah", WordCategory.TRAVEL, Difficulty.INTERMEDIATE)
    )
    
    fun getAllWords(): List<Word> = words
    
    fun getWordsByCategory(category: WordCategory): List<Word> {
        return words.filter { it.category == category }
    }
    
    fun getWordsByDifficulty(difficulty: Difficulty): List<Word> {
        return words.filter { it.difficulty == difficulty }
    }
    
    fun getRandomWords(count: Int): List<Word> {
        return words.shuffled().take(count)
    }
    
    fun getWordById(id: Int): Word? {
        return words.find { it.id == id }
    }
    
    fun searchWords(query: String): List<Word> {
        val lowerQuery = query.lowercase()
        return words.filter { 
            it.spanish.lowercase().contains(lowerQuery) ||
            it.english.lowercase().contains(lowerQuery) ||
            it.french.lowercase().contains(lowerQuery)
        }
    }
}