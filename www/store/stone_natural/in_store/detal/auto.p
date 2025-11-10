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

<body class="store">

@title[]
^hStock[]
$stock_select_archive[^table::load[http://www.civek.ru/stock/export/export_stock.txt]]
^if(^stock_select_archive.locate[id;$form:id]){$result[$stock_select_archive.stone_en]}{}

#@Ititle[]


@Info[]
^hStock[]
$currency_[^table::load[http://www.civek.ru/stock/export/export_currency.txt]]
$stock_select_archive[^table::load[http://www.civek.ru/stock/export/export_stock.txt]]
$str[$stock_select_archive.img_patch] 
$parts[^str.split[, ;lh]]
<div id="tehnobody">
<p><a href="/store/stone_natural/in_store/">Наличие природного камня на нашем складе</a></p>
<h2>^if(^stock_select_archive.locate[id;$form:id]){$h_stock.stone_type_id.[$stock_select_archive.stone_type_id] $stock_select_archive.stone_en}{}. В наличие на складе.</h2>
<span>^dtf:format[%d %h %Y;]</span>
<h3>Информация</h3>
           
            <dl id="info">
			<dt>Номер для заказа:</dt>
			<dd># $stock_select_archive.id</dd>
			
			^if(def $stock_select_archive.stone_type_id){<dt>Классификация:</dt> <dd>$h_stock.stone_type_id.[$stock_select_archive.stone_type_id]</dd>}{}
			^if(def $stock_select_archive.stone_format_id){<dt>Формат:</dt> <dd>$h_stock.stone_format_id.[$stock_select_archive.stone_format_id]</dd>}{}
			^if(def $stock_select_archive.s_length){<dt>Длина:</dt> <dd>$stock_select_archive.s_length мм.</dd>}{}
			^if(def $stock_select_archive.s_width){<dt>Ширина:</dt> <dd>$stock_select_archive.s_width мм.</dd>}{}
			^if(def $stock_select_archive.s_height){<dt>Толщина:</dt> <dd>$stock_select_archive.s_height мм.</dd>}{}
			
			
			
			<dt>Стоимость</dt>
	        <dd>^if(^currency_.locate[id;$stock_select_archive.price_type]){^eval($stock_select_archive.price*$currency_.currency) руб. с НДС.}{}</dd>
			
			<dt>Телефон:</dt>
			<dd>^my_phone[]</dd>
			<dt>Эл. почта:</dt>
			<dd>^my_email_stone[]</dd>
			<dt><a href="/store/stone_natural/services/">Изделия из камня</a>:</dt>
			<dd>Если у вас есть вопросы по изготовлению изделий из природного камня: <strong>камины</strong>, <strong>подоконники</strong>, <strong>лестницы</strong>, <strong>цокали</strong>, <strong>кухни</strong>, <strong>бордюры</strong> обращайтесь за помощью по телефону: ^my_phone[]</dd>
</dl>
</div>
<a href="http://www.civek.ru//stock/img/h/${stock_select_archive.img_patch}.jpg"><img class="thumb" src="http://www.civek.ru//stock/img/b/${stock_select_archive.img_patch}.jpg" alt="$h_stock.stone_type_id.[$stock_select_archive.stone_type_id] $stock_select_archive.stone_en" /></a>

#@Info[]























