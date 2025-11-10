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
<body class="services b_grille four">
#end@header[]

@title[]
^if(def $form:id){
  $title[^db::getWaterjetPatterns[
  $.id(^form:id.int(0))
  ]]
  $result[Шаблон ${title.pattern_name_ru} для производство декоративной решетки]
}{}
#@title[]

@description[]
$description[^db::getWaterjetPatterns[$.id(^form:id.int(0))]]
$result[$description.pattern_description]
#@description[]

@keywords[]
$keywords[^db::getWaterjetPatterns[$.id(^form:id.int(0))]]
$result[$keywords.pattern_keywords]
#@description[]


@navi_sub_nav[]
^hWaterjetMaterials[]
$navi_sub_nav[^db::getGrille[$.id(^form:id.int(0))]]
<div style="margin: 0 0 0.8em 0^; font-size: 1.2em^;"><a href="/services/grille/" title="Производство декоративных решеток">Производство декоративных решеток</a> / <strong>$navi_sub_nav.grille_name</strong></div>
#@navi_sub_nav[]

@detailGrille[]
^if(def $form:id){
^hWaterjetGrille[]
$h_waterjetgrille_[$h_waterjet_grille]
$showGrille[^db::getGrille[$.id(^form:id.int(0))]]
$showPatterns[^db::getWaterjetPatterns[]]
$nextLeft[^db::getGrilleNextLeft[$.id(^form:id.int(0))]]
$nextRight[^db::getGrilleNextRight[$.id(^form:id.int(0))]]
^navi_sub_nav[]
<h2>$showGrille.grille_name</h2>
<p>Калькулятор вентиляционных решеток (<a href="http://airconcept.ru/catalog/grills" target="_blank">airconcept.ru</a>)</p>
<h3>ID: $showGrille.id</h3>
<div id="tehnobody">
	^if(def $showGrille.grille_desc){<h3>О работе</h3>^untaint[as-is]{$showGrille.grille_desc}}{}
	<dl id="info">
	        <dt>Технология:</dt>
			<dd>Гидроабразив</dd>
            <dt>Материал:</dt>
			<dd>$h_waterjetgrille_.material_name_ru.[$showGrille.grille_material_id]</dd>
			<dt>Вид:</dt>
			<dd>$h_waterjetgrille_.grille_type_id_short.[$showGrille.grille_type_id]</dd>
			^if(^showPatterns.locate[id;$showGrille.grille_patterns_id]){<dt>Шаблон:</dt><dd><a href="/services/grille/patterns/detal/id/$showPatterns.id/">$showPatterns.pattern_name_ru</a></dd>}{}
			<dt>Выполнена:</dt>
			<dd>^dtf:format[%d %h %Y; $showGrille.grille_delivery_dt]</dd>
	</dl>
	^if(def $nextLeft.id){<span class="leftstr"><a style="text-decoration: none^; border-bottom: none^;" href="/services/grille/detal/id/$nextLeft.id/" title="Предыдущая работа">&#8592^;</a></span>}{}
    ^if(def $nextRight.id){<span class="rightstr"><a style="text-decoration: none^; border-bottom: none^;" href="/services/grille/detal/id/$nextRight.id/" title="Следующая работа">&#8594^;</a></span>}{}
    <div style="clear: left"></div>
	$str[$showGrille.grille_img]
			$parts[^str.split[, ]]
			^if(def $str){
			^parts.menu{
			<p><a href="/img/services/grille_factory/grille/h/${parts.piece}.jpg" title="${showGrille.grille_name}. Решетка декоративная." target="_blank"><img src="/img/services/grille_factory/grille/b/${parts.piece}.jpg" alt="${showGrille.grille_name}. Решетка декоративная." /></a></p>
			}
			}{}
	</div>
}
<h3>Производство решеток</h3>
<p>Декоративная решетка может быть выполнена практически из любого материала.</p>
<p>К наиболее распространенным материалам при производстве декоративных решеток относятся: <strong>нержавеющая сталь</strong>, <strong>латунь</strong>, <strong>алюминий</strong>, <strong>природный</strong> и <strong>искусственный камень</strong>, <strong>дерево</strong>.</p>
<h3>Расположение производства</h3>
<p style="font-size: 1.3em^;">^my_adress_civekwaterjet[]</p>

<dl id="info">
            <dt>Регион:</dt>
			<dd>Москва и Московская область</dd>
			<dt>Телефон:</dt>
			<dd>^my_phone_waterjet[]</dd>
			<dt>Почта:</dt> 
			<dd>^my_email[]</dd>
			<dt>Режим работы</dt>
			<dd>Пн-Пт с 9:00 до 19:00</dd>
			</dl>
#@detailGrille[]

@grille_secondary[]
$grille_id[^db::getGrille[$.id(^form:id.int(0))]]
<div id="secondary">

<h3>Решетки</h3>

   $grille[^db::getGrille[]]
   <ul id="section_id">
    ^grille.menu{
	 ^if($grille.id == $form:id){
	 <li><strong>$grille.grille_name</strong></li>
	 }{
	  <li><a href="/services/grille/detal/id/$grille.id/" title="${grille.grille_name}. Шаблон решетки.">$grille.grille_name</a></li>
	 }

	}
   </ul>

</div>
#@grille_secondary[]