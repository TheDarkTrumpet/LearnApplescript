set the_app to choose application with prompt "Choose application to startup automatically" as alias
set app_path to POSIX path of the_app
tell application "System Events"
	make new login item at end of login items with properties {path:app_path}
end tell


