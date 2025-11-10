@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[]::^description[]" />
<meta name="keywords" content="^title[]::^keywords[]" />

<script type="text/javascript" src="/js/jquery.min.js"> </script>
<script type="text/javascript" src="/js/main.js"> </script>

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="stoneinfo">

@print[country]
<div id="tehnosale">
<h2 id="anchorlist"><strong><em>Страны импортеры природного камня</em></strong></h2>
</div>
<ul class="listing">
^untaint[as-is]{
	^country.menu{
          ^print_cell[]
	}
}</ul>
#end @printArticlesShow[]


@print_cell[]
^if($country.id eq $country.last_insert_id){
$result[
<li>
<dl>
<dt></dt>
<dd><img src="/stone/img/i/$country.flag" alt="" /> <a href="/stone/country/cell/$country.id/" title="$country.name_ru">$country.name_ru</a> (<em>$country.name_en</em>)</dd>
</dl>
</li>]
}{
$result[
<li>
<dl>
<dt></dt>
<dd><img src="/stone/img/i/$country.flag" alt="" /> <a href="/stone/country/cell/$country.id/" title="$country.name_ru">$country.name_ru</a> (<em>$country.name_en</em>)</dd>
</dl>
</li>]
}
#@print_all_call[]


@Item[country]
<div id="tehnobody">
^untaint[as-is]{
	^if(def $country.name_ru){<h2>^country.name_ru.match[[\[\]]][g]{}</h2>}
	^listC[]
}</div>
#end @printArticleItem[]


@listC[]
$select[^get[]]
$cell[^select.select($select.country_id==$form:id)]
<ul class="listing">
^untaint[as-is]{
	^cell.menu{
          ^listClass_cell[]
	}
}</ul>

@listClass_cell[]
^if($cell.id eq $cell.last_insert_id){
$result[
<li>
<dl>
<dt><a href="/stone/all/select/$cell.id/"><img src="/stone/img/small/$cell.img_small" alt="^if(def $cell.name_en){^cell.name_en.match[[\[\]]][g]{}}{$cell.name_en}" /></a> ^if(def $cell.name_en){<a href="/stone/all/select/$cell.id/">^cell.name_en.match[[\[\]]][g]{}</a>}{<a href="/stone/all/select/$cell.id/">$cell.name_en</a>}
<span style="font-weight: bold^; color: #9A9A9A^; font-size: 0.8em^; font-style: italic^;">Номер для заказа  #$cell.id</span>
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$cell.flag" alt="" />$cell.country_ru</dd>
<dd>Классификация: <a href="/stone/classification/cell/$cell.classification_id/">$cell.classification_ru</a></dd>
^if(def $cell.color_id){<dd>Цвет: <a href="/stone/color/cell/$cell.color_id/">$cell.color_ru</a></dd>}{}
</dt>	
</dl>
</li>]
}{
$result[
<li>
<dl>
<dt>^if(def $cell.name_en){<a href="/stone/all/select/$cell.id/">^cell.name_en.match[[\[\]]][g]{}</a>}{<a href="/stone/all/select/$cell.id/">$cell.name_en</a>}</dt>
<span style="font-weight: bold^; color: #9A9A9A^; font-size: 0.8em^; font-style: italic^;">Номер для заказа  #$cell.id</span>					
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$cell.flag" alt="" /> $cell.country_ru</dd>
<dd>Классификация: <em><a href="/stone/classification/cell/$cell.classification_id/">$cell.classification_ru</a></em></dd>
^if(def $cell.color_id){<dd>Цвет: <a href="/stone/color/cell/$cell.color_id/">$cell.color_ru</a></dd>}{}
</dl>
</li>]
}
#@listClass[]


@html_country[]
^if(!def $form:id){
	$country[^getCountry[
	$.limit(61)
	$.offset(0)
	]]
	^if($country){
		^print[$country]
	}{
		<p>Не найдено.</p>
	}
}{
	^rem{ *** $form:id определена: достаем и показываем новость с выбранным id *** }
	$country[^getCountry[$.id(^form:id.int(0))]]
	^if($country){
		^Item[$country]
	}{
		^rem{ *** указали такую id, новости с которой не существует... посылаем посетителя на... 404 ошибку. *** }
		^Lib:location[/404/]
	}
}
#@@html_all[]


@printtitle[title]
^if(!def $form:id){
$result[Страны импортеры природного камня]
}{
$result[$title.name_ru ($title.name_en)]
}
#@printtitle[]

@title[]
^if(!def $form:id){
	$title[^getCountry[$.id(0)]]
	^if($title){$result[^printtitle[$title]]}
}{
	$title[^getCountry[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($title){$result[^printtitle[$title]]
	}
}
#@title[]

@printdescription[description]
^if(!def $form:id){
$result[]
}{
$result[^description.description.trim[]]
}
#@printtitle[]

@description[]
^if(!def $form:id){
	$description[^getCountry[$.id(0)]]
	^if($description){$result[^printdescription[$description]]}
}{
	$description[^getCountry[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($description){$result[^printdescription[$description]]
	}
}
#@description[]

@printkeywords[description]
^if(!def $form:id){
$result[]
}{
$result[$keywords.keywords]
}
#@printtitle[]

@keywords[]
^if(!def $form:id){
	$keywords[^getCountry[$.id(0)]]
	^if($keywords){$result[^printkeywords[$keywords]]}
}{
	$keywords[^getCountry[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($keywords){$result[^printkeywords[$keywords]]
	}
}
#@description[]