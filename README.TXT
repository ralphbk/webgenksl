Webgen v0.1
===========

Webgen uses two types of index files to aid the generation of web pages for the kslotten website:
a. mainmenu.txt
b. submenu_*.txt

mainmenu.txt
------------
Plain-text records describing the main menu entries (home..Musikschule). Each record consists of the following tab-separated fields:
1. The title text to be used for this main menu item - i.e. "home"
2. The default background colour (non-selected) for this main menu item - i.e. #00FF00 (green) or #00FFFF (aqua blue)
3. The background colour to be used when this main menu item has been selected - i.e. #FF8040 (orange)
4. Name of submenu_*.txt file to use when creating the left-hand sub-menu relevant for the selected main menu item - i.e. submenu_home.txt.
5. The default sub-menu item page that should be selected when this main menu item is selected - i.e. home_news.
6. The font-size to be used when displaying this main menu item - i.e. 12pt or 16pt.
7. The font-weight to be used when displaying this main menu item - i.e. bold or normal.

submenu_*.txt
-------------
These are several files (one for each main menu item) containing plain-text records describing the left-hand-side sub-menu entries specific to each of the main menu item. Each record consists of the following tab-separated fields:
1. The title text to be used for this sub-menu item - i.e. "News"
2. The default background colour (non-selected) for this sub-menu item - i.e. #00FFFF (aqua blue)
3. The background colour to be used when this sub-menu item has been selected - i.e. #FF8040 (orange)
4. The basename of the content and generated html file names - i.e. home_news.

Webgen Batch Files
------------------
Due to the limition of XP DOS batch files, it was necessary to split webgen into 3 batch files:
1. webgen.bat - steps through all the main menu items contained in mainmenu.txt - calling webgen2.bat.
2. webgen2.bat - steps through all the sub-menu items contained in the submenu_???.txt file relevant to the current mainmenu item - calling webgen3.txt.
3. webgen3.bat - creates the webpage for the current main-menu and sub-menu combination.

So, most of the page production is actually being done in webgen3.bat, and this is the file that should be edited to change the page appearance.

webgen3.bat is commented in more detail within the code, but the general flow is as follows:
1. Create the header
2. Create the main menu (stepping through mainmenu.txt again) together with page links and coloring of selected items.
3. Create the current sub-menu (stepping through the relevant submenu_???.txt) together with page links and colouring selected items.
4. Draw content for the page from a html-formatted file content_<pagebasename>.txt - i.e. content_informationen_organigramm.txt
5. Write all of the above to the html output in html/<pagebasename>.html - i.e. html/informationen_organigramm.html

Before exiting, webgen.bat also copies the home_news.html to index.html. This is needed to provide a simple startpage for the website.

Usage instructions:
-------------------
1. Create/edit the html-formatted content-????,txt files.
2. Tweak the formatting in webgen3,bat
3. Run webgen.bat.
4. Copy the contents of the html directory to the webserver.