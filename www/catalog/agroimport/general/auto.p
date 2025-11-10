@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title_htz[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^description[]" />
<meta name="keywords" content="^keywords[]" />

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
<body class="events competitions">
#end@header[]



@title_htz[]
^hMachines[]
$title_htz[^table::load[/_root.cfg]]
$str[$request:uri]
 ^if(^title_htz.locate[uri;$request:uri]){
   $result[$title_htz.title]
 }{$result[Тракторы общего назначения сборки ООО «Агроимпорт».]}
#@title[]


@description[]
^hMachines[]
 $description[^getMachines[
 $.id(^form:id.int(0))
 ]]
  ^if(^description.locate[translite;$form:translite]){$result[$h_Machines.description.[$description.classification]]}{$result[Тракторы общего назначения заводской сборки ОАО &laquo^;ХТЗ&raquo^;.]}
#@description[]

@keywords[]
^hMachines[]
 $keywords[^getMachines[]]
  ^if(^keywords.locate[translite;$form:translite]){$result[$h_Machines.keywords.[$keywords.classification]]}{$result[Тракторы общего назначения заводской сборки ОАО &laquo^;ХТЗ&raquo^;.]}
#@description[]


@getAGROIMPORTGen[]
^if(!def $form:translite){
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==6)]
  $mashine_s_s[^mashine_s.select($mashine_s.classification_sub==4)]
  $price[^getPriceMachines[]]
  $price_hash[^price.hash[id]]  
  <h2>Тракторы общего назначения сборки ООО «Агроимпорт»</h2>
  <ul class="listing">
  ^mashine_s_s.menu{ 
    $mashine_price[$price_hash.[$mashine_s_s.id].price] 
	$text(^eval($mashine_price*^exchange_usd[]))
	$str[$request:uri]
    $parts[^str.split[/;lh]] 
    $parts_uti[$parts.0/$parts.1/$parts.2]
	<li>
    <dl>	
    <dt><a href="$parts_uti/$mashine_s_s.classification_sub_sub_uri/$mashine_s_s.translite/" title="$mashine_s_s.title"><img src="/catalog/img/front/${mashine_s_s.img_front}.jpg" alt="$mashine_s_s.title" /></a> <a href="$parts_uti/$mashine_s_s.classification_sub_sub_uri/$mashine_s_s.translite/" title="$mashine_s_s.title">$mashine_s_s.title</a></dt>
    <dd style="text-transform: uppercase^; font-size: 0.8em^; color: #669933^;">$h_Machines.classification_sub.[$mashine_s_s.classification_sub]</dd>					
    <dd>^if($mashine_price){$text(^eval($mashine_price*^exchange_usd[])) <strong style="color:#ff0000^;">$text</strong> руб. <em style="color: #143B27^; font-size: 0.9em^;">$text_nds($text/6.55557) ^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.}{}</em></dd>					
    <dd><p>$mashine_s_s.lead</p></dd>
    </dl>
    </li>
	}
  </ul>
}{
^hMachines[]
 $mashine[^getMachines[]]
 $mashine_s[^mashine.select($mashine.brand_id==6)]
 $mashine_s_s[^mashine_s.select($mashine_s.classification_sub==4)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
  ^if(^mashine_s_s.locate[translite;$form:translite]){
  
    <h2>${mashine_s_s.name_ru}. Сборка ОАО &laquo^;${mashine_s_s.brand}&raquo^;. ${h_Machines.classification_sub.[$mashine_s_s.classification_sub]}.</h2>
    $mashine_price[$price_hash.[$mashine_s_s.id].price]
    <div id="tehnobody">
    <span>^dtf:format[%d %h %Y;]</span>
    <h3>$mashine_s_s.namenklatura</h3>
    $text(^eval($mashine_price*^exchange_usd[]))
    ^if($text){
    <span>Цена:</span>
    $text_nds($text/6.55557)
   <h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4>
   <div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>
   <dl id="info">
            ^if($mashine_s_s.classification){
			<dt>Тип:</dt>
			<dd>$h_Machines.classification.[$mashine_s_s.classification]</dd>
			}{}
			<dt>Бренд:</dt>
			<dd>&laquo^;$mashine_s_s.brand&raquo^;</dd>
			^if($mashine_s_s.country_origin_ru){
			<dt>Производство:</dt>
			<dd>$h_Machines.country_origin_ru.[$mashine_s_s.country_origin_ru]</dd>
			}{}
			<dt>Номенклатура:</dt>
			<dd><strong>$mashine_s_s.namenklatura</strong></dd>
			^if($mashine_s_s.year){
			<dt>Год выпуска:</dt>
			<dd><strong>^dtf:format[%Y;]</strong> г.</dd>
			}{}
			<dt>Состояние:</dt>
			<dd>Новый</dd>
			^if($mashine_s_s.parking){
			<dt>Стоянка:</dt>
			<dd>${h_Machines.parking.[$mashine_s_s.parking]}. г.${h_Machines.parking_citi.[$mashine_s_s.parking_citi]}.</dd>
			}{}
			^if($mashine_s_s.customs){
			<dt>Таможня:</dt>
			<dd>${h_Machines.customs.[$mashine_s_s.customs]}.</dd>
			}{}
			<dt>Телефон:</dt>
			<dd>^my_phone[]</dd>
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<dt><strong>Запрос</strong></dt>
			<dd>
<form class="callme" method="post">
<input onclick="document.getElementById('divCallMe').style.display=document.getElementById('divCallMe').style.display!='block'?'block':'none'^; return false^;" type="Submit" style="font-size: 1.0em^; border-right: 2px solid #484848^; border-bottom: 2px solid #484848^; border-top: 2px solid #fcfcfc^; border-left: 2px solid #fcfcfc^; color:#000^; width: auto^; padding: 0 5px^; " value="Запрос" />
</form>
</dd>
</dl>
   ^Callback[]
   }{}
  </div>

  <ul id="anchorlist">
			<li><a href="$mashine_s_s.tehno_info_uri" class="glossary" title="Технические характеристики">Технические характеристики</a></li>
</ul>

<img src="/catalog/img/detal/${mashine_s_s.img}.jpg" alt="$mashine_s_s.name_ru">

^untaint[as-is]{
 $mashine_s_s.body
}

<p class="backtotop"><a href="#primary" title="На вверх">На вверх</a></p>
  
  }{^Lib:location[/404/]}


}
#@getAGROIMPORTGen[]