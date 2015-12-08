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
Suggestions for {{artist}}
<hr/>
<table border="1">
%count = 0
%for row in rows:
	<tr>
		<td>{{row['song']}}</td><td><a href="/add/{{artist}}/{{count}}">+</a></td>
	</tr>
	%count = count + 1
%end
</table>
<hr/>

