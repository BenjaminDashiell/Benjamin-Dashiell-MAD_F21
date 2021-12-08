package com.example.karaoke

data class Song(val songTitle: String, val songAuthor: String, val songID: String)

class songDB(){
    val songList: MutableList<Song> =  mutableListOf(
        Song("Paradise","Alan Walker","23811"),
        Song("Happier Than Ever","Billie Eilish","23810"),
        Song("Bad Habits","Ed Sheeran","23757"),
        Song("Bad Romance","Lady Gaga","22046"),
        Song("Bad Blood","Taylor Swift","22810"),
        Song("Visiting Hours","Ed Sheeran","23782"),
        Song("I Fall Apart","Post Malone","23761"),
        Song("Firework","Katy Perry","22163"),
        Song("Piano Man","Billy Joel","20010"),
        Song("Blinding Lights","The Weeknd","23501"),
        Song("NDA","Billie Eilish","23752"),
        Song("Lost Cause","Billie Eilish","23732"),
        Song("Therefore I Am","Billie Eilish","23632"),
        Song("My Future","Billie Eilish","23589"),
        Song("Everything I Wanted","Billie Eilish","23542"),
        Song("Copycat","Billie Eilish","23417"),
    )

    fun getDB(): MutableList<Song>{
        return songList
    }
}
