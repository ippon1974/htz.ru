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
<body class="events mtz">
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

@description[]
$description[^getMachines[$.id(^form:id.int(0))]]
$result[$description.description]
#@description[]

@keywords[]
$keywords[^getMachines[$.id(^form:id.int(0))]]
$result[$keywords.keywords]
#@description[]


@detalMASHINE[]
^if(def $form:id){
 ^hMachines[]
 $mashine[^getMachines[]]
 $teh_id[^getTehMTZ[]]
 $img_patch[^db:getImgPatch[$.id(^form:id.int(0))]]
 $str[$img_patch.patch_img] 
 $parts[^str.split[,;lh]]
 $mashine_s[^mashine.select($mashine.brand_id==9)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
  ^if(^mashine_s.locate[id;$form:id]){
    
    $mashine_instore[^mashine_s.select($mashine_s.parking_citi==1)]
    ^if($mashine_instore){<div class="in_teh_mtz"><a href="/catalog/mtz/instore/" title="Наличие техники ПО МТЗ на стоянке в Москве">Наличие техники ПО &laquo^;МТЗ&raquo^; на стоянке в Москве</a></div>}{}
    
	^navi_sub_nav[]
   
    <h2>${mashine_s.name_ru}. ${h_Machines.classification_sub.[$mashine_s.classification_sub]}. Производство $h_Machines.brand_id.[$mashine_s.brand_id] ($h_Machines.country_origin_ru.[$mashine_s.country_origin_ru]).</h2>
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
			
			^if($mashine_s.customs){
			<dt>Таможня:</dt>
			<dd>${h_Machines.customs.[$mashine_s.customs]}.</dd>
			}{}
			
			^if($mashine_s.status){
			<dt>Состояние:</dt>
			<dd>${h_Machines.status.[$mashine_s.status]}.</dd>
			}{}
			
			^if($mashine_s.parking){
			<dt>Стоянка:</dt>
			<dd>${h_Machines.parking.[$mashine_s.parking]}. ${h_Machines.parking_citi.[$mashine_s.parking_citi]}.</dd>
			}{}
			
			^if($mashine_s.delivery){
			<dt>Доставка:</dt>
			<dd>${h_Machines.delivery.[$mashine_s.delivery]}.</dd>
			}{}
			
			^if(def $mashine_s.web_link){
			<dt>Сайт завода:</dt>
			<dd><a href="$mashine_s.web_link" target="_blank">$mashine_s.web_link</a></dd>
			}{}
			<br />
			<div>
			<!--<dt>Телефон:</dt>
			<dd>^my_phone_mtz[]</dd>-->
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<!--<dt><strong>Запрос</strong></dt>-->
			</div>
			<!--<dd>
<form class="callme" method="post">
<input onclick="document.getElementById('divCallMe').style.display=document.getElementById('divCallMe').style.display!='block'?'block':'none'^; return false^;" type="Submit" style="font-size: 1.0em^; border-right: 2px solid #484848^; border-bottom: 2px solid #484848^; border-top: 2px solid #fcfcfc^; border-left: 2px solid #fcfcfc^; color:#000^; width: auto^; padding: 0 5px^; " value="Запрос" />
</form>
</dd>-->
</dl>
	^rem{Callback[]}
   }{}
  </div>
  <ul id="anchorlist">
			 ^if(def $mashine_s.tehno_info_uri){<li><a href="$mashine_s.tehno_info_uri" class="glossary" title="Технические характеристики $mashine_s.namenklatura">Технические характеристики $mashine_s.namenklatura</a></li>}{}
             ^if(^teh_id.locate[machines_id;$mashine_s.id]){<li><a href="/catalog/mtz/teh/detal/id/$teh_id.id/" class="glossary" title="Технические характеристики $teh_id.namenklatura">Технические характеристики $teh_id.namenklatura</a></li>}{}
			 ^if(def $mashine_s.pdf){<li><a href="$mashine_s.pdf" class="glossarypdf" title="Буклет скачать">Буклет $mashine_s.namenklatura (<em style="color: #6D6D6D^; font-size: 0.8em^;">$f[^file::stat[/service/centerdownload/agroimport/pdf/220.pdf]] <strong>Байт:</strong> $f.size <strong>Год создания:</strong> $f.cdate.year $new_after[^date::now(-65)]</em>)</a></li>}{}
  </ul>

^if(def $parts.0){^if(def $parts.0){<a href="/catalog/img/def/${parts.0}.jpg"><img src="/catalog/img/detal/${parts.0}.jpg" alt="$mashine_s.name_ru"></a>}{<img src="/catalog/img/detal/${parts.0}.jpg" alt="$mashine_s.name_ru">}}{}

^if(def $mashine_s.body){
^untaint[as-is]{
 $mashine_s.body
}
}{}
<p class="backtotop"><a href="#primary" title="На вверх">На вверх</a></p>
  <br /><br /><br /><br /<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
  }{}
#@detalMASHINE[]

@Callback[]
$to[<mail@htz.ru>]
^rem{ *** от какого адреса будет отправляться письмо *** }
$from[index@$env:SERVER_NAME]
$img_patch[^db:getImgPatch[$.id(^form:id.int(0))]]
$str[$img_patch.patch_img] 
$parts[^str.split[,;lh]]
^if($form:action eq "done"){
	^rem{ *** сюда мы попадём после внешнего редиректа когда всё уже успешно отправилось *** }
	^rem{ *** тут пишем посетителю что-нить доброе за то, что он отправил нам пожелание *** }
	$reply_thanks[<div class="callback_post">
	<p style="margin: 0^;"><strong style="color:#008000^;">Ваш запрос отправлен.</strong></p>
	<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">В ближайшее время мы свяжемся с вами по телефону или электронной почте.</p>  
	<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">Ваш запрос: <strong style="text-transform: none^;">$mashine_s.name_ru</strong></p>
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

<form action="${request:uri}?id=$mashine_s.id" method="post" enctype="multipart/form-data">
<input type="hidden" name="do" value="do" />
<input type="Hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />
<input type="Hidden" name="tehno_name" value="^if(def $form:id){$mashine_s.name_ru}{}" />
<input type="Hidden" name="price" value="^number_format[^text.format[%.2f];,;.](2)" />

<table class="postmashine" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr valign="top">
	<td>
	<p style="font-size: 1.1em^; margin: 0^;">Запрос техники завода: <strong>^if(!def $form:id){$h_Machines.brand_id.[$mashine_s.brand_id]}{$h_Machines.brand_id.[$mashine_s.brand_id]}</strong></p>
	<p style="font-size: 1.1em^; margin: 0^;">Производство: <strong>^if(!def $form:id){$h_Machines.country_origin_ru.[$mashine_s.country_origin_ru]}{$h_Machines.country_origin_ru.[$mashine_s.country_origin_ru]}</strong></p>
	<p style="font-size: 1.1em^; margin: 0^;">Название: ^if(def $form:id){<strong>$mashine_s.name_ru</strong>}{$mashine_s.name_ru}</p>
	<p style="font-size: 1.1em^; margin: 0^;">Стоимость: ^if($mashine_price){<strong>^number_format[^text.format[%.2f];,;.](2)</strong> руб. РФ.}{<em>Нет точной цены</em>}</p>
	</td>
	^if(def $parts.0){<td width="120px"><img src="/catalog/img/front/${parts.0}.jpg" alt="$mashine_s.name_ru"></td>}{<td></td>}
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



###########################################################################
@mailform[][oAntiSpam;bShowForm]
$now[^date::now[]]
$detail[^db:get[$.id(^form:id.int(0))]]
$oAntiSpam[^Antispam::create[$hAntiSpamParams]]

^debug[$oAntiSpam]

$bShowForm(true)

^oAntiSpam.exec{

	^check[]

	
	<p>Ваше имя:<br /><strong style="font-size: 0.8em^;">$form:name</strong><br />Почта:<br /><strong style="font-size: 0.8em^;">$form:email</strong></p>
	
	
	^connect[$connect_string]{
^void:sql{INSERT INTO orders_clients_site
         (item, productname, name, areacode, phone1, phone2, email, m_2, comments, uri, dt) 
      values  
         ('$form:item', '$form:productname', '$form:name', '$form:areacode', '$form:phone1', '$form:phone2', '$form:email', '$form:m_2', '$form:comments', '$form:uri', '$form:dt')}}

	$to[^my_email_detal[]]
	^mail:send[ 
      $.from[$form:email] 
      $.to[$to] 
      $.subject[Запрос из каталога камня http://$env:SERVER_NAME/] 
	  $.charset[$response:charset]
      $.text[Раздел сайта: /Каталог камня/^#0AЗапрос камня: $form:productname^#0AСсылка: $form:uri^#0AИмя клиента: $form:name^#0AКонтактный телефон: ($form:areacode) $form:phone1 - $form:phone2^#0AЭлектронная почта: $form:email^#0AПримерный объем камня: $form:m_2 м.^#0AТекст сообщения: $form:comments^#0A-----------------^#0AСообщение отправлено: ^now.sql-string[]^#0AIP адрес отправителя: $env:REMOTE_ADDR] 
] 

	<p style="color:#006633^;">Ваше сообщение отправлено...</p>
	$bShowForm(false)
}{
	$bShowForm(false)
	$exception.handled(true)
	^switch[$exception.type]{
		^case[$oAntiSpam.CLASS_NAME]{
			^switch[$exception.source]{
				^case[unknown-uid]{
					<p>Ваше сообщение уже было добавлено <b>ранее</b>.</p>
				}

				^case[empty-uid]{
					^bye[]
				}

				^case[fake-uid-exist]{
					^bye[]
				}

				^case[no-real-uid]{
					^bye[]
				}

				^case[referer]{
					^bye[]
				}

				^case[suspected-content]{
					^bye[]
				}
			}
		}

		^case[check.fields]{
			<p style="color:red^;">Не заполнены обязательные поля</p>
			$bShowForm(true)
		}

		^case[DEFAULT]{
			$exception.handled(false)
		}
	}
}


^if($bShowForm){

	^oAntiSpam.print{

<form method="post" enctype="multipart/form-data">
<input type="hidden" name="item" value="1" />
<input type="hidden" name="productname" value="${detail.name_en}.${detail.classification_ru}." />
<input type="hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />
<input type="hidden" name="dt" value="^now.sql-string[]" />
			Ваше имя<br />
			<input name="name" type="text" maxlength="25" value="$form:name" style="width:95%^;font-size:1.1em^;"  /><br /><br />

			Номер телефона:<br />

            <input name="phone2" type="text" value="$form:phone2" style="width:95%^;font-size:1.1em^;" /><br /><br />
			
			Адрес эл. почты:<br />
			<input type="text" name="email" value="$form:email" style="width:95%^;font-size:1.1em^;"  /><br /><br />
			
			Примерный объем. м&sup2^;<br />
            <input name="m_2" type="text" maxlength="50" value="$form:m_2" style="width:95%^;font-size:1.1em^;" /><br /><br />

			Сообщение:<br />
			<textarea name="comments" type="text" rows="4" tabindex="6" style="overflow: auto^; width:95%^;font-size:1.7em^;" />$form:comments</textarea><br /><br />
            <input type="submit" name="action" value="Отправить" class="class" style="font-weight: bolder^; height: 2em^; background-color: #ff9664^; color: #000^; width:96%^; margin: 0^; padding: 0^;" />

</form>

	}{
		^switch[$exception.type]{
			^case[$oAntiSpam.CLASS_NAME]{
				$exception.handled(true)
				^switch[$exception.source]{
					^case[referer]{
						^rem{ *** РѕС‚РєСЂС‹С‚РёРµ С„РѕСЂРјС‹ СЃ РЅРµРёР·РІРµСЃС‚РЅРѕРіРѕ referer-Р° *** }
						^bye[]
					}

					^case[unknown-fields]{
						^rem{ *** РІ form РїСЂРёС€Р»Рё РЅРµРёР·РІРµСЃС‚РЅС‹Рµ РїРѕР»СЏ *** }
						^bye[]
					}
				}
			}
		}
	}
	
	

}

^debug[$oAntiSpam]
#end @main[]


###########################################################################
@check[]
^if(!def $form:name){
	^throw[check.fields;]
}
^if(!def $form:phone2){
	^throw[check.fields;]
}
^if(!def $form:email){
	^throw[check.fields;]
}
#end @check[]



###########################################################################
@debug[oAntiSpam][sKey;sValue]
#end @debug[]

@bye[]
<p>Спамеры — идите на Х...!</p>
#$response:status(404)
#end @bye[]
#@mailform[]