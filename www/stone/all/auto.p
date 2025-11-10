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

<link rel="stylesheet" type="text/css" href="/css/callback_mini.css">
<link rel="stylesheet" type="text/css" href="/css/callback.css">

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>

<link rel="shortcut icon" href="/ico.ico" /> 
<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="stoneinfo">

@print_allstone[allstone]
<div id="tehnosale">
<h2 id="anchorlist"><strong><em>Весь список природного камня</em></strong></h2>
</div>
<ul class="listing">
^untaint[as-is]{
	^allstone.menu{
          ^print_all_call[]
	}
}</ul>
#end @printArticlesShow[]


@print_all_call[]
^if($allstone.id eq $allstone.last_insert_id){
$result[
<li>
<dl>
<dt><a href="/stone/all/select/$allstone.id/"><img src="/stone/img/small/$allstone.img_small" alt="^if(def $allstone.name_en){^allstone.name_en.match[[\[\]]][g]{}}{$allstone.name_en}" /></a> ^if(def $allstone.name_en){<a href="/stone/all/select/$allstone.id/">^allstone.name_en.match[[\[\]]][g]{}</a>}{<a href="/stone/all/select/$allstone.id/">$allstone.name_en</a>}
<span style="font-weight: bold^; color: #9A9A9A^; font-size: 0.8em^; font-style: italic^;">Номер для заказа  #$allstone.id</span></dt>
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$allstone.flag" alt="" /> <a href="/stone/country/cell/$allstone.country_id/">$allstone.country_ru</a></dd>
<dd>Классификация: <a href="/stone/classification/cell/$allstone.classification_id/"><em>$allstone.classification_ru</em></a></dd>
^if(def $allstone.color_id){<dd>Цвет: <a href="/stone/color/cell/$allstone.color_id/">$allstone.color_ru</a></dd>}{$result[]}
</dt>	
</dl>
</li>]
}{
$result[
<li>
<dl>
<dt>^if(def $allstone.name_en){<a href="/stone/all/select/$allstone.id/">^allstone.name_en.match[[\[\]]][g]{}</a>}{<a href="/stone/all/select/$allstone.id/">$allstone.name_en</a>}
<span style="font-weight: bold^; color: #9A9A9A^; font-size: 0.8em^; font-style: italic^;">Номер для заказа  #$allstone.id</span></dt>				
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$allstone.flag" alt="" /> <a href="/stone/country/cell/$allstone.country_id/">$allstone.country_ru</a></dd>
<dd>Классификация: <a href="/stone/classification/cell/$allstone.classification_id/"><em>$allstone.classification_ru</em></a></dd>
^if(def $allstone.color_id){<dd>Цвет: <a href="/stone/color/cell/$allstone.color_id/">$allstone.color_ru</a></dd>}{$result[]}
</dl>
</li>]
}
#@print_all_call[]



@Item[allstone]
<div id="tehnobody">
^untaint[as-is]{
	^if(def $allstone.name_en){<h2>^allstone.name_en.match[[\[\]]][g]{}</h2>}{<h2>$allstone.name_en</h2>}
	^Item_call[]
}</div>

