@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title_htz[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title_htz[] | Тракторы Агроимпорт" />
<meta name="keywords" content="^title_htz[] | ХТЗ, Агроимпорт, купить трактор ХТЗ, Агроимпорт" />

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
$machines[^getMachines[]]
$str[$request:uri]
$parts[^str.split[/;lh]] 
$parts_spl[$parts.0/$parts.1/$parts.2/$parts.3/]
$parts_parts[$parts.4]
^switch[$parts_spl]{
   ^case[/catalog/agroimport/general/]{^if(^machines.locate[translite;$parts_parts]){$result[${machines.name_ru}. Сборка ООО "${machines.brand}". ${h_Machines.classification_sub.[$machines.classification_sub]}.]}{}} 
   ^case[/catalog/agroimport/spec/]{^if(^machines.locate[translite;$parts_parts]){$result[${machines.name_ru}. Сборка ООО "${machines.brand}". ${h_Machines.classification_sub.[$machines.classification_sub]}.]}{}}
    ^case[/catalog/agroimport/archive/]{^if(^machines.locate[translite;$parts_parts]){$result[${machines.name_ru}. Сборка ООО "${machines.brand}". ${h_Machines.classification_sub.[$machines.classification_sub]}.]}{}}
         …          
   ^case[DEFAULT]{$result[Тракторы сборки ООО «Агроимпорт»])}
 }
 
#@title[]



@getAGROIMPORTCELL[]
$str[$request:uri]
$parts[^str.split[/;lh]] 
$parts_spl[$parts.0/$parts.1/$parts.2/$parts.3/]
^switch[$parts_spl]{ 
   ^case[/catalog/agroimport/general/]{^getGENERAL[]} 
   ^case[/catalog/agroimport/spec/]{^getSPEC[]}
   ^case[/catalog/agroimport/archive/]{^getARCHIVE[]}
         …          
   ^case[DEFAULT]{
   
   
<h2>Техника производство &laquo^;Агроимпорт&raquo^; (Украина)</h2>

<ul id="anchorlist">
			<li><a href="/catalog/agroimport/general/" title="Тракторы общего назначения">Тракторы общего назначения</a></li>
			<li><a href="/catalog/agroimport/spec/" title="Спецтехника">Спецтехника</a></li>
			<li><a href="/catalog/agroimport/archive/" title="Архив техники Агроимпорт">Архив техники &laquo^;Агроимпорт&raquo^;</a></li>
			<li><a href="/catalog/agroimport/teh/" title="Характеристики техники «Агроимпорт»"><em><strong>Характеристики техники «Агроимпорт»</strong></em></a></li>
			<li><a href="/catalog/agroimport/all/" title="Вся техника Агроимпорт"><strong><em>Вся техника &laquo^;Агроимпорт&raquo^;</em></strong></a></li>
</ul>

<h3 id="our_education_programmes">ООО &laquo^;Агроимпорт&raquo^;</h3>

<img src="/catalog/agroimport/i/logo_agroimport.gif" alt="Агроимпорт" />

<p>Компания «Агроимпорт» основана в апреле 1997 года. На протяжении ряда лет компания "Агроимпорт" являлась официальным представителем ОАО ХТЗ, поставляя тракторы ХТЗ на рынок Российской Федерации.</p>

<p>В процессе развития фирмы были освоены работы по капитальному ремонту автотракторной техники. В 2003 году компания «Агроимпорт» приступила к выпуску новых тракторов серии Т-150.</p>

<p>На предприятии внедрена система управления качеством, соответствующая требованиям стандарта ISO 9001. Компания «Агроимпорт» &mdash^; финалист Всеукраинского конкурса качества продукции «100 лучших товаров Украины», лауреат рейтинга &laquo^;Лучшие предприятия Украины&raquo^;.</p>

<p>На предприятии постоянно проводятся опытно-конструкторские работы, направленные на повышение технического уровня производимой продукции. Внедрение в производство результатов разработок улучшает потребительские свойства и качество продукции. </p>

<p class="backtotop"><a href="#our_education_programmes" title="На вверх">На вверх</a></p>
   
   } 
} 
#@getAGROIMPORTCELL[]

