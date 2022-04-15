# Unzip Documents.zip file

# Expand-Archive .\Documents.zip

# List the files in directory with mode and LastWriteTime statistics
#** Parameters **

#** "| get-member" shows properties for the given commandlet. In this case it's "Get-Childitem"
#** "| Select FullName" shows the full path of do

#Get-Childitem -recurse -Path .\Documents

# Specify with the "-Include" parameter

# Get-Childitem -recurse -Include *.docx,*.pdf -Path .\Documents

# Get-Childitem -recurse -Include *.docx,*.pdf -Path .\Documents | export-csv `
#-Path files.csv

# Import CSV file.

$fileList = import-csv -Path .\files.csv -header FullName

#$fileList

#Loop through the results
foreach ($f in $fileList) {

    Get-Childitem -Path $f.FullName
}
