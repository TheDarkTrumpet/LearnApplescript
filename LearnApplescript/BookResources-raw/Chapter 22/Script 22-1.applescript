is_satimage_addition_installed()

on is_satimage_addition_installed()
	try
		change "a" in "abc" into "d" -- Send a Satimage-specific command
		return true
	on error number -1708 -- Command not found
		return false
	end try
end is_satimage_addition_installed


