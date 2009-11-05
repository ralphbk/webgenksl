#!/bin/bash

# --------------------------------------------------------------------------
# webgen_team.bat - Creating the content_standort_XYZ_team.txt file.
# --------------------------------------------------------------------------

title=$1
outputcontentfile=$2
inputcontentfile=pre_$2
oddbackcol=#E0E0E0
evenbackcol=#FFFFFF

midfontstyle="\"font-family:arial,san-serif; font-size:16pt\""
smlfontstyle="\"font-family:arial,san-serif; font-size:12pt\""

# --------------------------------------------------------------------------
# Tell the user what we are doing ...
# --------------------------------------------------------------------------

echo - Generating content for $title - $outputcontentfile ...

# --------------------------------------------------------------------------
# Create the main table - basically three fix-sized columns
# (actually four columns, but the first one empty, to create a margin)
# --------------------------------------------------------------------------
echo \<br/\> > $outputcontentfile
echo \<br/\> >> $outputcontentfile
echo \<table frame=\"void\" rules=\"none\" style=\"table-layout:fixed\;\"\> >> $outputcontentfile
echo    \<col width=\"30\"/\> >> $outputcontentfile
echo 	\<col width=\"155\"/\> >> $outputcontentfile
echo 	\<col width=\"400\"/\> >> $outputcontentfile
echo 	\<col width=\"50\"/\> >> $outputcontentfile

echo 	\<tr\> >> $outputcontentfile
echo 		\<td\> \</td\> >> $outputcontentfile
echo 		\<td colspan=\"3\"\>\<b\>$title\</b\>\</td\> >> $outputcontentfile
echo 	\</tr\> >> $outputcontentfile

counter=0

OLD_IFS=$IFS
IFS=`/bin/echo -ne "\t\n"`

while read name func email
do
	counter=$((counter+1))
	if [ $((counter % 2)) -eq 0 ]
	then
		backcol=$evenbackcol
	else
		backcol=$oddbackcol
	fi

	echo 	\<tr\> >> $outputcontentfile
	echo            \<td\> \</td\> >> $outputcontentfile
	echo 		\<td bgcolor=\"${backcol}\"\>$name\</td\>  >> $outputcontentfile
	echo 		\<td bgcolor=\"${backcol}\"\>$func\</td\>  >> $outputcontentfile
	# deal with the missing email param $email in the next line later ...
	echo 		\<td bgcolor=\"${backcol}\"\> >> $outputcontentfile
	echo			\<a href=\"mailto:${email}\" style=\"text-decoration:none\"\>\<img src=\"images/mail.gif\" border=\"0\" alt=\"email\"/\>\</a\>  >>$outputcontentfile
	echo 		\</td\>  >> $outputcontentfile
	echo 	\</tr\> >> $outputcontentfile
done < $inputcontentfile

IFS=$OLD_IFS

echo 	\<tr\> >> $outputcontentfile
echo 		\<td colspan=\"3\"\> \</td\> >> $outputcontentfile
echo 	\</tr\> >> $outputcontentfile
echo \</table\> >> $outputcontentfile
