package com.ute.aprendizajeidiomas

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.cardview.widget.CardView
import com.ute.aprendizajeidiomas.activities.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        val tvWelcome = findViewById<TextView>(R.id.tvWelcome)
        val cardVocabulary = findViewById<CardView>(R.id.cardVocabulary)
        val cardQuiz = findViewById<CardView>(R.id.cardQuiz)
        val cardProgress = findViewById<CardView>(R.id.cardProgress)
        val cardPractice = findViewById<CardView>(R.id.cardPractice)

        tvWelcome.text = "¡Bienvenido a tu App de Idiomas!"

        cardVocabulary.setOnClickListener {
            startActivity(Intent(this, VocabularyActivity::class.java))
        }

        cardQuiz.setOnClickListener {
            startActivity(Intent(this, QuizActivity::class.java))
        }

        cardProgress.setOnClickListener {
            startActivity(Intent(this, ProgressActivity::class.java))
        }

        cardPractice.setOnClickListener {
            startActivity(Intent(this, PracticeActivity::class.java))
        }
    }
}