@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[] | " />
<meta name="keywords" content="^title[] | " />

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
<body class="events b_taim">
#end@header[]

@title[]
^if(def $form:id){
  ^hMachines[]
  $title[^getMachines[
  $.id(^form:id.int(0))
  ]]
  $result[${title.name_ru}. Производство $h_Machines.brand_id.[$title.brand_id] ($h_Machines.country_origin_ru.[$title.country_origin_ru]).]
}{}
#@title[]


@detalMASHINE[]
^if(def $form:id){
^hMachines[]
 $mashine[^getMachines[]]
 $mashine_s[^mashine.select($mashine.brand_id==8)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
  ^if(^mashine_s.locate[id;$form:id]){
    ^navi_sub_nav[]
    <h2>${mashine_s.name_ru}. Производство $h_Machines.brand_id.[$mashine_s.brand_id] ($h_Machines.country_origin_ru.[$mashine_s.country_origin_ru]).</h2>
    $mashine_price[$price_hash.[$mashine_s.id].price]
    <div id="tehnobody">
    <span>^dtf:format[%d %h %Y;]</span>
    <h3>$mashine_s.namenklatura</h3>
    $text(^eval($mashine_price*^exchange_usd[]))
    ^if($text){
    <span>Цена:</span>
    $text_nds($text/6.55557)
   <h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4>
   <div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>
    }
   <dl id="info">
            ^if($mashine_s.classification){
			<dt>Тип:</dt>
			<dd>$h_Machines.classification.[$mashine_s.classification]</dd>
			}{}
			<dt>Бренд:</dt>
			<dd>$h_Machines.brand_id.[$mashine_s.brand_id]</dd>
			^if($mashine_s.country_origin_ru){
			<dt>Производство:</dt>
			<dd>$h_Machines.country_origin_ru.[$mashine_s.country_origin_ru]</dd>
			}{}
			<dt>Номенклатура:</dt>
			<dd><strong>$mashine_s.namenklatura</strong></dd>
			^if($mashine_s.year){
			<dt>Год выпуска:</dt>
			<dd><strong>^dtf:format[%Y;]</strong> г.</dd>
			}{}
			<dt>Состояние:</dt>
			<dd>Новый</dd>
			^if($mashine_s.parking){
			<dt>Стоянка:</dt>
			<dd>${h_Machines.parking.[$mashine_s.parking]}. г.${h_Machines.parking_citi.[$mashine_s.parking_citi]}.</dd>
			}{}
			^if($mashine_s.customs){
			<dt>Таможня:</dt>
			<dd>${h_Machines.customs.[$mashine_s.customs]}.</dd>
			}{}
			<dt>Телефон:</dt>
			<dd>^my_phone[]</dd>
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<!--<dt><strong>Запрос</strong></dt>-->
			<!--<dd>
<form class="callme" method="post">
<input onclick="document.getElementById('divCallMe').style.display=document.getElementById('divCallMe').style.display!='block'?'block':'none'^; return false^;" type="Submit" style="font-size: 1.0em^; border-right: 2px solid #484848^; border-bottom: 2px solid #484848^; border-top: 2px solid #fcfcfc^; border-left: 2px solid #fcfcfc^; color:#000^; width: auto^; padding: 0 5px^; " value="Запрос" />
</form>
</dd>-->
</dl>
^Callback[]
   }{}
  </div>
  <ul id="anchorlist">
			 ^if(def $mashine_s.tehno_info_uri){<li><a href="/catalog/belarus/agromash/mashine/teh/id/$mashine_s.tech_id/" class="glossary" title="Технические характеристики">Технические характеристики</a></li>}{}
             ^if(def $mashine_s.pdf){<li><a href="$mashine_s.pdf" class="glossarypdf" title="Буклет скачать">Буклет $mashine_s.namenklatura (<em style="color: #6D6D6D^; font-size: 0.8em^;">$f[^file::stat[/service/centerdownload/agroimport/pdf/220.pdf]] <strong>Байт:</strong> $f.size <strong>Год создания:</strong> $f.cdate.year $new_after[^date::now(-65)]</em>)</a></li>}{}
  </ul>

^if(def $mashine_s.img){^if($mashine_s.img_def){<a href="/catalog/img/def/${mashine_s.img}.jpg"><img src="/catalog/img/detal/${mashine_s.img}.jpg" alt="$mashine_s.name_ru"></a>}{<img src="/catalog/img/detal/${mashine_s.img}.jpg" alt="$mashine_s.name_ru">}}{}

^if(def $mashine_s.body){
^untaint[as-is]{
 $mashine_s.body
}
}{}
<p class="backtotop"><a href="#primary" title="На вверх">На вверх</a></p>
  <br /><br /><br /><br /<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
  }{}
#@detalMASHINE[]