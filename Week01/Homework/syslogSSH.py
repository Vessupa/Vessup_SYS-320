import syslogCheck_SSHD
import syslogCheck_Klogind
# SSH authentication failures

def ssh_fail(filename, searchTerms):

    # Call syslogCheck and return the results

    is_found = syslogCheck_SSHD._syslog(filename,searchTerms)

    is_found2 = syslogCheck_Klogind._syslog(filename,searchTerms)

    # found list
    found = []

    for eachFound in is_found:

        # Split the results

        print(eachFound)

        sp_results = eachFound.split(" ")

        # Append the split value to the found list

        

    for eachFound in is_found2:

        # Split the results

        print(eachFound)

        sp_results = eachFound.split(" ")

        # Append the split value to the found list

        found.append(sp_results[4])

    print(found)