set the_subject to "Hello there"
set the_body to "Please read the attached file:"
set the_file to choose file with prompt "Choose the file to attach:"

tell application "Mail"
	set new_message to make new outgoing message with properties {subject:the_subject, content:the_body, visible:true}
	tell new_message
		-- Add the recipients:
		make new to recipient at end of to recipients with properties {name:"Simon", address:"simon@example.net"}
		make new cc recipient at end of cc recipients with properties {name:"Georgia", address:"georgia@example.net"}
		-- Add the attachment:
		make new paragraph at end of last paragraph of content with data (linefeed & linefeed & linefeed)
		make new attachment at end of last paragraph of content with properties {file name:the_file}
	end tell
end tell



