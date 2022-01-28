import LinuxLogCheck_SSHD
import LinuxLogCheck_Klogind
# SSH authentication failures


def ssh_fail(filename,searchTerms):

    

    # Call syslogCheck and return the results

    is_found = LinuxLogCheck_SSHD._syslog(filename,searchTerms)

    is_found2 = LinuxLogCheck_Klogind._syslog(filename,searchTerms)

    # found list
    found = []

    for eachFound in is_found:

        # Split the results

        print(eachFound)

        sp_results = eachFound.split(" ")

        # Append the split value to the found list

        
    for line in is_found2:

        if 'searchTerms' in line:

            print(line, 'Hey')

        else:
            return



   # for eachFound in is_found2:

      #  # Split the results

     #   print(eachFound)

      #  sp_results = eachFound.split(" ")

        # Append the split value to the found list

      #  found.append(sp_results[3])

   # print(found)