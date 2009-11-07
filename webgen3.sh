#!/bin/bash

# --------------------------------------------------------------------------
# webgen3.sh - Creating the webpages.
# Never called directly, only via webgen.sh (and webgen2.sh)
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# First deal with the parameters passed to us by webgen2.sh
# --------------------------------------------------------------------------

selectedmainmenutitle1=$1 
selectedmainmenutitle2=$2 
selectedsubmenutitle=$3
selectedsubsubmenutitle=$4
selectedmainmenusubmenufile=$5
selectedsubsubmenufile=$6
selectedsubmenucontent=$7
selectedmainmenudisptextcol=$8
selectedmainmenudispbackcol=$9
selectedmainmenu1fontsize=${10}
selectedmainmenu1fontweight=${11}
selectedmainmenu2fontsize=${12}
selectedmainmenu2fontweight=${13}

# --------------------------------------------------------------------------
# Some default values and locations for the commonly needed stuff
# --------------------------------------------------------------------------

if [ ! -d $HTMLDIR ] 
then
	mkdir $HTMLDIR
fi
HTMLOUTFILE=${HTMLDIR}/${selectedsubmenucontent}.html
CONTENTFILE=content_${selectedsubmenucontent}.txt
author="Eva Ravnikar"

headertextcolor=#000000
headerbackcolor=#969696
headerfontfamily=arial,futura,san-serif

schoolnamestyle="\"font-family:Futura,${headerfontfamily}; font-size:20pt; color:${headertextcolor%}\""

bigfontstyle="\"font-family:${headerfontfamily}; font-size:20pt; color:${headertextcolor}\""
midfontstyle="\"font-family:${headerfontfamily}; font-size:16pt; color:${headertextcolor}\""
smlfontstyle="\"font-family:${headerfontfamily}; font-size:12pt; color:${headertextcolor}\""
defaultfontstyle="\"font-family:${headerfontfamily}; font-size:11pt; color:${headertextcolor}\""

columnwidth=155
toprowheight=126

menulinkstyle="\"text-decoration:none\""

backgroundimage="${IMAGEDIR}/ksl_logo_152_135_faded.gif"

# --------------------------------------------------------------------------
# Tell the user what we are doing ...
# --------------------------------------------------------------------------

if [ "${selectedsubsubmenutitle}" == "NOSUBSUB" ]
then
	echo "- Processing page for ${selectedmainmenutitle1} ${selectedmainmenutitle2} / ${selectedsubmenutitle} ($HTMLOUTFILE) ..."
else
	echo "- - Processing page for ${selectedmainmenutitle1} ${selectedmainmenutitle2} / ${selectedsubmenutitle} / ${selectedsubsubmenutitle} ($HTMLOUTFILE) ..."
fi

# --------------------------------------------------------------------------
# Creating the header - most of this comes from the old www.kslotten.ch site
# 
# General note: The html output is (generally) produced by redirected echo
# output. Crude but effective, it does require that all html-angle-brackets
# be escaped with a back-slash.
# --------------------------------------------------------------------------

