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
^if(!def $form:products_format_type_size && !def $form:products_format_type && !def $form:color){Ступени из природного камня}{
^if($form:products_format_type_size){^title_format_type_size[]}{}
^if($form:products_format_type){^title_format_type[]}{}
^if($form:color){^title_color[]}{}
}
#@title[]

@title_format_type_size[]
$title_format_type_size[^getProductsStore[]]
 $format_type_size_select[^title_format_type_size.select($title_format_type_size.products_type==1)]
  ^if(^format_type_size_select.locate[products_format_type_size;$form:products_format_type_size]){
     ${h_detal.products_type.[$format_type_size_select.products_type]}. Размеры $h_detal.products_format_type_size.[$format_type_size_select.products_format_type_size]
  }{0}
#@title_format_type_size[]

@title_format_type[]
$title_format_type[^getProductsStore[]]
 $format_type_select[^title_format_type.select($title_format_type.products_type==2)]
  ^if(^format_type_select.locate[products_format_type;$form:products_format_type]){
     ${h_detal.products_type.[$format_type_select.products_type]}. $h_detal.products_format_type.[${format_type_select.products_format_type}]
  }{0}
#@title_format_type[]

@title_color[]
$title_color[^getProductsStore[]]
 $format_color_select[^title_color.select($title_color.products_type==1)]
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


@html_ladder[]
^h_all[]
^if(!def $form:products_format_type_size && !def $form:products_format_type && !def $form:color){^ladder[]}{
^if($form:products_format_type_size){^plate[]}{}
^if($form:products_format_type){^plate_products_format_type[]}{}
^if($form:color){^plate_color_center[]}{}
^if($form:pay){Цена}{}
}
#@html_plate[]

@ladder[]
^if(!def $form:products_format_type_size){
 $ladder[^getProductsStore[]]
  $ladder_cell[^ladder.select($ladder.products_type==2)]
 <div style="margin: 0 0 0.5em 0^; color:#383838^;"><em>Стоимость ступеней на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span style="color:#ff0000^;">$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th>Камень</th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th>Руб.</th>
    <th>^$</th>
</tr>
   ^ladder_cell.sort($ladder_cell.pay)[desc]
   ^ladder_cell.menu{ 
   <tr>
   <td>$ladder_cell.id</td>
   <td><a href="/store/detal/id/$ladder_cell.id/">$ladder_cell.products_name_en</a></td>
   <td>$ladder_cell.w&times^;$ladder_cell.h&times^;$ladder_cell.i</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$ladder_cell.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$ladder_cell.color]^;">$h_detal.color_name.[$ladder_cell.color]</span></td>
   <td class="rub">^eval($ladder_cell.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$ladder_cell.pay</td>
   </tr>
   }</table>
#end @plate[]
}{
 $plate[^getProductsStore[]]
 <div style="margin: 0 0 0.5em 0^; color:#383838^;"><em>Стоимость ступеней на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span style="color:#ff0000^;">$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th>Камень</th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th>Руб.</th>
    <th>^$</th>
</tr>
    $plate_select[^plate.select($plate.products_format_type_size==$form:products_format_type_size)]
	 ^plate_select.sort($plate_select.pay)
	 ^plate_select.menu{
	 <tr>
   <td>$plate_select.id</td>
   <td><a href="/store/detal/id/$plate_select.id/">$plate_select.products_name_en</a></td>
   <td>$plate_select.w&times^;$plate_select.h&times^;$plate_select.i</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$plate_select.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$plate_select.color]^;">$h_detal.color_name.[$plate_select.color]</span></td>
   <td class="rub">^eval($plate_select.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$plate_select.pay</td>
   </tr>
	 }</table>
}
#@plate[]

