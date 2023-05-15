# downloadFTPs

*Currently, this doesn't support downloading txt, cds, feature, rna, or protein files individually. You'd have to use the "all" option to download everything, then go in and delete the files you don't want if you need to free up space. Sorry!

What your data file should look like:

Strain Name    AssemblyID (starting with GCA)

The way I recommend you do this is:

	1. download the csv file from the ncbi genome list page

	2. copy-paste the "strain name" column into column 1 of your excel sheet

	3. copy-paste the "assembly" column into column 2 of your excel sheet

	4. create a blank .txt file inside this folder, and copy-paste your first two excel sheet columns into it

Now you're ready to run!

To run:
	
	1. open linux terminal

	2. navigate to the folder this file is in by typing "cd [directory name here]" and hitting enter

		*you can type "ls" and then hit enter to see the list of all possible directories you can navigate to
	
	3. once you're in this folder in the terminal, type "./download.sh" and hit enter

	4. follow the prompts
