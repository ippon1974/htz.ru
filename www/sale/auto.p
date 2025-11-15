@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Прайс-лист</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="Стоимость техники на текущей момент заводов-производителей: SANY, SHANTUI, XCMG, BONNY, CHANG LIN, HONGDA, SHEHWA, ZOOMLION, МТЗ, ХТЗ" />
<meta name="keywords" content="Скачать прайс-листы: SANY, SHANTUI, XCMG, BONNY, CHANG LIN, HONGDA, SHEHWA, ZOOMLION, МТЗ, ХТЗ" />

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://htz.ru/news/rss/rss/" />

</head>
#@header[]

@newPrice[]
 ^CTZ[]
 ^MTZ[]
 ^TAIM[]
 ^AGROMASH[]
 ^HTZ[]
 ^AGROIMPORT[]
 ^HONGDA[]
 ^FANGYUAN[]
 ^SANY[]
 ^ZOOMLION[]
#@newPrice[]

@CTZ[]
$mashine_price[^table::load[/catalog/ctz/nomenclature.cfg]]
 <h3>Техника ПО &laquo^;ЧТЗ&raquo^; (РФ)</h3>
 <p>Стоимость техники ПО &laquo^;ЧТЗ&raquo^; с учетом НДС 18%</p>
 <table class="price_table" cellspacing="0">
<tr>
	<th>Номенклатура</th>
	<th>Стоянка</th>
	<th>Цена</th>
</tr>
 ^mashine_price.menu{
 <tr>
<td><a href="$mashine_price.uri" title="">$mashine_price.name</a></td>
<td><span><nobr>$mashine_price.parking</span></nobr></td>
<td>^if(def $mashine_price.value){$mashine_price.value руб.}{<span style="color:#ff0000^;">Уточнить</span>}</td>
</tr>
 }
 </tr>
</table>
#@CTZ[]

@MTZ[]
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==9)]
  $price[^getPriceMachines[]]
 
#hash таблицы с ценами по полю id 
$price_hash[^price.hash[id]]  

 <h3>Техника ^untaint[as-is]{$mashine_s.brand} (Беларусь)</h3>
 <p>Стоимость техники ^untaint[as-is]{$mashine_s.brand} с учетом НДС 18%</p>
<table class="price_table" cellspacing="0">
<tr>
	<th>Номенклатура</th>
	<th>Стоянка</th>
	<th>Цена</th>
</tr>

#перебираем записи таблицы с товарами 
^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
<tr>
<td><a href="/catalog/mtz/detal/id/$mashine_s.id/" title="$mashine_s.name_ru">$mashine_s.namenklatura</a></td>
<td><span><nobr>$h_Machines.parking_citi.[$mashine_s.parking_citi]</span></nobr></td>
<td>^if($mashine_price){^eval($mashine_price*^exchange_usd[]) руб.}{<span style="color:#ff0000^;">Уточнить</span>}</td>
</tr>
 } 
</tr>
</table>
#@MTZ[]

@TAIM[]
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==8)]
  $price[^getPriceMachines[]]
 
#hash таблицы с ценами по полю id 
$price_hash[^price.hash[id]]  

 <h3>Техника $h_Machines.brand_id.[$mashine_s.brand_id] (Беларусь)</h3>
 <p>Стоимость техники $h_Machines.brand_id.[$mashine_s.brand_id] без НДС</p>
<table class="price_table" cellspacing="0">
<tr>
	<th>Номенклатура</th>
	<th>Стоянка</th>
	<th>Цена</th>
</tr>

#перебираем записи таблицы с товарами 
^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
<tr>
<td><a href="/catalog/belarus/taim/mashine/detal/id/$mashine_s.id/">$mashine_s.name_ru</a></td>
<td><span><nobr>$h_Machines.parking_citi.[$mashine_s.parking_citi]</nobr></span></td>
<td>^if($mashine_price){^eval($mashine_price*^exchange_usd[]) руб.}{<span style="color:#ff0000^;">Уточнить</span>}</td>
</tr>
 } 
</tr>
</table>
#@TAIM[]

@AGROMASH[]
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==7)]
  $price[^getPriceMachines[]]
 
