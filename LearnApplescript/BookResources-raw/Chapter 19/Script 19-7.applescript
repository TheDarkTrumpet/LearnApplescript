script A
	property x : " says hi!"

	on say_hello()
		display dialog "Script A" & x
	end say_hello
end script

script B
	property parent : A

	on say_hello_again()
		display dialog "Script B" & x
	end say_hello_again
end script

tell B to say_hello() -- This works
tell B to say_hello_again() -- This errors


