#!/usr/bin/python

from bottle import default_app, run, route
from bottle import get, put, post, request, template
from bottle import static_file
from tinydb import TinyDB, where
from compare import *

db = TinyDB('db.json')
compare_db = TinyDB('brad_db.json')
wishlist_db = TinyDB('wishlist_db.json')

@get('/')
def welcome():
	return template('home_view') 

@post('/')
def post_search():
	name = request.forms.get('name', '').strip()
	return search(name)

@get('/search')
def search():
	didSearch = False
	return template('list_view', rows=[], search_name="", didSearch=didSearch)
@get('/search/<name>')
def search(name):
	didSearch = True
	results = db.search(where('artist').contains(name.title()))
	return template('list_view', rows=results, search_name=name, didSearch=didSearch)

@get('/wishlist')
def wish_list():
	wishlist = wishlist_db.all()
	return template('wish_view', wish_rows=wishlist) 

@get('/delete/<id:int>')
@post('/delete/<id:int>')
def delete(id):
	wishlist = wishlist_db.all()
	remove_from_wishlist(wishlist[id])
	return wish_list()
	
@get('/compare')
def compare():
	artists = make_artist_unique(db)
	artists_to_compare = make_artist_unique(compare_db)
	related = related_artists(artists, artists_to_compare)
	match = "%.2f"%((float(len(related))/len(artists))*100)
	return template('compare_view', rows=related, match=match)
	
@get('/compare/suggest/<name>')
def suggest(name):
	suggestions = suggest_songs(name, db, compare_db)
	return template('suggest_view', rows=suggestions, artist=name)
	
@get('/add/<name>/<id:int>')
def add(name,id):
	suggestions = suggest_songs(name, db, compare_db)
	add_to_wishlist(suggestions[id])
	return suggest(name)

@route('/<filename:path>')
def send_static(filename):
	return static_file(filename, root='static/')

if __name__ == "__main__":
	run(reloader = True, host="0.0.0.0")
else:
	application = default_app()
	

