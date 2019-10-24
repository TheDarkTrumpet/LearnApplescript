tell application "Finder"
	say_hello(name of home)
end tell

on say_hello(user_name)
	display dialog ("Hello " & user_name & "!")
end say_hello


