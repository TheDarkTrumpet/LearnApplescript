tell application "Finder" of machine (get "eppc://192.168.2.7")
	using terms from application "Finder"
		 get name of every Finder window
	end using terms from
end tell


