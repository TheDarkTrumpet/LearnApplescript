 on open the_item_list
	 set shell_script to "chmod"

	 -- Ask the user what mode to use
	 set this_mode to 0
	 repeat with the_entity_ref in {{"owner", 100}, {"group members", 10}, {"others", 1}}
		 set {entity_name, entity_val} to the_entity_ref
		 repeat with the_action_ref in {{"read", 4}, {"write to", 2}, {"execute", 1}}
			 set {action_name, action_val} to the_action_ref
			 display dialog "Allow " & entity_name & " to " & action_name & "?" buttons {"No", "Yes"} default button "Yes"
			 if button returned of result is "Yes" then
				 set this_mode to this_mode + (entity_val * action_val)
			 end if
		 end repeat
	 end repeat

	 -- Ask if folders should be processed recursively
	 display dialog "When processing folders, change all enclosed items as well?" buttons {"No", "Yes"} default button "Yes"
	 if button returned of result is "Yes" then
		 set shell_script to shell_script & space & "-R"
	 end if

	 -- Add the mode argument to the command string
	 set shell_script to shell_script & space & this_mode

	 -- Add the file path arguments to the command string
	 repeat with item_ref in the_item_list
		 set shell_script to shell_script & space & quoted form of POSIX path of item_ref
	 end repeat

	 -- Run the shell script
	 display dialog "Make these changes as an administrator?" buttons {"No", "Yes"}
	 set run_as_admin to button returned of result is "Yes"
	 try
		 do shell script shell_script administrator privileges run_as_admin
	 on error err_msg
		 display dialog "The following error(s) occurred:" & return & err_msg buttons {"OK"}
	 end try
 end open


