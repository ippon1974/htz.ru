@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[] | Б/У Техника | Вы может продать Б/У дорожно-строительную и сельскохозяйственную технику с помощью нашего сайта. Это не очень дорого и удобно." />
<meta name="keywords" content="^title[] | Б/У Техника | Б/У Китайские бульдозеры, Б/У погрузчики, Б/У экскаваторы, Б/У китайские катки, Б/У xcmg, Б/У shantui, Б/У foton, Б/У shehwa, Б/У бульдозеры SHANTUI, Б/У бульдозеры Китай, Б/У SANY, Б/У ZOOMLION, Б/У бетононасосы, Б/У фронтальные Б/У погрузчики Б/У XCMG, Б/У бульдозеры SHEHWA, Б/У тракторы ХТЗ." />

<script type="text/javascript" src="/js/jquery.min.js"> </script>
<script type="text/javascript" src="/js/main.js"> </script>

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>

<link rel="shortcut icon" href="/ico.ico" /> 
<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>
</head>



<body class="usetehno">

@getTechnology[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		technology_id AS id,
		last_insert_id,
		phone_users,
		img_icon,
		nomenclature,
		name,
		translit,
		type_technology,
		type_name,
		brand,
		country_manufacturer,
		year,
		work,
        state,
		img_1,
		img_2,
		img_3,
		body_img_1,
		body_img_2,
		body_img_3,
		body_img_4,
		body_img_5,
		body_img_6,
		body_img_7,
		pdf,
		dt,
		title,
		lead,
		description,
		keywords,
		parking,
		presence,
		price
	FROM
		technology
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND technology_id = ^hParam.id.int(0)
		}
	ORDER BY
		dt DESC
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getArticles[]

@print[tehno]
<div id="tehnosale">
<h2><strong><em>Б/У Техника</em></strong></h2>
<h3><a href="/catalog/use/help/">Как продать технику через наш сайт?</a></h3>
<p><em>Уважаемые владельцы</em> дорожно-строительной и сельскохозяйственной техники. Если вы <a href="/catalog/use/help/"><strong>намерены продать</strong></a> по каким-либо причинам свою технику мы готовы помочь вам в этом с помощью нашего сайта</a>.</p>
<h3>Продажа Б/У Техники</strong></h3>
<table cellspacing="0">
<tr><th>&#9660;</th><th>Наименование</th><th>Год выпуска</th><th>Стоимость</th></th>
^untaint[as-is]{
	^tehno.menu{
         ^print_call[]
	}
}</table>

</div>
#end @printArticlesShow[]

@print_call[]
^if($tehno.id eq $tehno.last_insert_id){
$result[<tr><td><a href="/catalog/use/tehno/$tehno.id/"><img src="/catalog/use/i/$tehno.img_icon" alt="$tehno.name" /></a></td><td><a href="/catalog/use/tehno/$tehno.id/">$tehno.name</a></td><td>$tehno.year</td><td>$tehno.price руб.</td></tr>]
}{
$result[<tr><td>$tehno.id</td><td><a href="/catalog/use/tehno/$tehno.id/">$tehno.name</a></td><td>$tehno.year</td><td>$tehno.price руб.</td></tr>]
}
#end @print_call[]

@Item[tehno;amount]
<div id="tehnobody">
^untaint[as-is]{
	^if(def $tehno.name){<h2>^tehno.name.match[[\[\]]][g]{}</h2>}
	^Item_call[]
}</div>

