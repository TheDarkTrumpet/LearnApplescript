-- Open Bing in Tab
-- Created by Christian Grunenberg Mon Jan 25 2010.
-- Copyright (c) 2010–2016. All rights reserved.

property pURL : "http://www.bing.com"

-- Import helper library
tell application "Finder" to set pathToAdditions to ((path to application id "DNtp" as string) & "Contents:Resources:Template Script Additions.scpt") as alias
set helperLibrary to load script pathToAdditions

-- Open URL in a new tab
my helperLibrary's openURLInTab(pURL)