echo \<?xml version=\"1.0\" encoding=\"iso-8859-1\"?\> > $HTMLOUTFILE
echo \<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"\> >> $HTMLOUTFILE
echo \<html xmlns=\"http://www.w3.org/1999/xhtml\"\> >> $HTMLOUTFILE
echo 	\<head\> >> $HTMLOUTFILE
echo 		\<meta http-equiv=\"content-type\" content=\"text/html\;charset=iso-8859-1\" /\> >> $HTMLOUTFILE
echo 		\<title\>Kreisschule Lotten - ${selectedmainmenutitle1} ${selectedmainmenutitle2}  >> $HTMLOUTFILE
if [ "${selectedsubmenutitle}" != "NODISPLAY" ]
then
	echo 	/ ${selectedsubmenutitle//_/ } >> $HTMLOUTFILE
fi 
if [ "${selectedsubsubmenutitle}" != "NODISPLAY" ] && [ "${selectedsubsubmenutitle}" != "NOSUBSUB" ]
then
	echo 	/ ${selectedsubsubmenutitle//_/ } >> $HTMLOUTFILE
fi
echo \</title\> >> $HTMLOUTFILE
echo 		\<meta name=\"keywords\" content=\"Kreisschule Lotten  >> $HTMLOUTFILE
echo Schule >> $HTMLOUTFILE
echo Schulen >> $HTMLOUTFILE
echo Schafisheim >> $HTMLOUTFILE
echo Hunzenschwil >> $HTMLOUTFILE
echo Rupperswil >> $HTMLOUTFILE
echo Oberstufe >> $HTMLOUTFILE
echo Realschule >> $HTMLOUTFILE
echo Kleinklasse >> $HTMLOUTFILE
echo Sekundarschule\" /\> >> $HTMLOUTFILE
echo 		\<meta name=\"description\" content=\"Willkommen auf der Homepage der Kreisschule Lotten. Die Gemeinden Hunzenschwil, Rupperswil und Schafisheim f\&uuml\;hren ihre Oberstufe seit 2004 gemeinsam unter der Bezeichnung Kreisschule Lotten.\" /\> >> $HTMLOUTFILE
echo 		\<meta name=\"author\" content=\"${author}\" /\> >> $HTMLOUTFILE
echo 		\<meta name=\"language\" content=\"de >> $HTMLOUTFILE
echo ch\' >> $HTMLOUTFILE
echo at\" /\> >> $HTMLOUTFILE
echo 		\<meta name=\"organization\" content=\"Kreisschule Lotten\" /\> >> $HTMLOUTFILE
echo 		\<meta name=\"keywords\" content=\"Kreisschule  >> $HTMLOUTFILE
echo Lotten >> $HTMLOUTFILE
echo Hunzenschwil >> $HTMLOUTFILE
echo Rupperswil  >> $HTMLOUTFILE
echo Schafisheim  >> $HTMLOUTFILE
echo Oberstufe >> $HTMLOUTFILE
echo Schule >> $HTMLOUTFILE
echo Realschule >> $HTMLOUTFILE
echo Sekundarschule >> $HTMLOUTFILE
echo Kleinklasse >> $HTMLOUTFILE
echo 5102 >> $HTMLOUTFILE
echo 5502 >> $HTMLOUTFILE
echo 5503 >> $HTMLOUTFILE
echo Schulverband >> $HTMLOUTFILE
echo bezirk >> $HTMLOUTFILE
echo lenzburg >> $HTMLOUTFILE
echo \&ouml\;ffentlich >> $HTMLOUTFILE
echo 6. Schuljahr >> $HTMLOUTFILE
echo 7. Schuljahr >> $HTMLOUTFILE
echo 8. Schuljahr >> $HTMLOUTFILE
echo 9. Schuljahr >> $HTMLOUTFILE
echo 10. Schuljahr >> $HTMLOUTFILE
echo Schulsport >> $HTMLOUTFILE
echo Musikschule\" /\> >> $HTMLOUTFILE
echo 		\<meta name=\"robots\" content=\"index\" /\> >> $HTMLOUTFILE
echo 	\<link rel=\"shortcut icon\" href=\"favicon.ico\" type=\"image/x-icon\"/\> >> $HTMLOUTFILE
echo \</head\> >> $HTMLOUTFILE
echo \<body style=$defaultfontstyle\> >> $HTMLOUTFILE

# --------------------------------------------------------------------------
# Create the main table - basically six. fix-sized columns
# --------------------------------------------------------------------------

echo \<table border=\"0\" frame=\"void\" rules=\"none\" style=\"table-layout:fixed\; border-collapse:collapse\;\" cellspacing=\"0\"\> >> $HTMLOUTFILE
echo 	\<col width=\"92\"/\> >> $HTMLOUTFILE
echo 	\<col width=\"${columnwidth}\"/\> >> $HTMLOUTFILE
echo 	\<col width=\"${columnwidth}\"/\> >> $HTMLOUTFILE
echo 	\<col width=\"${columnwidth}\"/\> >> $HTMLOUTFILE
echo 	\<col width=\"${columnwidth}\"/\> >> $HTMLOUTFILE
echo 	\<col width=\"${columnwidth}\"/\> >> $HTMLOUTFILE
echo 	\<col width=\"${columnwidth}\"/\> >> $HTMLOUTFILE

# --------------------------------------------------------------------------
# Creating the main main menu
# --------------------------------------------------------------------------

echo 	\<tr\> >> $HTMLOUTFILE
echo 		\<td\>\&nbsp\;\</td\> >> $HTMLOUTFILE

OLD_IFS=$IFS
IFS=`/bin/echo -ne "\t\n"`

while read mainmenutitle1 mainmenutitle2 submenufilename defaultsubmenuitem deftextcol defbackcol seltextcol selbackcol disptextcol dispbackcol mainmenu1fontsize mainmenu1fontweight mainmenu2fontsize mainmenu2fontweight
do
	if [ "$mainmenutitle1" == "$selectedmainmenutitle1" ] && [ "$mainmenutitle2" == "$selectedmainmenutitle2" ]
	then
		backcol=$selbackcol
		textcol=$seltextcol
	else
		backcol=$defbackcol
		textcol=$deftextcol
	fi
	echo 		\<td bgcolor=\"${backcol}\" valign=\"bottom\"\> >> $HTMLOUTFILE
	echo 			\<font style=\"font-family:${headerfontfamily}\; font-size:${mainmenu1fontsize}\; font-weight:${mainmenu1fontweight}\; color:${textcol}\; background-color:${backcol}\"\> >> $HTMLOUTFILE
	echo 				\<a href=\"${defaultsubmenuitem}.html\" style=\"text-decoration:none\; color:${textcol}\; background-color:${backcol}\"\>${mainmenutitle1}\</a\> >> $HTMLOUTFILE
	echo			\</font\> >> $HTMLOUTFILE
	echo 			\<br/\> >> $HTMLOUTFILE
	echo 			\<font style=\"font-family:${headerfontfamily}\; font-size:${mainmenu2fontsize}\; font-weight:${mainmenu2fontweight}\; color:${textcol}\; background-color:${backcol}\"\> >> $HTMLOUTFILE
	echo 				\<a href=\"${defaultsubmenuitem}.html\" style=\"text-decoration:none\; color:${textcol}\; background-color:${backcol}\"\>${mainmenutitle2}\</a\> >> $HTMLOUTFILE
	echo 			\</font\> >> $HTMLOUTFILE
	echo		\</td\> >> $HTMLOUTFILE
done < mainmenu.txt 

IFS=$OLD_IFS

# --------------------------------------------------------------------------
# Main-menu underlines
# --------------------------------------------------------------------------

echo 	\</tr\> >> $HTMLOUTFILE
echo 	\<tr\> >> $HTMLOUTFILE
echo 		\<td height=\"5\" bgcolor=\"#333333\"\> \</td\> >> $HTMLOUTFILE
echo 		\<td height=\"5\" bgcolor=\"#FF0000\"\> \</td\> >> $HTMLOUTFILE
echo 		\<td colspan=\"5\" bgcolor=\"#B0B0B0\"\> \</td\> >> $HTMLOUTFILE
#echo 		\<td height=\"5\" bgcolor=\"#333333\"\>\<SPACER height=\"4\" type=\"block\"\>\</td\> >> $HTMLOUTFILE
#echo 		\<td bgcolor=\"#FF0000\"\>\<SPACER height=\"4\" type=\"block\"\>\</td\> >> $HTMLOUTFILE
#echo 		\<td colspan=\"5\" bgcolor=\"#B0B0B0\"\>\<SPACER height=\"4\" type=\"block\"\>\</td\> >> $HTMLOUTFILE
echo 	\</tr\> >> $HTMLOUTFILE

# --------------------------------------------------------------------------
# Sidebar image
# --------------------------------------------------------------------------

echo 	\<tr\> >> $HTMLOUTFILE
echo 		\<td valign=\"top\"\> >> $HTMLOUTFILE
echo 			\<img width=\"92\" src=\"images/kslotten-sidebar.png\" alt=\"\" border=\"0\" /\> >> $HTMLOUTFILE
echo 		\</td\> >> $HTMLOUTFILE

# --------------------------------------------------------------------------
# Creating the sub-menu - First display the current main menu item selected
# --------------------------------------------------------------------------

echo 		\<td bgcolor=\"${headerbackcolor}\" valign=\"top\"\> >> $HTMLOUTFILE
echo 			\<table rules=\"none\" width=\"${columnwidth}\" border=\"0\" frame=\"void\" style=\"table-layout:fixed\; border-collapse:collapse\;\" cellspacing=\"0\"\> >> $HTMLOUTFILE
echo 				\<tr\> >> $HTMLOUTFILE
echo 					\<td bgcolor=\"${selectedmainmenudispbackcol}\"\> >> $HTMLOUTFILE
echo 						\<font style=\"font-family:${headerfontfamily}\; font-size:${selectedmainmenu1fontsize}\; font-weight:${selectedmainmenu1fontweight}\; color:${selectedmainmenudisptextcol}\"\>${selectedmainmenutitle1}\</font\> >> $HTMLOUTFILE
echo 						\<br/\> >> $HTMLOUTFILE
echo 						\<font style=\"font-family:${headerfontfamily}\; font-size:${selectedmainmenu2fontsize}\; font-weight:${selectedmainmenu2fontweight}\; color:${selectedmainmenudisptextcol}\"\>${selectedmainmenutitle2}\</font\> >> $HTMLOUTFILE
echo 					\</td\> >> $HTMLOUTFILE
echo 				\</tr\> >> $HTMLOUTFILE

echo 				\<tr\>\<td\>\&nbsp\;\</td\>\</tr\> >> $HTMLOUTFILE
echo 				\<tr\>\<td\>\&nbsp\;\</td\>\</tr\> >> $HTMLOUTFILE

# --------------------------------------------------------------------------
# Further creating the sub-menu - step through the relevant submenu-???.txt file and
# highlight the currently selected item.
# --------------------------------------------------------------------------

while read submenutitle contentbasename deftextcol defbackcol seltextcol selbackcol subsubmenufile
do
	if [ "${submenutitle}" == "NODISPLAY" ]
	then
		continue
	fi
	if [ "${selectedsubmenutitle}" == "${submenutitle}" ]
	then
		textcol=$seltextcol
		backcol=$selbackcol
	else
		textcol=$deftextcol
		backcol=$defbackcol
	fi
	echo 				\<tr\> >> $HTMLOUTFILE
	echo 					\<td height=\"40\" bgcolor=\"${backcol}\"\>\<font style=\"font-family:${headerfontfamily}\; font-size:14pt\; color:${textcol}\"\>\<a href=\"${contentbasename}.html\" style=\"text-decoration:none\; color:${textcol}\"\>${submenutitle//_/ }\</a\>\</font\>\</td\>  >> $HTMLOUTFILE
	echo 				\</tr\> >> $HTMLOUTFILE
	if [ "${selectedsubmenutitle}" == "${submenutitle}" ] && [ "${subsubmenufile}" != "NOSUBSUB" ]
	then
		while read subsubmenutitle subsubcontentbasename deftextcol defbackcol seltextcol selbackcol subsubsubmenufile
		do
			if [ "${subsubmenutitle}" == "NODISPLAY" ]
			then
				continue
			fi
			if [ "${selectedsubsubmenutitle}" == "${subsubmenutitle}" ]
			then
				textcol=$seltextcol
				backcol=$selbackcol
			else
				textcol=$deftextcol
				backcol=$defbackcol
			fi
			echo \<tr\> >> $HTMLOUTFILE
			echo   \<td\> >> $HTMLOUTFILE
                        echo     \<table rules=\"none\" width=\"${columnwidth}\" border=\"0\" frame=\"void\" style=\"table-layout:fixed\; border-collapse:collapse\;\" cellspacing=\"0\"\> >> $HTMLOUTFILE
			echo       \<col width=\"20\"/\> >> $HTMLOUTFILE
			echo       \<col width=\"135\"/\> >> $HTMLOUTFILE
			echo       \<tr\> >> $HTMLOUTFILE
			echo         \<td height=\"30\" bgcolor=\"${backcol}\"\>\<font style=\"font-family:${headerfontfamily}\; font-size:12pt\; color:${textcol}\"\>\&nbsp\;\</font\>\</td\>  >> $HTMLOUTFILE
			echo         \<td height=\"30\" bgcolor=\"${backcol}\"\>\<font style=\"font-family:${headerfontfamily}\; font-size:12pt\; color:${textcol}\"\>\<a href=\"${subsubcontentbasename}.html\" style=\"text-decoration:none\; color:${textcol}\"\>${subsubmenutitle//_/ }\</a\>\</font\>\</td\>  >> $HTMLOUTFILE
			echo       \</tr\> >> $HTMLOUTFILE
                        echo     \</table\> >> $HTMLOUTFILE
			echo   \</td\> >> $HTMLOUTFILE
			echo \</tr\> >> $HTMLOUTFILE
		done < $subsubmenufile
	fi
done < ${selectedmainmenusubmenufile}

echo 				\<tr\> >> $HTMLOUTFILE
echo 					\<td\>\&nbsp\;\</td\> >> $HTMLOUTFILE
echo 				\</tr\> >> $HTMLOUTFILE
echo 			\</table\> >> $HTMLOUTFILE
echo 		\</td\> >> $HTMLOUTFILE

# --------------------------------------------------------------------------
# The main content starts here (another table in table)
# --------------------------------------------------------------------------

echo 		\<td colspan=\"5\" valign=\"top\"\> >> $HTMLOUTFILE
echo 			\<table rules=\"none\" border=\"0\" frame=\"void\" style=\"table-layout:fixed\; border-collapse:collapse\;\" cellspacing=\"0\"\> >> $HTMLOUTFILE

# --------------------------------------------------------------------------
# Add the picture that goes with the menu selected, above the main content
# --------------------------------------------------------------------------

echo 				\<tr\> >> $HTMLOUTFILE
echo 					\<td valign=\"top\" align=\"center\"\> >> $HTMLOUTFILE
echo 						\<img src=\"images/${selectedsubmenucontent}.jpg\" height=\"153\" width=\"780\" alt=\"\" border=\"0\" /\> >> $HTMLOUTFILE
echo 					\</td\> >> $HTMLOUTFILE
echo 				\</tr\> >> $HTMLOUTFILE

# --------------------------------------------------------------------------
# Creating the main page content. We have the kslotten logo in the background
# top right, then get the rest from the relevant content-???.txt file.
# --------------------------------------------------------------------------

echo 				\<tr\> >> $HTMLOUTFILE
echo 					\<td valign=\"top\" align=\"left\" style=\"background-image:url\(${backgroundimage}\)\; background-repeat:no-repeat\; background-position:top right\;\"\> >> $HTMLOUTFILE
if [ -e $CONTENTFILE ]
then
	cat $CONTENTFILE >> $HTMLOUTFILE
else
	echo Awaiting content from file $CONTENTFILE  >> $HTMLOUTFILE
fi
echo 					\</td\> >> $HTMLOUTFILE
echo 				\</tr\> >> $HTMLOUTFILE

# --------------------------------------------------------------------------
# Close off the main content's sub-table and then the main table
# --------------------------------------------------------------------------

echo 			\</table\> >> $HTMLOUTFILE
echo 		\</td\> >> $HTMLOUTFILE
echo 	\</tr\> >> $HTMLOUTFILE
echo \</table\> >> $HTMLOUTFILE
cat include-google-analytics.txt >> $HTMLOUTFILE
echo \</body\> >> $HTMLOUTFILE
echo \</html\> >> $HTMLOUTFILE

# --------------------------------------------------------------------------
# That's all folks!
# --------------------------------------------------------------------------
