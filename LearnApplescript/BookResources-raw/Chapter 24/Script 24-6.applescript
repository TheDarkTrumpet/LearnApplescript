tell application "Keynote"
	tell (make new slideshow with data {theme:"White", slideSize:{800, 600}})
		tell slide 1
			set title to "Keynote features"
			set body to "(c) Apple, Inc."
		end tell
		make new slide at the end of slides
		tell slide 2
			set title to "Magic Move"
			set body to "The new Magic Move feature lets you add " & "a sophisticated animation using a quick and simple process."
		end tell
		make new slide at the end of slides
		tell slide 3
			set title to "Enhanced Theme Chooser"
			set body to "Now choosing the right theme " & "for your presentation is easier than ever."
		end tell
		make new slide at the end of slides
		tell slide 4
			set title to "Text- and object-based transitions"
			set body to "Let your words and graphics really play onscreen."
		end tell
	end tell
	save slideshow 1 in POSIX file "/Users/Shared/Examples.key"
end tell


