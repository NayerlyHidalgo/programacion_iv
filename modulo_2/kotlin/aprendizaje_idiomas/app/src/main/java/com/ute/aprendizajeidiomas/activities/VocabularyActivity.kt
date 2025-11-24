package com.ute.aprendizajeidiomas.activities

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.google.android.material.appbar.MaterialToolbar
import com.ute.aprendizajeidiomas.R
import com.ute.aprendizajeidiomas.adapters.CategoryAdapter
import com.ute.aprendizajeidiomas.models.WordCategory

class VocabularyActivity : AppCompatActivity() {

    private lateinit var recyclerView: RecyclerView
    private lateinit var categoryAdapter: CategoryAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_vocabulary)

        findViewById<MaterialToolbar>(R.id.toolbar)?.setNavigationOnClickListener { 
            finish() 
        }

        setupRecyclerView()
    }

    private fun setupRecyclerView() {
        recyclerView = findViewById(R.id.recyclerViewCategories)
        recyclerView.layoutManager = GridLayoutManager(this, 2)
        
        val categories = WordCategory.values().toList()
        categoryAdapter = CategoryAdapter(categories) { category ->
            // Navigate to word list for this category
            val intent = android.content.Intent(this, WordListActivity::class.java)
            intent.putExtra("category", category.name)
            startActivity(intent)
        }
        
        recyclerView.adapter = categoryAdapter
    }
}