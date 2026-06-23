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
$result[Подоконники из гранита]
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


@scroller_misha[]
$count(^MAIN:pSQL.int{
	SELECT
		COUNT(*)
	FROM
		v_windowsill_granite
	WHERE
		is_published = 1
})
$items(50)
$opage[^scroller::init[$count;$items;page]]
^opage.print[
	$.target_url[/services/makestone/windowsill/granite/]
	$.nav_count(50)
	$.mode[html]
]
$granite[^MAIN:pSQL.table{
	SELECT
		granite_windowsill_id AS id,
		g_slab_id,
		granite_windowsil_type_id,
		granite_windowsil_name,
		granite_windowsil_price,
		granite_windowsil_item,
		granite_windowsil_desc,
		granite_windowsil_img,
		is_published
	FROM
		v_windowsill_granite
	WHERE
		is_published = 1
		^if(^hParam.id.int(0)){
		AND granite_windowsill_id = ^hParam.id.int(0)
		}
	ORDER BY
		id ASC
}[
	$.offset($opage.offset)
	$.limit($opage.limit)
]]
#end @scroller_misha[]

@printList[opage]
^untaint[as-is]{
<ul class="listing">
	^granite.menu{
	       ^printList_cell[granite;гранита]
	}
</ul>
}
#end @printList[opage]

@printList_cell[item;name]
$result[
	<li>
	<dl>
	<dt><a href="/services/makestone/windowsill/$item/detail/id/${$item.id}/" title="Подоконник из $name ${$item.granite_windowsil_name}"><img src="/services/makestone/windowsill/$item/img/list/${$item.granite_windowsil_img}.webp" alt="Подоконник из $name ${$item.granite_windowsil_name}" /></a></dt>
	<dd class="delta"><a href="/services/makestone/windowsill/$item/detail/id/${$item.id}/" title="Подоконник из $name ${$item.granite_windowsil_name}">Подоконник из $name ${$item.granite_windowsil_name}</a></dd>
	</dl>
	</li>
]
#end@printArticlesList_cell[]

@makestone_show_windowsill[]

^hMakeStone[]

<div id="makestone_show_list">

<h3>Весь цикл от замера до монтажа на вашем объекте. Расчет полной стоимости работ. Собственное производство в Москве.</h3>

<p style="font-size: 1.1em^;color: rgba(40, 38, 38, 0.818)^;">^scroller_misha[]</p>
	^printList[]
<p style="font-size: 1.1em^;color: rgba(40, 38, 38, 0.818)^;">^scroller_misha[]</p>

</div>
#@makestone_show_windowsill[]

@works_secondary[]
<div id="makestone_show_right">
<h3>Каталог камня</h3>
</div>
#@works_secondary[]
