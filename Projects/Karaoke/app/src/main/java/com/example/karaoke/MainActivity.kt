package com.example.karaoke

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Parcelable
import android.view.View
import android.widget.*

class MainActivity : AppCompatActivity(){
    //for karaoke data
    private val karaokeDB = songDB() //access our karaoke list
    private var karaokeArray: Array<Song> = karaokeDB.getDB().toTypedArray()
    //private lateinit var adapter: ArrayAdapter<Song>
    private lateinit var resultsAdapter: ArrayAdapter<String>
    private lateinit var queueAdapter: ArrayAdapter<String>
    private lateinit var queueAdapter2: ArrayAdapter<String>

    //for the views
    private lateinit var resultsList: ListView
    private lateinit var queueList: ListView
    private lateinit var songInput: TextView
    private lateinit var switchListViewType: Switch
    lateinit var saveResults: Parcelable
    lateinit var saveQueue: Parcelable

    //Mutable Lists
    private var displayResults: MutableList<String> = mutableListOf()
    private var displayQueue: MutableList<String> = mutableListOf()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //init the lateinits
        resultsList = findViewById(R.id.resultsList)
        queueList = findViewById(R.id.queueList)
        songInput = findViewById(R.id.songInput)
        switchListViewType = findViewById(R.id.switchListViewType)
        saveResults = resultsList.onSaveInstanceState()!!
        saveQueue = queueList.onSaveInstanceState()!!
    }

    fun findSong(view: View){
        displayResults.clear() //to refresh it between searches

        val checkInput = (songInput.text).toString()
        for (song in karaokeArray){
            //check if user's input is a song title, author, or ID
            if(song.songTitle == checkInput || song.songAuthor == checkInput || song.songID == checkInput){
                //add the song to the displayResults as a checkbox
                    val passString = "${song.songTitle} by ${song.songAuthor} \nID: ${song.songID}"
                    displayResults.add(passString)
                    updateResults(view)
            }
        }
    }

    private fun updateResults(view: View){
        //show entries of displayResults to the user

        resultsAdapter = ArrayAdapter<String>(this, android.R.layout.simple_list_item_multiple_choice, displayResults)
        resultsList.adapter = resultsAdapter
    }

    fun addToQueue(view: View){
        //for loop through resultsList
        //var testOutput = ""
        for(i in 0..resultsList.getCount()){
            if(resultsList.isItemChecked(i)){
                //If any checkbox is selected
                //testOutput += resultsList.getItemAtPosition(i).toString()
                displayQueue.add(resultsList.getItemAtPosition(i).toString())
            }
        }
        //Toast.makeText(this,testOutput,Toast.LENGTH_SHORT).show()
        updateQueue(view)
    }

    private fun updateQueue(view: View){
        //show entries of displayQueue to the user as text
        queueAdapter = ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, displayQueue)
        queueList.adapter = queueAdapter
    }

    fun selectFromQueue(view: View){
        //show entries of displayQueue (checkboxes)
        //Solution is not being able to select the checkboxes (set choiceMode to Multiple Choice. None/empty makes it unable to select from)
        if(switchListViewType.isChecked){
            queueAdapter2 = ArrayAdapter<String>(this, android.R.layout.simple_list_item_multiple_choice, displayQueue)
            queueList.adapter = queueAdapter2
            //Toast.makeText(this,"switch is on",Toast.LENGTH_SHORT).show()
        }
        else{
            updateQueue(view)
            //Toast.makeText(this,"switch is off",Toast.LENGTH_SHORT).show()
        }
        //Toast.makeText(this,"switch is pressed",Toast.LENGTH_SHORT).show()
    }

    fun removeFromQueue(view: View){
        //for loop through displayQueue
        for(i in 0..queueList.getCount()){
            if(queueList.isItemChecked(i)){
                //If any checkbox is selected
                //Toast.makeText(this, queueList.getItemAtPosition(i).toString(),Toast.LENGTH_SHORT).show()
                displayQueue.remove(queueList.getItemAtPosition(i).toString())
            }
        }
        selectFromQueue(view)
    }

    //save state for rotation
    //only need to save the ListViews
    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putParcelable("saveState1", resultsList.onSaveInstanceState())
        outState.putParcelable("saveState2", queueList.onSaveInstanceState())
        super.onSaveInstanceState(outState)
    }
    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        val state1 = savedInstanceState.getParcelable<Parcelable>("saveState1")
        val state2 = savedInstanceState.getParcelable<Parcelable>("saveState2")
        resultsList.onRestoreInstanceState(state1);
        queueList.onRestoreInstanceState(state2);
    }
}