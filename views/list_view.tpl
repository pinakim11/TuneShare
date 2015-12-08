<!-- TOP BANNER -->
<h1>Wes' Music Collection</h1>

<form action="/" method="get">
	<input value="Search" type="submit" />
</form>

<form action="/compare" method="get">
	<input value="Compare" type="submit" />
</form>

<form action="/wishlist" method="get">
	<input value="Wishlist" type="submit" />
</form>
<!-- END TOP BANNER -->

<p>Search Music</p>
<form action="/" method="post">
	Artist: <input name="name" type="text" />
	<input value="Search" type="submit" />
</form>

<hr/>
%if (len(rows) > 0):
	{{len(rows)}}{{" Results for "}}{{search_name}}
%else: 
	{{search_name}}
%end
<hr/>
<table border="1">
%for row in rows:
	<tr>
	<td>{{row['song']}}</td>
	</tr>
%end
</table>
<hr/>

