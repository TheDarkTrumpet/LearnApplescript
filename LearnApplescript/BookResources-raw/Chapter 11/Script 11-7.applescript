 on run
	 set user_name to "Ben"
	 say_hello(user_name) 
	 display dialog ("Goodbye " & user_name & "!")
 end run

 on say_hello(user_name)
	 set user_name to "Jane"
	 display dialog ("Hello " & user_name & "!")
 end say_hello


