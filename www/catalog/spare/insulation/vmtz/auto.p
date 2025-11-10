@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^description[]" />
<meta name="keywords" content="^keywords[]" />
<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />
</head>
#@header[]

@title[]
$result[Утеплители моторов для тракторов. ВМТЗ Владимирский моторо-тракторный завод.]
#end @title[]

@description[]
$result[Утеплители моторов для тракторов. ВМТЗ Владимирский моторо-тракторный завод.]
#end @description[]

@keywords[]
$result[Утеплитель мотора, утеплитель для трактора, утеплитель для МТЗ утеплитель для ХТЗ]
#end @keywords[]


@Insulation[]
^hInsulation[]
$insulation[^getInsulation[]]
<h3 id="ins_amkodor">${h_Insulation.factory.[6]} ${h_Insulation.factory_desc.[6]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_amkodor[^insulation.select($insulation.tech_id==6)]
^ins_amkodor.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_amkodor.id/" title="Утеплитель на капот. $ins_amkodor.product_desc">$ins_amkodor.product_desc</a></td>
    	<td>$ins_amkodor.cost</td>
	</tr>
}
</table>

#end @Insulation[]