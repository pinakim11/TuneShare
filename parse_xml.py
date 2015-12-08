#!/usr/bin/python

import plistlib
from tinydb import TinyDB
from compare.py import *

itunes_xml = plistlib.readPlist('BradiTunesMusicLibrary.xml')
db = TinyDB('brad_db.json')

library = []

# Parse through XML file and store Song and Artist in library as tuple
for track in itunes_xml['Tracks']:
	info = itunes_xml['Tracks'][track]
	
	# Handle situation where no artist is specified
	try:
		library.append((info['Name'],info['Artist']))
	except:
		library.append((info['Name'],'None'))

# Build TinyDB database using library
for track in library:
	db.insert({'song': track[0], 'artist': track[1]})

