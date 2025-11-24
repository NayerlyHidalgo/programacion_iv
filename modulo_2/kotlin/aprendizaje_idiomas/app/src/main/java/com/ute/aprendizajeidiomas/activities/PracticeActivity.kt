package com.ute.aprendizajeidiomas.activities

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.cardview.widget.CardView
import com.google.android.material.appbar.MaterialToolbar
import com.ute.aprendizajeidiomas.R
import com.ute.aprendizajeidiomas.data.WordRepository
import com.ute.aprendizajeidiomas.models.Word

class PracticeActivity : AppCompatActivity() {

    private lateinit var cardWord: CardView
    private lateinit var tvWordFront: TextView
    private lateinit var tvWordBack: TextView
    private lateinit var btnNext: Button
    private lateinit var btnShowTranslation: Button
    
    private var words: List<Word> = emptyList()
    private var currentWordIndex = 0
    private var isShowingTranslation = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_practice)

        findViewById<MaterialToolbar>(R.id.toolbar)?.setNavigationOnClickListener { 
            finish() 
        }

        initializeViews()
        loadWords()
        showCurrentWord()
    }

    private fun initializeViews() {
        cardWord = findViewById(R.id.cardWord)
        tvWordFront = findViewById(R.id.tvWordFront)
        tvWordBack = findViewById(R.id.tvWordBack)
        btnNext = findViewById(R.id.btnNext)
        btnShowTranslation = findViewById(R.id.btnShowTranslation)

        cardWord.setOnClickListener {
            flipCard()
        }

        btnShowTranslation.setOnClickListener {
            flipCard()
        }

        btnNext.setOnClickListener {
            nextWord()
        }
    }

    private fun loadWords() {
        words = WordRepository.getRandomWords(20)
    }

    private fun showCurrentWord() {
        if (currentWordIndex < words.size) {
            val word = words[currentWordIndex]
            tvWordFront.text = "🇪🇸 ${word.spanish}"
            tvWordBack.text = "🇺🇸 ${word.english}\n🇫🇷 ${word.french}\n🔊 ${word.pronunciation}"
            
            isShowingTranslation = false
            updateCardDisplay()
        } else {
            // Restart practice
            currentWordIndex = 0
            words = WordRepository.getRandomWords(20)
            showCurrentWord()
        }
    }

    private fun flipCard() {
        isShowingTranslation = !isShowingTranslation
        updateCardDisplay()
    }

    private fun updateCardDisplay() {
        if (isShowingTranslation) {
            tvWordFront.visibility = android.view.View.GONE
            tvWordBack.visibility = android.view.View.VISIBLE
            btnShowTranslation.text = "Ocultar traducción"
        } else {
            tvWordFront.visibility = android.view.View.VISIBLE
            tvWordBack.visibility = android.view.View.GONE
            btnShowTranslation.text = "Mostrar traducción"
        }
    }

    private fun nextWord() {
        currentWordIndex++
        showCurrentWord()
    }
}