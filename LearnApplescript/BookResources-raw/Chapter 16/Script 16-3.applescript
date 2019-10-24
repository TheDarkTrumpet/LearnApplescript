set dialog_reply to display dialog "5472 ÷ 57 =" buttons {"56", "76", "96"} giving up after 7
if (gave up of dialog_reply) then
	set the_response to "Not fast enough!"
else if (button returned of dialog_reply is "96") then
  set the_response to "You got it!"
else
	set the_response to "Wrong answer!"
end if
display dialog the_response