@Item_call[]
^if($tehno.id eq $tehno.last_insert_id){
$result[
<span>^dtf:format[%d %h %Y;]</span>
<h3>Информация о техники</h3>

$text(^tehno.price.trim[])
$text_nds($text/6.55557)
<h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4><div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>


<dl id="info">
			<dt>Сегодня:</dt>
			<dd><abbr class="dtstart">^dtf:format[%d %h %Y;]г.</abbr></dd>
			<dt>Дата публикации:</dt>
			<dd>^dtf:format[%d %h %Y;$tehno.dt;$dtf:rr-locale]г.</dd>
			<dt>Тип:</dt>
			<dd>$tehno.type_name</dd>
			<dt>Бренд:</dt>
			<dd>&laquo^;$tehno.brand&raquo^;</dd>
			<dt>Страна:</dt>
			<dd>$tehno.country_manufacturer</dd>
			<dt>Номенклатура:</dt>
			<dd><strong>$tehno.nomenclature</strong></dd>
			<dt>Год выпуска:</dt>
			<dd><strong>$tehno.year</strong></dd>
			<dt>Наработка:</dt>
			<dd>$tehno.work (<em>моточасы</em>)</dd>
			<dt>Состояние:</dt>
			<dd>$tehno.state</dd>
			<dt>Стоянка:</dt>
			<dd>$tehno.parking</dd>
			<dt>Описание:</dt>
			<dd>$tehno.lead</dd>
			<dt>Таможня:</dt>
			<dd>Россия</dd>
			<!--<dt>Телефон:</dt>
			<dd><noindex>^if(def $tehno.phone_users){$tehno.phone_users}{^my_phone[]}</noindex></dd>-->
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<dt>Адрес страницы</dt>
			<dd><a href="/catalog/use/tehno/$tehno.id/">http://www.htz.ru/catalog/use/tehno/$tehno.id/</a></a></dd>
			<dt>Скачать:</dt>
			<dd><a href="/catalog/use/$tehno.id/">Скачать предложение:</a> ($f[^file::stat[/catalog/use/pdf/$tehno.pdf]]<em>.pdf Байт: $f.size</em>)</dd>
			<dd>
			
</dl>


<div>
^if(def $tehno.img_1){<a class="popup" id="feedbackLink" onclick="return false" href="/catalog/use/screen/id/$tehno.id/"><img src="/catalog/use/i/small/$tehno.img_1" alt="$tehno.name" /></a>}{}
^if(def $tehno.img_2){<a class="popup" id="feedbackLink" onclick="return false" href="/catalog/use/screen/id/$tehno.id/"><img src="/catalog/use/i/small/$tehno.img_2" alt="$tehno.name" /></a>}{}
^if(def $tehno.img_3){<a class="popup" id="feedbackLink" onclick="return false" href="/catalog/use/screen/id/$tehno.id/"><img src="/catalog/use/i/small/$tehno.img_3" alt="$tehno.name" /></a>}{}
</div>

<!--^send[]-->

]
}{
$result[

<span>^dtf:format[%d %h %Y;]</span>
<h3>Информация о техники</h3>

$text(^tehno.price.trim[])
$text_nds($text/6.55557)
<h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4><div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>


<dl id="info">
			<dt>Сегодня:</dt>
			<dd><abbr class="dtstart">^dtf:format[%d %h %Y;]г.</abbr></dd>
			<dt>Дата публикации:</dt>
			<dd>^dtf:format[%d %h %Y;$tehno.dt;$dtf:rr-locale]г.</dd>
			<dt>Тип:</dt>
			<dd>$tehno.type_name</dd>
			<dt>Бренд:</dt>
			<dd>&laquo^;$tehno.brand&raquo^;</dd>
			<dt>Страна:</dt>
			<dd>$tehno.country_manufacturer</dd>
			<dt>Номенклатура:</dt>
			<dd><strong>$tehno.nomenclature</strong></dd>
			<dt>Год выпуска:</dt>
			<dd><strong>$tehno.year</strong></dd>
			<dt>Наработка:</dt>
			<dd>$tehno.work (<em>моточасы</em>)</dd>
			<dt>Состояние:</dt>
			<dd>$tehno.state</dd>
			<dt>Стоянка:</dt>
			<dd>$tehno.parking</dd>
			<dt>Описание:</dt>
			<dd>$tehno.lead</dd>
			<dt>Таможня:</dt>
			<dd>Россия</dd>
			<!--<dt>Телефон:</dt>
			<dd><noindex>^if(def $tehno.phone_users){$tehno.phone_users}{^my_phone[]}</noindex></dd>-->
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
			<dt>Адрес страницы</dt>
			<dd><a href="/catalog/use/tehno/$tehno.id/">http://www.htz.ru/catalog/use/tehno/$tehno.id/</a></a></dd>
			^if(def $tehno.pdf){
			<dt>Скачать:</dt>
			<dd><a href="/catalog/use/$tehno.id/">Скачать предложение:</a> ($f[^file::stat[/catalog/use/pdf/$tehno.pdf]]<em>.pdf Байт: $f.size</em>)</dd>
			<dd>}{}
			
</dl>

<!--^send[]-->

]
}
#end @printArticleItem[]

