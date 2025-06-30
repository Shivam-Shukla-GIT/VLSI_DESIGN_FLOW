###         Shivam Shukla - 2022478 - Assignment 1 - Task 1 - TCL Script          ###

#First, I check that exactly one argument is given to the script
#Then program expects that one command-line argument - a comma-separated list of file names, so one have to enter the file names separated by commas.
#Example: tclsh tclans.tcl file1.v,file2.v,file3.v
if {$argc != 1} {
    puts "Usage: tclsh count_keywords.tcl <file_list>"
    exit 1
}

            #Next up, I get the list of filenames from the command-line argument
            #The first argument ($argv 0) should be a comma-separated list of filenames.
            #I split this string into a list of individual filenames.
set files [split [lindex $argv 0] ","]

            #Now I go through each file in the list
            #I loop through every filename in the `files` list to handle each file one by one.
foreach fname $files {
            #Trim any extra spaces and skip if the filename is empty
            #I remove any spaces before and after the filename.
            #If the filename is empty after trimming, I just skip it and move to the next file.
    set fname [string trim $fname]
    if {$fname eq ""} continue

            #Open the file for reading
            #I open the file named in `fname` to read its content.
    set fh [open $fname r]

            #Initialize counters for each keyword
            #I set up counters for each keyword and start them at zero.
            #These counters will count how many times each keyword shows up in the file.
    set al 0      ;# Counter for 'always'
    set ini 0     ;# Counter for 'initial'
    set bg 0      ;# Counter for 'begin'
    set en 0      ;# Counter for 'end'

            #Read each line of the file
            #I read each line from the file until I reach the end.
    while {[gets $fh line] != -1} {
            #Split the line at // to ignore comments
            #I split the line at `//` to remove comments.
            #Only the part before `//` is processed.
        set line [lindex [split $line "//"] 0]

                #Split the line into words and count keywords
                #I break the line into words based on spaces.
                #Each word is trimmed of extra spaces, and I skip empty words.
                #Then I count how many times each keyword appears.
        foreach word [split $line " "] {
                #Trim spaces from the word
            set word [string trim $word]
                #Skip empty words
            if {[string length $word] == 0} continue

                #Count the keywords
                #I use a `switch` to check each word and increase the correct counter if it matches a keyword.
            switch -- $word {
                "always" {incr al}
                "always@" {incr al}
                "initial" {incr ini}
                "begin" {incr bg}
                "end" {incr en}
            }
        }
    }

                #Close the file after processing
    close $fh

                #Print out the results for this file
                #I show the filename and how many times each keyword was found in it.
    puts "Filename: $fname"
    puts "Occurrences of 'always': $al"
    puts "Occurrences of 'initial': $ini"
    puts "Occurrences of 'begin': $bg"
    puts "Occurrences of 'end': $en"
    puts ""
}

###         ------THANK YOU------          ###