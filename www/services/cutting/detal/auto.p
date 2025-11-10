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
  $title[^db::getMaterialPrice[
  $.id(^form:id.int(0))
  ]]
  $result[${title.material_name_ru}. Толщина: ${title.material_size} мм. ${title.material_price_rub} руб. за 1 пог. метр. Разрезать гидроабразивом. Москва и МО.]
}{}
#@title[]

@description[]
$description[^db::getMaterialPrice[$.id(^form:id.int(0))]]
$result[$description.description]
#@description[]

@keywords[]
$keywords[^db::getMaterialPrice[$.id(^form:id.int(0))]]
$result[$keywords.keywords]
#@description[]

@materials[]
$materials_id[^db::getMaterialPrice[$.id(^form:id.int(0))]]
<div id="secondary">
<h3>$materials_id.material_name_ru</h3>

   $materials[^db::getMaterialPrice[]]
   $materials_select[^materials.select($materials.material_type_id==$materials_id.material_type_id)] 
   
   <ul id="section_id">
    ^materials_select.menu{
	 ^if($materials_select.id == $form:id){
	 <li><strong>Толщина: ${materials_select.material_size} мм.</strong></li>
	 }{
	  <li><a href="/services/cutting/detal/id/$materials_select.id/" title="${materials_select.material_name_ru} ${materials_select.material_size} мм. Гидроабразив.">Толщина: ${materials_select.material_size} мм.</a></li>
	 }

	}
   </ul>
   <p style="padding: 0.5em 0 0 0^; font-size: 1.1em^;"><a style="color:red^;" href="/services/cutting/" title="Полный прайс-лист на раскрой гидроабразивом">&#8594^; Полный прайс-лист</a></p>

    $materials_item[^table::load[/services/cutting/materials_list.cfg]]
	<h3>Материалы</h3>
    <ul id="section_id">
    ^materials_item.menu{
	^if($materials_item.uri eq $request:uri){
	<li><strong>$materials_item.nameletter</strong></li>
	}{
	 ^if($materials_item.type_id == $materials_id.material_type_id){<li class="four"><a href="$materials_item.uri" title="${materials_item.nameletter}. Раскрой гидроабразивом.">$materials_item.nameletter</a></li>}{<li><a href="$materials_item.uri" title="${materials_item.nameletter}. Раскрой гидроабразивом.">$materials_item.nameletter</a></li>}
	}
}
   </ul>
   <br />
   <h3>Наши работы</h3>
   $works[^db::getWaterjetWorks[]]
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
#@materials[]


@navi_sub_nav[]
^hWaterjetMaterials[]
$navi_sub_nav[^db::getMaterialPrice[$.id(^form:id.int(0))]]
<div style="margin: 0 0 0.8em 0^; font-size: 1.2em^;"><a href="/services/cutting/" title="Услуги гидроабразивной резки">Услуги гидроабразивной резки</a> / <a href="/services/cutting/$h_waterjet_material.material_item.[$navi_sub_nav.material_type_id]" title="$h_waterjet_material.material_name_ru.[$navi_sub_nav.material_type_id]">$h_waterjet_material.material_name_ru.[$navi_sub_nav.material_type_id]</a> / <strong>$navi_sub_nav.material_name_ru ${navi_sub_nav.material_size} мм.</strong></div>
#@navi_sub_nav[]

@detailMaterials[]
^if(def $form:id){
$showMaterialsPrice[^db::getMaterialPrice[$.id(^form:id.int(0))]]
^navi_sub_nav[]
<h2>${showMaterialsPrice.material_name_ru}. Толщина: ${showMaterialsPrice.material_size} мм. Разрезать гидроабразивом.</h2>
<div id="tehnobody">
    <span>^dtf:format[%d %h %Y;]</span>
    <h3>Услуги гидроабразивной резки в Москве и МО.</h3>
    $text(^eval($showMaterialsPrice.material_price_rub))
    <span>Цена раскроя гидроабразивом за 1 (один) погонный метр.</span>
    $text_nds($text/6.55557)
   <h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4>
   <div class="price">^int2str:money2str($text) за 1 (один) погонный метр.</div>
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
			
			<h3>Принимаем форматы файлоф</h3>
			<ul>
			<li>Для простых чертежей: PDF, TXT, JPG, GIF, скан</li>
			<li>Для сложных чертежей: DWG, DXF, Ai</li>
			</ul>
			
			<div style="background-color: #FFFFE0^; padding:5px 5px^;">
			<h3>Минимальный заказ</h3>
			<p style="font-size: 1.3em^;">Не менее 15000 тыс. рублей.</p>
			</div>

			<h3>Параметры станка &laquo^;Multi Cam&raquo^;</h3>
			<br />
			<table cellspacing="0">
            <tr>
            <th>Модель</th>
			<th>Д, мм</th>
			<th>Ш, мм</th>
			<th>В, мм</th>
			<th>Рабочая зона, мм</th>
			<th>Вес, кг</th>
			</tr>
			<tr>
			<td>V 204-W</td>
			<td>4165</td>
			<td>2159</td>
			<td>1854</td>
			<td>1524 &#215^; 3048</td>
			<td>1687</td>
			</tr>
			</table>
			
			<h3>Расположение производства</h3>
			<p style="font-size: 1.3em^;">^my_adress_civekwaterjet[]</p>
            <h3>Прилегающие населенные пункты</h3>
			<p style="font-size: 1.3em^;">Люберцы, Коренево, Лыткарино, Томилино, Котельники, Некрасовка, Дзержинский, Железнодорожный, Жуковский, Раменское, Выхино-Жулебино.</p>
			<p style="font-size:1.2em^; margin:0 0 1.5em 0^;"><a href="https://www.google.com/maps/place/%D1%83%D0%BB.+%D0%9A%D0%B0%D1%80%D0%BB%D0%B0+%D0%9C%D0%B0%D1%80%D0%BA%D1%81%D0%B0,+117,+%D0%9A%D1%80%D0%B0%D1%81%D0%BA%D0%BE%D0%B2%D0%BE,+%D0%9C%D0%BE%D1%81%D0%BA%D0%BE%D0%B2%D1%81%D0%BA%D0%B0%D1%8F+%D0%BE%D0%B1%D0%BB.,+%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D1%8F,+140050/@55.6616615,37.9924765,17z/data=!4m2!3m1!1s0x414ac80061d5370d:0xc82c3a4eef48e24a" target="_blank" title="Адрес компании в Google Maps (Гугл Карты)">Адрес компании в Google Maps (Гугл Карты)</a></p>
			
	</div>
}
#@detailMaterials[]