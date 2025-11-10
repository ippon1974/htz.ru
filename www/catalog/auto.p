@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^nav_title[]</title>

<meta name='yandex-verification' content='4fef9008e58102b3' />
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^nav_title[] | Сельскохозяйственная техника, спецтехника заводов: ХТЗ, МТЗ, ВТЗ, ЮМЗ. Доставка дорожно-строительной техники из Китая: бульдозеры, фронтальные погрузчики, бетононасосы, вилочные погрузчики, дорожные катки, грейдеры." />
<meta name="keywords" content="^nav_title[] | Китайские бульдозеры, погрузчики, экскаваторы, китайские катки, xcmg, shantui, foton, shehwa, бульдозеры SHANTUI, бульдозеры Китай, SANY, ZOOMLION, бетононасосы, фронтальные погрузчики XCMG, бульдозеры SHEHWA." />

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="events ^nav_body[]">


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
<li class="$cell.section_id">$cell.name</li>
}{ 
<li class="$cell.section_id"><a href="$cell.uri">$cell.name</a></li>
}
#end @get_archive_cell[]


@get_archive_footer[] 
$archive_footer[^table::load[/catalog/agroimport/nomenclature.cfg]]
$cell_footer[^archive_footer.select($archive_footer.archive==1)]
$cell_footer_type[^cell_footer.select($cell_footer.type==1)]
<h4>Тракторы &laquo;Агроимпорт&raquo;</h4>
<ul id="section_id">
   ^cell_footer_type.menu{
       ^get_archive__footer_cell[] 
}</ul>
#end @get_archive[] 

@get_archive__footer_cell[] 
^if($cell_footer_type.uri eq $request:uri){
<li class="$cell_footer_type.section_id"><strong>$cell_footer_type.name_detal</strong></li>
}{ 
<li class="$cell_footer_type.section_id"><a href="$cell_footer_type.uri" title="$cell_footer_type.name_detal">$cell_footer_type.name_detal</a></li>
}
#end @get_archive_cell[]

@get_archive_footerSp[] 
$archive_footer[^table::load[/catalog/agroimport/nomenclature.cfg]]
$cell_footer[^archive_footer.select($archive_footer.archive==1)]
$cell_footer_type[^cell_footer.select($cell_footer.type==2)]
<h4>Спецтехника &laquo;Агроимпорт&raquo;</h4>
<ul id="section_id">
   ^cell_footer_type.menu{
       ^get_archive__footerSp_cell[] 
}</ul>
#end @get_archive[] 

@get_archive__footerSp_cell[] 
^if($cell_footer_type.uri eq $request:uri){
<li class="$cell_footer_type.section_id"><strong>$cell_footer_type.name_detal</strong></li>
}{ 
<li class="$cell_footer_type.section_id"><a href="$cell_footer_type.uri" title="$cell_footer_type.name_detal">$cell_footer_type.name_detal</a></li>
}
#end @get_archive_cell[]


@nav_title[]
$cell[^table::load[/catalog/nav.cfg]]
^if(^cell.locate[uri;$request:uri]){
$result[^cell.name.trim[]]
}{
$result[]
}
#end @nav_title[]

@nav_body[]
$cell[^table::load[/catalog/nav.cfg]]
^if(^cell.locate[uri;$request:uri]){
$result[^cell.class.trim[]]
}{
$result[]
}
#end @nav_body[]