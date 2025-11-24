package com.ute.aprendizajeidiomas.activities

import android.os.Bundle
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.appbar.MaterialToolbar
import com.ute.aprendizajeidiomas.R
import com.ute.aprendizajeidiomas.models.*
import com.ute.aprendizajeidiomas.utils.QuizGenerator

class QuizActivity : AppCompatActivity() {

    private lateinit var tvQuestion: TextView
    private lateinit var tvQuestionCounter: TextView
    private lateinit var layoutOptions: LinearLayout
    private lateinit var btnNext: Button
    
    private val quizGenerator = QuizGenerator()
    private var questions: List<QuizQuestion> = emptyList()
    private var currentQuestionIndex = 0
    private var score = 0
    private var selectedAnswer: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_quiz)

        findViewById<MaterialToolbar>(R.id.toolbar)?.setNavigationOnClickListener { 
            finish() 
        }

        initializeViews()
        generateQuiz()
        showCurrentQuestion()
    }

    private fun initializeViews() {
        tvQuestion = findViewById(R.id.tvQuestion)
        tvQuestionCounter = findViewById(R.id.tvQuestionCounter)
        layoutOptions = findViewById(R.id.layoutOptions)
        btnNext = findViewById(R.id.btnNext)

        btnNext.setOnClickListener {
            if (selectedAnswer != null) {
                checkAnswer()
                nextQuestion()
            } else {
                Toast.makeText(this, "Selecciona una respuesta", Toast.LENGTH_SHORT).show()
            }
        }
    }

    private fun generateQuiz() {
        questions = quizGenerator.generateQuiz(
            questionCount = 10,
            questionType = QuestionType.MULTIPLE_CHOICE
        )
    }

    private fun showCurrentQuestion() {
        if (currentQuestionIndex < questions.size) {
            val question = questions[currentQuestionIndex]
            tvQuestionCounter.text = "Pregunta ${currentQuestionIndex + 1} de ${questions.size}"
            
            when (question.questionType) {
                QuestionType.SPANISH_TO_ENGLISH -> {
                    tvQuestion.text = "¿Cómo se dice '${question.word.spanish}' en inglés?"
                }
                QuestionType.ENGLISH_TO_SPANISH -> {
                    tvQuestion.text = "¿Cómo se dice '${question.word.english}' en español?"
                }
                QuestionType.SPANISH_TO_FRENCH -> {
                    tvQuestion.text = "¿Cómo se dice '${question.word.spanish}' en francés?"
                }
                else -> {
                    tvQuestion.text = "¿Cuál es la traducción correcta de '${question.word.spanish}'?"
                }
            }

            showOptions(question.options)
            selectedAnswer = null
            btnNext.text = if (currentQuestionIndex == questions.size - 1) "Finalizar" else "Siguiente"
        } else {
            showResults()
        }
    }

    private fun showOptions(options: List<String>) {
        layoutOptions.removeAllViews()
        
        options.forEach { option ->
            val button = Button(this).apply {
                text = option
                setBackgroundResource(R.drawable.option_button_selector)
                setPadding(32, 24, 32, 24)
                setOnClickListener {
                    selectOption(option)
                    selectedAnswer = option
                }
            }
            
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
            ).apply {
                setMargins(0, 0, 0, 16)
            }
            
            layoutOptions.addView(button, params)
        }
    }

    private fun selectOption(selectedOption: String) {
        for (i in 0 until layoutOptions.childCount) {
            val button = layoutOptions.getChildAt(i) as Button
            button.isSelected = button.text == selectedOption
        }
    }

    private fun checkAnswer() {
        val question = questions[currentQuestionIndex]
        if (selectedAnswer == question.correctAnswer) {
            score++
            Toast.makeText(this, "¡Correcto! ✅", Toast.LENGTH_SHORT).show()
        } else {
            Toast.makeText(this, "Incorrecto ❌\nLa respuesta correcta es: ${question.correctAnswer}", Toast.LENGTH_LONG).show()
        }
    }

    private fun nextQuestion() {
        currentQuestionIndex++
        showCurrentQuestion()
    }

    private fun showResults() {
        val percentage = (score * 100) / questions.size
        val message = when {
            percentage >= 80 -> "¡Excelente! 🏆"
            percentage >= 60 -> "¡Bien hecho! 👍"
            percentage >= 40 -> "No está mal, sigue practicando 📚"
            else -> "Necesitas más práctica 💪"
        }
        
        Toast.makeText(this, 
            "Quiz completado!\n" +
            "Puntuación: $score/${questions.size} ($percentage%)\n" +
            message, 
            Toast.LENGTH_LONG).show()
        
        finish()
    }
}