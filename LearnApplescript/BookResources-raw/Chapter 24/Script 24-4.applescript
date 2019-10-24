tell application "Pages"
	tell body text of document 1
		make new shape at after word 1 of paragraph 2 with properties {shape type:diamond, name:"Shape of a diamond"}
		set object text of shape "Shape of a diamond" to "I am a diamond"
		set shadow of shape "Shape of a diamond" to true
		set shadow color of shape "Shape of a diamond" to {25000, 0, 25000}
	end tell
end tell