#hash таблицы с ценами по полю id 
$price_hash[^price.hash[id]]  

 <h3>Техника $h_Machines.brand_id.[$mashine_s.brand_id] (Беларусь)</h3>
 <p>Стоимость техники $h_Machines.brand_id.[$mashine_s.brand_id] с учетом НДС 18%</p>
<table class="price_table" cellspacing="0">
<tr>
	<th>Номенклатура</th>
	<th>Стоянка</th>
	<th>Цена</th>
</tr>

#перебираем записи таблицы с товарами 
^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
<tr>
<td><a href="http://htz.ru/catalog/belarus/agromash/mashine/detal/id/$mashine_s.id/">$mashine_s.name_ru</a></td>
<td><span><nobr>$h_Machines.parking_citi.[$mashine_s.parking_citi]</nobr></span></td>
<td>^if($mashine_price){^eval($mashine_price*^exchange_usd[]) руб.}{<span style="color:#ff0000^;">Уточнить</span>}</td>
</tr>
 } 
</tr>
</table>
#@AGROMASH[]

@HTZ[]
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==5)]
  $price[^getPriceMachines[]]
 
#hash таблицы с ценами по полю id 
$price_hash[^price.hash[id]]  

 <h3>Техника &laquo^;$mashine_s.brand&raquo^; (Украина)</h3>
 <p>Стоимость техники &laquo^;$mashine_s.brand&raquo^; с учетом НДС 18%</p>
<table class="price_table" cellspacing="0">
<tr>
	<th>Номенклатура</th>
	<th>Стоянка</th>
	<th>Цена</th>
</tr>

#перебираем записи таблицы с товарами 
^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
<tr>
<td><a href="/catalog/htz/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/">$mashine_s.namenklatura</a></td>
<td><span><nobr>$h_Machines.parking_citi.[$mashine_s.parking_citi]</span></nobr></td>
<td>^if($mashine_price){^eval($mashine_price*^exchange_usd[]) руб.}{<span style="color:#ff0000^;">Уточнить</span>}</td>
</tr>
 } 
</tr>
</table>
#@HTZ[]

@AGROIMPORT[]
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==6)]
  $price[^getPriceMachines[]]
 
#hash таблицы с ценами по полю id 
$price_hash[^price.hash[id]]  

 <h3>Техника &laquo^;$mashine_s.brand&raquo^; (Украина)</h3>
 <p>Стоимость техники &laquo^;$mashine_s.brand&raquo^; с учетом НДС 18%</p>
<table class="price_table" cellspacing="0">
<tr>
	<th>Номенклатура</th>
	<th>Стоянка</th>
	<th>Цена</th>
</tr>

#перебираем записи таблицы с товарами 
^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
<tr>
<td><a href="/catalog/agroimport/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/">$mashine_s.namenklatura</a></td>
<td><span><nobr>$h_Machines.parking_citi.[$mashine_s.parking_citi]</span></nobr></td>
<td>^if($mashine_price){^eval($mashine_price*^exchange_usd[]) руб.}{<span style="color:#ff0000^;">Уточнить</span>}</td>
</tr>
 } 
</tr>
</table>
#@AGROIMPORT[]

@HONGDA[]
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==1)]
  $price[^getPriceMachines[]]
 
#hash таблицы с ценами по полю id 
$price_hash[^price.hash[id]]  

 <h3>Стационарные бетононасосы &laquo^;$mashine_s.brand&raquo^; (Китай)</h3>
 <p>Стоимость техники &laquo^;$mashine_s.brand&raquo^; с учетом НДС 18%</p>
<table class="price_table" cellspacing="0">
<tr>
	<th>Номенклатура</th>
	<th>Стоянка</th>
	<th>Цена</th>
</tr>

#перебираем записи таблицы с товарами 
^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
<tr>
<td><a href="/catalog/china/hongda/pump/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/">$mashine_s.namenklatura</a> (<em style="font-size: 0.9em^;">$h_Machines.classification_sub.[$mashine_s.classification_sub]</em>)</td>
<td><span><nobr>$h_Machines.parking_citi.[$mashine_s.parking_citi]</span></nobr></td>
<td>^if($mashine_price){^eval($mashine_price*^exchange_usd[]) руб.}{<span style="color:#ff0000^;">Уточнить</span>}</td>
</tr>
 } 
