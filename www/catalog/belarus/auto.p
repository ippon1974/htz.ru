@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[] | " />
<meta name="keywords" content="^title[] | " />

<link rel="stylesheet" type="text/css" href="/css/callback_mini.css">
<link rel="stylesheet" type="text/css" href="/css/callback.css">

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />

</head>
<body class="events">
#end@header[]

@title[]
 $title[^table::load[/_root.cfg]]
  ^if(^title.locate[uri;$request:uri]){$result[$title.title]}{}
#@title[]

@menu_a_agromash[]
 $menu_a_agromash[^table::load[/catalog/belarus/menu_about_agromash.cfg]]
  <ul>
   ^menu_a_agromash.menu{
     ^menu_a_agromash_cell[]
   }
  </ul>
#@menu_a_agromash[]

@menu_a_agromash_cell[]
^if($menu_a_agromash.is_published){
 ^if($menu_a_agromash.uri eq $request:uri){
<li><strong>$menu_a_agromash.name</strong></li>
}{ 
<li><a href="$menu_a_agromash.uri">$menu_a_agromash.name</a></li>
}
}{}
#@menu_a_agromash_cell[]


@navi_sub_nav[]
 $navi_sub_nav[^getMachines[]]
    ^if(^navi_sub_nav.locate[id;$form:id]){<div style="margin: 0 0 0.8em 0^; font-size: 1.5em^;"><a href="/catalog/belarus/agromash/mashine/$navi_sub_nav.classification_sub_sub_uri/">$h_Machines.classification.[$navi_sub_nav.classification]</a></div>}{} 
#@navi_sub_nav[]



















