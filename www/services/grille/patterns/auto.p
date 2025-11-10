@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

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


@title[]
$title[^table::load[/_root.cfg]]
^if(^title.locate[uri;$request:uri]){ 
$result[$title.title]
}{ 
$result[]
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

@navi_sub_nav[]
 $navi_sub_nav[^table::load[/services/cutting/materials_list.cfg]]
    ^if(^navi_sub_nav.locate[uri;$request:uri]){<div style="margin: 0 0 0.8em 0^; font-size: 1.2em^;"><a href="/services/cutting/" title="Услуги гидроабразивной резки">Услуги гидроабразивной резки</a> / <strong>$navi_sub_nav.nameletter</strong></div>}{} 
#@navi_sub_nav[]

@patterns_list[]
$showPatterns[^db::getWaterjetPatterns[]]
<div class="patterns">
^showPatterns.menu{<ins class="pattern"><div class="r"><a href="/services/grille/patterns/detal/id/$showPatterns.id/"><img src="/img/services/grille_factory/patterns/f/${showPatterns.id}_1.jpg" alt="Шаблон для декоративной решетки $showPatterns.pattern_name_ru" border="0" /></a><span class="sptxt"><a title="Шаблон для декоративной решетки $showPatterns.pattern_name_ru" href="/services/grille/patterns/detal/id/$showPatterns.id/">$showPatterns.pattern_name_ru ($showPatterns.pattern_name_en)</a> <strong># $showPatterns.id</strong></span></div></ins>}
</div>
#@patterns_list[]


@pattern_secondary[]
$pattern_id[^db::getWaterjetPatterns[$.id(^form:id.int(0))]]
<div id="secondary_id">
<h3>Шаблоны</h3>
   $patterns[^db::getWaterjetPatterns[]]
   <ul id="section_id">
    ^patterns.menu{
	  <li><a href="/services/grille/patterns/detal/id/$patterns.id/" title="${patterns.pattern_name_ru}. Шаблон решетки.">$patterns.pattern_name_ru</a></li>
	 }
   </ul>

</div>
#@works_secondary[]
