@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title_htz[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title_htz[] | Тракторы общего назначения завода ХТЗ" />
<meta name="keywords" content="^title_htz[] | ХТЗ, купить трактор ХТЗ Т-150 К09, запчасти ХТЗ" />

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
<body class="events concerts">
#end@header[]

@title_htz[]
^hMachines[]
$machines[^getMachines[]]
$str[$request:uri]
$parts[^str.split[/;lh]] 
$parts_spl[$parts.0/$parts.1/$parts.2/$parts.3/]
$parts_parts[$parts.4]
^switch[$parts_spl]{
   ^case[/catalog/htz/general/]{^if(^machines.locate[translite;$parts_parts]){$result[${machines.name_ru}. Сборка ОАО "${machines.brand}". ${h_Machines.classification_sub.[$machines.classification_sub]}.]}{}} 
   ^case[/catalog/htz/universal/]{^if(^machines.locate[translite;$parts_parts]){$result[${machines.name_ru}. Сборка ОАО "${machines.brand}". ${h_Machines.classification_sub.[$machines.classification_sub]}.]}{}}
   ^case[/catalog/htz/spec/]{^if(^machines.locate[translite;$parts_parts]){$result[${machines.name_ru}. Сборка ОАО "${machines.brand}". ${h_Machines.classification_sub.[$machines.classification_sub]}.]}{}}
   ^case[/catalog/htz/small/]{^if(^machines.locate[translite;$parts_parts]){$result[${machines.name_ru}. Сборка ОАО "${machines.brand}". ${h_Machines.classification_sub.[$machines.classification_sub]}.]}{}}
         …          
   ^case[DEFAULT]{$result[Тракторы сборки Харьковского тракторного завода им. Серго Орджоникидзе. ОАО «ХТЗ»])}
 }
 
#@title[]

