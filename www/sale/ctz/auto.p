@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[] | Стоимость техники на текущей момент завода: ХТЗ" />
<meta name="keywords" content="^title[] | Скачать прайс-листы: SANY, SHANTUI, XCMG, BONNY, CHANG LIN, HONGDA, SHEHWA, ZOOMLION, МТЗ, ХТЗ" />

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />

</head>
#@header[]

@title[]
 $title[^table::load[/_root.cfg]]
   ^if(^title.locate[uri;$request:uri]){$result[$title.title]}{$result[Прайс-лист]}
#@title[]

@nav_nomenclature[]
$sections[^table::load[/catalog/ctz/nomenclature.cfg]]
<h3>Номенклатура</h3>
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

@newPrice[]
 ^CTZ[]
#@newPrice[]















