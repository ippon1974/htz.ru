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
^if(!def $form:products_format_type_size && !def $form:products_format_type && !def $form:color){Все форматы природного камня одним списком}{
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
 $format_type_select[^title_format_type.select($title_format_type.products_type==1)]
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


@html_all[]
^h_all[]
^all_plate[]
^all_slabs[]
^all_sett[]
^all_ladder[]
#@html_plate[]

@all_plate[]
 $all_plate[^getProductsStore[]]
  $all_plate_cell[^all_plate.select($all_plate.products_type==1)]
 <div class="head_tbl">
 <div>$h_detal.products_type.[$all_plate_cell.products_type]</div>
 <em>Стоимость плитки на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span>$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th>Камень</th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th>Руб.</th>
    <th>^$</th>
</tr>
   ^all_plate_cell.sort($all_plate_cell.pay)[desc]
   ^all_plate_cell.menu{ 
   <tr>
   <td>$all_plate_cell.id</td>
   <td><a href="/store/detal/id/$all_plate_cell.id/">$all_plate_cell.products_name_en</a></td>
   <td>$all_plate_cell.w&times^;$all_plate_cell.h&times^;$all_plate_cell.i</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$all_plate_cell.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$all_plate_cell.color]^;">$h_detal.color_name.[$all_plate_cell.color]</span></td>
   <td class="rub">^eval($all_plate_cell.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$all_plate_cell.pay</td>
   </tr>
   }</table>
#end @all

@all_slabs[]
 $all_slabs[^getProductsStore[]]
  $all_slabs_cell[^all_slabs.select($all_slabs.products_type==3)]
 <div class="head_tbl">
 <div>$h_detal.products_type.[$all_slabs_cell.products_type]</div>
 <em>Стоимость слебов на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span>$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th>Камень</th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th>Руб.</th>
    <th>^$</th>
</tr>
   ^all_slabs_cell.sort($all_slabs_cell.pay)[desc]
   ^all_slabs_cell.menu{ 
   <tr>
   <td>$all_slabs_cell.id</td>
   <td><a href="/store/detal/id/$all_slabs_cell.id/">$all_slabs_cell.products_name_en</a></td>
   <td>${all_slabs_cell.i}мм</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$all_slabs_cell.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$all_slabs_cell.color]^;">$h_detal.color_name.[$all_slabs_cell.color]</span></td>
   <td class="rub">^eval($all_slabs_cell.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$all_slabs_cell.pay</td>
   </tr>
   }</table>
#@all_slabs[]

@all_sett[]
 $all_sett[^getProductsStore[]]
  $all_sett_cell[^all_sett.select($all_sett.products_type==4)]
 <div class="head_tbl">
 <div>$h_detal.products_type.[$all_sett_cell.products_type]</div>
 <em>Стоимость брусчатки на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span>$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th>Камень</th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th>Руб.</th>
    <th>^$</th>
</tr>
   ^all_sett_cell.sort($all_sett_cell.pay)[desc]
   ^all_sett_cell.menu{ 
   <tr>
   <td>$all_sett_cell.id</td>
   <td><a href="/store/detal/id/$all_sett_cell.id/">$all_sett_cell.products_name_en</a></td>
   <td>$all_sett_cell.w&times^;$all_sett_cell.h&times^;$all_sett_cell.i</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$all_sett_cell.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$all_sett_cell.color]^;">$h_detal.color_name.[$all_sett_cell.color]</span></td>
   <td class="rub">^eval($all_slabs_cell.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$all_slabs_cell.pay</td>
   </tr>
   }</table>
#@@all_sett[]

@all_ladder[]
 $all_ladder[^getProductsStore[]]
  $all_ladder_cell[^all_ladder.select($all_ladder.products_type==2)]
 <div class="head_tbl">
 <div>$h_detal.products_type.[$all_ladder_cell.products_type]</div>
 <em>Стоимость ступеней на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span>$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th>Камень</th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th>Руб.</th>
    <th>^$</th>
</tr>
   ^all_ladder_cell.sort($all_ladder_cell.pay)[desc]
   ^all_ladder_cell.menu{ 
   <tr>
   <td>$all_ladder_cell.id</td>
   <td><a href="/store/detal/id/$all_ladder_cell.id/">$all_ladder_cell.products_name_en</a></td>
   <td>$all_ladder_cell.w&times^;$all_ladder_cell.h&times^;$all_ladder_cell.i</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$all_ladder_cell.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$all_ladder_cell.color]^;">$h_detal.color_name.[$all_ladder_cell.color]</span></td>
   <td class="rub">^eval($all_ladder_cell.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$all_ladder_cell.pay</td>
   </tr>
   }</table>
#@all_ladder[]


