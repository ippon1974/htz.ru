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

<body class="events fangyuan">
	
<ul id="skip">
<li><a href="#navigation" title="Пропустить навигацию">Пропустить навигацию</a></li>
</ul>
	
<div id="headerwrap">
<div id="header">
			
<ul id="utility">
<li><a href="/about/contact/" title="Контакты">Контакты</a></li>
<li><a href="/news/" title="Новости">Новости</a></li>
<li id="glossary"><span><a href="/catalog/spare/" title="Каталог запчастей">Каталог запчастей</a></span></li>
<li><a href="/map/" title="Карта сайта">Карта сайта</a></li>
</ul>
			
<h1 title="Comhaltas"><a href="/" title="Стройпроектмонтаж"><img src="/i/logo.gif" alt="Стройпроектмонтаж" /></a></h1>
		
<ul id="languageswitch">
<li class="first">Русский</li>
<li><a href="/en/">English</a></li>
</ul>
			
</div>		
	
</div>	
	
<div id="searchwrapper">

<div id="search">
<form method="get" action="/cgi-bin/search/search.pl"  >
<div>
<input type="hidden" name="stpos" value="0" />
</div>

<p id="searchlabel"><label for="search_textbox">Поиск</label></p>
<dl>
<dt><input class="filled" type="text" id="search_textbox" name="query" value="Найти" tabindex="1" /></dt>
<dd><input type="image" src="/img/widgets/go_button.gif" alt="Поиск по сайту" tabindex="2" /></dd>
<dd><a href="http://spare.htz.ru/" title="Поиск по каталогу запчастей">Найти запчасть</a></dd>
</dl>
</form>
#@header[]

@title[]
^hMachines[]
 $title[^getMachines[]]
  $title[^table::load[/_root.cfg]]
  ^if(^title.locate[uri;$request:uri]){$result[$title.title]}{}
#@title[]

@description[]
^hMachines[]
 $description[^getMachines[]]
  ^if(^description.locate[translite;$form:translite]){$result[$h_Machines.description.[$description.classification]]}{$result[Стационарные бетононасосы от компании Fangyuan Group Co.,Ltd (КНР)]}
#@description[]

@keywords[]
^hMachines[]
 $keywords[^getMachines[]]
  ^if(^keywords.locate[translite;$form:translite]){$result[$h_Machines.keywords.[$keywords.classification]]}{$result[Стационарные бетононасосы от компании Fangyuan Group Co.,Ltd (КНР)]}
#@description[]


@getPumpHngda[]
^if(!def $form:translite){
^hMachines[]
 $PumpHngda[^getMachines[]]
 $PumpHngda_brand[^PumpHngda.select($PumpHngda.brand_id==3)]
  $PumpHngda_select[^PumpHngda_brand.select($PumpHngda.classification==1)] 
   <h2>Стационарные бетононасосы от компании Fangyuan Group Co.,Ltd (КНР)</h2>
   <ul class="listing">
   ^PumpHngda_select.menu{^PumpHngdaPrint[]}
   </ul>
}{

^hMachines[]
 $mashine[^getMachines[]]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]

 $str[$request:uri]
 $parts[^str.split[/;lh]] 
 $parts_parts[$parts.6]
 

  ^if(^mashine.locate[translite;$parts_parts]){
    <h2>${mashine.name_ru}. Завод &laquo^;${mashine.brand}&raquo^;. ${h_Machines.classification_sub.[$mashine.classification_sub]}. Производство ${h_Machines.country_origin_ru.[$mashine.country_origin_ru]}.</h2>
$mashine_price[$price_hash.[$mashine.id].price]



<div id="tehnobody">
<span>^dtf:format[%d %h %Y;]</span>
<h3>$mashine.namenklatura</h3>

$text(^eval($mashine_price*^exchange_usd[]))
^if($text){
$text_nds($text/6.55557)
<h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4>
<div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>

}{}

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
			^if($mashine.volume){
			<dt>Объем</dt>
			<dd>$mashine.volume м&#179^;/ч</dd>
			}{}
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
			<a class="quest" href="#" class="callme" onclick="document.getElementById('divCallMe').style.display=document.getElementById('divCallMe').style.display!='block'?'block':'none'^; return false^;">
			Уточнить наличие.</a>
			</dd>-->
</dl>
^Callback[]
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
}
#@getPump[]

