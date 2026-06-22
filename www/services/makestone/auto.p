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

@hMakeStone[]
$h_makestone[
	$.make_stone_id[
		$.1[Ступень]
		$.2[Стол]
		$.3[Подоконник]
		$.4[Столешница]
		$.5[]
	]
	$.make_stone_declension[
		$.1[Ступени]
		$.2[Столы]
		$.3[Подоконники]
		$.4[Столешницы]
		$.5[Каталог камня. Слебы.]
	]
	$.make_stone_item[
		$.1[step]
		$.2[table]
		$.3[windowsill]
		$.4[tabletop]
		$.5[catalogstone]
	]
    $.stone_type_id[
        $.1[агат]
		$.2[агломерат]
		$.3[аметист]
		$.4[гранит]
		$.5[ламбрадорит]
		$.6[мрамор]
		$.7[оникс]
		$.8[кварц]
		$.9[травертин]
   ]
   $.stone_declension_type[
		$.1[агата]
		$.2[агломерата]
		$.3[аметиста]
		$.4[гранита]
		$.5[ламбрадорита]
		$.6[мрамора]
		$.7[оникса]
		$.8[кварца]
		$.9[травертина]
   ]
   $.stone_item[
        $.1[agate]
		$.2[aglomerate]
		$.3[amethyst]
		$.4[granite]
		$.5[labradorite]
		$.6[marble]
		$.7[onix]
		$.8[quartz]
		$.9[travertine]
   ]
 ]
#@hMakeStone[]

@makestone_show[]
^hMakeStone[]
<div id="makestone_show">
<h2>Весь цикл от замера до монтажа на вашем объекте. Расчет полной стоимости работ. Собственное производство в Москве.</h2>
<h3>Работаем с физическими и юридическими лицами. Минимальный заказ одно изделие: подоконник, столешница, стол и т.д.</h3>

<p><a class = "begin_list" href="/services/makestone/$h_makestone.make_stone_item.[4]/" title="$h_makestone.make_stone_declension.[4] из камня">$h_makestone.make_stone_declension.[4]</a> из ^h_makestone.stone_declension_type.foreach[key;value]{<a href="/services/makestone/tabletop/$h_makestone.stone_item.[$key]/" title="$h_makestone.make_stone_declension.[4] из $h_makestone.stone_declension_type.[$key]">$value</a>}[, ].</p>
<p><a class = "begin_list" href="/services/makestone/$h_makestone.make_stone_item.[3]/" title="$h_makestone.make_stone_declension.[3] из камня">$h_makestone.make_stone_declension.[3]</a> из ^h_makestone.stone_declension_type.foreach[key;value]{<a href="/services/makestone/windowsill/$h_makestone.stone_item.[$key]/" title="$h_makestone.make_stone_declension.[3] из $h_makestone.stone_declension_type.[$key]">$value</a>}[, ]</p>
<p><a class = "begin_list" href="/services/makestone/$h_makestone.make_stone_item.[1]/" title="$h_makestone.make_stone_declension.[1] из камня">$h_makestone.make_stone_declension.[1]</a> из ^h_makestone.stone_declension_type.foreach[key;value]{<a href="/services/makestone/step/$h_makestone.stone_item.[$key]/" title="$h_makestone.make_stone_declension.[1] из $h_makestone.stone_declension_type.[$key]">$value</a>}[, ]</p>
<p><a class = "begin_list" href="/services/makestone/$h_makestone.make_stone_item.[2]/" title="$h_makestone.make_stone_declension.[2] из камня">$h_makestone.make_stone_declension.[2]</a> из ^h_makestone.stone_declension_type.foreach[key;value]{<a href="/services/makestone/table/$h_makestone.stone_item.[$key]/" title="$h_makestone.make_stone_declension.[2] из $h_makestone.stone_declension_type.[$key]">$value</a>}[, ]</p>
<p><a class = "begin_list" href="/services/makestone/$h_makestone.make_stone_item.[5]/" title="$h_makestone.make_stone_declension.[5] из камня">$h_makestone.make_stone_declension.[5]</a> из ^h_makestone.stone_declension_type.foreach[key;value]{<a href="/services/makestone/catalogstone/$h_makestone.stone_item.[$key]/" title="$h_makestone.make_stone_declension.[5] из $h_makestone.stone_declension_type.[$key]">$value</a>}[, ]</p>

