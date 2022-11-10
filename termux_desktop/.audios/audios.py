import os
from gtts import gTTS
os.system('clear')
buscar = input('escribe lo que quieres que diga el audio: ')
nombrar = input('como nombraras el mp3: ')
tts = gTTS(buscar , lang='es-us')
tts.save(nombrar)

