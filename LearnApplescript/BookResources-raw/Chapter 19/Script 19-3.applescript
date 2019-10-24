property TestLib : missing value

on load_libraries()
	set scripts_folder_path to path to scripts folder from user domain as text
	set TestLib to load script alias (scripts_folder_path & "TestLib.scpt")
end load_libraries

on run
	load_libraries()
	-- Rest of the code goes here...
end run