</div>
#@makestone_show[]

@location_area[]
<h3>Расположение производства:</h3>
<p>121357, г.Москва, ул.Верейская,д.29 С 82<br />
Пн-Пт с 9:00 до 19:00. Выходные дни: суббота и воскресенье.<br />
Контактный телефон: ^my_phone_waterjet[]<br />
Электронная почта: ^my_email[]</p>
<p>
<strong>Прилегающие населенные пункты</strong>: Внуково, Дорогомилово, Крылатское, Кунцево, Можайский, Ново-Переделкино, Очаково-Матвеевское, Проспек Вернадского, Раменки, Солнцево, Тропарёво-Никулино, Филёвский парк, Фили-Давыдково<br />
</p>
#@location_area[]


@menu_products_stone_right[]
<h3>Изделия</h3>
$menu_products_stone_right[^table::load[/services/makestone/menu_products_stone_right.cfg]]
<ul class="menu_stone_tablestone">
	^menu_products_stone_right.menu{
		  ^products_item[]
		}
</ul>
#@menu_products_stone_right[]

@products_item[]
$path[$request:path]
$parts[^path.split[/;lh]]

^if($menu_products_stone_right.uri eq $request:uri){ 
  <li style="font-size: 1.1em^; margin: 0^;padding: 0 4px 0 4px^;"><span style="background-color: #FFFFCC^;">$menu_products_stone_right.name</span></li>
}{ 
	^if($parts.3 eq $menu_products_stone_right.item){
		  <li style="margin: 0^;padding: 0 4px 0 4px^;"><a href="$menu_products_stone_right.uri" title="$menu_products_stone_right.title"><span style="color:#600^;background-color: #FFFFCC^;">$menu_products_stone_right.name</a></span></li>

	}{
		  <li style="margin: 0^;padding: 0 4px 0 4px^;"><a href="$menu_products_stone_right.uri" title="$menu_products_stone_right.title">$menu_products_stone_right.name</a></li>
	}
} 
#@navigation_item[]

@menu_catalog_stone_right[]
<br />
<h3>Слебы Каталог</h3>
$menu_catalog_stone_right[^table::load[/services/makestone/menu_catalog_stone_right.cfg]]
<ul class="menu_stone_tablestone">
	^menu_catalog_stone_right.menu{
		  ^catalog_stone_item[]
		}
</ul>
#@menu_catalog_stone_right[]

@catalog_stone_item[]
$path[$request:path]
$parts[^path.split[/;lh]]

^if($menu_catalog_stone_right.uri eq $request:uri){ 
  <li style="font-size: 1.1em^; margin: 0^;padding: 0 4px 0 4px^;"><span style="background-color: #FFFFCC^;">$menu_catalog_stone_right.name</span></li>
}{ 
	^if($parts.4 eq $menu_catalog_stone_right.item){
		  <li style="margin: 0^;padding: 0 4px 0 4px^;"><a href="$menu_catalog_stone_right.uri" title="$menu_catalog_stone_right.title"><span style="color:#600^;background-color: #FFFFCC^;">$menu_catalog_stone_right.name</a></span></li>
	}{
		  <li style="margin: 0^;padding: 0 4px 0 4px^;"><a href="$menu_catalog_stone_right.uri" title="$menu_catalog_stone_right.title">$menu_catalog_stone_right.name</a></li>
	}
} 
#@catalog_stone_item[]


@works_secondary[]
<div id="makestone_show_right">
^menu_products_stone_right[]
^menu_catalog_stone_right[]
</div>
#@works_secondary[]