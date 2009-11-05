#!/bin/bash

# --------------------------------------------------------------------------
# webgen.sh - The primary webgen loop. Call this to generate page
# --------------------------------------------------------------------------

export HTMLDIR=html
export IMAGEDIR=images

# --------------------------------------------------------------------------
# First do some content generation ...
# --------------------------------------------------------------------------
echo Processing pre-content ...
./webgen_team.sh "Rupperswil Team" content_standort_rupperswil_team.txt
./webgen_team.sh "Hunzenschwil Team" content_standort_hunzenschwil_team.txt
./webgen_team.sh "Schafisheim Team" content_standort_schafisheim_team.txt

# --------------------------------------------------------------------------
# Steps through the main menu items, calling webgen2.bat with the following 
# parameters:
# 1. current main menu item title - part 1
# 2. current main menu item title - part 2
# 3. the relevant submenu-???.txt filename
# 4. text color to be used for display of the current main menu item
# 5. background color to be used for display of the current main menu item
# 6. font-size to be used to display the current main menu item - part 1
# 7. font-weight to be used to display the current main menu item - part 1
# 8. font-size to be used to display the current main menu item - part 2
# 9. font-weight to be used to display the current main menu item - part 2
# --------------------------------------------------------------------------

OLD_IFS=$IFS
IFS=`/bin/echo -ne "\t\n"`

while read mainmenutitle1 mainmenutitle2 submenufilename defaultsubmenuitem deftextcol defbackcol seltextcol selbackcol disptextcol dispbackcol mainmenu1fontsize mainmenu1fontweight mainmenu2fontsize mainmenu2fontweight
do
	./webgen2.sh $mainmenutitle1 $mainmenutitle2 $submenufilename $disptextcol $dispbackcol $mainmenu1fontsize $mainmenu1fontweight $mainmenu2fontsize $mainmenu2fontweight
done < mainmenu.txt 

IFS=$OLD_IFS

# --------------------------------------------------------------------------
# Finish off by creating an index page. (Default main menu, default sub-menu)
# --------------------------------------------------------------------------

cp ${HTMLDIR}/home.html ${HTMLDIR}/index.html

