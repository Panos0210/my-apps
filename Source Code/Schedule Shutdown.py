import os
os.system('shutdown /a')
shut = input('Is it shutdown or restart (s, r): ')
time = int(input('Enter time to shutdown: '))
type = input('Is it in hours, minutes or seconds (h, m, s): ')

shut =shut.lower()
type = type.lower()

if type == 'h':
    time = (time * 60) * 60
elif type == 'm':
    time = time * 60

if shut == 's':
    command = f'shutdown /s /t {time} /f'
    os.system(command)
elif shut == 'r':
    command = f'shutdown /r /t {time} /f'
    os.system(command)
else:
    print('Choose s or r for shutdown or restart!')
