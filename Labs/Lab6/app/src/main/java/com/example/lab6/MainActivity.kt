package com.example.lab6

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun displayMessage(view: View) {
        //anything comes from a view has to take a View as input
        val displayText = findViewById<TextView>(R.id.textMessage) //<type of what you want to access> (R.id.idNameOfWhatYouWant)
        val personName = findViewById<EditText>(R.id.userInput)
        val displayImage = findViewById<ImageView>(R.id.imageView)
        val name = personName.text
        displayText.text = "Happy Holidays to "+name+"!"
        displayImage.setImageResource(R.drawable.tree)
    }
}