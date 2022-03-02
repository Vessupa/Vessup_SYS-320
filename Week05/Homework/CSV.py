# Import CSV module to program
import csv, re, sys, os, argparse, CSV_Check
# File to traverse a given directory and it's subdirs and retrieve all the files


# parser
parser = argparse.ArgumentParser(

    description="Traverses a directory and analyze logs for attacks",
    epilog="Developed by Asani Vessup, 20220208"
    )

# Add argument to pass to the fs.py program
parser.add_argument("-d", "--directory", required="True", help="Directory that you want to traverse for logs.")

parser.add_argument("-p", "--process", required="True", help="Process to search for.")

parser.add_argument("-s", "--service", required="True", help="Service to look up.")
# Parse the arguments
args = parser.parse_args()

rootdir = args.directory

process = args.process

service = args.service
# Get information from the commandline
# print(sys.argv)

# Directory to traverse
#rootdir= sys.argv[2]

# print(rootdir)

# In our story, we will traverse a directory

# Check if the argument is a directory

if not os.path.isdir(rootdir):
    print("Invalid directory => {}".format(rootdir))
    exit()



# List to save files

fList = []

# Crawl through the provided directory
for root, subfolders, filenames in os.walk(rootdir):

    for f in filenames:

        #print(root + "/" + f)
        fileList = root + "/" + f
        #print(fileList)
        #print(fileList)
        fList.append(fileList)
        #print(fList)

def attack_events(service, process):

    print("hello")

    for eachFile in fList:

    # Call syslogCheck and return the results
        #print("hello")

        is_found = CSV_Check._logs(service, process, eachFile)

        

        # found list
        found = []

        for eachFound in is_found:

            # Split the results

            #print(eachFound)

            sp_results = eachFound.split(" ")

        

            # Append the split value to the found list
            # "GET /cgi-bin/test-cgi HTTP/1.1" 404 435 "-" "-"

            found.append(sp_results[2]+ " " + sp_results[3] + " " + sp_results[4])
        

            # Remove duplicates by using set
            # and convert the list to dictionary

            getValues = set(found)

            # Print results

            for eachValue in getValues:

                print(eachValue)

                #print(fList)

                return

attack_events(service, process)
#for eachFile in fList:

    #print(os.stat(eachFile))
# Function to parse the CSV files which takes in two arguments
# Fix: urlHausOpen has a number 1 instead of 'l'
#with open('../../Logs/urlHausTestDataSet.csv', 'rt')as f:
    #contents = csv.reader(f)
    #print(contents)


def CSVOpen(fList, searchTerm):
    print("Hello")
# Open the urlHaus file
    for eachFile in fList:
        with open(eachFile)as f:
            contents = csv.reader(f)
       
            next(contents)

        # Fix: add '(inter' after next to fix list object is not an
        # iterator error
                
            for keyword in searchTerm:

                for eachLine in contents:
                    # Fix: add '' between 'r and +', and '+ and ,'
                    x = re.findall(r''+keyword+'', eachLine[2])
    
#for eachFile in fList:

    #print(os.stat(eachFile))
CSVOpen(fList, process)
                
                #for _ in x:
                    
# Don't edit this line. It is here to show how it is possible
# to remove the "tt" so programs don't convert the malicious
# domains to links that an be accidentally clicked on.
                    #the_url = eachLine[2].replace("http","hxxp")
                    #the_src = eachLine[6]
                    #print("""
                    #URL:{}
                    #Info: {} 
                    #{}""".format(the_url, the_src,"*"*60))