@getHTZCELL[]
$str[$request:uri]
$parts[^str.split[/;lh]] 
$parts_spl[$parts.0/$parts.1/$parts.2/$parts.3/]
^switch[$parts_spl]{ 
   ^case[/catalog/htz/general/]{^getHTZ[]} 
   ^case[/catalog/htz/universal/]{^getHTZuniversal[]}
   ^case[/catalog/htz/spec/]{^getHTZspec[]}
   ^case[/catalog/htz/small/]{^getHTZsmall[]}
         …          
   ^case[DEFAULT]{
   
   
   <h2>Тракторы сборки Харьковского тракторного завода им. Серго Орджоникидзе. (ОАО &laquo^;ХТЗ&raquo^;)</h2>

<ul id="anchorlist">
			<li><a href="/catalog/htz/general/" title="Тракторы общего назначения ХТЗ">Тракторы общего назначения (ОАО &laquo^;ХТЗ&raquo^;)</a></li>
			<li><a href="/catalog/htz/universal/" title="Пахотно-пропашные трактора ХТЗ">Пахотно-пропашные трактора (ОАО &laquo^;ХТЗ&raquo^;)</a></li>
			<li><a href="/catalog/htz/spec/" title="Спецтехника ХТЗ">Спецтехника (ОАО &laquo^;ХТЗ&raquo^;)</a></li>
			<li><a href="/catalog/htz/small/" title="Тракторы малой мощности ХТЗ">Тракторы малой мощности (ОАО &laquo^;ХТЗ&raquo^;)</a></li>
			<li><a href="/catalog/htz/all/" title=""><strong style="color: #ff6600^;"><em>Вся техника &laquo^;ХТЗ&raquo^; одним списком</em></strong></a></li>
			<li><a href="/catalog/htz/teh/" title="Характеристики техники ХТЗ"><i><strong>Характеристики техники &laquo^;ХТЗ&raquo^;</strong></i></a></li>
			<li><a href="/catalog/htz/spare/" title="Запчасти для тракторов ХТЗ"><i><strong>Запчасти для тракторов &laquo^;ХТЗ&raquo^;</strong></i></a></li>
</ul>

<h3 id="our_education_programmes">Прошлое и будущее ОАО &laquo^;ХТЗ&raquo^;</h3> 

<p>&laquo^;Черным годом&raquo^; для нашего и многих других заводов сельхозмашиностроения стран СНГ стал 2002 год, когда объем годового производства в отрасли упал до рекордно низкой отметки. Но уже в 2003 году ситуацию удалось переломить благодаря государственной поддержке отрасли. Начиная с 2003 г., объем производства украинских тракторов стал расти в среднем на 15&mdash^;17% в год.</p>

<img src="/catalog/htz/i/001.jpg" alt="Харьковский тракторный завод" />

<p>Есть все предпосылки утверждать, что в 2007 году произойдет значительное увеличение темпов роста производства. Причинами станут повышение покупательной способности фермеров и сельских хозяйств, а также реализация государственных программ поддержки и кредитования сельхозпроизводителей. И конечно же, конкурентные преимущества нового семейства харьковских тракторов, серийный выпуск которых начался в 2006 году.</p>

<p>Сегодня во всем мире сельское хозяйство &mdash^; это сплав современных технологий, трудолюбия и природных условий. Важнейшей составляющей успешного аграрного бизнеса уже давно стал уровень механизации производства. К сожалению, до недавнего времени сельскохозяйственное машиностроение Украины переживало не лучшие времена. Кризис отрасли был напрямую связан с кризисом сельского хозяйства как в Украине, так и во многих странах СНГ, на традиционном рынке сбыта харьковской техники.</p>

<p>Практически десятилетняя стагнация, охватившая аграрный комплекс, наиболее серьезно затронула машинно-тракторный парк. С 1990 по 2004 год только в сельском хозяйстве Украины количество тракторов сократилось почти в два раза (с 471,1 тыс. до 250,7 тыс. штук), а зерноуборочных комбайнов - в полтора раза (с 105,3 тыс. до 62,1 тыс. штук). За эти годы из-за полного физического износа было списано свыше четверти миллиона тракторов и более 50 тысяч комбайнов.</p>

<p>По этим сухим цифрам даже неспециалист может восстановить картину реальной обеспеченности аграриев сельхозтехникой. Произведенные в большинстве своем еще во времена СССР, тракторы и комбайны работали по 20 &mdash^; 30 лет с превышением нормы нагрузки в 1,5 &mdash^; 2,5 раза.</p>

<p>На протяжении последних лет ситуация в сельском предпосылки позитивного роста: стал формироваться новый класс крупных землевладельцев, начали активно развиваться малые и средние фермерские хозяйства. Законодательные изменения и последовательные действия правительства по поддержке отечественных аграриев позволяют надеяться, что ситуация будет улучшаться более быстрыми темпами.</p>

<p class="backtotop"><a href="#anchorlist" title="На вверх">На вверх</a></p>
   
   
   } 
} 
#@getHTZCELL[]

