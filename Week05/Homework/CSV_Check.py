import re, yaml, sys, csv


# Open the Yaml file
try:

    with open('CSV.yaml', 'r') as yf:
        keywords = yaml.safe_load(yf)

except EnvironmentError as e:
    print(e.strerror)



def _logs(filename, listOfKeywords):

    with open(filename, 'r') as f:

        contents = csv.reader(f)

    # Lists to store the results
    #results = []

    # Loop through the list returned. Each element is a line

    for line in contents:

        # Loops through the keywords

        for eachKeyword in listOfKeywords:

            # If the 'line' contains the keyword then it will print
            # if eachKeyword in line:
            # Searches and returns results using a regular expression search

            x = re.findall(r''+eachKeyword+'', line[1])

            for found in x:

                # Append the returned keyworkds to the results list

                    # results.append(found)

                args = line[1]
                host = line[2]
                name = line[3]
                path = line[4]
                pid = line[5]
                user = line[6]
                print("""
        
    Arguments: {}
    Host: {}
    Name: {}
    Path: {}
    PID: {}
    User: {}
    {}
    """.format(args, host, name, path, pid, user, "*" * 60))

    # Check to see if there are results
    if len(results) == 0:
        print("No Results")
        sys.exit(1)

    results = sorted(results)
    
    
    return results