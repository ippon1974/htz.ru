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
<body class="services b_services four">
#end@header[]

@title[]
^if(def $form:id){
  ^hWaterjetMaterials[]
  $title[^db::getWaterjetWorks[
  $.id(^form:id.int(0))
  ]]
  $result[${title.work_title}. $h_waterjet_material.material_name_ru.[$title.work_materials_type_id] толщиной ${title.work_materials_size} мм. Гидроабразив.]
}{}
#@title[]

@description[]
$description[^db::getWaterjetWorks[$.id(^form:id.int(0))]]
$result[$description.work_description]
#@description[]

@keywords[]
$keywords[^db::getWaterjetWorks[$.id(^form:id.int(0))]]
$result[$keywords.work_keywords]
#@description[]

@works_secondary[]
$works_id[^db::getWaterjetWorks[$.id(^form:id.int(0))]]
<div id="secondary">

<h3>Наши работы</h3>

   $works[^db::getWaterjetWorks[]]
#$works_select[^works.select($works.work_materials_type_id==$works_id.work_materials_type_id)] 
   
   <ul id="section_id">
    ^works.menu{
	 ^if($works.id == $form:id){
	 <li><strong>$works.work_title_short</strong></li>
	 }{
	  <li><a href="/services/cutting/works/detal/id/$works.id/" title="${works.work_title_short}. Гидроабразив.">$works.work_title_short</a></li>
	 }

	}
   </ul>
   <p style="padding: 0.5em 0 0 0^; font-size: 1.1em^;"><a style="color:red^;" href="/services/cutting/works/" title="Все работы. Гидроабразив">Все работы &#8594^;</a></p>

</div>
#@works_secondary[]


@navi_sub_nav[]
^hWaterjetMaterials[]
$navi_sub_nav[^db::getWaterjetWorks[$.id(^form:id.int(0))]]
<div style="margin: 0 0 0.8em 0^; font-size: 1.2em^;"><a href="/services/cutting/" title="Услуги гидроабразивной резки">Услуги гидроабразивной резки</a> / <a href="/services/cutting/works/" title="Наши работы. Гидроабразивная резка.">Наши работы</a> / <strong>$navi_sub_nav.work_title_short</strong></div>
#@navi_sub_nav[]

@detailWorks[]
^if(def $form:id){
^hWaterjetMaterials[]
$showWorks[^db::getWaterjetWorks[$.id(^form:id.int(0))]]
^navi_sub_nav[]
<h2>${showWorks.work_title}. $h_waterjet_material.material_name_ru.[$showWorks.work_materials_type_id] толщиной ${showWorks.work_materials_size} мм. Гидроабразив.</h2>
<div id="tehnobody">
            <dl id="info">
			<dt>Технология:</dt>
			<dd>Гидроабразив</dd>
            <dt>Материал:</dt>
			<dd>$h_waterjet_material.material_name_ru.[$showWorks.work_materials_type_id]</dd>
			<dt>Толщина:</dt>
			<dd>${showWorks.work_materials_size} мм.</dd>
			<dt>Кол-во метров</dt> 
			<dd>$showWorks.work_meters_count пог. метр.</dd>
			<dt>Цена раскроя</dt>
			<dd>^eval($showWorks.work_meters_price*$showWorks.work_meters_count)[%.2f] руб.</dd>
			<dt>Изготовлена:</dt>
			<dd>^dtf:format[%d %h %Y; $showWorks.work_delivery_dt]</dd>
			</dl>
			
			
			^if(def $showWorks.work_desc){<h3>Процесс</h3>^untaint[as-is]{$showWorks.work_desc}}{}
			
			$str[$showWorks.work_img]
			$parts[^str.split[, ]]
			^if(def $str){
			^parts.menu{
			<p><a href="/img/services/waterjet/works/h/${parts.piece}.jpg" target="_blank"><img src="/img/services/waterjet/works/b/${parts.piece}.jpg" alt="${showWorks.work_title_short}. Гидроабразив." /></a></p>
			}
			}{}
			
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
			
			<h3>Расположение производства</h3>
			<p style="font-size: 1.3em^;">^my_adress_civekwaterjet[]</p>
            <h3>Прилегающие населенные пункты</h3>
			<p style="font-size: 1.3em^;">Люберцы, Коренево, Лыткарино, Томилино, Котельники, Некрасовка, Дзержинский, Железнодорожный, Жуковский, Раменское, Выхино-Жулебино.</p>
			<p style="font-size:1.2em^; margin:0 0 1.5em 0^;"><a href="https://www.google.com/maps/place/%D1%83%D0%BB.+%D0%9A%D0%B0%D1%80%D0%BB%D0%B0+%D0%9C%D0%B0%D1%80%D0%BA%D1%81%D0%B0,+117,+%D0%9A%D1%80%D0%B0%D1%81%D0%BA%D0%BE%D0%B2%D0%BE,+%D0%9C%D0%BE%D1%81%D0%BA%D0%BE%D0%B2%D1%81%D0%BA%D0%B0%D1%8F+%D0%BE%D0%B1%D0%BB.,+%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D1%8F,+140050/@55.6616615,37.9924765,17z/data=!4m2!3m1!1s0x414ac80061d5370d:0xc82c3a4eef48e24a" target="_blank" title="Адрес компании в Google Maps (Гугл Карты)">Адрес компании в Google Maps (Гугл Карты)</a></p>
			
	</div>
}
#@detailMaterials[]