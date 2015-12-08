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
{{match}}% Music Match with Brad
<hr/>
<table border="1">
%for row in rows:
	<tr>
	<td>{{row}}</td><td><a href="compare/suggest/{{row}}">></a></td>
	</tr>
%end
</table>
<hr/>

