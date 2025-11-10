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

@showMaterialsPrice[]
$showMaterialsPrice[^db::getMaterialPrice[]]
<table cellpadding="0">
<tr>
<th>Материал</th>
<th>Толщина мм.</th>
<th>Стоимость</th>
</tr>
^showMaterialsPrice.menu{
<tr>
	<td><a href="/services/cutting/detal/id/$showMaterialsPrice.id/" title="${showMaterialsPrice.material_name_ru}. ${showMaterialsPrice.material_size}.мм. Гидроабразив.">$showMaterialsPrice.material_name_ru</a></td>
	<td>${showMaterialsPrice.material_size} мм.</td>
	<td>$showMaterialsPrice.material_price_rub руб.</td>
	</tr>
}
	
</table>
#end @showMaterialsPrice[]

@materials_list[]
<h3>Коротко о технологии</h3>
<p><strong>Гидроабразивная резка</strong> &mdash^; вид обработки материалов резанием, где в качестве режущего инструмента вместо резца используется <strong>струя воды</strong> или <strong>смеси воды и абразивного материала</strong>, выходящая из сопла с высокой скоростью и <strong>под высоким давлением</strong>.</p>

<p>Наши работы по гидроабразиву: (<a href="http://htz.ru/services/cutting/works/" title="Перейти в раздел работы по гидроабразивной резки">http://htz.ru/services/cutting/works/</a>)</p>

<p style="margin: 0 0 1.5em 5px^;font-size: 1.3em^;">Контактный телефон: ^my_phone_waterjet[] (Пн-Пт с 9:00 до 19:00)<br />
Электронная почта: ^my_email[]<br /><br />
Расположение: Посёлок ВУГИ, 1с4, Люберцы, Московская область, 140004. Территория института «ННЦ ГП - ИГД им. А.А. Скочинского»<br /><br />
Прилегающие населенные пункты: Люберцы, Красково, Коренево, Томилино, Лыткарино, Некрасовка, Октябрьский, Котельники, Малаховка, Дзержинский, Железнодорожный, Раменское, Жуковский, Выхино-Жулебино, Электроугли.<br />
</p>


<h3>Доступные материалы для раскроя гидроабразивом:</h3>
$materials_list[^table::load[/services/cutting/materials_list.cfg]]
<p>
^materials_list.menu{
<a href="$materials_list.uri" title="${materials_list.nameletter}. Стоимость раскроя. Гидроабразивная резка.">$materials_list.nameletter</a>
}[ | ]
.</p>

<h3>Стоимость раскроя материала гидроабразивом за 1 (один) пог. м.</h3>
^showMaterialsPrice[]

<h3>Наше оборудование «Multi Cam»</h3>
<p><strong>Характреристики станка «Multi Cam» гидроабразивной резки материала</strong></p>

<ul>
<li>Клиренс по оси Z -254 мм</li>
<li>Ход по Z-Оси – 203 мм</li>
<li>Разрешение: 0,0025 мм</li>
<li>Повторяемость: ± 0,025мм</li>
<li>Ускоренное перемещение: 254мм/с</li>
<li>Точность позиционного перемещения: ±.0,127 мм на 3048 мм</li>
<li>Максимальная скорость резания; 635 мм/с</li>
<li>Приводы: Бесщёточный цифровой серво переменного тока</li>
<li>Приводная система осям X и Y: Линейная зубчатая рейка и шестерня</li>
<li>Приводная система по оси Z: Прецизионный шариковый винт</li>
</ul>

<p><strong>Таблица размеров (мм). Станок «Multi Cam».</strong></p>
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
<td>1524 x 3048</td>
<td>1687</td>
</tr>
</table>

<h3>Расположение производство:</h3>
<p>Посёлок ВУГИ, 1с4, Люберцы, Московская область, 140004. Территория института «ННЦ ГП - ИГД им. А.А. Скочинского»</p>
<p>Контактный телефон: ^my_phone_waterjet[]</p>
<p>Электронная почта: ^my_email[]</p>
#@materials_list[]


#Blokc Items Materials

@materialsItem[]
$materials_item[^table::load[/services/cutting/materials_list.cfg]]
<div id="secondary">
<h3>Материалы</h3>
   <ul id="section_id">
    ^materials_item.menu{
	 ^if($materials_item.uri eq $request:uri){
	 <li><strong>$materials_item.nameletter</strong></li>
	 }{
	  <li><a href="$materials_item.uri" title="${materials_item.nameletter}. Раскрой гидроабразивом.">$materials_item.nameletter</a></li>
	 }

	}
   </ul>
   <p style="padding: 0.5em 0 0 0^; font-size: 1.1em^;"><a style="color:red^;" href="/services/cutting/" title="Полный прайс-лист на раскрой гидроабразивом">&#8594^; Полный прайс-лист</a></p>
^works_secondary[]
</div>
#@materialsItem[]


@materialsSelectItem[]
$materials_item[^table::load[/services/cutting/materials_list.cfg]]
$materials[^db::getMaterialPrice[]]
<div id="tehnobody">
^navi_sub_nav[]
<h2>^if(^materials_item.locate[uri;$request:uri]){${materials_item.nameletter}. Стоимость раскроя с помощью технологии гидроабразивной резки.}{}</h2>
<span>^dtf:format[%d %h %Y;]</span>
<br /><br />
<p>Стоимость раскроя гидроабразивом указана в рублях РФ за 1 (один) погонный метр.</p>
<table cellpadding="0">
<tr>
<th>Материал</th>
<th>Толщина мм.</th>
<th>Стоимость</th>
</tr>
^if(^materials_item.locate[uri;$request:uri]){
^materials.menu{
^if($materials.material_type_id == $materials_item.type_id){
<tr>
	<td><a href="/services/cutting/detal/id/$materials.id/" title="${materials.material_name_ru}. ${materials.material_size}.мм. Гидроабразив.">$materials.material_name_ru</a></td>
	<td>$materials.material_size мм.</td>
	<td>$materials.material_price_rub руб.</td>
	</tr>
}{}
}
}{}
</table>
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
<p>Расположение производство: ^my_adress_civekwaterjet[]</p>
</div>
#@MaterialsSelectItem[]

#@Blokc Items Materials


@works_secondary[]
$works_id[^db::getWaterjetWorks[$.id(^form:id.int(0))]]
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
#@works_secondary[]
