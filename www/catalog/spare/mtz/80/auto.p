@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[] | Запчасти МТЗ-80 | МТЗ Запчасти</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[] | ^description[]" />
<meta name="keywords" content="^title[] | ^keywords[]" />

<script type="text/javascript" src="/js/jquery.min.js"> </script>
<script type="text/javascript" src="/js/main.js"> </script>

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>

<style type="text/css" media="all">
a {
	text-decoration: none;
}
a:visited {
	color: Purple;
	text-decoration: none;
}
</style>


</head>


<body class="spare">

@title[]
$title[^table::load[/_root.cfg]]
^if(^title.locate[uri;$request:uri]){ 
	$result[$title.title]
}{ 
	$result[^title_id[]]
} 
#@title[]


@description[]
$description[^table::load[/_root.cfg]]
^if(^description.locate[uri;$request:uri]){ 
	$result[$description.description]
}{ 
	$result[]
} 
#@description[]

@keywords[]
$keywords[^table::load[/_root.cfg]]
^if(^keywords.locate[uri;$request:uri]){ 
	$result[$keywords.keywords]
}{ 
	$result[]
} 
#@keywords[]

@getCategories[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		categoryID AS id,
		name,
		parent,
		patch
	FROM
		MTZ_categories
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND categoryID = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getCategories[]

@menuCategories[]
$categories[^getCategories[]]
$categories_select[^categories.select($categories.parent == 0)]
 ^if($categories_select){
 <ul>
       ^categories_select.menu{<li><a href="$categories_select.patch" title = "$categories_select.name">$categories_select.name</a></li>}
 </ul>}{
 
 }
#@menuCatalog[]


@getProducts[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		productID AS id,
		categoryID,
		name,
		description,
		customers_rating,
		Price,
		picture,
		in_stock,
		thumbnail,
		enabled,
		list_price,
		product_code
	FROM
		MTZ_products
	WHERE
	     enabled = 1
		^if(^hParam.id.int(0)){
		 AND productID = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getProducts[]

@nav_nomenclature[]
$sections[^table::load[/catalog/mtz/nomenclature.cfg]]
<ul id="section_id">
 ^sections.menu{ 
      ^nav_nomenclature_cell[]
   } 
</ul>

@nav_nomenclature_cell[] 
^if($sections.uri eq $request:uri){
<li class="$sections.section_id">$sections.name</li>
}{ 
<li class="$sections.section_id"><a href="$sections.uri">$sections.name</a></li>
}
#end @nav_nomenclature_cell[] 
