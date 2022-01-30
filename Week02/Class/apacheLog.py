
import logCheck
import importlib
importlib.reload(logCheck)

# Apache Events

def apache_events(filename, service, term):

    

    # Call syslogCheck and return the results

    is_found = logCheck._logs(filename, service, term)

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

        
   