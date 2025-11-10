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
^h_all[]
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

@getCatStore[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		categories_id AS id,
		parent_id,
		categories_name,
		path,
		title,
		img,
		description_categories,
		description,
		keywords,
		last_insert_id
	FROM
		shop_categories
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND categories_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @geCatStore[]


@getProductsStore[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		products_id AS id,
		categories_id,
		products_type,
		products_format_type,
		products_format_type_size,
		title,
		products_name_ru,
		products_name_en,
		color,
		w,
		h,
		i,
		d,
		_img,
		img1,
		img2,
		img3,
		img4,
		img5,
		country,
		description_products,
		description,
		keywords,
		pay,
		pay_discont,
		presence,
		dt,
		last_insert_id
	FROM
		shop_products
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND products_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @geCatStore[]

@menuStore[menuStore]
$menuStore[^getCatStore[]]
^if(^menuStore.locate[id;11]){
$str[$menuStore.title]
<ul id="anchorlist">
<li><a href="$menuStore.path"><strong>^str.upper[]</strong></a><br /><a href="/store/stone_natural/plate/">плитка</a>, <a href="/store/stone_natural/slabs/">слебы</a>, <a href="/store/stone_natural/ladder/">ступени</a>, <a href="/store/stone_natural/sett/">брусчатка</a>, <a href="/store/stone_natural/services/">изделия из природного камня</a><li>
</ul>}{}
#@menuStore[menuStore]#


@h_all[]
 $h_detal[
 
    $.products_type[
         $.1[Плитка из природного камня]
		 $.2[Ступени]
		 $.3[Слебы]
		 $.4[Брусчатка]
  ]
  
   $.products_format[
         $.1[Плитка]
		 $.2[Ступени]
		 $.3[Слеб]
		 $.4[Брусчатка]
  ]
  
  $.item[
         $.1[plate]
		 $.2[ladder]
		 $.3[slabs]
		 $.4[sett]
  ]
  
   $.products_format_type[
         $.1[Граниты]
		 $.2[Лабрадорит]
		 $.3[Мрамора]
		 $.4[Травертины]
		 $.5[Сланец]
		 $.6[Эксклюзивный камень]
		 $.7[Песчаник]
		 $.8[Гранит]
  ]
  
     $.products_format_type_socr[
         $.1[Гранит]
		 $.2[Лабрадорит]
		 $.3[Мрамор]
		 $.4[Травертин]
		 $.5[Сланец]
		 $.6[Эксклюзивный камень]
		 $.7[Песчаник]
  ]
  
  $.products_socr[
         $.1[Гр]
		 $.2[Л]
		 $.3[Мр]
		 $.4[Т]
		 $.5[Сл]
		 $.6[Экс]
		 $.7[П]
  ]
  
  $.products_format_type_size[
         $.1[300&times^;300&times^;20] 
		 $.2[300&times^;600&times^;12] 
		 $.3[300&times^;600&times^;15] 
		 $.4[300&times^;600&times^;18]
		 $.5[300&times^;600&times^;30]
		 $.6[305&times^;305&times^;12]
		 $.7[305&times^;610&times^;10] 
		 $.8[305&times^;610&times^;12]
		 $.9[400&times^;400&times^;10]
		 $.10[400&times^;400&times^;12]
		 $.11[600&times^;600&times^;15] 
		 $.12[600&times^;600&times^;18]
		 $.13[600&times^;600&times^;20]
		 $.14[305&times^;305&times^;10]
		 $.15[300&times^;600&times^;20] 
		 $.16[300&times^;150&times^;50]
		 $.17[300&times^;600&times^;10]
		 $.18[200&times^;100&times^;30]
		 $.19[200&times^;100&times^;50]
		 $.20[90&times^;90&times^;20]
		 $.21[90&times^;90&times^;30]
		 $.22[2610&times^;350&times^;30]
		 $.23[20]
		 $.24[30]
		 $.25[18]
  ]
  
    $.color_name[
         $.1[Красный]
		 $.2[С-красный]
		 $.3[Черный]
		 $.4[С-серый]
		 $.5[Белый]
		 $.6[Желтый]
		 $.7[С-коричн.]
		 $.8[Коричневый]
		 $.9[Т-зеленый]
		 $.10[С-зеленый]
		 $.11[Голубой]
		 $.12[С-фиолет]
		 $.13[Фиолетовый]
		 $.14[Розовый]
		 $.15[Серебро]
		 $.16[Зеленый]
		 $.17[Т-серый]
		 $.18[Р-коричн]
		 $.20[Бежевый]
		 $.22[Кремовый]
  ]
  
      $.color_font[
         $.1[#fff] 
		 $.2[#fff]
		 $.3[#fff]
		 $.4[#000]
		 $.5[#000]
		 $.6[#000] 
		 $.7[#fff] 
		 $.8[#fff]
		 $.9[#fff]
		 $.10[#fff]
		 $.11[#fff]
		 $.12[#fff]
		 $.13[#fff]
		 $.14[#000]
		 $.15[#000]
		 $.16[#fff]
		 $.17[#fff]
		 $.18[#000]
		 $.20[#000]
		 $.22[#000]
  ]
  
    $.color_code[
         $.1[#ff0000] 
		 $.2[#ff6347] 
		 $.3[#000]
		 $.4[#c3c3c3]
		 $.5[#eaeaea]
		 $.6[#ffff00] 
		 $.7[#998866] 
		 $.8[#660000]
		 $.9[#003300]
		 $.10[#556b2f]
		 $.11[#4682b4]
		 $.12[#8000ff]
		 $.13[#6a5acd]
		 $.14[#ffc0cb]
		 $.15[#c0c0c0]
		 $.16[#228b22]
		 $.17[#708090]
		 $.18[#ffc0cb]
		 $.20[#f5deb3]
		 $.22[#f2ddc6]
  ]
  
      $.country[
         $.1[]
  ]
  
   $.exchange_rate[
         $.1[31]
		 $.2[40]
		 $.3[0.752]
  ]

]
#@h_all[]


@plate_foto[]
<dl>
<dt>Фото</dt>
<dd><a href="/store/stone_natural/plate/foto/">Все фото плитки</a></dd>
</dl>
#@plate_foto[]

@slabs_foto[]
<dl>
<dt>Фото</dt>
<dd><a href="/store/stone_natural/slabs/foto/">Все фото слебов</a></dd>
</dl>
#@plate_foto[]


@plate_stone[]
$plate_stone[^table::load[/store/stone_natural/plate/plate_stone.cfg]]
<dl>
<dt>Камень</dt>
  ^plate_stone.menu{
       ^plate_stone_cell[]
  }</dl>
##@plate_size[]
@plate_stone_cell[]
^if($plate_stone.uri eq $request:query){
  <dd><span>$plate_stone.name</span></dd>
}{
   <dd><a href="/store/stone_natural/plate/products_format_type/$plate_stone.id/">$plate_stone.name</a></dd>
}
#@plate_size_cell[]


@plate_size[]
$plate_size[^table::load[/store/stone_natural/plate/plate_size.cfg]]
<dl>
<dt>Размеры</dt>
  ^plate_size.menu{
    ^plate_size_cell[]
  }</dl>
##@plate_size[]
@plate_size_cell[]
^if($plate_size.uri eq $request:query){
<dd><span>$plate_size.w &times^; $plate_size.h &times^; $plate_size.i</span></dd>
}{
<dd><a href="/store/stone_natural/plate/products_format_type_size/$plate_size.id/">$plate_size.w &times^; $plate_size.h &times^; $plate_size.i</a></dd>
}
#@plate_size_cell[]

@plate_color_right[]
^h_all[]
 $plate_color[^table::load[/store/stone_natural/plate/plate_color.cfg]]
<dl>
<dt>Цвет</dt>
  ^plate_color.menu{
       ^plate_color_cell[]
  }</dl>
##@plate_color[]
@plate_color_cell[]
^if($plate_color.uri eq $request:query){
  <dd><span>$plate_color.name</span></dd>
}{
   <dd><strong><a style="color: $h_detal.color_code.[$plate_color.id]^;" href="/store/stone_natural/plate/color/$plate_color.id/">$plate_color.name</a></strong></dd>
}
#@plate_color_cell[]

@slabs_size[]
 $slabs_size[^table::load[/store/stone_natural/slabs/slabs_size.cfg]]
<dl>
<dt>Размеры</dt>
  ^slabs_size.menu{
    ^slabs_size_cell[]
  }</dl>
##@plate_size[]

@slabs_size_cell[]
^if($slabs_size.uri eq $request:query){
<dd><span>$slabs_size.name ${slabs_size.i}мм</span></dd>
}{
<dd><a href="/store/stone_natural/slabs/products_format_type_size/$slabs_size.id/">$slabs_size.name ${slabs_size.i}мм</a></dd>
}
#@plate_size_cell[]

@slabs_stone[]
 $slabs_stone[^table::load[/store/stone_natural/slabs/slabs_stone.cfg]]
<dl>
<dt>Камень</dt>
  ^slabs_stone.menu{
       ^slabs_stone_cell[]
  }</dl>
##@plate_size[]

@slabs_stone_cell[]
^if($slabs_stone.uri eq $request:query){
  <dd><span>$slabs_stone.name</span></dd>
}{
   <dd><a href="/store/stone_natural/slabs/products_format_type/$slabs_stone.id/">$slabs_stone.name</a></dd>
}
#@plate_size_cell[]

@slabs_color_right[]
^h_all[]
 $slabs_color[^table::load[/store/stone_natural/slabs/slabs_color.cfg]]
<dl>
<dt>Цвет</dt>
  ^slabs_color.menu{
       ^slabs_color_cell[]
  }</dl>
##@plate_color[]

@slabs_color_cell[]
^if($slabs_color.uri eq $request:query){
  <dd><span>$slabs_color.name</span></dd>
}{
   <dd><strong><a style="color: $h_detal.color_code.[$slabs_color.id]^;" href="/store/stone_natural/slabs/color/$slabs_color.id/">$slabs_color.name</a></strong></dd>
}
#@plate_color_cell[]

@slabs_pay[]
 $slabs_pay[^getProductsStore[]]
   $slabs_pay_select[[^slabs_pay.select($products_type.products_type==3)]]
<dl>
<dt>Стоимость</dt>
  ^slabs_pay_select.menu{
       1
  }</dl>
##@plate_color[]

@sett_size[]
 $sett_size[^table::load[/store/stone_natural/sett/sett_size.cfg]]
<dl>
<dt>Размеры</dt>
  ^sett_size.menu{
    ^sett_size_cell[]
  }</dl>
##@plate_size[]

@sett_size_cell[]
^if($sett_size.uri eq $request:query){
<dd><span>$sett_size.w&times^;$sett_size.h&times^;$sett_size.i</span></dd>
}{
<dd><a href="/store/stone_natural/sett/products_format_type_size/$sett_size.id/">$sett_size.w&times^;$sett_size.h&times^;$sett_size.i</a></dd>
}
#@plate_size_cell[]

@sett_color_right[]
^h_all[]
$sett_color[^table::load[/store/stone_natural/sett/sett_color.cfg]]
<dl>
<dt>Цвет</dt>
  ^sett_color.menu{
       ^sett_color_cell[]
  }</dl>
##@plate_color[]

@sett_color_cell[]
^if($sett_color.uri eq $request:query){
  <dd><span>$sett_color.name</span></dd>
}{
   <dd><strong><a style="color: $h_detal.color_code.[$sett_color.id]^;" href="/store/stone_natural/sett/color/$sett_color.id/">$sett_color.name</a></strong></dd>
}
#@plate_color_cell[]

@in_store_special_civel[]
<strong><a style="color:red^;" href="/store/stone_natural/in_store/" title="Наличие на складе природного камня">Наличие на складе</a></strong>
#@in_store_special_civel[]











 
 
 
 

          