@getHTZ[]
^if(in "/catalog/htz/general/"){ 
^hMachines[]
 $mashine[^getMachines[]]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]] 
 
 $str[$request:uri]
 $parts[^str.split[/;lh]] 
 $parts_parts[$parts.4]
  ^if(^mashine.locate[translite;$parts_parts]){
  <h2>${mashine.name_ru}. Сборка ОАО &laquo^;${mashine.brand}&raquo^;. ${h_Machines.classification_sub.[$mashine.classification_sub]}.</h2>
  $mashine_price[$price_hash.[$mashine.id].price]
<div id="tehnobody">
^warning[]
<span>^dtf:format[%d %h %Y;]</span>
<h3>$mashine.namenklatura</h3>
$text(^eval($mashine_price*^exchange_usd[]))

^if($text){
<span>Цена:</span>
$text_nds($text/6.55557)
<h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4>
<div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>
<dl id="info">
            ^if($mashine.classification){
			<dt>Тип:</dt>
			<dd>$h_Machines.classification.[$mashine.classification]</dd>
			}{}
			^if(def $mashine.brand){
			<dt>Бренд:</dt>
			<dd>&laquo^;$mashine.brand&raquo^;</dd>
			}{}
			^if($mashine.country_origin_ru){
			<dt>Производство:</dt>
			<dd>$h_Machines.country_origin_ru.[$mashine.country_origin_ru]</dd>
			}{}
			^if(def $mashine.namenklatura){
			<dt>Номенклатура:</dt>
			<dd><strong>$mashine.namenklatura</strong></dd>
			}{}
			<dt>Год выпуска:</dt>
			<dd><strong>^dtf:format[%Y;]</strong> г.</dd>
			<dt>Состояние:</dt>
			<dd>Новый</dd>
			^if($mashine.parking){
			<dt>Стоянка:</dt>
			<dd>${h_Machines.parking.[$mashine.parking]}. ${h_Machines.parking_citi.[$mashine.parking_citi]}.</dd>
			}{}
			^if($mashine.customs){
			<dt>Таможня:</dt>
			<dd>${h_Machines.customs.[$mashine.customs]}.</dd>
			}{}
			<!--<dt>Телефон:</dt>
			<dd>^my_phone_new_h[]</dd>-->
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<!--<dt><strong>Запрос:</strong></dt>-->
<!--<dd>
<form class="callme" method="post">
<input onclick="document.getElementById('divCallMe').style.display=document.getElementById('divCallMe').style.display!='block'?'block':'none'^; return false^;" type="Submit" style="font-size: 1.2em^; border-right: 2px solid #484848^; border-bottom: 2px solid #484848^; border-top: 2px solid #fcfcfc^; border-left: 2px solid #fcfcfc^; color:#000^; width: auto^; padding: 0 5px^; " value="Запрос" />
</form>
</dd>-->

</dl>

^Callback[]
	}{}
</div>

  <ul id="anchorlist">
			<li><a href="$mashine.tehno_info_uri" class="glossary" title="Технические характеристики">Технические характеристики</a></li>
</ul>

<img src="/catalog/img/detal/${mashine.img}.jpg" alt="$mashine.name_ru">

^untaint[as-is]{
 $mashine.body
}

^menu_batton[]

<p class="backtotop"><a href="#primary" title="На вверх">На вверх</a></p>

  }{}
}{}
#@getHTZ[]


@getHTZuniversal[]
^if(in "/catalog/htz/universal/"){ 
^hMachines[]
 $mashine[^getMachines[]]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]] 
 
 $str[$request:uri]
 $parts[^str.split[/;lh]] 
 $parts_parts[$parts.4]
  ^if(^mashine.locate[translite;$parts_parts]){
  <h2>${mashine.name_ru}. Сборка ОАО &laquo^;${mashine.brand}&raquo^;. ${h_Machines.classification_sub.[$mashine.classification_sub]}.</h2>
  $mashine_price[$price_hash.[$mashine.id].price]
<div id="tehnobody">
^warning[]
<span>^dtf:format[%d %h %Y;]</span>
<h3>$mashine.namenklatura</h3>
$text(^eval($mashine_price*^exchange_usd[]))

^if($text){
<span>Цена:</span>
$text_nds($text/6.55557)
<h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4>
<div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>

<dl id="info">
            ^if($mashine.classification){
			<dt>Тип:</dt>
			<dd>$h_Machines.classification.[$mashine.classification]</dd>
			}{}
			<dt>Бренд:</dt>
			<dd>&laquo^;$mashine.brand&raquo^;</dd>
			^if($mashine.country_origin_ru){
			<dt>Производство:</dt>
			<dd>$h_Machines.country_origin_ru.[$mashine.country_origin_ru]</dd>
			}{}
			<dt>Номенклатура:</dt>
			<dd><strong>$mashine.namenklatura</strong></dd>
			^if($mashine.year){
			<dt>Год выпуска:</dt>
			<dd><strong>^dtf:format[%Y;]</strong> г.</dd>
			}{}
			<dt>Состояние:</dt>
			<dd>Новый</dd>
			^if($mashine.parking){
			<dt>Стоянка:</dt>
			<dd>${h_Machines.parking.[$mashine.parking]}. г.${h_Machines.parking_citi.[$mashine.parking_citi]}.</dd>
			}{}
			^if($mashine.customs){
			<dt>Таможня:</dt>
			<dd>${h_Machines.customs.[$mashine.customs]}.</dd>
			}{}
			<!--<dt>Телефон:</dt>
			<dd>^my_phone[]</dd>-->
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<!--<dt><strong>Запрос</strong></dt>
			<dd>
<form class="callme" method="post">
<input onclick="document.getElementById('divCallMe').style.display=document.getElementById('divCallMe').style.display!='block'?'block':'none'^; return false^;" type="Submit" style="font-size: 1.0em^; border-right: 2px solid #484848^; border-bottom: 2px solid #484848^; border-top: 2px solid #fcfcfc^; border-left: 2px solid #fcfcfc^; color:#000^; width: auto^; padding: 0 5px^; " value="Запрос" />
</form>
</dd>-->
</dl>
^Callback[]
	}{}
</div>


  <ul id="anchorlist">
			<li><a href="$mashine.tehno_info_uri" class="glossary" title="Технические характеристики">Технические характеристики</a></li>
</ul>
<img src="/catalog/img/detal/${mashine.img}.jpg" alt="$mashine.name_ru">

^untaint[as-is]{
 $mashine.body
}

^menu_batton[]

<p class="backtotop"><a href="#primary" title="На вверх">На вверх</a></p>

  }{}
}{}
#@getHTZuniversal[]


