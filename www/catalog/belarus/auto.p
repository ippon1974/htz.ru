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
<body class="events">
#end@header[]

@title[]
 $title[^table::load[/_root.cfg]]
  ^if(^title.locate[uri;$request:uri]){$result[$title.title]}{}
#@title[]

@menu_a_agromash[]
 $menu_a_agromash[^table::load[/catalog/belarus/menu_about_agromash.cfg]]
  <ul>
   ^menu_a_agromash.menu{
     ^menu_a_agromash_cell[]
   }
  </ul>
#@menu_a_agromash[]

@menu_a_agromash_cell[]
^if($menu_a_agromash.is_published){
 ^if($menu_a_agromash.uri eq $request:uri){
<li><strong>$menu_a_agromash.name</strong></li>
}{ 
<li><a href="$menu_a_agromash.uri">$menu_a_agromash.name</a></li>
}
}{}
#@menu_a_agromash_cell[]

@namenklatura[]
^hMachines[]
 $namenklatura[^getMachines[]]
 $str[$request:uri]
  $namenklatura_s[^namenklatura.select($namenklatura.brand_id==7)]
   <ul id="section_id">
   ^namenklatura_s.menu{
    ^if($namenklatura_s.id==$form:id){
	<li>$namenklatura_s.namenklatura</li>}{
	^if($namenklatura_s.tech_id==$form:id){
		<li class="$h_Machines.css.[$namenklatura_s.css]"><a href="/catalog/belarus/agromash/mashine/detal/id/$namenklatura_s.id/">$namenklatura_s.namenklatura</a></li>
	}{
		<li><a href="/catalog/belarus/agromash/mashine/detal/id/$namenklatura_s.id/">$namenklatura_s.namenklatura </a></li>
	}
	}
   }
   <ul>
#@namenklatura[]

@navi_sub_nav[]
 $navi_sub_nav[^getMachines[]]
    ^if(^navi_sub_nav.locate[id;$form:id]){<div style="margin: 0 0 0.8em 0^; font-size: 1.5em^;"><a href="/catalog/belarus/agromash/mashine/$navi_sub_nav.classification_sub_sub_uri/">$h_Machines.classification.[$navi_sub_nav.classification]</a></div>}{} 
#@navi_sub_nav[]

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
	^if(def $mashine_s.img){<td width="120px"><img src="/catalog/img/front/${mashine_s.img}.jpg" alt="$mashine_s.name_ru"></td>}{<td></td>}
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



















