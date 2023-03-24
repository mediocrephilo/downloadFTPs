#! /bin/sh
chmod +x "download.sh"

echo "what type of files are you downloading? (fna, gbff, gff, gtf, all)"
read fileType
echo "what is the name of your input file?"
read dataFile
echo "what is the pathway to the folder would you like to download your results to?"
read outputFolder

speciesName=($(awk '{print $1}' "$dataFile".txt))	#saving the first column values to species name array
assemblyID=($(awk '{print $2}' "$dataFile".txt))	#saving the second column values to assembly ID array
assemblyID2=($(awk '{print $3}' "$dataFile".txt))	#saving the third column values to assembly ID2 array
url=()	#declaring relevant arrays
urlID=()

for i in ${!assemblyID[@]}; do		#altering the strings in assembly ID array to fit the web address format
	urlID[i]="${assemblyID[i]//[A]/F}"
	url[i]="${urlID[i]::-2}"
	url[i]="${url[i]/_}"
	url[i]="${url[i]//[A]/F}"
done

if [ "$fileType" != "all" ]; 		#for any specific type of file, download using the ftp command
then
	for i in ${!assemblyID[@]}; do
		url[i]="ftp.ncbi.nlm.nih.gov/genomes/all/${url[i]:0:3}"/"${url[i]:3:3}"/"${url[i]:6:3}"/"${url[i]:9:3}/"${urlID[i]}"_"${assemblyID2[i]}"/"${urlID[i]}"_"${assemblyID2[i]}"_genomic.$fileType.gz"
		wget --timestamping ftp://"${url[$i]}" -P $outputFolder/"${speciesName[$i]}"/"$fileType"
	done
else
	for i in ${!url[@]}; do			#if user wants to download all files, use this other ftp command
		url[i]="ftp.ncbi.nlm.nih.gov/genomes/all/${url[i]:0:3}"/"${url[i]:3:3}"/"${url[i]:6:3}"/"${url[i]:9:3}/"${urlID[i]}"_"${assemblyID2[i]}"/"
		wget --recursive --no-host-directories --cut-dirs=6 ftp://"${url[$i]}" -P $outputFolder/"${speciesName[$i]}"
	done
fi
