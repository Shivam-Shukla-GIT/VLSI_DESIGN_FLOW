###         Shivam Shukla - 2022478 - Assignment 1 - Task 2 - Shell Script          ###

#First, I check that exactly one argument is given to the script
#Then program expects that one command-line argument - a comma-separated list of file names, so one have to enter the file names separated by commas.
#Example: ./shellans.sh file1.v,file2.v,file3.v
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_list>"
    exit 1
fi

#It then gets comma-separated file list from command line
#$1 is the first argument provided to the program, which should be a comma-separated list of file names.
file_list="$1"

#Then I converted the comma-separated list into an array
#here IFS is set to a comma, then the string file_list is split into an array of filenames.
#This `read -r -a files` actually reads the list into the `files` array.
IFS=',' read -r -a files <<< "$file_list"

#Here, I made a function to count the occurrences of a keyword in a given file
count_keyword() {
    local file="$1"         #This helps file to process
    local keyword="$2"      #This helps keyword whose occurrences are to be counted
    #then to remove comments and trim words, then count exact matches
    awk -F'//' '{print $1}' "$file" | \
    tr -s '[:space:]' '\n' | \
    grep -w "^$keyword$" | \
    wc -l                
    #I used awk to split lines on '//' and keep only part before '//' - ignore comments.
    #then I replace all whitespace with newlines so each word is treated as being on a separate line.
    #then I used word boundaries to search for the exact keyword match.
    #then I count the number of lines output by `grep`, which corresponds to the number of keyword occurrences.
}

#After which I process each file in the array
for file in "${files[@]}"; do
    #Check if the specified file exists
    if [ ! -f "$file" ]; then
        echo "File not found: $file"    # If the file does not exist print error message and continue with the next file
        continue
    fi

    #then just count and display occurrences of each keyword for current file
    #For each file call `count_keyword` function to get the count of 'task', 'function', 'module', and 'endmodule'.
    echo "Filename: $file"
    echo "Occurrences of 'task': $(count_keyword "$file" 'task')"
    echo "Occurrences of 'function': $(count_keyword "$file" 'function')"
    echo "Occurrences of 'module': $(count_keyword "$file" 'module')"
    echo "Occurrences of 'endmodule': $(count_keyword "$file" 'endmodule')"
    echo ""
done
###         ------THANK YOU------          ###