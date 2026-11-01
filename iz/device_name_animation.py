import os

device_name = "set device name"
limitstop = 40
limit = 0
flipper = 1
while True:
	os.system('cls')
	os.system(f"figlet \"{" " * limit + device_name}\" | lolcat")
	limit += 1*flipper
	if limit > limitstop:
		flipper = flipper *-1
	if limit == 0:
		flipper = flipper *-1 
