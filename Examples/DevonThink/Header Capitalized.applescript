-- Script Format > Capitalized Header
-- Created by Christian Grunenberg on Tue Mar 01 2005.
-- Copyright (c) 2004-2014. All rights reserved.

tell application id "DNtp"
	try
		tell selected text of think window 1
			set size to 12
			set size of character 1 of every word to 24
		end tell
	end try
end tell