@getGENERAL[]
^if(in "/catalog/agroimport/general/"){ 
^hMachines[]
 $mashine[^getMachines[]]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]] 
 
 $str[$request:uri]
 $parts[^str.split[/;lh]] 
 $parts_parts[$parts.4]
  ^if(^mashine.locate[translite;$parts_parts]){
  <h2>${mashine.name_ru}. Сборка ООО &laquo^;${mashine.brand}&raquo^;. ${h_Machines.classification_sub.[$mashine.classification_sub]}.</h2>
  $mashine_price[$price_hash.[$mashine.id].price]
<div id="tehnobody">
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
			<dt>Производство:</dt>
			<dd>$h_Machines.country_origin_ru.[$mashine.country_origin_ru]</dd>
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
			<dd>${h_Machines.parking.[$mashine.parking]}. ${h_Machines.parking_citi.[$mashine.parking_citi]}.</dd>
			}{}
			^if($mashine.customs){
			<dt>Таможня:</dt>
			<dd>${h_Machines.customs.[$mashine.customs]}.</dd>
			}{}
			<!--<dt>Телефон:</dt>
			<dd>^my_phone[]</dd>-->
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<!--<dt><strong>Запрос 25</strong></dt>-->
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
		<li><a href="$mashine.tehno_info_uri" class="glossary" title="Технические характеристики">Технические характеристики</a></li>
  		^if(def $mashine.pdf){<li><a href="$mashine.pdf" class="glossarypdf" title="Буклет скачать">Буклет $mashine.namenklatura (<em style="color: #6D6D6D^; font-size: 0.8em^;">$f[^file::stat[/service/centerdownload/agroimport/pdf/220.pdf]] <strong>Байт:</strong> $f.size <strong>Год создания:</strong> $f.cdate.year $new_after[^date::now(-65)]</em>)</a></li>}{}
		<li><a href="/service/centerdownload/agroimport/" class="glossarypdf" title="Все буклеты shantui"><strong style="color: #6D6D6D^; font-size: 0.8em^;">Все буклеты Агроимпорт</strong></a></li>
  </ul>

<img src="/catalog/img/detal/${mashine.img}.jpg" alt="$mashine.name_ru">

^untaint[as-is]{
 $mashine.body
}



<p class="backtotop"><a href="#primary" title="На вверх">На вверх</a></p>

  }{}
}{}
#@getGENERAL[]

@getSPEC[]
^if(in "/catalog/agroimport/spec/"){ 
^hMachines[]
 $mashine[^getMachines[]]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]] 
 
 $str[$request:uri]
 $parts[^str.split[/;lh]] 
 $parts_parts[$parts.4]
  ^if(^mashine.locate[translite;$parts_parts]){
  <h2>${mashine.name_ru}. Сборка ООО &laquo^;${mashine.brand}&raquo^;. ${h_Machines.classification_sub.[$mashine.classification_sub]}.</h2>
  $mashine_price[$price_hash.[$mashine.id].price]
<div id="tehnobody">
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
			<dt>Производство:</dt>
			<dd>$h_Machines.country_origin_ru.[$mashine.country_origin_ru]</dd>
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
			<dd>${h_Machines.parking.[$mashine.parking]}. ${h_Machines.parking_citi.[$mashine.parking_citi]}.</dd>
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
           ^if(def $mashine.pdf){<li><a href="$mashine.pdf" class="glossarypdf" title="Буклет скачать">Буклет $mashine.namenklatura (<em style="color: #6D6D6D^; font-size: 0.8em^;">$f[^file::stat[/service/centerdownload/agroimport/pdf/220.pdf]] <strong>Байт:</strong> $f.size <strong>Год создания:</strong> $f.cdate.year $new_after[^date::now(-65)]</em>)</a></li>}{}
		   <li><a href="/service/centerdownload/agroimport/" class="glossarypdf" title="Все буклеты shantui"><strong style="color: #6D6D6D^; font-size: 0.8em^;">Все буклеты Агроимпорт</strong></a></li>
  </ul>

<img src="/catalog/img/detal/${mashine.img}.jpg" alt="$mashine.name_ru">

^untaint[as-is]{
 $mashine.body
}



<p class="backtotop"><a href="#primary" title="На вверх">На вверх</a></p>

  }{}
}{}
#@getSPEC[]