@getHTZspec[]
^if(in "/catalog/htz/spec/"){ 
^hMachines[]
 $mashine[^getMachines[]]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]] 
 
 $str[$request:uri]
 $parts[^str.split[/;lh]] 
 $parts_parts[$parts.4]
  ^if(^mashine.locate[translite;$parts_parts]){
  <h2>${mashine.name_ru}. Сборка ОАО &laquo^;${mashine.brand}&raquo^;. ${h_Machines.classification_sub.[$mashine.classification_sub]}.</h2>
  $mashine_price[$price_hash.[$mashine.id].price]
<div id="tehnobody">
^warning[]
<span>^dtf:format[%d %h %Y;]</span>
<h3>$mashine.namenklatura</h3>
$text(^eval($mashine_price*^exchange_usd[]))

^if($text){
<span>Цена:</span>
$text_nds($text/6.55557)
<h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4>
<div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>

<dl id="info">
            ^if($mashine.classification){
			<dt>Тип:</dt>
			<dd>$h_Machines.classification.[$mashine.classification]</dd>
			}{}
			<dt>Бренд:</dt>
			<dd>&laquo^;$mashine.brand&raquo^;</dd>
			^if($mashine.country_origin_ru){
			<dt>Производство:</dt>
			<dd>$h_Machines.country_origin_ru.[$mashine.country_origin_ru]</dd>
			}{}
			<dt>Номенклатура:</dt>
			<dd><strong>$mashine.namenklatura</strong></dd>
			^if($mashine.year){
			<dt>Год выпуска:</dt>
			<dd><strong>^dtf:format[%Y;]</strong> г.</dd>
			}{}
			<dt>Состояние:</dt>
			<dd>Новый</dd>
			^if($mashine.parking){
			<dt>Стоянка:</dt>
			<dd>${h_Machines.parking.[$mashine.parking]}. г.${h_Machines.parking_citi.[$mashine.parking_citi]}.</dd>
			}{}
			^if($mashine.customs){
			<dt>Таможня:</dt>
			<dd>${h_Machines.customs.[$mashine.customs]}.</dd>
			}{}
			<!--<dt>Телефон:</dt>
			<dd>^my_phone[]</dd>-->
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<!--<dt><strong>Запрос</strong></dt>
			<dd>
<form class="callme" method="post">
<input onclick="document.getElementById('divCallMe').style.display=document.getElementById('divCallMe').style.display!='block'?'block':'none'^; return false^;" type="Submit" style="font-size: 1.0em^; border-right: 2px solid #484848^; border-bottom: 2px solid #484848^; border-top: 2px solid #fcfcfc^; border-left: 2px solid #fcfcfc^; color:#000^; width: auto^; padding: 0 5px^; " value="Запрос" />
</form>
</dd>-->
</dl>
^Callback[]
	}{}
</div>

  <ul id="anchorlist">
			<li><a href="$mashine.tehno_info_uri" class="glossary" title="Технические характеристики">Технические характеристики</a></li>
</ul>

<img src="/catalog/img/detal/${mashine.img}.jpg" alt="$mashine.name_ru">

^untaint[as-is]{
 $mashine.body
}

^menu_batton[]

<p class="backtotop"><a href="#primary" title="На вверх">На вверх</a></p>
  }{}
}{}
#@getHTZspec[]

