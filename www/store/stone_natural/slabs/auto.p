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
^if(!def $form:products_format_type_size && !def $form:products_format_type && !def $form:color){Слебы}{
^if($form:products_format_type_size){^title_format_type_size[]}{}
^if($form:products_format_type){^title_format_type[]}{}
^if($form:color){^title_color[]}{}
}
#@title[]

@title_format_type_size[]
$title_format_type_size[^getProductsStore[]]
 $format_type_size_select[^title_format_type_size.select($title_format_type_size.products_type==3)]
  ^if(^format_type_size_select.locate[products_format_type_size;$form:products_format_type_size]){
     $h_detal.products_type.[$format_type_size_select.products_type] толщиной ${h_detal.products_format_type_size.[$format_type_size_select.products_format_type_size]} мм
  }{0}
#@title_format_type_size[]

@title_format_type[]
$title_format_type[^getProductsStore[]]
 $format_type_select[^title_format_type.select($title_format_type.products_type==3)]
  ^if(^format_type_select.locate[products_format_type;$form:products_format_type]){
     ${h_detal.products_type.[$format_type_select.products_type]}. ${h_detal.products_format_type.[${format_type_select.products_format_type}]}.
  }{0}
#@title_format_type[]

@title_color[]
$title_color[^getProductsStore[]]
 $format_color_select[^title_color.select($title_color.products_type==3)]
  ^if(^format_color_select.locate[color;$form:color]){
     ${h_detal.products_type.[$format_color_select.products_type]}. Цвет &mdash^; $h_detal.color_name.[${format_color_select.color}]
  }{Нет цвета}
#@title_format_type[]

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


@html_slabs[]
^h_all[]
^if(!def $form:products_format_type_size && !def $form:products_format_type && !def $form:color){^slabs[]}{
^if($form:products_format_type_size){^slabs[]}{}
^if($form:products_format_type){^slabs_products_format_type[]}{}
^if($form:color){^slabs_color_center[]}{}
^if($form:pay){Цена}{}
}
#@html_plate[]

@exchange_usd[]
  $exchange_usd(31)
##@exchange_usd[]

@slabs[]
^if(!def $form:products_format_type_size){
 $slabs[^getProductsStore[]]
  $slabs_cell[^slabs.select($slabs.products_type==3)]
 <div style="margin: 0 0 0.5em 0^; color:#383838^;"><em>Стоимость слебов на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span style="color:#ff0000^;">$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th><a href="/store/stone_natural/slabs/letter/">Камень</a></th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th><a href="/store/stone_natural/slabs/pay/">Руб.</a></th>
    <th><a href="/store/stone_natural/slabs/pay/">^$</a></th>
</tr>
   ^slabs_cell.sort($slabs_cell.pay)[desc]
   ^slabs_cell.menu{ 
   <tr>
   <td>$slabs_cell.id</td>
   <td><a href="/store/detal/id/$slabs_cell.id/">$slabs_cell.products_name_en</a> <ins title="$h_detal.products_format_type.[$slabs_cell.products_format_type]">$h_detal.products_socr.[$slabs_cell.products_format_type]<ins/></td>
   <td>${slabs_cell.i}мм</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$slabs_cell.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$slabs_cell.color]^;">$h_detal.color_name.[$slabs_cell.color]</span></td>
   <td class="rub">^eval($slabs_cell.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$slabs_cell.pay</td>
   </tr>
   }</table>
#end @plate[]
}{
 $slabs[^getProductsStore[]]
 <div style="margin: 0 0 0.5em 0^; color:#383838^;"><em>Стоимость слебов на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span style="color:#ff0000^;">$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th>Камень</th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th>Руб.</th>
    <th>^$</th>
</tr>
    $slabs_select[^slabs.select($slabs.products_format_type_size==$form:products_format_type_size)]
	 ^slabs_select.menu{
	 <tr>
   <td>$slabs_select.id</td>
   <td><a href="/store/detal/id/$slabs_select.id/">$slabs_select.products_name_en</a> <ins title="$h_detal.products_format_type.[$slabs_select.products_format_type]">$h_detal.products_socr.[$slabs_select.products_format_type]<ins/></td>
   <td>${slabs_select.i}мм</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$slabs_select.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$slabs_select.color]^;">$h_detal.color_name.[$slabs_select.color]</span></td>
   <td class="rub">^eval($slabs_select.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$slabs_select.pay</td>
   </tr>
	 }</table>
}
#@plate[]

@slabs_products_format_type[]
^if(def $form:products_format_type){
 <div style="margin: 0 0 0.5em 0^; color:#383838^;"><em>Стоимость слебов на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span style="color:#ff0000^;">$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th>Камень</th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th>Руб.</th>
    <th>^$</th>
</tr>
  $products_type[^getProductsStore[]]
   $products_type_select[^products_type.select($products_type.products_type==3))]
    $products_format_type[^products_type_select.select($products_type_select.products_format_type==$form:products_format_type))]
      ^products_format_type.sort($products_format_type.pay)
	  ^products_format_type.menu{
   <tr>
   <td>$products_format_type.id</td>
   <td><a href="/store/detal/id/$products_format_type.id/">$products_format_type.products_name_en</a></td>
   <td>${products_format_type.i} мм</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$products_format_type.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$products_format_type.color]^;">$h_detal.color_name.[$products_format_type.color]</span></td>
   <td class="rub">^eval($products_format_type.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$products_format_type.pay</td>
   </tr>}</table>
   }{}
##@plate_products_format_type[]


@slabs_color_center[]
^if(def $form:color){
 <div style="margin: 0 0 0.5em 0^; color:#383838^;"><em>Стоимость слебов на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span style="color:#ff0000^;">$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th>Камень</th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th>Руб.</th>
    <th>^$</th>
</tr>
  $color[^getProductsStore[]]
   $color_select[^color.select($color.products_type==3))]
    $color_type[^color_select.select($color_select.color==$form:color))]
	^color_type.sort($color_type.pay)
      ^color_type.menu{
   <tr>
   <td>$color_type.id</td>
   <td><a href="/store/detal/id/$color_type.id/">$color_type.products_name_en</a></td>
   <td>${color_type.i} мм</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$color_type.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$color_type.color]^;">$h_detal.color_name.[$color_type.color]</span></td>
   <td class="rub">^eval($color_type.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$color_type.pay</td>
   </tr>}</table>
}{}
##@plate_color_center[]



@slabs_foto[]
<dl>
<dt>Фото</dt>
<dd><a href="/store/stone_natural/slabs/foto/">Все фото слебов</a></dd>
</dl>
#@plate_foto[]

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


