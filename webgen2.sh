#!/bin/bash

# --------------------------------------------------------------------------
# webgen2.bat - The secondary webgen loop. Not called directly - only via 
# webgen.bat.
# --------------------------------------------------------------------------

selectedmainmenutitle1=$1
selectedmainmenutitle2=$2
selectedmainmenusubmenufile=$3
selecteddisptextcol=$4
selecteddispbackcol=$5
selectedmainmenu1fontsize=$6
selectedmainmenu1fontweight=$7
selectedmainmenu2fontsize=$8
selectedmainmenu2fontweight=$9

echo Processing pages for $selectedmainmenutitle1 $selectedmainmenutitle2 ...

# --------------------------------------------------------------------------
# Steps through the current sub-menu items, calling webgen3.bat with the following 
# parameters:
# 1. current main menu item title - part 1
# 2. current main menu item title - part 2
# 3. the current sub-menu item title
# 4. the current sub-sub-menu item title set to NOSUBSUB to indicate we are not processing a sub-sub-menu
# 5. the current sub-menu file
# 6. the current sub-sub-menu file set to NOSUBSUB to indicate we are not processing a sub-sub-menu
# 6. the current sub-menu item html/content file basename
# 7. text color to be used for display of the current main menu item
# 8. background color to be used for display of the current main menu item
# 9. font-size to be used to display the current main menu item - part 1
# 10. font-weight to be used to display the current main menu item - part 1
# 11. font-size to be used to display the current main menu item - part 2
# 12. font-weight to be used to display the current main menu item - part 2
#
# In case there is a subsubmenu assigned, we call webgen2a to deal with it.
#
# --------------------------------------------------------------------------

OLD_IFS=$IFS
IFS=`/bin/echo -ne "\t\n"`

while read submenutitle contentbasename deftextcol defbackcol seltextcol selbackcol subsubmenufile
do
        ./webgen3.sh $selectedmainmenutitle1 $selectedmainmenutitle2 $submenutitle "NOSUBSUB" $selectedmainmenusubmenufile "NOSUBSUB" $contentbasename $selecteddisptextcol $selecteddispbackcol $selectedmainmenu1fontsize $selectedmainmenu1fontweight $selectedmainmenu2fontsize $selectedmainmenu2fontweight
	
	if [ "$subsubmenufile" != "NOSUBSUB" ]
	then
		./webgen2a.sh $selectedmainmenutitle1 $selectedmainmenutitle2 $submenutitle $selectedmainmenusubmenufile $subsubmenufile $selecteddisptextcol $selecteddispbackcol $selectedmainmenu1fontsize $selectedmainmenu1fontweight $selectedmainmenu2fontsize $selectedmainmenu2fontweight
	fi
done < $selectedmainmenusubmenufile


IFS=$OLD_IFS