@getHTZsmall[]
^if(in "/catalog/htz/small/"){ 
^hMachines[]
 $mashine[^getMachines[]]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]] 
 
 $str[$request:uri]
 $parts[^str.split[/;lh]] 
 $parts_parts[$parts.4]
  ^if(^mashine.locate[translite;$parts_parts]){
  <h2>${mashine.name_ru}. Сборка ОАО &laquo^;${mashine.brand}&raquo^;. ${h_Machines.classification_sub.[$mashine.classification_sub]}.</h2>
  $mashine_price[$price_hash.[$mashine.id].price]
<div id="tehnobody">
^warning[]
<span>^dtf:format[%d %h %Y;]</span>
<h3>$mashine.namenklatura</h3>
$text(^eval($mashine_price*^exchange_usd[]))

^if($text){
<span>Цена:</span>
$text_nds($text/6.55557)
<h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4>
<div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>

<dl id="info">
            ^if($mashine.classification){
			<dt>Тип:</dt>
			<dd>$h_Machines.classification.[$mashine.classification]</dd>
			}{}
			<dt>Бренд:</dt>
			<dd>&laquo^;$mashine.brand&raquo^;</dd>
			^if($mashine.country_origin_ru){
			<dt>Производство:</dt>
			<dd>$h_Machines.country_origin_ru.[$mashine.country_origin_ru]</dd>
			}{}
			<dt>Номенклатура:</dt>
			<dd><strong>$mashine.namenklatura</strong></dd>
			^if($mashine.year){
			<dt>Год выпуска:</dt>
			<dd><strong>^dtf:format[%Y;]</strong> г.</dd>
			}{}
			<dt>Состояние:</dt>
			<dd>Новый</dd>
			^if($mashine.parking){
			<dt>Стоянка:</dt>
			<dd>${h_Machines.parking.[$mashine.parking]}. г.${h_Machines.parking_citi.[$mashine.parking_citi]}.</dd>
			}{}
			^if($mashine.customs){
			<dt>Таможня:</dt>
			<dd>${h_Machines.customs.[$mashine.customs]}.</dd>
			}{}
			<!--<dt>Телефон:</dt>
			<dd>^my_phone[]</dd>-->
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<!--<dt><strong>Запрос</strong></dt>
<dd>
<form class="callme" method="post">
<input onclick="document.getElementById('divCallMe').style.display=document.getElementById('divCallMe').style.display!='block'?'block':'none'^; return false^;" type="Submit" style="font-size: 1.0em^; border-right: 2px solid #484848^; border-bottom: 2px solid #484848^; border-top: 2px solid #fcfcfc^; border-left: 2px solid #fcfcfc^; color:#000^; width: auto^; padding: 0 5px^; " value="Запрос" />
</form>
</dd>-->
</dl>
^Callback[]
	}{}
</div>

  <ul id="anchorlist">
			<li><a href="$mashine.tehno_info_uri" class="glossary" title="Технические характеристики">Технические характеристики</a></li>
</ul>

<img src="/catalog/img/detal/${mashine.img}.jpg" alt="$mashine.name_ru">

^untaint[as-is]{
 $mashine.body
}

^menu_batton[]

<p class="backtotop"><a href="#primary" title="На вверх">На вверх</a></p>

  }{}
}{}
#@getHTZsmall[]


