on create_folder(folder_location, folder_name)
	tell application "Finder"
		make new folder at folder_location with properties {name:folder_name}
	end tell
end create_folder