@html[]
^if(!def $form:id){
	$tehno[^getTechnology[]]
	^if($tehno){
		^print[$tehno]
	}{
		<p>Не найдено ни одной новости за указаный период.</p>
	}
}{
	^rem{ *** $form:id определена: достаем и показываем новость с выбранным id *** }
	$tehno[^getTechnology[$.id(^form:id.int(0))]]
	^if($tehno){
		^Item[$tehno]
	}{
		^rem{ *** указали такую id, новости с которой не существует... посылаем посетителя на... 404 ошибку. *** }
		^Lib:location[/404/]
	}
}
#@html[]

@printtitle[title]
^if(!def $form:id){
$result[Б/У Техника | Продажа и покупка техники Б/У]
}{
$result[Б/У $title.name]
}
#@printtitle[]

@title[]
^if(!def $form:id){
	$title[^getTechnology[$.id(0)]]
	^if($title){$result[^printtitle[$title]]}
}{
	$title[^getTechnology[
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
$result[<li><a href="/catalog/use/">Б/У Техника</a></li> <li>$title.name</li>]
}
#@printtitle[]

@navi_go[]
^if(!def $form:id){
	$navi[^getTechnology[$.id(0)]]
	^if($navi){$result[^prinnavi[$title]]}
}{
	$navi[^getTechnology[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($navi){$result[^prinnavi[$navi]]
	}
}
#@title[]

@send[]

$to[<mail@htz.ru>]
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
				      $.subject[Сообщение с сайта http://$env:SERVER_NAME/]
				      $.charset[$response:charset] 
				      $.text[Имя: $form:name^#0A^if(def $form:email){Фамилия: $form:lastname^#0A}Компания: $form:company^#0AТелефон: $form:areacode $form:phone1 $form:phone2^#0AЭлектронная почта: $form:email^#0AПродукт Б/У: $form:detalinfo ^#0AДополнительная информация:^#0A$form:comments^#0A^#0AСообщение отправлено: ^now.sql-string[]^#0AIP: $env:REMOTE_ADDR]
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

<h3 class="comments">[Форма для отправки эл. письма]</h3>
<form id="comment_form" action="/catalog/use/?id=$tehno.id" method="post" enctype="multipart/form-data">
$err_field_empty
$reply_thanks
<input type="hidden" name="do" value="do" />


<dl class="identity">
	<dt><label>Ваше Имя*</label></dt>
	<dd><input type="text" class="filled" name="name" value="$form:name" /></dd>
	<dt><label>Ваша Фамилия*</label></dt>
	<dd><input type="text" class="filled" name="lastname" value="$form:lastname" /></dd>
	<dt><label>Компания (<em>не обязательно</em>)</label></dt>
	<dd><input type="text" class="filled" name="company" value="$form:company" /></dd>
	
	
	<dt><label>Номер телефона:</label> +7*</dt>
    <dd><input type="text" class="filled" name="areacode" value="$form:areacode" style="width:35px;" />
   &#8211^;
    <input name="phone1" type="text" maxlength="3" value="$form:phone1" style="width:35px;" />
   &#8211^;
    <input name="phone2" type="text" maxlength="4" value="$form:phone2" style="width:60px;" /></dd>
	
	<dt><label>Адрес эл. почты*</label></dt>
	<dd><input type="text" class="filled" name="email" value="$form:email" tabindex="5" /></dd>
</dl>
				
<dl>
<dt><label>Текст сообщения</label></dt>
<input type="Hidden" class="filled" name="detalinfo" value="$tehno.name" tabindex="5" />
<dd><textarea name="comments" rows="8" cols="20" tabindex="6">$form:comments</textarea></dd>
<dt class="submit"><input type="image" name="submit" src="/img/widgets/submit_button.gif" alt="Отправить сообщение" value="Post" tabindex="7" /></dt>
</dl>
#@send[]

# метод проверяет все-ли поля формы заполнены. если все хорошо должен вернуть 1, иначе - 0
@is_ok[]
$result(^if(def $form:name && def $form:lastname && def $form:areacode && def $form:phone1 && def $form:phone2 && def $form:email && def $form:detalinfo && def $form:comments){1}{0})
#end @is_ok[]

@getRigftTehno[]
 $getRigftTehno[^getTechnology[]]
  <ul id="section_id">
   ^getRigftTehno.menu{^if($getRigftTehno.id==$form:id){
   <li><strong>$getRigftTehno.nomenclature</strong></li>
   }{
   <li><a href="/catalog/use/tehno/$getRigftTehno.id/">$getRigftTehno.nomenclature</a></li>
   }
   }
   </li>
  </ul>
  
#@getRigftTehno[]