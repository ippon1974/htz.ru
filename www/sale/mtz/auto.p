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

@menu_namenklatura[]
  $menu_namenklatura[^getMachines[]]
   $menu_namenklatura_brand[^menu_namenklatura.select($menu_namenklatura.brand_id==9)]
   <h3>Номенклатура</h3>
   <ul id="section_id">
    ^menu_namenklatura_brand.menu{
           <li class=""><a href="/catalog/mtz/detal/id/$menu_namenklatura_brand.id/">$menu_namenklatura_brand.namenklatura</a></li>
}
   </ul>
#@menu_namenklatura[]

@newPrice[]
 ^MTZ[]
#@newPrice[]















