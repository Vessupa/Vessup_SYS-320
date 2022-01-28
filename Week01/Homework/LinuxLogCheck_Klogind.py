import re
import re

def _syslog(filename,listOfKeywords):

    with open(filename) as f:

        contents = f.readlines()

    # Lists to store the results
    results = []
    

    for line in contents:

        for eachKeyword in listOfKeywords:


            x = re.findall(r''+eachKeyword+'', line)

            for found in x:

                #Append results to results list

                    results.append(found)

    results = ''.join(results)
    
    return results