@plate_products_format_type[]
^if(def $form:products_format_type){
 <div style="margin: 0 0 0.5em 0^; color:#383838^;"><em>Стоимость на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span style="color:#ff0000^;">$h_detal.exchange_rate.[1]</span></div>
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
   $products_type_select[^products_type.select($products_type.products_type==2))]
    $products_format_type[^products_type_select.select($products_type_select.products_format_type==$form:products_format_type))]
      ^products_format_type.sort($products_format_type.pay)
	  ^products_format_type.menu{
   <tr>
   <td>$products_format_type.id</td>
   <td><a href="/store/detal/id/$products_format_type.id/">$products_format_type.products_name_en</a></td>
   <td>$products_format_type.w&times^;$products_format_type.h&times^;$products_format_type.i</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$products_format_type.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$products_format_type.color]^;">$h_detal.color_name.[$products_format_type.color]</span></td>
   <td class="rub">^eval($products_format_type.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$products_format_type.pay</td>
   </tr>}</table>
   }{}
##@plate_products_format_type[]


@plate_color_center[]
^if(def $form:color){
 <div style="margin: 0 0 0.5em 0^; color:#383838^;"><em>Стоимость на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span style="color:#ff0000^;">$h_detal.exchange_rate.[1]</span></div>
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
   $color_select[^color.select($color.products_type==1))]
    $color_type[^color_select.select($color_select.color==$form:color))]
	^color_type.sort($color_type.pay)
      ^color_type.menu{
   <tr>
   <td>$color_type.id</td>
   <td><a href="/store/detal/id/$color_type.id/">$color_type.products_name_en</a></td>
   <td>$color_type.w&times^;$color_type.h&times^;$color_type.i</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$color_type.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$color_type.color]^;">$h_detal.color_name.[$color_type.color]</span></td>
   <td class="rub">^eval($color_type.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$color_type.pay</td>
   </tr>}</table>
}{}
##@plate_color_center[]





@ladder_size[]
 $ladder_size[^table::load[/store/stone_natural/ladder/ladder_size.cfg]]
<dl>
<dt>Размеры</dt>
  ^ladder_size.menu{
    ^ladder_size_cell[]
  }</dl>
##@plate_size[]
@ladder_size_cell[]
^if($plate_size.uri eq $request:query){
<dd><span>$plate_size.w &times^; $plate_size.h &times^; $plate_size.i</span></dd>
}{
<dd><a href="/store/stone_natural/plate/products_format_type_size/$plate_size.id/">$plate_size.w &times^; $plate_size.h &times^; $plate_size.i</a></dd>
}
#@plate_size_cell[]

@ladder_stone[]
 $plate_stone[^table::load[/store/stone_natural/ladder/ladder_stone.cfg]]
<dl>
<dt>Камень</dt>
  ^ladder_stone.menu{
       ^ladder_stone_cell[]
  }</dl>
##@plate_size[]
@ladder_stone_cell[]
^if($ladder_stone.uri eq $request:query){
  <dd><span>$ladder_stone.name</span></dd>
}{
   <dd><a href="/store/stone_natural/plate/products_format_type/$ladder_stone.id/">$ladder_stone.name</a></dd>
}
#@plate_size_cell[]

@ladder_color_right[]
^h_all[]
 $ladder_color[^table::load[/store/stone_natural/ladder/ladder_color.cfg]]
<dl>
<dt>Цвет</dt>
  ^ladder_color.menu{
       ^ladder_color_cell[]
  }</dl>
##@plate_color[]
@ladder_color_cell[]
^if($ladder_color.uri eq $request:query){
  <dd><span>$ladder_color.name</span></dd>
}{
   <dd><strong><a style="color: $h_detal.color_code.[$plate_color.id]^;" href="/store/stone_natural/plate/color/$ladder_color.id/">$ladder_color.name</a></strong></dd>
}
#@plate_color_cell[]

@plate_pay[]
 $plate_pay[^getProductsStore[]]
   $plate_pay_select[[^plate_pay.select($products_type.products_type==1)]]
<dl>
<dt>Стоимость</dt>
  ^plate_pay_select.menu{
       1
  }</dl>
##@plate_color[]



