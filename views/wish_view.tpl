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

<hr/>
Wishlist
<hr/>
<table border="1">
%count = 0
%for row in wish_rows:
	<tr>
	<td>{{row['song']}}</td><td>{{row['artist']}}</td><td><a href="/delete/{{count}}">X</a></td>
	</tr>
	%count = count + 1
%end
</table>
<hr/>

