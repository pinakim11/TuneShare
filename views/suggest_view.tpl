<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
–––––––––––––––––––––––––––––––––––––––––––––––––– -->
<meta charset="utf-8">
<title>TuneSHARE</title>
<meta name="description" content="Personal Website">
<meta name="author" content="Wes Delp">

<!-- Mobile Specific Metas
–––––––––––––––––––––––––––––––––––––––––––––––––– -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- FONT
–––––––––––––––––––––––––––––––––––––––––––––––––– -->
<link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">

<!-- CSS
–––––––––––––––––––––––––––––––––––––––––––––––––– -->
<link rel="stylesheet" href="/css/normalize.css">
<link rel="stylesheet" href="/css/skeleton.css">

<!-- Favicon
–––––––––––––––––––––––––––––––––––––––––––––––––– -->
<link rel="icon" type="image/png" href="images/favicon.png">


<div class="container">
	<div class="row">
		<div class="one-full column" style="margin-top: 5%">
<br />

<h1><font color= #A5AFBE>Tune</font><a href="/">SHARE</a></h1>

<a class="button button-primary" href="/compare">&lt; Back to Results</a>
<a class="button button-primary" href="/wishlist">Wishlist</a>

<!-- TEMPLATE BELOW
–––––––––––––––––––––––––––––––––––––––––––––––––– -->

<hr/>
Suggestions for: <h5><font color=#33C3F0>{{artist}}</font></h5>
<hr/>
<table border="0">
%count = 0
<thead>
	<tr>
		<th>Song</th>
		<th>Add to Wishlist</th>
	</tr>
</thead>
%for row in rows:
	<tr>
		<td>{{row['song']}}</td><td><center><a href="/add/{{artist}}/{{count}}"><img src="/images/add.png" style="width:18px;height:18px;border:0;"/></a></center></td>
	</tr>
	%count = count + 1
%end
</table>
<hr/>

</html>

