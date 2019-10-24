on InstallScript(d)
	set w_name to contained data of item 12 of d
	set w to graphic window w_name
	set script of w to "
			on pick in w at {point:{x, y}, step:i}
				set d to dialog \"" & name of d & "\"
				set contained data of item 8 of d to x
				set contained data of item 10 of d to y
				continue pick in w at {point:{x, y}, step:i}
			end pick in"
	postit ("Loaded")
	smilepause 5
	postit ("")
end InstallScript


