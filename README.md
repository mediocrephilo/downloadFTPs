# downloadFTPs

*Currently, this doesn't support downloading txt, cds, feature, rna, or protein files individually. You'd have to use the "all" option to download everything, then go in and delete the files you don't want if you need to free up space. Sorry!

What your data file should look like:

Strain Name    AssemblyID 1 (starting with GCA)    AssemblyID 2 (starting with ASM)

The way I recommend you do this is:

	1. download the csv file from the ncbi genome list page

	2. copy-paste the "strain name" column into column 1 of your excel sheet

	3. copy-paste the "assembly" column into column 2 of your excel sheet

	4. as you're filling out your data for each of the genomes you want from the ncbi genome list page, open the corresponding "assembly" link and copy-paste 	     the "ASM******v*" code at the top of the page into column 3 of your excel sheet

	5. copy-paste your first three excel sheet columns into a blank text document and title it whatever you want

Now you're ready to run!

How to run:

1. Make sure your data file is in the same folder as the "download.sh" file.

2. Open the terminal

3. Navigate to the folder "download.sh" is in using "ls" to list the folders in your current directory, and "cd *folderName*" to change to the target folder.

4. Type "./download.sh" without quotes.

5. It should be running!