</tr>
</table>
#@HONGDA[]

@FANGYUAN[]
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==3)]
  $price[^getPriceMachines[]]
 
#hash таблицы с ценами по полю id 
$price_hash[^price.hash[id]]  

 <h3>Стационарные бетононасосы &laquo^;$mashine_s.brand&raquo^; (Китай)</h3>
 <p>Стоимость техники &laquo^;$mashine_s.brand&raquo^; с учетом НДС 18%</p>
<table class="price_table" cellspacing="0">
<tr>
	<th>Номенклатура</th>
	<th>Стоянка</th>
	<th>Цена</th>
</tr>

#перебираем записи таблицы с товарами 
^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
<tr>
<td><a href="/catalog/china/fangyuan/pump/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/">$mashine_s.namenklatura</a>  (<em style="font-size: 0.9em^;">$h_Machines.classification_sub.[$mashine_s.classification_sub]</em>)</td>
<td><span><nobr>$h_Machines.parking_citi.[$mashine_s.parking_citi]</span></nobr></td>
<td>^if($mashine_price){^eval($mashine_price*^exchange_usd[]) руб.}{<span style="color:#ff0000^;">Уточнить</span>}</td>
</tr>
 } 
</tr>
</table>
#@FANGYUAN[]

@SANY[]
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==2)]
  $mashine_s_s[^mashine_s.select($mashine_s.classification==1)]
  $price[^getPriceMachines[]]
 
#hash таблицы с ценами по полю id 
$price_hash[^price.hash[id]]  

 <h3>Стационарные бетононасосы &laquo^;$mashine_s_s.brand&raquo^; (Китай)</h3>
 <p>Стоимость техники &laquo^;$mashine_s_s.brand&raquo^; с учетом НДС 18%</p>
<table class="price_table" cellspacing="0">
<tr>
	<th>Номенклатура</th>
	<th>Стоянка</th>
	<th>Цена</th>
</tr>

#перебираем записи таблицы с товарами 
^mashine_s_s.menu{  
    $mashine_price[$price_hash.[$mashine_s_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
<tr>
<td><a href="/catalog/china/sany/pump/$mashine_s_s.classification_sub_sub_uri/$mashine_s_s.translite/">$mashine_s_s.namenklatura</a> (<em style="font-size: 0.9em^;">$h_Machines.classification_sub.[$mashine_s_s.classification_sub]</em>)</td>
<td><span><nobr>$h_Machines.parking_citi.[$mashine_s_s.parking_citi]</span></nobr></td>
<td>^if($mashine_price){^eval($mashine_price*^exchange_usd[]) руб.}{<span style="color:#ff0000^;">Уточнить</span>}</td>
</tr>
 } 
</tr>
</table>
#@SANY[]

@ZOOMLION[]
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==4)]
  $mashine_s_s[^mashine_s.select($mashine_s.classification==1)]
  $price[^getPriceMachines[]]
 
#hash таблицы с ценами по полю id 
$price_hash[^price.hash[id]]  

 <h3>Стационарные бетононасосы &laquo^;$mashine_s_s.brand&raquo^; (Китай)</h3>
 <p>Стоимость техники &laquo^;$mashine_s_s.brand&raquo^; с учетом НДС 18%</p>
<table class="price_table" cellspacing="0">
<tr>
	<th>Номенклатура</th>
	<th>Стоянка</th>
	<th>Цена</th>
</tr>

#перебираем записи таблицы с товарами 
^mashine_s_s.menu{  
    $mashine_price[$price_hash.[$mashine_s_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
<tr>
<td><a href="/catalog/china/zoomlion/pump/$mashine_s_s.classification_sub_sub_uri/$mashine_s_s.translite/">$mashine_s_s.namenklatura</a> (<em style="font-size: 0.9em^;">$h_Machines.classification_sub.[$mashine_s_s.classification_sub]</em>)</td>
<td><span><nobr>$h_Machines.parking_citi.[$mashine_s_s.parking_citi]</span></nobr></td>
<td>^if($mashine_price){^eval($mashine_price*^exchange_usd[]) руб.}{<span style="color:#ff0000^;">Уточнить</span>}</td>
</tr>
 } 
</tr>
</table>
#@ZOOMLION[]