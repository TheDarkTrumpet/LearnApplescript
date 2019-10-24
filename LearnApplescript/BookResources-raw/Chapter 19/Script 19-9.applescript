script A
	on say_hello()
		display dialog "Script A says hi!"
	end say_hello
end script

script B
	property parent : A

	on say_hello()
		continue say_hello()
		display dialog "Script B says hi!"
	end say_hello
end script

tell B to say_hello()


