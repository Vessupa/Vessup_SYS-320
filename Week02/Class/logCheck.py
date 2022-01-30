import re, sys, yaml


# Open the Yaml file
try:

    with open('searchTerms.yaml', 'r') as yf:
        keywords = yaml.safe_load(yf)

except EnvironmentError as e:
    print(e.strerror)

def _logs(filename,service, term):

    # Query the yaml file for the 'term' or direction and
    # retrieve the strings to search on.
    # terms = keywords['apache']['php']
    terms = keywords[service][term]

    listOfKeywords = terms.split(",")

    with open(filename) as f:

        contents = f.readlines()

    # Lists to store the results
    results = []

    # Loop through the list returned. Each element is a line

    for line in contents:

        # Loops through the keywords

        for eachKeyword in listOfKeywords:

            # If the 'line' contains the keyword then it will print
            # if eachKeyword in line:
            # Searches and returns results using a regular expression search

            x = re.findall(r''+eachKeyword+'', line)

            for found in x:

                # Append the returned keyworkds to the results list

                    results.append(found)

    # Check to see if there are results
    if len(results) == 0:
        print("No Results")
        sys.exit(1)

    results = sorted(results)
    
    
    return results