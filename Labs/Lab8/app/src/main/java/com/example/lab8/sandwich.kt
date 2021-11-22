package com.example.lab8

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.util.Log
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.example.lab8.databinding.ActivitySandwichBinding

class Sandwich : AppCompatActivity() {
    private lateinit var binding: ActivitySandwichBinding

    lateinit var sandwichShopTextView : TextView
    lateinit var feedbackText : EditText
    private var ShopName : String? = null
    private var ShopUrl : String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivitySandwichBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setSupportActionBar(binding.toolbar)

        //view
        sandwichShopTextView = findViewById(R.id.sandwichShopText)
        feedbackText = findViewById(R.id.feedbackText)

        //intent data
        ShopName = intent.getStringExtra("ShopName")
        ShopUrl = intent.getStringExtra("ShopURL")

        ShopName?.let { Log.i("shop received", it) }
        ShopUrl?.let { Log.i("url received", it) }

        ShopName?.let {sandwichShopTextView.text = "You should get sandwiches at $ShopName."}

        binding.fab.setOnClickListener { view -> loadWebSite() }
    }

    override fun onBackPressed() {
        val data = Intent()
        data.putExtra("feedback", feedbackText.text.toString())
        setResult(Activity.RESULT_OK, data) //must be set before super.onBackPressed()
        super.onBackPressed()
        finish()
    }

    private fun loadWebSite() {
        //create implict intent
        var newIntent = Intent()
        newIntent.action = Intent.ACTION_VIEW
        newIntent.data = ShopUrl?.let { Uri.parse(ShopUrl) }

        // Verify that the intent will resolve to an activity
        if (newIntent.resolveActivity(packageManager) != null) {
            // start activity
            startActivity(newIntent)
        } else {
            //message
            Log.i("error", "Website wasn't loaded")
        }
    }
}