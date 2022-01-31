
import logCheckProxy
import importlib
importlib.reload(logCheckProxy)

# Apache Events

def apache_events(filename, service, term):

    

    # Call syslogCheck and return the results

    is_found = logCheckProxy._logs(filename, service, term)

    # found list
    found = []

    for eachFound in is_found:

        # Split the results

        #print(eachFound)

        sp_results = eachFound.split(" ")

        

        # Append the split value to the found list
        # 
        # QQ.exe - tcpconn.tencent.com:80 close, 133 bytes sent, 0 bytes received

        #found.append(sp_results[0]+ " " + sp_results[1] + " " + sp_results[3])

            

        found.append(sp_results[0]+ " " + sp_results[2] + " " + sp_results[3] + " " + sp_results[4]  + " bytes sent " + sp_results[7] + " bytes recieved ")

        # Remove duplicates by using set
        # and convert the list to dictionary

        getValues = set(found)

        # Print results

        for eachValue in getValues:

            print(eachValue)

            

        
   