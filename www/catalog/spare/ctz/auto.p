@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[] | Запчасти ЧТЗ | ЧТЗ Запчасти</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[] | ^description[]" />
<meta name="keywords" content="^title[] | ^keywords[]" />

<script type="text/javascript" src="/js/jquery.min.js"> </script>
<script type="text/javascript" src="/js/main.js"> </script>

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>

<style type="text/css" media="all">
a {
	text-decoration: none;
}
a:visited {
	color: Purple;
	text-decoration: none;
}
</style>


</head>



<body class="spare sparehtz">


@getCatalog[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		catalog_id AS id,
		name,
		translit
	FROM
		ctz_catalog
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getCatalog[]


@getCategories[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		categories_id AS id,
		catalog_id,
		name,
		description,
		keywords,
		picture
	FROM
		ctz_categories
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND categories_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getCategories[]

@getProducts[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		products_id AS id,
		category_id,
		brand,
		country,
		picture,
		name,
		description,
		keywords,
		product_code,
		presence,
		last_insert_id,
		price
	FROM
		ctz_products
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND products_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getCategories[]

@nav_nomenclature[]
$sections[^table::load[/catalog/ctz/nomenclature.cfg]]
<ul id="section_id">
 ^sections.menu{ 
      ^nav_nomenclature_cell[]
   } 
</ul>

@nav_nomenclature_cell[] 
^if($sections.uri eq $request:uri){
<li class="$sections.section_id">$sections.name</li>
}{ 
<li class="$sections.section_id"><a href="$sections.uri">$sections.name</a></li>
}
#end @nav_nomenclature_cell[] 

@menuCatalog[]
$catalog[^getCatalog[]]
 ^if($catalog){
 <ul>
       ^catalog.menu{<li><a href="/catalog/spare/ctz/det250m/$catalog.translit/">$catalog.name</a></li>}
 </ul>}{
 
 }
#@menuCatalog[]

@title[]
$title[^table::load[/_root.cfg]]
^if(^title.locate[uri;$request:uri]){ 
$result[$title.title]
}{ 
$result[^title_id[]]
} 
#@hedpage[]

@title_id[]
$title_id[^getCategories[]]
^if(^title_id.locate[id;$form:id]){ 
$result[$title_id.name]
}{ 
$result[]
} 
#@title_id[]

@description[]
$description[^table::load[/_root.cfg]]
^if(^description.locate[uri;$request:uri]){ 
$result[$description.description]
}{ 
$result[]
} 
#@hedpage[]

@keywords[]
$keywords[^table::load[/_root.cfg]]
^if(^keywords.locate[uri;$request:uri]){ 
$result[$keywords.keywords]
}{ 
$result[]
} 
#@hedpage[]


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
				      $.text[Адрес станице на сайте: $form:uri^#0AИмя: $form:name^#0A^if(def $form:email){Фамилия: $form:lastname^#0A}Компания: $form:company^#0AТелефон: $form:areacode $form:phone1 $form:phone2^#0AЭлектронная почта: $form:email^#0AДополнительная информация:^#0A$form:comments^#0A^#0AСообщение отправлено: ^now.sql-string[]^#0AIP: $env:REMOTE_ADDR]
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

<h3 class="comments">[Заказ запасных частей]</h3>
<form id="comment_form" action="http://www.htz.ru/catalog/spare/ctz/det250m/detal/id/$detail.id/" method="post" enctype="multipart/form-data">
$err_field_empty
$reply_thanks
<input type="hidden" name="do" value="do" />
<input type="hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />

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
<dd><textarea name="comments" rows="8" cols="20" tabindex="6">$form:comments</textarea></dd>
<dt class="submit"><input type="image" name="submit" src="/img/widgets/submit_button.gif" alt="Отправить сообщение" value="Post" tabindex="7" /></dt>
</dl>
#@send[]

# метод проверяет все-ли поля формы заполнены. если все хорошо должен вернуть 1, иначе - 0
@is_ok[]
$result(^if(def $form:name && def $form:lastname && def $form:areacode && def $form:phone1 && def $form:phone2 && def $form:email && def $form:comments){1}{0})
#end @is_ok[]

@phone_company[]
+ 7 (925) 585-33-71 (Мегафон)
#phone_company[]
