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
  $result[Шаблон ${title.pattern_name_ru} для производства декоративной решетки]
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
$navi_sub_nav[^db::getWaterjetPatterns[$.id(^form:id.int(0))]]
<div style="margin: 0 0 0.8em 0^; font-size: 1.2em^;"><a href="/services/grille/" title="Производство декоративных решеток">Производство декоративных решеток</a> / <a href="/services/grille/patterns/" title="Шаблоны для решеток">Шаблоны для решеток</a> / <strong>$navi_sub_nav.pattern_name_ru</strong></div>
#@navi_sub_nav[]

@detailPatterns[]
^if(def $form:id){
$Patterns[^db::getWaterjetPatternsASC[]]
$showPatterns[^db::getWaterjetPatterns[$.id(^form:id.int(0))]]
$nextLeft[^db::getNextLeft[$.id(^form:id.int(0))]]
$nextRight[^db::getNextRight[$.id(^form:id.int(0))]]
^navi_sub_nav[]
<h2>Шаблон &laquo^;${showPatterns.pattern_name_ru}&raquo^; для производства декоративной решетки</h2>
<h3>ID: $showPatterns.id</h3>
<div id="tehnobody">
    ^if(def $nextLeft.id){<span class="leftstr"><a style="text-decoration: none^; border-bottom: none^;" href="/services/grille/patterns/detal/id/$nextLeft.id/" title="Предыдущий шаблон">&#8592^;</a></span>}{}
    ^if(def $nextRight.id){<span class="rightstr"><a style="text-decoration: none^; border-bottom: none^;" href="/services/grille/patterns/detal/id/$nextRight.id/" title="Следующий шаблон">&#8594^;</a></span>}{}
    <div style="clear: left"></div>
    <p>^if(def $nextRight.id){<a href="/services/grille/patterns/detal/id/$nextRight.id/">}{<a href="/services/grille/patterns/detal/id/$Patterns.id/">}<img src="/img/services/grille_factory/patterns/b/${showPatterns.id}_1.jpg" alt="Шаблон для декоративной решетки $showPatterns.pattern_name_ru" /></a></p>
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
#@detailPatterns[]

@pattern_secondary[]
$pattern_id[^db::getWaterjetPatterns[$.id(^form:id.int(0))]]
<div id="secondary">

<h3>Шаблоны</h3>

   $patterns[^db::getWaterjetPatterns[]]
#$works_select[^works.select($works.work_materials_type_id==$works_id.work_materials_type_id)] 
   
   <ul id="section_id">
    ^patterns.menu{
	 ^if($patterns.id == $form:id){
	 <li><strong>$patterns.pattern_name_ru</strong></li>
	 }{
	  <li><a href="/services/grille/patterns/detal/id/$patterns.id/" title="${patterns.pattern_name_ru}. Шаблон решетки.">$patterns.pattern_name_ru</a></li>
	 }

	}
   </ul>

</div>
#@works_secondary[]