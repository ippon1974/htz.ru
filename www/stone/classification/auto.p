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

@print[class]
<div id="tehnosale">
<h2 id="anchorlist"><strong><em>Классификация природного камня</em></strong></h2>
</div>
<ul class="listing">
^untaint[as-is]{
	^class.menu{
          ^print_cell[]
	}
}</ul>
#end @printArticlesShow[]


@print_cell[]
^if($class.id eq $class.last_insert_id){
$result[
<li>
<dl>
<dt><a href="/stone/classification/cell/$class.id/" title=""><img src="/stone/img/small/$class.img_small" alt="$class.name_en" width="75" height="75" /></a> <a href="/stone/all/select/$class.id/" title="$class.name_en">$class.name_ru</a></dt>
<dd>$class.description</dd>
</dl>
</li>]
}{
$result[
<li>
<dl>
<dt></dt>
<dd><a href="/stone/classification/cell/$class.id/"><strong>$class.name_ru</strong></a> (<em>$class.name_en</em>)</dd>
<dd>$class.description</dd>
</dl>
</li>]
}
#@print_all_call[]


@Item[class]
<div id="tehnobody">
^untaint[as-is]{
	^if(def $class.name_en){<h2>^class.name_ru.match[[\[\]]][g]{}</h2>}
	^listClass[]
}</div>
#end @printArticleItem[]

@listClass[]
$stone[^get[]]
$cell[^stone.select($stone.classification_id==$form:id)]
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
<dd>Классификация: $cell.classification_ru</dd>
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
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$cell.flag" alt="" /> <a href="/stone/country/cell/$cell.country_id/">$cell.country_ru</a></dd>
<dd>Классификация: <em>$cell.classification_ru</em></dd>
^if(def $cell.color_id){<dd>Цвет: <a href="/stone/color/cell/$cell.color_id/">$cell.color_ru</a></dd>}{}
</dl>
</li>]
}
#@listClass[]


@html_class[]
^if(!def $form:id){
	$class[^getClassification[
	$.limit(2)
	$.offset(0)
	]]
	^if($class){
		^print[$class]
	}{
		<p>Не найдено.</p>
	}
}{
	^rem{ *** $form:id определена: достаем и показываем новость с выбранным id *** }
	$class[^getClassification[$.id(^form:id.int(0))]]
	^if($class){
		^Item[$class]
	}{
		^rem{ *** указали такую id, новости с которой не существует... посылаем посетителя на... 404 ошибку. *** }
		^Lib:location[/404/]
	}
}
#@@html_all[]


@printtitle[title]
^if(!def $form:id){
$result[Классификация природного камня]
}{
$result[$title.name_ru ($title.name_en)]
}
#@printtitle[]

@title[]
^if(!def $form:id){
	$title[^getClassification[$.id(0)]]
	^if($title){$result[^printtitle[$title]]}
}{
	$title[^getClassification[
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
	$description[^getClassification[$.id(0)]]
	^if($description){$result[^printdescription[$description]]}
}{
	$description[^getClassification[
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
	$keywords[^getClassification[$.id(0)]]
	^if($keywords){$result[^printkeywords[$keywords]]}
}{
	$keywords[^getClassification[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($keywords){$result[^printkeywords[$keywords]]
	}
}
#@description[]