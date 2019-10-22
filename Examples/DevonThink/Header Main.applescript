-- Script Format > Header Main
-- Created by Christian Grunenberg on Sat May 15 2004.
-- Copyright (c) 2004-2014. All rights reserved.

tell application id "DNtp"
	try
		tell selected text of think window 1
			set properties to {alignment:center, font:"Helvetica-Bold", underlined:false, size:24, color:{20000, 20000, 20000}, background:{65535, 65535, 65535}}
		end tell
	end try
end tell