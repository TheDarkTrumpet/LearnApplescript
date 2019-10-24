on open {the_alias}
	try
		tell application "Finder" to open folder "Contents" of item the_alias
	on error
		display alert "Not a bundle."
	end try
end open 


