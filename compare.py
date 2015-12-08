#!/usr/bin/python

from tinydb import TinyDB, where

db = TinyDB('db.json')
compare_db = TinyDB('brad_db.json')
wishlist_db = TinyDB('wishlist_db.json')

# Takes:   music database
# Returns: set of unique artists
def make_artist_unique(db):
	data = db.all()
	artists = []

	for song in data:
		artists.append(song['artist'])
	
	unique = set(artists)
	return unique

# Takes:   two sets of unique artists
# Returns: intersection of two sets
def related_artists(first_set, second_set):
	return first_set & second_set

# Takes:   artist, databases
# Returns: songs json object
def suggest_songs(artist, db, compare_db):
	songs = []
	songs_compare = []
	songs_suggest = []
	
	data = db.search(where('artist') == artist)
	data_compare = compare_db.search(where('artist') == artist)
	
	for song in data:
		songs.append(song)
		
	for song in data_compare:
		songs_compare.append(song)
		
	for suggest in songs_compare:
		found = suggest in songs
		if (found == False):
			songs_suggest.append(suggest)
			
	return songs_suggest

def add_to_wishlist(song):
	wishlist_db.insert({'song': song['song'], 'artist': song['artist']})
	
def remove_from_wishlist(song):
	wishlist_db.remove((where('song') == song['song']) & (where('artist') == song['artist']))

def main():

	'''
	artists = make_artist_unique(db)
	artists_to_compare = make_artist_unique(compare_db)

	related = related_artists(artists, artists_to_compare)

	print "%.2f"%((float(len(related))/len(artists))*100),"% Match"
	
	
	print "============================================="
	for artist in related:
		print artist
	print "============================================="	

	
	#artist = "Afrojack"
	
	for artist in related:
		suggestions = suggest_songs(artist, db, compare_db)
		
		if (len(suggestions) > 0):
			print "\n============================================="
			print "Suggestions by",artist 
			print "============================================="
			for song in suggestions:
				remove_from_wishlist(song)
	
	'''
if __name__ == "__main__":
	main()

