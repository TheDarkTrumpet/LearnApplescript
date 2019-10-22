-- Script Format > Source
-- Created by Christian Grunenberg on Sat May 15 2004.
-- Copyright (c) 2004-2014. All rights reserved.

tell application id "DNtp"
	try
		tell selected text of think window 1
			set properties to {alignment:left, font:"Courier", size:11, color:{60000, 0, 0}, background:{65535, 65535, 65535}}
			plain
		end tell
	end try
end tell