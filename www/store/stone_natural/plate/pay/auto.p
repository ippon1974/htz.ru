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
Плитка из природного камня с сортировкой по цене
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


@html_plate[]
^h_all[]
^if(!def $form:products_format_type_size && !def $form:products_format_type && !def $form:color){^plate[]}{
}
#@html_plate[]

@plate[]
^if(!def $form:products_format_type_size){
 $plate[^getProductsStore[]]
  $plate_cell[^plate.select($plate.products_type==1)] 
 <div style="margin: 0 0 0.5em 0^; color:#383838^;"><em>Стоимость плитки на: ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>. <strong>USD</strong> <span style="color:#ff0000^;">$h_detal.exchange_rate.[1]</span></div>
 <table class="store_store">
 <tr>
    <th>№</th>
	<th><a href="/store/stone_natural/plate/letter/">Камень</a></th>
	<th>Размеры</th>
	<th>Цвет</th>
	<th><a href="/store/stone_natural/plate/">Руб.</a></th>
    <th><a href="/store/stone_natural/plate/">^$</a></th>
</tr>
   ^plate_cell.sort($plate_cell.pay)
   ^plate_cell.menu{ 
   <tr>
   <td>$plate_cell.id</td>
   <td><a href="/store/detal/id/$plate_cell.id/">$plate_cell.products_name_en</a>  <ins title="$h_detal.products_format_type.[$plate_cell.products_format_type]">$h_detal.products_socr.[$plate_cell.products_format_type]<ins/></td>
   <td>$plate_cell.w&times^;$plate_cell.h&times^;$plate_cell.i</td>
   <td><span style="padding: 0 5px 0 5px^; color: $h_detal.color_font.[$plate_cell.color]^; font-size: 0.8em^; background-color: $h_detal.color_code.[$plate_cell.color]^;">$h_detal.color_name.[$plate_cell.color]</span></td>
   <td class="rub">^eval($plate_cell.pay*$h_detal.exchange_rate.[1]).00</td>
   <td class="usd">$plate_cell.pay</td>
   </tr>
   }</table>
#end @plate[]
}{}
#@plate[]