@navi_sub_str[]
$str[$request:uri] 
$parts[^str.split[/;lh]] 
$parts_str[$parts.0/$parts.1/$parts.2/$parts.3/]
^if(in "$parts_str"){ 
^navi[]
}{
<ul id="breadcrumbs">
<li class="first"><a href="/" title="Главная">Главная</a></li>
<li><a href="/catalog/" title="Каталог">Каталог</a></li>
<li class="ua"><strong>Тракторы &laquo^;ХТЗ&raquo^;</strong></li>
</ul>
}
#@navi_sub_str[]

@navi_sub_nav[]
 $navi_sub_nav[^getMachines[]]
    ^if(^navi_sub_nav.locate[tehno_info_uri;$request:uri]){<div><a href="/catalog/htz/$navi_sub_nav.classification_sub_sub_uri/$navi_sub_nav.translite/">$navi_sub_nav.namenklatura</a></div><br />}{} 
#@navi_sub_nav[]

@menu_batton[]
  $menu_batton[^getMachines[]]
   $menu_batton_brand[^menu_batton.select($menu_batton.brand_id==5)]
   $menu_batton_select[^menu_batton_brand.select($menu_batton_brand.classification==5)]
   <h1>Тракторы $menu_batton_brand.brand</h1>
   <ul>
    ^menu_batton_select.menu{

	 ^if($menu_batton_select.translite eq $form:translite){
	 <li><strong>$menu_batton_select.name_ru</strong></li>
	 }{
	 <li><a href="/catalog/htz/$menu_batton_select.classification_sub_sub_uri/$menu_batton_select.translite/">$menu_batton_select.name_ru</a></li>
	 }

	}
   </ul>
#@menu_batton[]

@menu_namenklatura[]
  $menu_namenklatura[^getMachines[]]
   $menu_namenklatura_brand[^menu_namenklatura.select($menu_namenklatura.brand_id==5)]
   <h3>Номенклатура</h3>
   $str[$request:uri]
   $parts[^str.split[/;lh]] 
   $parts_parts[$parts.4]
   <ul id="section_id">
    ^menu_namenklatura_brand.menu{
	 ^if($menu_namenklatura_brand.translite eq $parts_parts){
	 <li><strong>$menu_namenklatura_brand.namenklatura</strong></li>
	 }{
	 ^if($menu_namenklatura_brand.tehno_info_uri eq $request:uri){<li class="four"><a href="/catalog/htz/$menu_namenklatura_brand.classification_sub_sub_uri/$menu_namenklatura_brand.translite/">$menu_namenklatura_brand.namenklatura</a></li>}{<li><a href="/catalog/htz/$menu_namenklatura_brand.classification_sub_sub_uri/$menu_namenklatura_brand.translite/">$menu_namenklatura_brand.namenklatura</a></li>}
	 }
}
   </ul>
#@menu_namenklatura[]




@Callback[]
$to[<mail@htz.ru>]
^rem{ *** от какого адреса будет отправляться письмо *** }
$from[index@$env:SERVER_NAME]

^if($form:action eq "done"){
	^rem{ *** сюда мы попадём после внешнего редиректа когда всё уже успешно отправилось *** }
	^rem{ *** тут пишем посетителю что-нить доброе за то, что он отправил нам пожелание *** }
	$reply_thanks[<div class="callback_post">
	<p style="margin: 0^;"><strong style="color:#008000^;">Ваш запрос отправлен.</strong></p>
	<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">В ближайшее время мы свяжемся с вами по телефону или электронной почте.</p>  
	<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">Ваш запрос: $mashine_s_s.name_ru</p>
	<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">Стоимость: ^if($mashine_price){^number_format[^text.format[%.2f];,;.](2) руб.РФ.}{<em>Нет точной цены</em>}</p>
	</div>]
}{

}

