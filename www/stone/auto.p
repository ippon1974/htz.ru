@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="Каталог природного камня | " />
<meta name="keywords" content="Каталог природного камня | " />

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

<body class="stoneinfo">

@printtitle[title]
^if(!def $form:id){
$result[Каталог камня]
}{
$result[300]
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
$result[<li><strong>Каталог камня</strong></li>]
}{
$result[<li><a href="/catalog/use/">Б/У</a></li> <li>$title.name</li>]
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

@get[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
     SELECT
	    stone_id AS id,
		classification_id,
		classification_ru,
		color_id,
		color_ru,
		color_en,
		country_id,
		country_ru,
		name_ru,
		name_en,
		application,
		description,
		keywords,
		img,
		img_small,
		flag,
		last_insert_id,
		price
	FROM
		stone
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND stone_id = ^hParam.id.int(0)
		}
	ORDER BY
		id DESC
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getArticles[]


@scroller_misha[]
$newscount(^MAIN:pSQL.int{
	SELECT
		COUNT(*)
	FROM
		stone
	WHERE
		is_published = 1
})
$items(10)
$opage[^scroller::init[$newscount;$items;page]]
^opage.print[
	$.target_url[/stone/]
	$.nav_count(10)
	$.mode[html]
]
$news[^MAIN:pSQL.table{
	SELECT
		stone_id AS id,
		classification_id,
		classification_ru,
		color_id,
		color_ru,
		color_en,
		country_id,
		country_ru,
		name_ru,
		name_en,
		application,
		img,
		img_small,
		flag,
		last_insert_id
	FROM
		stone
	WHERE
		is_published = 1
		^if(^hParam.id.int(0)){
		AND stone_id = ^hParam.id.int(0)
		}
	ORDER BY
		id DESC
}[
	$.offset($opage.offset)
	$.limit($opage.limit)
]]
#end @scroller_misha[]


@printList[opage]
^untaint[as-is]{
<ul class="listing">
	^news.menu{
	       ^printList_cell[]
	}
</ul>
}

@printList_cell[]
^if($news.id eq $news.last_insert_id){
$result[
<li>
<dl>
<dt><a href="/stone/all/select/$news.id/"><img src="/stone/img/small/$news.img_small" alt="^if(def $news.name_en){^news.name_en.match[[\[\]]][g]{}}{$news.name_en}" /></a> ^if(def $news.name_en){<a href="/stone/all/select/$news.id/">^news.name_en.match[[\[\]]][g]{}</a>}{<a href="/stone/all/select/$news.id/">$news.name_en</a>}
<span style="font-weight: bold^; color: #9A9A9A^; font-size: 0.8em^; font-style: italic^;">Номер для заказа #$news.id</span></dt>
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$news.flag" alt="" /> <a href="/stone/country/cell/$news.country_id/">$news.country_ru</a></dd>
<dd>Классификация: <a href="/stone/classification/cell/$news.classification_id/"><em>$news.classification_ru</em></a></dd>
^if(def $news.color_id){<dd>Цвет: <a href="/stone/color/cell/$news.color_id/">$news.color_ru</a></dd>}{}
</dt>
</dl>
</li>]
}{
$result[
<li>
<dl>
<dt>^if(def $news.name_en){<a href="/stone/all/select/$news.id/">^news.name_en.match[[\[\]]][g]{}</a>}{<a href="/stone/all/select/$news.id/">$news.name_en</a>}</dt>
<span style="font-weight: bold^; color: #9A9A9A^; font-size: 0.8em^; font-style: italic^;">Номер для заказа  #$news.id</span>		
<dd><img style="margin: 0 5px 0 0^;" src="/stone/img/i/$news.flag" alt="" /> <a href="/stone/country/cell/$news.country_id/">$news.country_ru</a></dd>
<dd>Классификация: <a href="/stone/classification/cell/$news.classification_id/"><em>$news.classification_ru</em></a></dd>
^if(def $news.color_id){<dd>Цвет: <a href="/stone/color/cell/$news.color_id/">$news.color_ru</a></dd>}{}
</dl>
</li>]
}
#end@printArticlesList_cell[]


@htmlscroller[]
<p>^scroller_misha[]</p>
^printList[]
<p>^scroller_misha[]</p>

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
				      $.text[Имя: $form:name^#0A^if(def $form:email){Фамилия: $form:lastname^#0A}Компания: $form:company^#0AТелефон: $form:areacode $form:phone1 $form:phone2^#0AЭлектронная почта: $form:email^#0AДополнительная информация:^#0A$form:comments^#0A^#0AСообщение отправлено: ^now.sql-string[]^#0AIP: $env:REMOTE_ADDR]
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
<form id="comment_form" action="http://www.htz.ru/stone/all/select/$allstone.id/" method="post" enctype="multipart/form-data">
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
<dd><textarea name="comments" rows="8" cols="20" tabindex="6">$form:comments</textarea></dd>
<dt class="submit"><input type="image" name="submit" src="/img/widgets/submit_button.gif" alt="Отправить сообщение" value="Post" tabindex="7" /></dt>
</dl>
#@send[]

# метод проверяет все-ли поля формы заполнены. если все хорошо должен вернуть 1, иначе - 0
@is_ok[]
$result(^if(def $form:name && def $form:lastname && def $form:areacode && def $form:phone1 && def $form:phone2 && def $form:email && def $form:comments){1}{0})
#end @is_ok[]


@getClassification[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		classification_id AS id,
		last_insert_id,
		name_ru,
		name_en,
		description,
		keywords,
		uri
	FROM
		classification
	WHERE
		is_published = 1
		^if(^hParam.id.int(0)){
		AND classification_id = ^hParam.id.int(0)
		}
	ORDER BY
		id DESC
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getArticles[]

@printClassification[class]
<ul>
^untaint[as-is]{
	^class.menu{
          <li><a href="/stone/classification/cell/$class.id/">$class.name_ru</a></li>
	}
}</ul>
#end @printArticlesShow[]


@html_class[]
    $class[^getClassification[
	$.limit(2)]]
	^if($class){
		^printClassification[$class]
	}
#@html[]


@getColor[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		color_id AS id,
		img,
		name_ru,
		name_en,
		last_insert_id,
		description,
		keywords,
		uri
	FROM
	   color
	WHERE
		is_published = 1
		^if(^hParam.id.int(0)){
		AND color_id = ^hParam.id.int(0)
		}
	ORDER BY
		id
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getArticles[]

@printColor[color]
<ul>
^untaint[as-is]{
	^color.menu{
          <li><img src="/stone/img/i/c/$color.img" alt="" /> <a href="/stone/color/cell/$color.id/">$color.name_ru</a></li>
	}
}</ul>
#end @printArticlesShow[]


@html_color[]
    $color[^getColor[{$.limit(4)}]]
	^if($color){
		^printColor[$color]
	}
#@html[]



@getCountry[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		country_id AS id,
		name_ru,
		name_en,
		flag,
		last_insert_id,
		description,
		keywords,
		uri
	FROM
		country
	WHERE
		is_published = 1
		^if(^hParam.id.int(0)){
		AND country_id = ^hParam.id.int(0)
		}
	ORDER BY
		id
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getArticles[]


@printCountry[country]
<ul class="utility">
^untaint[as-is]{
	^country.menu{
          <li><img src="/stone/img/i/$country.flag" alt="" /> <a href="/stone/country/cell/$country.id/" title="$country.name_ru">$country.name_ru</a></li>
	}
}</ul>
#end @printArticlesShow[]


@html_country[]
    $country[^getCountry[
	$.limit(44)
	$.offset(14)
	]]
	^if($country){
		^printCountry[$country]
	}
#@html[]

@printalfa[]
$catalog[^MAIN:pSQL.table{SELECT stone_id, name_en FROM stone WHERE LEFT(LCASE(name_en),1)="$form:letter" ORDER BY name_en ASC}]
<ul class="alphabet">
^catalog.menu{
   <li><a href="/stone/all/?id=$catalog.stone_id">$catalog.name_en</a></li>
}</ul>

@printalfafront[]
$alphabet[^MAIN:pSQL.table{SELECT (LEFT(name_en,1)) AS letter FROM stone GROUP BY LCASE(LEFT(name_en,1))}]
^alphabet.sort{$alphabet.letter}
<div class="alphabet">
^alphabet.menu{
       <a href="/stone/letter/?letter=$alphabet.letter">$alphabet.letter</a>
}[|]</div><br />
^printalfa[]


@printalfa_ru[]
$catalog_ru[^MAIN:pSQL.table{SELECT stone_id, name_ru FROM stone WHERE LEFT(LCASE(name_ru),1)="$form:letter" ORDER BY name_ru ASC}]
<ul class="alphabet">
^catalog_ru.menu{
   <li><a href="/stone/all/?id=$catalog_ru.stone_id">$catalog_ru.name_ru</a></li>
}</ul>

@printalfafront_ru[]
$alphabet_ru[^MAIN:pSQL.table{SELECT (LEFT(name_ru,1)) AS letter FROM stone GROUP BY LCASE(LEFT(name_ru,1))}]
^alphabet_ru.sort{$alphabet_ru.letter}
<div class="alphabet">
^alphabet_ru.menu{
       <a href="/catalog/letter/?letter=$alphabet_ru.letter">$alphabet_ru.letter</a>
}[|]</div>
^printalfa_ru[]
#@printalfafront_ru[]


@menuRstorePlate[]
 $menuRstorePlate[^getProductsStore[
 $.limit(13)
 $.offset(125)
 ]]
   $menuRstorePlate_cell[^menuRstorePlate.select($menuRstorePlate.products_type==1)]
 <dl>
<dt>Плитка</dt>
     ^menuRstorePlate_cell.menu{<dd><a href="/store/detal/id/$menuRstorePlate_cell.id/">$menuRstorePlate_cell.products_name_en</a> <em>$menuRstorePlate_cell.pay</em> ^$</dd>}
 </dl>

#@menuRstorePlate[]

@menuRstoreSlabs[]
 $menuRstoreSlabs[^getProductsStore[
 $.limit(10)
 $.offset(214)
 ]]
   $menuRstoreSlabs_cell[^menuRstoreSlabs.select($menuRstoreSlabs.products_type==3)]
 <dl>
<dt>Слебы</dt>
     ^menuRstoreSlabs_cell.menu{<dd><a href="/store/detal/id/$menuRstoreSlabs_cell.id/">$menuRstoreSlabs_cell.products_name_en</a> <em>$menuRstoreSlabs_cell.pay</em> ^$</dd>}
 </dl>
#@menuRstoreSlabs[]

@menuRstoreSett[]
 $menuRstoreSett[^getProductsStore[
 $.limit(35)
 $.offset(568)
 ]]
  $menuRstoreSett_cell[^menuRstoreSett.select($menuRstoreSett.products_type==4)]
 <dl>
<dt>Брусчатка</dt>
     ^menuRstoreSett_cell.menu{<dd><a href="/store/detal/id/$menuRstoreSett_cell.id/">5</a> <em>$menuRstoreSett_cell.pay</em> ^$</dd>}
 </dl>
  
#@menuRstoreSett[]

@menuRstoreLadder[]
 $menuRstoreLadder[^getProductsStore[]]
#@menuRstoreSett[]

@in_store_special_civel[]
<strong><a style="color:red^;" href="/store/stone_natural/in_store/" title="Наличие на складе природного камня">Наличие на складе</a></strong>
#@in_store_special_civel[]