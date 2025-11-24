package com.ute.aprendizajeidiomas.activities

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.google.android.material.appbar.MaterialToolbar
import com.ute.aprendizajeidiomas.R
import com.ute.aprendizajeidiomas.adapters.WordAdapter
import com.ute.aprendizajeidiomas.data.WordRepository
import com.ute.aprendizajeidiomas.models.WordCategory

class WordListActivity : AppCompatActivity() {

    private lateinit var recyclerView: RecyclerView
    private lateinit var wordAdapter: WordAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_word_list)

        val categoryName = intent.getStringExtra("category")
        val category = WordCategory.valueOf(categoryName ?: WordCategory.GREETINGS.name)
        
        findViewById<MaterialToolbar>(R.id.toolbar)?.apply {
            title = getCategoryDisplayName(category)
            setNavigationOnClickListener { finish() }
        }

        setupRecyclerView(category)
    }

    private fun setupRecyclerView(category: WordCategory) {
        recyclerView = findViewById(R.id.recyclerViewWords)
        recyclerView.layoutManager = LinearLayoutManager(this)
        
        val words = WordRepository.getWordsByCategory(category)
        wordAdapter = WordAdapter(words)
        recyclerView.adapter = wordAdapter
    }

    private fun getCategoryDisplayName(category: WordCategory): String {
        return when (category) {
            WordCategory.GREETINGS -> "Saludos"
            WordCategory.NUMBERS -> "Números"
            WordCategory.COLORS -> "Colores"
            WordCategory.ANIMALS -> "Animales"
            WordCategory.FOOD -> "Comida"
            WordCategory.FAMILY -> "Familia"
            WordCategory.TIME -> "Tiempo"
            WordCategory.TRAVEL -> "Viajes"
        }
    }
}