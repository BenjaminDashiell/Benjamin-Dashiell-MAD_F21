package com.example.lab8

import android.app.Activity
import android.content.Intent
import android.util.Log
import android.view.View
import android.widget.*
import androidx.constraintlayout.widget.ConstraintLayout
import com.example.lab8.R
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.switchmaterial.SwitchMaterial
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    // lateinit views
    lateinit var messageTextView : TextView
    lateinit var layoutRoot : ConstraintLayout
    lateinit var radioGroup : RadioGroup
    lateinit var checkBox1 : CheckBox
    lateinit var checkBox2 : CheckBox
    lateinit var checkBox3 : CheckBox
    lateinit var spinner : Spinner
    lateinit var switch : SwitchMaterial
    lateinit var locationButton : Button
    lateinit var reviewTextView : TextView
    var fillingId = -1
    private var mySandwichShop = SandwichShop();
    private var selectedLocation = 0
    private val REQUEST_CODE = 1
    lateinit var saveText: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //init views after onCreate
        messageTextView = findViewById(R.id.messageTextView)
        layoutRoot = findViewById(R.id.root_layout)
        radioGroup = findViewById(R.id.radioGroup)
        checkBox1 = findViewById(R.id.checkBox1)
        checkBox2 = findViewById(R.id.checkBox2)
        checkBox3 = findViewById(R.id.checkBox3)
        spinner = findViewById(R.id.spinner)
        switch = findViewById(R.id.switch1)
        locationButton = findViewById(R.id.locationButton)
        reviewTextView = findViewById(R.id.reviewTextView)

        //event listener for intent
        locationButton.setOnClickListener {
            selectedLocation = spinner.selectedItemPosition
            mySandwichShop.suggestShop(selectedLocation)
            Log.i("shop suggested", mySandwichShop.name);
            Log.i("url suggested", mySandwichShop.url);

            //create Explicit Intent
            val intent = Intent(this, Sandwich::class.java)
            intent.putExtra("ShopName", mySandwichShop.name)
            intent.putExtra("ShopURL", mySandwichShop.url)

            startActivityForResult(intent, REQUEST_CODE)
        }
    }

    fun createSandwich(view: View){
        var filling: CharSequence = ""
        var toppinglist = ""
        var toppingChoice = ""
        fillingId = radioGroup.checkedRadioButtonId    //value of the radio button selected

        if(fillingId == -1){
            //snackbar
            val fillingSnackBar = Snackbar.make(layoutRoot, "Please select the main filling", Snackbar.LENGTH_SHORT) //view,message,duration
            fillingSnackBar.show()
        }else{
            filling = findViewById<RadioButton>(fillingId).text
            if(checkBox1.isChecked){
                toppingChoice = checkBox1.text.toString()
                toppinglist += toppingChoice + ", "
            }
            if(checkBox2.isChecked){
                toppingChoice = checkBox2.text.toString()
                toppinglist += toppingChoice + ", "
            }
            if(checkBox3.isChecked){
                toppingChoice = checkBox3.text.toString()
                toppinglist += toppingChoice + ", "
            }
            if(toppinglist.isNotEmpty()){
                toppinglist = "with "+ toppinglist
            }

            //location
            val location = " at " + spinner.selectedItem

            //Switch
            if (switch.isChecked){
                filling = switch.text.toString() + " $filling"
            }

            //final text message
            messageTextView.text = "You ordered a $filling sandwich $toppinglist$location"
            //save
            updateUI()
        }
    }

    //for intent
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if((requestCode == REQUEST_CODE) && (resultCode == Activity.RESULT_OK)) {
            reviewTextView.setText(data?.let{data.getStringExtra("feedback")})
        }
    }

    //for save states
    private fun updateUI(){
        //TextView
        saveText = messageTextView
    }
    override fun onSaveInstanceState(outState: Bundle) {
        updateUI() //kept crashing when rotate and no options selected yet, so set message=saveText even if there is no displayed text
        super.onSaveInstanceState(outState)
        outState.putString("message", saveText.text as String?)
        super.onSaveInstanceState(outState)
    }
    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        messageTextView.text = savedInstanceState.getString("message", "")
        updateUI()
    }
}