# File to traverse a given directory and it's subdirs and retrieve all the files

import os, sys, argparse, attackCheck

# parser
parser = argparse.ArgumentParser(

    description="Traverses a directory and analyze logs for attacks",
    epilog="Developed by Asani Vessup, 20220208"
    )

# Add argument to pass to the fs.py program
parser.add_argument("-d", "--directory", required="True", help="Directory that you want to traverse for logs.")

parser.add_argument("-a", "--attacktype", required="True", help="Attack you want to search for in logs.")
# Parse the arguments
args = parser.parse_args()

rootdir = args.directory

attacktype = args.attacktype
# Get information from the commandline
# print(sys.argv)

# Directory to traverse
rootdir= sys.argv[2]

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
        print(fileList)
        #print(fileList)
        fList.append(fileList)

print(fList)

def attack_events(service, attack):

    for eachFile in fList:

    # Call syslogCheck and return the results

        is_found = attackCheck._logs(service, attack)

        # found list
        found = []

        for eachFound in is_found:

            # Split the results

            #print(eachFound)

            sp_results = eachFound.split(" ")

        

            # Append the split value to the found list
            # "GET /cgi-bin/test-cgi HTTP/1.1" 404 435 "-" "-"

            found.append(sp_results[0]+ " " + sp_results[1] + " " + sp_results[3])
        

            # Remove duplicates by using set
            # and convert the list to dictionary

            getValues = set(found)

            # Print results

            for eachValue in getValues:

                print(eachValue)

                return

for eachFile in fList:

    print(os.stat(eachFile))