@Item_call[]
^if($allstone.id eq $allstone.last_insert_id){
$result[
<span>^dtf:format[%d %h %Y;]</span>
<h3>Информация о продукте</h3>
<dl id="info">
			<dt>Номер для заказа:</dt>
			<dd>#$allstone.id</dd>
			<dt>Наименование:</dt>
			<dd>^if(def $allstone.name_en){^allstone.name_en.match[[\[\]]][g]{}}{$allstone.name_en} (<em>$allstone.name_ru</em>)</dd>			
			<dt>Страна:</dt>
			<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$allstone.flag" alt="" /> <a href="/stone/country/cell/$allstone.country_id/">$allstone.country_ru</a></dd>		
			<dt>Классификация:</dt>
			<dd><a href="/stone/classification/cell/$allstone.classification_id/">$allstone.classification_ru</a></dd>
			^if(def $allstone.color_id){<dt>Цвет:</dt><dd><a href="/stone/color/cell/$allstone.color_id/">$allstone.color_ru</a></dd>}{}
			<dt>Таможня:</dt>
			<dd>Россия</dd>
			<dt>Телефон:</dt>
			<dd>^my_phone_catalogstone[]</dd>
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<dt>Адрес страницы</dt>
			<dd><a href="/stone/all/select/$allstone.id/">http://www.htz.ru/stone/all/select/$allstone.id/</a></dd>
			<dt><a href="/store/stone_natural/services/">Изделия из камня</a>:</dt>
			<dd>Если у вас есть вопросы по изготовлению изделий из природного камня: <strong>камины</strong>, <strong>подоконники</strong>, <strong>лестницы</strong>, <strong>цокали</strong>, <strong>кухни</strong>, <strong>бордюры</strong> обращайтесь за помощью по телефон: ^my_phone[]</dd>
			
</dl>
^mailform[]
^rem{ Callback }
<p><img src="/stone/img/$allstone.img" alt="^if(def $allstone.name_en){^allstone.name_en.match[[\[\]]][g]{}}{$allstone.name_en}" /></p>
<p>P.S. <em>$allstone.application</em></p>
<br />
<h3>$allstone.color_ru $allstone.classification_ru</h3>
<br />
$ff[^get[]]
	        $cell[^ff.select($ff.color_id==$allstone.color_id)]
	        $cell_cell[^cell.select($cell.classification_id==$allstone.classification_id)]
			$cellf[^table::create[$cell_cell;
            $.limit(5) 
            ]] 
			
			^untaint[as-is]{
			<ul class="listing">
			^cellf.menu{
			^if($cellf.id eq $cellf.last_insert_id){
<li>
<dl>
<dt><a href="/stone/all/select/$cellf.id/"><img src="/stone/img/small/$cellf.img_small" alt="^if(def $cellf.name_en){^cellf.name_en.match[[\[\]]][g]{}}{$cellf.name_en}" /></a> ^if(def $cellf.name_en){<a href="/stone/all/select/$cellf.id/">^cellf.name_en.match[[\[\]]][g]{}</a>}{<a href="/stone/all/select/$cellf.id/">$cellf.name_en</a>}
<span style="font-weight: bold^; color: #9A9A9A^; font-size: 0.8em^; font-style: italic^;">Номер для заказа  #$allstone.id</span></dt>
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$cellf.flag" alt="" /> <a href="/stone/country/cell/$cellf.country_id/">$cellf.country_ru</a></dd>
<dd>Классификация: <a href="/stone/classification/cell/$cellf.classification_id/"><em>$cellf.classification_ru</em></a></dd>
^if(def $cellf.color_id){<dd>Цвет: <a href="/stone/color/cell/$cellf.color_id/">$cellf.color_ru</a></dd>}{$result[]}
</dt>	
</dl>
</li>}{
<li>
<dl>
<dt><a href="/stone/all/select/$cellf.id/"> ^if(def $cellf.name_en){<a href="/stone/all/select/$cellf.id/">^cellf.name_en.match[[\[\]]][g]{}</a>}{<a href="/stone/all/select/$cellf.id/">$cellf.name_en</a>}
<span style="font-weight: bold^; color: #9A9A9A^; font-size: 0.8em^; font-style: italic^;">Номер для заказа  #$allstone.id</span></dt>
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$cellf.flag" alt="" /> <a href="/stone/country/cell/$cellf.country_id/">$cellf.country_ru</a></dd>
<dd>Классификация: <a href="/stone/classification/cell/$cellf.classification_id/"><em>$cellf.classification_ru</em></a></dd>
^if(def $cellf.color_id){<dd>Цвет: <a href="/stone/color/cell/$cellf.color_id/">$cellf.color_ru</a></dd>}{$result[]}
</dt>	
</dl>
</li>
}
}</ul>
}]
}{
$result[
<span>^dtf:format[%d %h %Y;]</span>
<h3>Информация о продукте</h3>
<dl id="info">
			<dt>Номер для заказа:</dt>
			<dd>#$allstone.id</dd>
			<dt>Наименование:</dt>
			<dd>^if(def $allstone.name_en){^allstone.name_en.match[[\[\]]][g]{}}{$allstone.name_en}</dd>
			<dt>Страна:</dt>
			<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$allstone.flag" alt="" /> <a href="/stone/country/cell/$allstone.country_id/">$allstone.country_ru</a></dd>
			<dt>Классификация:</dt>
			<dd><a href="/stone/classification/cell/$allstone.classification_id/">$allstone.classification_ru</a></dd>
			^if(def $allstone.color_id){<dt>Цвет:</dt><dd><a href="/stone/color/cell/$allstone.color_id/">$allstone.color_ru</a></dd>}{}
			<dt>Таможня:</dt>
			<dd>Россия</dd>
			<dt>Телефон:</dt>
			<dd>^my_phone_catalogstone[]</dd>
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			^rem{Callback}
			<dt>Адрес страницы</dt>
			<dd><a href="/stone/all/select/$allstone.id/">http://www.htz.ru/stone/all/select/$allstone.id/</a></dd>
			
</dl>

]
}
#end @printArticleItem[]

