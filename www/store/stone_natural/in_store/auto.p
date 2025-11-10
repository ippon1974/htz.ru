@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[] | " />
<meta name="keywords" content="^title[] | " />

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
<body class="store">
#end@header[]

@title[]
$result[Наличие природного камня на нашем складе]
#@title[]


@getALL[]
^hStock[]
$stock_select_archive[^table::load[http://www.civek.ru/stock/export/export_stock.txt]]
$currency_[^table::load[http://www.civek.ru/stock/export/export_currency.txt]]
<h2>Наличие природного камня на нашем складе</h2>
<p style="background: #FFDEAD^; padding: 2px 0 2px 10px^;">Контактный телефон в Москве: ^my_phone_new_h[]<br />Электронная почта: ^my_email_stone[]</p>
<ul class="listing">
^stock_select_archive.menu{
$str[$stock_select_archive.img_patch] 
$parts[^str.split[, ;lh]]
	<li>
    <dl>	
    <dt>^if(def $stock_select_archive.img_patch){<a href="/store/stone_natural/in_store/detal/id/$stock_select_archive.id/"><img class="thumb" src="http://www.civek.ru/stock/img/b/${parts.0}.jpg" alt="$h_stock.stone_type_id.[$stock_select_archive.stone_type_id] $stock_select_archive.stone_en" /></a>}{}</dt>
    <dd><a href="/store/stone_natural/in_store/detal/id/$stock_select_archive.id/" title="$h_stock.stone_type_id.[$stock_select_archive.stone_type_id] $stock_select_archive.stone_en">$h_stock.stone_type_id.[$stock_select_archive.stone_type_id] $stock_select_archive.stone_en</a></dd>					
	^if(def $stock_select_archive.stone_type_id){<dd>Классификация: $h_stock.stone_type_id.[$stock_select_archive.stone_type_id]</dd>}{}
	^if(def $stock_select_archive.stone_format_id){<dd>Формат: $h_stock.stone_format_id.[$stock_select_archive.stone_format_id]</dd>}{}
	^if(def $stock_select_archive.s_length){<dd>Длина: $stock_select_archive.s_length мм.</dd>}{}
	^if(def $stock_select_archive.s_width){<dd>Ширина: $stock_select_archive.s_width мм.</dd>}{}
	^if(def $stock_select_archive.s_height){<dd>Толщина: $stock_select_archive.s_height мм.</dd>}{}
	
	<dd>Стоимость за кв.м.: ^if(^currency_.locate[id;$stock_select_archive.price_type]){^eval($stock_select_archive.price*$currency_.currency) руб. с НДС.}{}</dd>
    
    </dl>
    </li>}
</ul>
#@getAGROIMPORTGen[]