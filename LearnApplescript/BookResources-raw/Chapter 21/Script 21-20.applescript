tell application "Automator"
	activate
	set itunes_action_names to name of Automator actions whose target application contains "iTunes"
	set the_selection to choose from list itunes_action_names
	if the_selection is false then return -- User canceled
	set action_name to item 1 of the_selection
	set my_workflow to make workflow with properties {name:action_name & "Workflow"}
	add Automator action action_name to my_workflow
	save my_workflow in file ((path to desktop as string) & action_name)
end tell


