@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^description[]" />
<meta name="keywords" content="^keywords[]" />

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />

<style type="text/css" media="screen">

.list ol {
	list-style: none;
}
.list li {
	font-size: 0.8em;
}
.list td {
	font-size: 0.9em;
}

.slist ol {
	list-style: none;
}
.slist li {
	font-size: 0.7em;
}
.slist td {
	font-size: 0.8em;
}

</style>
</head>

@utility[]
<body class="events competitions">
<ul id="skip">
<li><a href="#navigation" title="Пропустить навигацию">Пропустить навигацию</a></li>
</ul>
	
<div id="headerwrap">
<div id="header">
			
<ul id="utility">
<li><a href="/about/contact/" title="Контакты">Контакты</a></li>
<li><a href="/news/" title="Новости">Новости</a></li>
<li id="glossary"><span><a href="/catalog/spare/" title="Каталог запчастей">Каталог запчастей</a></span></li>
<li><a href="/map/" title="Карта сайта">Карта сайта</a></li>
</ul>
			
<h1 title="Comhaltas"><a href="/" title="Стройпроектмонтаж"><img src="/i/logo.gif" alt="Стройпроектмонтаж" /></a></h1>
		
<ul id="languageswitch">
<li class="first">Русский</li>
<li><a href="/en/">English</a></li>
</ul>
			
</div>		
	
</div>	
	
<div id="searchwrapper">

<div id="search">
<form method="get" action="/cgi-bin/search/search.pl"  >
<div>
<input type="hidden" name="stpos" value="0" />
</div>

<p id="searchlabel"><label for="search_textbox">Поиск</label></p>
<dl>
<dt><input class="filled" type="text" id="search_textbox" name="query" value="Найти" tabindex="1" /></dt>
<dd><input type="image" src="/img/widgets/go_button.gif" alt="Поиск по сайту" tabindex="2" /></dd>
<dd><a href="http://spare.htz.ru/" title="Поиск по каталогу запчастей">Найти запчасть</a></dd>
</dl>
</form>
#end @utility[]


@nav_nomenclature[]
$sections[^table::load[/catalog/ctz/nomenclature.cfg]]
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

@id_select[]
$title[^table::load[/catalog/ctz/body.cfg]]
^if(^title.locate[uri;$request:uri]){
$result[^title.section_id.trim[]]
}{
$result[]
}
#end @id_select_cell[]

@nav_name_bul[]
$sections[^table::load[/catalog/ctz/bulldozers.cfg]]
<ul>
 ^sections.menu{
      ^nav_name_bul_cell[]
   }
</ul>

@nav_name_bul_cell[] 
^if($sections.uri eq $request:uri){
<li>$sections.name</li>
}{ 
<li><a href="$sections.uri">$sections.name</a></li>
}
#end @nav_name_bul[]

@money[amount]
$var[^table::load[/catalog/ctz/nomenclature.cfg]]
^if(^var.locate[uri;$request:uri]){
$text(^var.value.trim[])
$text_nds($text/6.55557)
<div class="value">Стоимость техники на ^dtf:format[%d.%m.%Y]<br /><strong>$var.name_detal</strong>: <span>^number_format[^text.format[%.2f];,;.](2)</span> руб.<br /><em>^int2str:money2str($text)</em><br />В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.<br />Производство: <strong>$var.production</strong><br />Страна: <strong>$var.country</strong><br />Наличие: <strong>$var.availability</strong><br />Стоянка: <strong>$var.parking</strong></div>
}{
$result[]
}
#ens@money[amount]


@get_tehno[]
$archive[^table::load[/catalog/agroimport/nomenclature.cfg]]
$cell[^archive.select($archive.archive==0)]
<ul id="section_id">
   ^cell.menu{
        ^get_tehno_cell[]
}</ul>
#end ]@get_tehno[] 

@get_tehno_cell[]
^if($cell.uri eq $request:uri){
<li class="$cell.section_id">$cell.name</li>
}{ 
<li class="$cell.section_id"><a href="$cell.uri">$cell.name</a></li>
}
#end @get_tehno_cell[]


@get_archive[] 
$archive[^table::load[/catalog/agroimport/nomenclature.cfg]]
$cell[^archive.select($archive.archive==1)]
<p style="color: #FF6347;"><strong><em>Техника снята с производства</em></strong></p>
<ul id="section_id">
   ^cell.menu{
       ^get_archive_cell[] 
}</ul>
#end @get_archive[] 

@get_archive_cell[] 
^if($cell.uri eq $request:uri){
<li>$cell.name</li>
}{ 
<li><a href="$cell.uri">$cell.name</a></li>
}
#end @get_archive_cell[]