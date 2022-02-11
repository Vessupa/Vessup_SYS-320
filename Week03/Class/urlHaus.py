# Import CSV module to program
import csv, re, sys

# Function to parse the CSV files which takes in two arguments
# Fix: urlHausOpen has a number 1 instead of 'l'
#with open('../../Logs/urlHausTestDataSet.csv', 'rt')as f:
    #contents = csv.reader(f)
    #print(contents)


def urlHausOpen(filename,searchTerm):
# Open the urlHaus file
    with open('../../Logs/urlHausTestDataSet.csv')as f:
        contents = csv.reader(f)
        # Skips over first 9 lines
        
        for _ in range(9):
            next(contents)

        # Fix: add '(inter' after next to fix list object is not an
        # iterator error
                
        for keyword in searchTerm:

            for eachLine in contents:
                # Fix: add '' between 'r and +', and '+ and ,'
                x = re.findall(r''+keyword+'', eachLine[2])
                
                for _ in x:
                    
# Don't edit this line. It is here to show how it is possible
# to remove the "tt" so programs don't convert the malicious
# domains to links that an be accidentally clicked on.
                    the_url = eachLine[2].replace("http","hxxp")
                    the_src = eachLine[6]
                    print("""
                    URL:{}
                    Info: {} 
                    {}""".format(the_url, the_src,"*"*60))