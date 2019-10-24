script A
	on say_hello()
		display dialog "Script A says hi!"
	end say_hello
end script

script B
	property parent : A
end script

tell B to say_hello()