@getARCHIVE[]
^if(in "/catalog/agroimport/archive/"){ 
^hMachines[]
 $mashine[^getMachines[]]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]] 
 
 $str[$request:uri]
 $parts[^str.split[/;lh]] 
 $parts_parts[$parts.4]
  ^if(^mashine.locate[translite;$parts_parts]){
  <h2>${mashine.name_ru}. Сборка ООО &laquo^;${mashine.brand}&raquo^;. ${h_Machines.classification_sub.[$mashine.classification_sub]}.</h2>
  $mashine_price[$price_hash.[$mashine.id].price]
<div id="tehnobody">
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
			<dt>Производство:</dt>
			<dd>$h_Machines.country_origin_ru.[$mashine.country_origin_ru]</dd>
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
			<dd>${h_Machines.parking.[$mashine.parking]}. ${h_Machines.parking_citi.[$mashine.parking_citi]}.</dd>
			}{}
			^if($mashine.customs){
			<dt>Таможня:</dt>
			<dd>${h_Machines.customs.[$mashine.customs]}.</dd>
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
			<li><a href="$mashine.tehno_info_uri" class="glossary" title="Технические характеристики">Технические характеристики</a></li>
</ul>

<img src="/catalog/img/detal/${mashine.img}.jpg" alt="$mashine.name_ru">

^untaint[as-is]{
 $mashine.body
}



<p class="backtotop"><a href="#primary" title="На вверх">На вверх</a></p>

  }{}
}{}
#@getARCHIVE[]


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
<li class="ua"><strong>Тракторы &laquo^;Агроимпорт&raquo^;</strong></li>
</ul>
}
#@navi_sub_str[]


@navi_sub_nav[]
 $navi_sub_nav[^getMachines[]]
    ^if(^navi_sub_nav.locate[tehno_info_uri;$request:uri]){<div><a href="/catalog/agroimport/$navi_sub_nav.classification_sub_sub_uri/$navi_sub_nav.translite/">$navi_sub_nav.namenklatura</a></div><br />}{} 
#@navi_sub_nav[]

@navi_namenklatura[]
 $navi_namenklatura[^getMachines[]]
    ^if(^navi_namenklatura.locate[tehno_info_uri;$request:uri]){$navi_namenklatura.namenklatura}{} 
#@navi_namenklatura[]

@namenklatura[]
^hMachines[]
 $namenklatura[^getMachines[]]
 $str[$request:uri]
 $parts[^str.split[/;lh]]
 $parts_str[$parts.0/$parts.1/$parts.2/$parts.3/$parts.4/]
  $namenklatura_s[^namenklatura.select($namenklatura.brand_id==6)]
   <ul id="section_id">
   ^namenklatura_s.menu{
    ^if($parts.4 eq $namenklatura_s.translite){
	<li>$namenklatura_s.namenklatura</li>}{
	^if($namenklatura_s.tehno_info_uri eq $request:uri){
		<li class="$h_Machines.css.[$namenklatura_s.css]"><a href="/catalog/agroimport/$namenklatura_s.classification_sub_sub_uri/$namenklatura_s.translite/">$namenklatura_s.namenklatura</a></li>
	}{
		<li><a href="/catalog/agroimport/$namenklatura_s.classification_sub_sub_uri/$namenklatura_s.translite/">$namenklatura_s.namenklatura</a></li>
	}
	}
   }
   <ul>
#@namenklatura[]

@bodycss[]
^hMachines[]
 $bodycss[^getMachines[]]
    $bodycss_s[^bodycss.select($bodycss.brand_id==6)]
      ^if(^bodycss_s.locate[tehno_info_uri;$request:uri]){$result[$h_Machines.css.[$bodycss_s.css]]}{$result[]}
#@bodycss[]

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
				      $.subject[Запрост техники: http://$env:SERVER_NAME/]
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


<form action="^if(!def $form:translite){/catalog/agroimport/$mashine.classification_sub_sub_uri/?translite=$mashine.translite}{/catalog/agroimport/$mashine_s_s.classification_sub_sub_uri/?translite=$mashine_s_s.translite}" method="post" enctype="multipart/form-data">
<input type="hidden" name="do" value="do" />
<input type="Hidden" name="uri" value="http://www.${env:SERVER_NAME}$request:uri" />
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
$result(^if(def $form:name && def $form:lastname && def $form:phone && def $form:email){1}{0})
#end @is_ok[]

























