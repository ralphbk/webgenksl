#!/bin/bash

# --------------------------------------------------------------------------
# webgen2a.bat - The tertiary webgen loop. Not called directly - only via 
# webgen2.bat. Deals with subsubmenu item pages.
# --------------------------------------------------------------------------

selectedmainmenutitle1=$1
selectedmainmenutitle2=$2
selectedsubmenutitle=$3
selectedmainmenusubmenufile=$4
selectedsubsubmenufile=$5
selecteddisptextcol=$6
selecteddispbackcol=$7
selectedmainmenu1fontsize=$8
selectedmainmenu1fontweight=$9
selectedmainmenu2fontsize=${10}
selectedmainmenu2fontweight=${11}

echo - Processing pages for $selectedmainmenutitle1 $selectedmainmenutitle2 / $selectedsubmenutitle ...

# --------------------------------------------------------------------------
# Steps through the current sub-menu items, calling webgen3.bat with the following 
# parameters:
# 1. current main menu item title - part 1
# 2. current main menu item title - part 2
# 3. the current sub-menu item title
# 4. the current sub-sub-menu item title
# 4. the current sub-menu file
# 5. the current sub-sub-menu file
# 6. the current sub-sub-menu item html/content file basename
# 7. text color to be used for display nof the current main menu item
# 8. background color to be used for display of the current main menu item
# 9. font-size to be used to display the current main menu item - part 1
# 10. font-weight to be used to display the current main menu item - part 1
# 11. font-size to be used to display the current main menu item - part 2
# 12. font-weight to be used to display the current main menu item - part 2

# --------------------------------------------------------------------------

OLD_IFS=$IFS
IFS=`/bin/echo -ne "\t\n"`

while read subsubmenutitle contentbasename deftextcol defbackcol seltextcol selbackcol subsubsubmenufile
do
        ./webgen3.sh $selectedmainmenutitle1 $selectedmainmenutitle2 $selectedsubmenutitle $subsubmenutitle $selectedmainmenusubmenufile $selectedsubsubmenufile $contentbasename $selecteddisptextcol $selecteddispbackcol $selectedmainmenu1fontsize $selectedmainmenu1fontweight $selectedmainmenu2fontsize $selectedmainmenu2fontweight
done < $selectedsubsubmenufile


IFS=$OLD_IFS

