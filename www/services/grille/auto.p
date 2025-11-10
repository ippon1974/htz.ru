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

@grille_list[]
^hWaterjetGrille[]
$showGrille[^db::getGrille[]]
$showPatterns[^db::getWaterjetPatterns[]]
<p>Компания &laquo^;Civek Water Jet&raquo^; предлагает Вам свои услуги по производству декоративных решеток из различных материалов.</p>
<p>Калькулятор вентиляционных решеток (<a href="http://airconcept.ru/catalog/grills" target="_blank">airconcept.ru</a>)</p>
<ul class="listing">
^showGrille.menu{
<li>
<dl>
<dt><a href="/services/grille/detal/id/$showGrille.id/" title="$showGrille.grille_name"><img src="/img/services/grille_factory/grille/f/${showGrille.id}_1.jpg" alt="$showGrille.grille_name" /></a> <a href="/services/grille/detal/id/$showGrille.id/" title="$showGrille.grille_name">$showGrille.grille_name</a></dt>							
<dd><p><strong>Вид</strong>: <span class="listinglower">${h_waterjet_grille.grille_type_id_short.[$showGrille.grille_type_id]}</span>. <strong>Материал</strong>: <span class="listinglower">${h_waterjet_grille.material_name_ru.[$showGrille.grille_material_id]}</span>. ^if(^showPatterns.locate[id;$showGrille.grille_patterns_id]){<strong>Шаблон</strong>: $showPatterns.pattern_name_ru}{}</p></dd>					
</dl>
</li>
}
</ul>
#@grille_list[]

@patterns_secondary[]
$pattern_id[^db::getWaterjetPatterns[$.id(^form:id.int(0))]]
<h3>Шаблоны</h3>
$patterns[^db::getWaterjetPatterns[]]
   <ul id="section_id">
    ^patterns.menu{
	 ^if($patterns.id == $form:id){
	 <li><strong>$patterns.pattern_name_en</strong></li>
	 }{
	  <li><a href="/services/grille/patterns/detal/id/$patterns.id/" title="${patterns.pattern_name_en}. Шаблон для декоративной решетки.">$patterns.pattern_name_en</a></li>
	 }

	}
   </ul>
#@patterns_secondary[]


@grille_type_secondary[]
$works_id[^db::getWaterjetWorks[$.id(^form:id.int(0))]]
<h3>Виды решеток</h3>
$works[^db::getWaterjetWorks[]]
#$works_select[^works.select($works.work_materials_type_id==$works_id.work_materials_type_id)] 
   
   <ul id="section_id">
    ^works.menu{
	 ^if($works.id == $form:id){
	 <li><strong>$works.work_title_short</strong></li>
	 }{
	  <li><a href="/services/cutting/works/detal/id/$works.id/" title="${works.work_title_short}. Гидроабразив.">$works.work_title_short</a></li>
	 }

	}
   </ul>
#@grille_type_secondary[]