^if(def $form:do){
	^rem{ *** если что-то пришло к нам в элементе 'do' - значит форма сабмитится *** }
	^if(^is_ok[]){
		$now[^date::now[]]
		^rem{ *** если данные валидные, то пробуем отправить письмо *** }
		^try{
			^mail:send[ 
				      $.from[^if(^is_email[$form:email]){$form:email}{$from}] 
				      $.to[$to] 
				      $.subject[Запрос техники: http://$env:SERVER_NAME/]
				      $.charset[$response:charset] 
				      $.text[Название техники: $form:tehno_name^#0AСтраница техники: $form:uri^#0AСтомиость техники: — $form:price руб. РФ.^#0AГород/Область — $form:city^#0AИмя клиента: $form:name^#0A^if(def $form:email){Фамилия: $form:lastname^#0A}Телефон: $form:phone^#0AЭлектронная почта: $form:email^#0AКомментарий клиента: $form:comments^#0A^#0AСообщение отправлено: ^now.sql-string[]^#0AIP: $env:REMOTE_ADDR]
]
}{
			^rem{ *** использовали try т.к. в отправке письма может возникнуть ошибка *** }
			^rem{ *** и тут мы окажемся, если эта ошибка таки возникла *** }

			^rem{ *** говорим парсеру, что с этой ошибкой мы разберёмся сами *** }
			$exception.handled(1)
			
			^rem{ *** ну и надо что-нить сообщить пользователю в связи с ошибкой *** }
			^rem{ *** конечно хорошо-бы ещё записать что-нить в лог файл про эту ошибку *** }
			<p>Сожалеем, но при отправке письма возникла неизвестная ошибка.</p>
		}

		^rem{ *** делаем _внешний_ редирект на себя, чтобы защититься от Reload *** }
		^rem{ *** правда от Back все равно таким образом не защититься *** }
		^rem{ *** для того, чтобы редирект был внешним не забываем начать адрес с http:// *** }
		$response:location[http://^taint[as-is][${env:SERVER_NAME}$request:uri]^if(^request:uri.pos[?]>=0){&}{?}action=done]
	}{
		^rem{ *** не заполнены какие-то поля формы. ругаемся. *** }
		^rem{ *** при этом не сбрасываем флаг что нужно показывать форму. *** }
		^rem{ *** т.е. после ругани у нас покажется форма *** }
		^rem{ *** при этому уже заполненные ранее пользователям данные не будут потеряны *** }
		$err_field_empty[<div class="callback_post_error">
		<p style="margin: 0^;"><strong>Внимание ошибка!</strong></p>
		<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">Вы не заполнили обязательные поля данной формы. Попробуйте отправить запрос повторно.</p>
		<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">В случае возникновения проблем с отправкой, перезвоните нам по телефону: ^my_phone[]</p>
		<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">Режим работы: Пн-Пт. С 10.00 до 19.00. Суббота и воскресенье &mdash^; выходные дни.</p>
		</div>]
	}
}

<div class="head_contact">
$err_field_empty
$reply_thanks
<div class="callme">

<div class="clear"></div>
 <div class="form" id="divCallMe">
  <div class="close" onclick="document.getElementById('divCallMe').style.display='none'^;"></div>
  <div id="divCallMeBody">
  <script src="/includes/scripts/100.js" type="text/javascript"></script>


<form action="^if(!def $form:translite){/catalog/htz/$mashine.classification_sub_sub_uri/?translite=$mashine.translite}{/catalog/htz/$mashine_s_s.classification_sub_sub_uri/?translite=$mashine_s_s.translite}" method="post" enctype="multipart/form-data">
<input type="hidden" name="do" value="do" />
<input type="Hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />
<input type="Hidden" name="tehno_name" value="^if(!def $form:translite){$mashine.name_ru}{$mashine_s_s.name_ru}" />
<input type="Hidden" name="price" value="^number_format[^text.format[%.2f];,;.](2)" />

<table class="postmashine" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr valign="top">
	<td>
	<p style="font-size: 1.1em^; margin: 0^;">Запрос техники завода: <strong>^if(!def $form:translite){$h_Machines.brand_id.[$mashine.brand_id]}{$h_Machines.brand_id.[$mashine_s_s.brand_id]}</strong></p>
	<p style="font-size: 1.1em^; margin: 0^;">Производство: <strong>^if(!def $form:translite){$h_Machines.country_origin_ru.[$mashine.country_origin_ru]}{$h_Machines.country_origin_ru.[$mashine_s_s.country_origin_ru]}</strong></p>
	<p style="font-size: 1.1em^; margin: 0^;">Название: ^if(!def $form:translite){$mashine.name_ru}{$mashine_s_s.name_ru}</p>
	<p style="font-size: 1.1em^; margin: 0^;">Стоимость: ^if($mashine_price){<strong>^number_format[^text.format[%.2f];,;.](2)</strong> руб. РФ.}{<em>Нет точной цены</em>}</p>
	</td>
	<td width="120px">^if(!def $form:translite){<img src="/catalog/img/front/${mashine.img}.jpg" alt="$mashine.name_ru">}{<img src="/catalog/img/front/${mashine_s_s.img}.jpg" alt="$mashine_s_s.name_ru">}</td>
</tr>
<tr>
<td colspan="2">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td>
	<label style="color:#000^; font-size: 0.8em^;">Компания</label><br />
    <input type="text" name="company" value="" style="background: #fffff0^; width: 100%^; border-color:  #5a5a5a #eaeaea  #eaeaea #5a5a5a^;" />
	</td>
</tr>
<tr>
	<td>
	<label style="color:#ff0000^; font-size: 0.8em^;">Ваше Имя</label><br />
    <input type="text" name="name" value="" style="background: #fffff0^; width: 100%^; border-color:  #5a5a5a #eaeaea  #eaeaea #5a5a5a^;" />
	</td>
</tr>
<tr>
	<td>
	<label style="color:#ff0000^; font-size: 0.8em^;">Фамилия</label><br />
    <input type="text" name="lastname" value="" style="background: #fffff0^; width: 100%^; border-color:  #5a5a5a #eaeaea  #eaeaea #5a5a5a^;" />
	</td>
</tr>
<tr>
	<td>
	<label style="color:#ff0000^; font-size: 0.8em^;">Телефон с кодом</label><br />
    <input type="text" name="phone" value="" style="background: #fffff0^; width: 100%^; border-color:  #5a5a5a #eaeaea  #eaeaea #5a5a5a^;" />
	</td>
</tr>
<tr>
	<td>
	<label style="color:#ff0000^; font-size: 0.8em^;">Электронная почта</label><br />
    <input type="text" name="email" value="" style="background: #fffff0^; width: 100%^; border-color:  #5a5a5a #eaeaea  #eaeaea #5a5a5a^;" />
	</td>
</tr>
<tr>
	<td>
	<label style="color:#000^; font-size: 0.8em^;">Ваш город / область</label><br />
    <input type="text" name="city" value="" style="background: #fffff0^; width: 100%^; border-color:  #5a5a5a #eaeaea  #eaeaea #5a5a5a^;" />
	</td>
</tr>
<tr>
	<td>
	<label style="color:#000^; font-size: 0.8em^;">Текст сообщения</label><br />
    <textarea type="text" rows="4" cols="20" name="comments" value="" style="overflow: auto^; background: #fffff0^; width: 100%^; border-color:  #5a5a5a #eaeaea  #eaeaea #5a5a5a^;" />$form:comments</textarea>
	</td>
</tr>
<tr>
   <td>
   <input type="Submit" name="submit" value="Отправить" style=" font-size: 15px^; width: 100%^; height: 30px^; color:#000^; text-transform: uppercase^; margin: 0^; border: 2px solid^; border-color: #eaeaea #000 #000 White^;"  />
   </td>
</tr>
</table>
</td>
</tr>
</table>
</form>

</div>
 </div>
</div>
</p>
</div>

# метод проверяет все-ли поля формы заполнены. если все хорошо должен вернуть 1, иначе - 0
@is_ok[]
$result(^if(def $form:name && def $form:lastname && def $form:phone && ^Lib:isEmail[$form:email]){1}{0})
#end @is_ok[]

@warning[]
<p style="color:red^;">Внимание! Поставки техники завода &laquo^;ХТЗ&raquo^; в Россию прекращены!</p>
#end @warning[]