@Callback[]
$to[<^my_email_sendmail[]>]
^rem{ *** от какого адреса будет отправляться письмо *** }
$from[index@$env:SERVER_NAME]

^if($form:action eq "done"){
	^rem{ *** сюда мы попадём после внешнего редиректа когда всё уже успешно отправилось *** }
	^rem{ *** тут пишем посетителю что-нить доброе за то, что он отправил нам пожелание *** }
	$reply_thanks[<div class="callback_post">
	<p style="margin: 0^;"><strong style="color:#008000^;">Ваш запрос отправлен.</strong></p>
	<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">В ближайшее время мы свяжемся с вами по телефону или электронной почте.</p>  
	<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">Ваш запрос: камень: $allstone.name_en, классификация: $allstone.classification_ru, страна: $allstone.country_ru</p>
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
				      $.subject[Запрос камня из каталога: http://$env:SERVER_NAME/]
				      $.charset[$response:charset] 
				      $.text[Страница: $form:uri^#0AГород/Область — $form:city^#0AИмя клиента: $form:name^#0A^if(def $form:email){Фамилия: $form:lastname^#0A}Телефон: $form:phone^#0AЭлектронная почта: $form:email^#0AКомментарий клиента: $form:comments^#0A^#0AСообщение отправлено: ^now.sql-string[]]
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


<form action="/stone/all/?id=$allstone.id" method="post" enctype="multipart/form-data">
<input type="hidden" name="do" value="do" />
<input type="Hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />

<table class="postmashine" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr valign="top">
	<td>
	<p style="font-size: 1.1em^; margin: 0^;">Запрос камня: <strong>^if(def $allstone.name_en){^allstone.name_en.match[[\[\]]][g]{}}{$allstone.name_en}</strong></p>
	<p style="font-size: 1.1em^; margin: 0^;">Классификация: $allstone.classification_ru</p>
	<p style="font-size: 1.1em^; margin: 0^;">Страна: <strong>$allstone.country_ru</strong></p>
	</td>
	<td width="75px">^if(def $allstone.img){<img src="/stone/img/small/$allstone.img" alt="$allstone.name_en">}{}</td>
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
#@Callback[]

# метод проверяет все-ли поля формы заполнены. если все хорошо должен вернуть 1, иначе - 0
@is_ok[]
$result(^if(def $form:name && def $form:lastname && def $form:phone && ^Lib:isEmail[$form:email]){1}{0})
#end @is_ok[]






@html_allstone[]
^if(!def $form:id){
	$allstone[^get[]]
	^if($allstone){
		^print_allstone[$allstone]
	}{
		<p>Не найдено.</p>
	}
}{
	^rem{ *** $form:id определена: достаем и показываем новость с выбранным id *** }
	$allstone[^get[$.id(^form:id.int(0))]]
	^if($allstone){
		^Item[$allstone]
	}{
		^rem{ *** указали такую id, новости с которой не существует... посылаем посетителя на... 404 ошибку. *** }
		^Lib:location[/404/]
	}
}
#@@html_all[]


@printtitle[title]
^if(!def $form:id){
$result[Весь список природного камня]
}{
$result[^if(def $title.name_en){$title.name_en :: $title.name_ru} :: $title.classification_ru]
}
#@printtitle[]

@title[]
^if(!def $form:id){
	$title[^get[$.id(0)]]
	^if($title){$result[^printtitle[$title]]}
}{
	$title[^get[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($title){$result[^printtitle[$title]]
	}
}
#@title[]

@prinnavi[navi]
^if(!def $form:id){
$result[<li><strong>Б/У Техника</strong></li>]
}{
$result[<li>$title.name_ru</li>]
}
#@printtitle[]

@navi_go[]
^if(!def $form:id){
	$navi[^get[$.id(0)]]
	^if($navi){$result[^prinnavi[$title]]}
}{
	$navi[^get[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($navi){$result[^prinnavi[$navi]]
	}
}
#@title[]

@printdescription[description]
^if(!def $form:id){
$result[Весь список камня]
}{
$result[$description.classification_ru $description.name_en под заказ. ${description.country_ru}.  $description.description]
}
#@printtitle[]

@description[]
^if(!def $form:id){
	$description[^get[$.id(0)]]
	^if($description){$result[^printdescription[$description]]}
}{
	$description[^get[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($description){$result[^printdescription[$description]]
	}
}
#@title[]

@printkeywords[keywords]
^if(!def $form:id){
$result[$keywords.classification_ru $keywords.name_en под заказ, ${keywords.country_ru}, Мрамор, Гранит, Оникс, работа с камнем, изделия из природного камня]
}{
$result[$keywords.keywords]
}
#@printtitle[]

@keywords[]
^if(!def $form:id){
	$keywords[^get[$.id(0)]]
	^if($keywords){$result[^printkeywords[$keywords]]}
}{
	$keywords[^get[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($keywords){$result[^printkeywords[$keywords]]
	}
}
#@title[]

@html_allstone_c[][oCachePage]
^use[CachePage.p]
$oCachePage[^CachePage::create[
	$.sCacheDir[$CACHE_DIR]
]]

^oCachePage.run[$sKey]($iTime){
	^rem{ собственно код, формирующий страницу. при вызове метода не перепутайте... }
	^rem{ ...и не используйте случайно квадратные скобки вместо фигурных... }
	^html_allstone[]
}
#end @main[]

###########################################################################
@mailform[][oAntiSpam;bShowForm]
$now[^date::now[]] 
$detail[^get[$.id(^form:id.int(0))]]
$oAntiSpam[^Antispam::create[$hAntiSpamParams]]

^debug[$oAntiSpam]

$bShowForm(true)

^oAntiSpam.exec{

	^check[]

	
	<p>Ваш запрос:<br /><strong style="font-size: 0.8em^;">${detail.name_en}. ${detail.classification_ru}.</strong><br />Ваше имя:<br /><strong style="font-size: 0.8em^;">$form:name</strong><br />Почта:<br /><strong style="font-size: 0.8em^;">$form:email</strong></p>
	$to[^my_email_sendmail[]]
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
<div class="value_sendmail_stone">
<p>Запрос камня: <strong>$detail.name_en</strong></p>
<form method="post" enctype="multipart/form-data">
<input type="hidden" name="productname" value="${detail.name_en}.${detail.classification_ru}." />
<input type="hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />
			<em style="color:red^;">*</em> Ваше имя<br />
			<input name="name" type="text" maxlength="25" value="$form:name" style="width:95%^;font-size:1.1em^;"  /><br />

			<em style="color:red^;">*</em> Номер телефона: +7<br />
<input name="areacode" type="text" maxlength="4" value="$form:areacode" style="width:20%^;font-size:1.1em^;" />
-
<input name="phone1" type="text" maxlength="4" value="$form:phone1" style="width:25%^;font-size:1.1em^;" />
-
<input name="phone2" type="text" maxlength="4" value="$form:phone2" style="width:44%^;font-size:1.1em^;" /><br />
			
			
			
			<em style="color:red^;">*</em> Адрес эл. почты:<br />
			<input type="text" name="email" value="$form:email" style="width:95%^;font-size:1.1em^;"  /><br />
			
			Примерный объем. м&sup2^;<br />
            <input name="m_2" type="text" maxlength="50" value="$form:m_2" style="width:95%^;font-size:1.1em^;" /><br />

			Сообщение:<br />
			<textarea name="comments" type="text" rows="4" tabindex="6" style="overflow: auto^; width:95%^;font-size:1.7em^;" />$form:comments</textarea><br /><br />

            <input type="submit" name="action" value="Отправить" class="_post" style="font-weight: bolder^; height: 2em^; width: auto^; margin: 0^; " />
</form></div>

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
^if(!def $form:areacode){
	^throw[check.fields;]
}
^if(!def $form:phone1){
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


