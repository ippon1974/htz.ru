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

@print[color]
<div id="tehnosale">
<h2 id="anchorlist"><strong><em>Подобрать камень по цвету</em></strong></h2>
</div>
<ul class="listing">
^untaint[as-is]{
	^color.menu{
          ^print_cell[]
	}
}</ul>
#end @printArticlesShow[]


@print_cell[]
^if($color.id eq $color.last_insert_id){
$result[
<li>
<dl>
<dt><a href="/stone/color/cell/$color.id/" title="$color.name_ru"><img src="/stone/img/i/c/$color.img" alt="$color.name_ru" /></a> <a href="/stone/color/cell/$color.id/" title="$color.name_ru">$color.name_ru</a> (<em>$color.name_en</em>)</dt>
</dl>
</li>]
}{
$result[
<li>
<dl>
<dt></dt>
<dd><a href="/stone/color/cell/$color.id/" title="$color.name_ru">$color.name_ru</a></dd>
</dl>
</li>]
}
#@print_all_call[]


@Item[color]
<div id="tehnobody">
^untaint[as-is]{
	^if(def $color.name_ru){<h2>^color.name_ru.match[[\[\]]][g]{}</h2>}
	^listC[]
}</div>
#end @printArticleItem[]


@listC[]
$select[^get[]]
$cell[^select.select($select.color_id==$form:id)]
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
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$cell.flag" alt="" /> <a href="/stone/country/cell/$cell.country_id/">$cell.country_ru</a></dd>
<dd>Классификация: <a href="/stone/classification/cell/$cell.classification_id/">$cell.classification_ru</a></dd>
<dd>Цвет: <em>$cell.color_ru</em></dd>
</dt>	
</dl>
</li>]
}{
$result[
<li>
<dl>
<dt>^if(def $cell.name_en){<a href="/stone/all/select/$cell.id/">^cell.name_en.match[[\[\]]][g]{}</a>}{<a href="/stone/all/select/$cell.id/">$cell.name_en</a>}</dt>
<span style="font-weight: bold^; color: #9A9A9A^; font-size: 0.8em^; font-style: italic^;">Номер для заказа  #$cell.id</span>					
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$cell.flag" alt="" /> <a href="/stone/country/cell/$cell.country_id/">$cell.country_ru</a></dd>
<dd>Классификация: <a href="/stone/classification/cell/$cell.classification_id/">$cell.classification_ru</a></dd>
<dd>Цвет: <em>$cell.color_ru</em></dd>
</dl>
</li>]
}
#@listClass[]



@html_color[]
^if(!def $form:id){
	$color[^getColor[
	$.limit(13)
	$.offset(0)
	]]
	^if($color){
		^print[$color]
	}{
		<p>Не найдено.</p>
	}
}{
	^rem{ *** $form:id определена: достаем и показываем новость с выбранным id *** }
	$color[^getColor[$.id(^form:id.int(0))]]
	^if($color){
		^Item[$color]
	}{
		^rem{ *** указали такую id, новости с которой не существует... посылаем посетителя на... 404 ошибку. *** }
		^Lib:location[/404/]
	}
}
#@@html_all[]


@printtitle[title]
^if(!def $form:id){
$result[Подобрать камень по цвету]
}{
$result[$title.name_ru ($title.name_en)]
}
#@printtitle[]

@title[]
^if(!def $form:id){
	$title[^getColor[$.id(0)]]
	^if($title){$result[^printtitle[$title]]}
}{
	$title[^getColor[
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
	$description[^getColor[$.id(0)]]
	^if($description){$result[^printdescription[$description]]}
}{
	$description[^getColor[
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
	$keywords[^getColor[$.id(0)]]
	^if($keywords){$result[^printkeywords[$keywords]]}
}{
	$keywords[^getColor[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($keywords){$result[^printkeywords[$keywords]]
	}
}
#@description[]