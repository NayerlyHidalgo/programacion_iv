package com.ute.aprendizajeidiomas.activities

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.appbar.MaterialToolbar
import com.ute.aprendizajeidiomas.R
import com.ute.aprendizajeidiomas.data.WordRepository
import com.ute.aprendizajeidiomas.models.WordCategory

class ProgressActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_progress)

        findViewById<MaterialToolbar>(R.id.toolbar)?.setNavigationOnClickListener { 
            finish() 
        }

        showStatistics()
    }

    private fun showStatistics() {
        val totalWords = WordRepository.getAllWords().size
        val categoriesCount = WordCategory.values().size
        
        val tvTotalWords = findViewById<TextView>(R.id.tvTotalWords)
        val tvCategoriesCount = findViewById<TextView>(R.id.tvCategoriesCount)
        val tvProgressMessage = findViewById<TextView>(R.id.tvProgressMessage)
        
        tvTotalWords.text = "Palabras totales: $totalWords"
        tvCategoriesCount.text = "Categorías disponibles: $categoriesCount"
        tvProgressMessage.text = "¡Sigue practicando para mejorar tu vocabulario!\n\n" +
                "📚 Estudia las palabras en la sección Vocabulario\n" +
                "🧠 Pon a prueba tus conocimientos con el Quiz\n" +
                "✍️ Practica con las flashcards en Práctica"
    }
}