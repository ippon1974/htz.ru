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
<link rel="stylesheet" type="text/css" href="/services/makestone/css/style.css" media="all" />
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
$title[^db::getAglomerateTable[$.id(^form:id.int(0))]]
^if(def $title){ 
$result[Стол из агломерата $title.aglomerate_table_name]
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

@navi_center_id[name]
$navi_center_id[^db::getAglomerateTable[$.id(^form:id.int(0))]]
$result[<span style="background: #FFFFCC^;">Стол из $name $navi_center_id.aglomerate_table_name</span>]
#@navi_center_id[]

@tabletop_detail[item;name]
^hMakeStone[]
$detail_step_$item[^db::getAglomerateTable[$.id(^form:id.int(0))]
$step_$item[^db::getAglomerateStep[$.id(^form:id.int(0))]]
$windowsill_$item[^db::getAglomerateWindowsill[$.id(^form:id.int(0))]]
$tabletop_$item[^db::getAglomerateTableTop[$.id(^form:id.int(0))]]]
$slab_$item[^db::getAglomerateSlab[$.id(^form:id.int(0))]]

<div id="">
<h1>Стол из $name ${detail_step_$item.aglomerate_table_name}. Образец.</h1>
</div>

<div id="makestone_show_list">

<h3>Весь цикл от замера до монтажа на вашем объекте. Расчет полной стоимости работ. Собственное производство в Москве.</h3>

<a href="/services/makestone/table/$item/img/big/${detail_step_$item.aglomerate_table_img}.webp" target="_blank" title="Стол из $name $detail_step_$item.aglomerate_table_name"><img src="/services/makestone/table/$item/img/list/${detail_step_$item.aglomerate_table_img}.webp" alt="Ступень из $name $detail_step_$item.aglomerate_table_name" /></a>

<p>Работаем с юридическими и физическими лицами. Сотрудничаем со многими архитектурными и дизайнерскими компаниями Москвы</p>

<p class="send_email">Электронная почта для заказа: ^my_email[]</p>

<h3>Другие изделия из $name $detail_step_$item.aglomerate_table_name</h3>

<ul>
<li><a href="/services/makestone/tabletop/$item/detail/id/$tabletop_$item.id/" title="Столешница из $name $tabletop_$item.aglomerate_tabletop_name">Столешница из $name $tabletop_$item.aglomerate_tabletop_name</a></li>
<li><a href="/services/makestone/windowsill/$item/detail/id/$windowsill_$item.id/" title="Подоконник из $name $windowsill_$item.aglomerate_windowsill_name">Подоконник из $name $windowsill_$item.aglomerate_windowsill_name</a></li>
<li><a href="/services/makestone/step/$item/detail/id/$step_$item.id/" title="Ступень из $name $step_$item.aglomerate_step_name">Ступень из $name $step_$item.aglomerate_step_name</a></li>
</ul>

<h3>Cлеб из $name для изготовления столов</h3>

<a href="/services/makestone/catalogstone/$item/detail/id/$slab_$item.id/" title="Слеб из $name $slab_$item.aglomerate_name"><img src="/services/makestone/catalogstone/$item/img/list/${slab_$item.aglomerate_img}.webp" alt="Слеб из $name $slab_$item.aglomerate_name" /></a>

^location_area[]

</div>
#@tabletop_detail[]

@works_secondary[]
<div id="makestone_show_right">
<h3>Каталог камня</h3>
</div>