@PumpHngdaPrint[]
<li>
<dl>	
<dt><a href="${request:uri}$PumpHngda_select.classification_sub_sub_uri/$PumpHngda_select.translite/" title="$PumpHngda_select.title"><img src="/catalog/china/fangyuan/pump/i/front/${PumpHngda_select.img_front}.jpg" alt="$PumpHngda_select.title" /></a> <a href="${request:uri}$PumpHngda_select.classification_sub_sub_uri/$PumpHngda_select.translite/" title="$PumpHngda_select.title">$PumpHngda_select.title</a></dt>
<dd style="text-transform: uppercase^; font-size: 0.8em^; color: #669933^;">$h_Machines.classification_sub.[$PumpHngda_select.classification_sub] ^if($PumpHngda_select.volume){<span style="text-transform: none^; font-size: 1.0em^; color: #383838^;">(Производительность: <span style="color: #ff0000^;">$PumpHngda_select.volume</span> м&#179^;/ч)</span>}{}</dd>						
<dd><p>$PumpHngda_select.lead</p></dd>
</dl>
</li>
#@PumpHngdaPrint[]

@navi_sub_nav[]
 $navi_sub_nav[^getMachines[]]
    ^if(^navi_sub_nav.locate[tehno_info_uri;$request:uri]){<div><a href="/catalog/china/fangyuan/pump/$navi_sub_nav.classification_sub_sub_uri/$navi_sub_nav.translite/">$navi_sub_nav.brand $navi_sub_nav.namenklatura</a></div><br />}{} 
#@navi_sub_nav[]

@navi_sub_nav_add[]
 $navi_sub_nav[^getMachines[]]
    ^if(^navi_sub_nav.locate[complect_uri;$request:uri]){<div><a href="/catalog/china/fangyuan/pump/$navi_sub_nav.classification_sub_sub_uri/$navi_sub_nav.translite/">$navi_sub_nav.brand $navi_sub_nav.namenklatura</a></div><br />}{} 
#@navi_sub_nav_add[]

@menu_batton[]
  $menu_batton[^getMachines[]]
   $menu_batton_brand[^menu_batton.select($menu_batton.brand_id==3)]
   $menu_batton_select[^menu_batton_brand.select($menu_batton_brand.classification==1)]
   <h1>Стационарные бетононасосы $menu_batton_brand.brand</h1>
   <ul>
    ^menu_batton_select.menu{

	 ^if($menu_batton_select.translite eq $form:translite){
	 <li><strong>$menu_batton_select.name_ru</strong></li>
	 }{
	 <li><a href="/catalog/china/fangyuan/pump/$menu_batton_select.classification_sub_sub_uri/$menu_batton_select.translite/">$menu_batton_select.name_ru</a></li>
	 }

	}
   </ul>
#@menu_batton[]

@menu_namenklatura[]
  $menu_namenklatura[^getMachines[]]
   $menu_namenklatura_brand[^menu_namenklatura.select($menu_namenklatura.brand_id==3)]
   $menu_namenklatura_select[^menu_namenklatura_brand.select($menu_namenklatura_brand.classification==1)]
   <h3>Номенклатура</h3>
   <ul id="section_id">
    ^menu_namenklatura_select.menu{

	 ^if($menu_namenklatura_select.translite eq $form:translite){
	 <li><strong>$menu_namenklatura_select.namenklatura</strong></li>
	 }{
	 ^if($menu_namenklatura_select.tehno_info_uri eq $request:uri){<li class="four"><a href="/catalog/china/fangyuan/pump/$menu_namenklatura_select.classification_sub_sub_uri/$menu_namenklatura_select.translite/">$menu_namenklatura_select.namenklatura</a></li>}{<li><a href="/catalog/china/fangyuan/pump/$menu_namenklatura_select.classification_sub_sub_uri/$menu_namenklatura_select.translite/">$menu_namenklatura_select.namenklatura</a></li>}
	 }

	}
   </ul>
#@menu_namenklatura[]

@mailsend[]
<div style="margin: 0 0 2em 0^;">
<span><em>Сегодня: ^dtf:format[%d.%m.%Y]</em></span>
<p style="margin: 0^;"><em>Уточнить стоимость: ${h_Machines.classification.[$PumpHngda.classification]} $PumpHngda.namenklatura Производство $PumpHngda.country_origin_ru</em></p>
$to[<plategi@yandex.ru>, <mail@htz.ru>]
^rem{ *** от какого адреса будет отправляться письмо *** }
$from[index@$env:SERVER_NAME]

^if($form:action eq "done"){
	^rem{ *** сюда мы попадём после внешнего редиректа когда всё уже успешно отправилось *** }
	^rem{ *** тут пишем посетителю что-нить доброе за то, что он отправил нам пожелание *** }
	$reply_thanks[<p><font color="#339900">Спасибо. Ваше сообщение отправлено. Мы постараемся в ближайшее время связаться с вами.</font></p>]
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
				      $.subject[Запрос о наличии камня с нашего сайта http://$env:SERVER_NAME/]
				      $.charset[$response:charset] 
				      $.text[Имя: $form:name^#0A^if(def $form:email){$form:lastname}Телефон: $form:areacode $form:phone1 $form:phone2^#0AЭлектронная почта: $form:email^#0AЗапрос о наличии: $form:productname^#0AСтоимость: ${form:pay}^$^#0AАдрес страницы: $form:uri^#0A^#0AСообщение отправлено: ^now.sql-string[]^#0AIP: $env:REMOTE_ADDR]
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
		$err_field_empty[<p><font color="#cc0000">Не заполнены обязательные * поля данной формы!</font></p>]
	}
}

<form action="http://${env:SERVER_NAME}$request:uri" method="post" enctype="multipart/form-data">
$err_field_empty
$reply_thanks
<input type="hidden" name="do" value="do" />
<input type="hidden" name="productname" value="${PumpHngda.name_ru}. ${h_Machines.classification_sub.[$PumpHngda.classification_sub]}." />
<input type="hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />
<input type="hidden" name="pay" value="" />
Ваше имя<em style="color:red^;">*</em><br />
<input name="name" type="text" maxlength="25" value="$form:name" style="width:95%;font-size:1.1em;"  /><br />
Номер телефона<em style="color:red^;">*</em>: +7<br />
<input name="areacode" type="text" maxlength="3" value="$form:areacode" style="width:30px;font-size:1.1em;" />
-
<input name="phone1" type="text" maxlength="3" value="$form:phone1" style="width:30px;font-size:1.1em;" />
-
<input name="phone2" type="text" maxlength="4" value="$form:phone2" style="width:40px;font-size:1.1em;" /><br />
Адрес эл. почты<em style="color:red^;">*</em><br />
<input name="email" type="text" maxlength="50" value="$form:email" style="width:95%;font-size:1.1em;" />
<input type="Submit" value="УТОЧНИТЬ СТОИМОСТЬ" id="submitButton" name="submitButton" style="font-weight: bolder^; height: 2em^; background-color: #ffcc33^; color: #000^; width:96%; margin: 0.5em 0 2px 0" >
</form>
</div>
#@sendmail[]
	      
# метод проверяет все-ли поля формы заполнены. если все хорошо должен вернуть 1, иначе - 0
@is_ok[]
$result(^if(def $form:name && def $form:areacode && def $form:phone1 && def $form:phone2 && def $form:email){1}{0})
#end @is_ok[]
#@mailsend[]