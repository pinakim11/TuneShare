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
<link rel="stylesheet" href="../css/normalize.css">
<link rel="stylesheet" href="../css/skeleton.css">

<!-- Favicon
–––––––––––––––––––––––––––––––––––––––––––––––––– -->
<link rel="icon" type="image/png" href="images/favicon.png">


<div class="container">
	<div class="row">
		<div class="one-full column" style="margin-top: 5%">
<br />

<h1><font color= #A5AFBE>Tune</font><a href="/">SHARE</a></h1>

<a class="button button-primary" href="/search">Search</a>
<a class="button button-primary" href="/compare">Compare</a>
<a class="button button-primary" href="/wishlist">Wishlist</a>

<!-- TEMPLATE BELOW
–––––––––––––––––––––––––––––––––––––––––––––––––– -->

<hr/>

<form action="/" method="post">
	Artist: <input name="name" type="text" />
	<input value="Search" type="submit" />
</form>

<hr/>
%if (didSearch):
	<font size="5", color=#33C3F0>{{len(rows)}}</font>&nbsp;{{"  Results for "}}{{search_name}}
%else: 
	{{"Try Searching an Artist!"}}
%end
<hr/>
<table border="0">
%for row in rows:
	<tr>
	<td>{{row['song']}}</td>
	</tr>
%end
</table>
<hr/>

		</div>
	</div>
</div>

</html>

