@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[] | Запчасти ЧТЗ Т-170 | ЧТЗ Запчасти</title>

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



<body class="spare">

@getCatalogNew[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		categories_id AS id,
		parent_id,
		patch,
		catalog_name,
		title,
		description_catalog,
		keywords_catalog
	FROM
		ctz170_new_categ
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND categories_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getCatalog[]


@getProducts[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		products_id AS id,
		parent_id,
		brand,
		country,
		picture,
		name_products,
		description_products,
		keywords_products,
		product_code,
		presence,
		price,
		last_insert_id
	FROM
		ctz170_products
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND products_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getCatalog[]



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
<li class="$sections.section_id"><a href="$sections.uri" title="$sections.name">$sections.name</a></li>
}
#end @nav_nomenclature_cell[] 


@printCatalog[]
$catalog[^getCatalogNew[]]
 $catalog_cell[^catalog.select($catalog.parent_id==0)]
<ul>
     ^catalog_cell.menu{<li><a href="$catalog_cell.patch/$catalog_cell.catalog_name/" title="$catalog_cell.title">$catalog_cell.title</a></li>}
</ul>
  
@menuCatalog[]
^printCatalog[]
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

@send[]
$to[<mail@htz.ru>]
^rem{ *** от какого адреса будет отправляться письмо *** }
$from[index@$env:SERVER_NAME]

^if($form:action eq "done"){
	^rem{ *** сюда мы попадём после внешнего редиректа когда всё уже успешно отправилось *** }
	^rem{ *** тут пишем посетителю что-нить доброе за то, что он отправил нам пожелание *** }
	$reply_thanks[<p><font color="#339900"><strong>Спасибо. Ваше сообщение отправлено. Мы постараемся в ближайшее время связаться с вами.</strong></font></p>]
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
				      $.text[Имя: $form:name^#0A^if(def $form:email){$form:lastname}Телефон: $form:areacode $form:phone1 $form:phone2^#0AЭлектронная почта: $form:email^#0AНазвание детали: $form:namedetal^#0AНомер по каталогу: $form:codedetal^#0AАдрес страницы: $form:uri^#0AСообщение отправлено: ^now.sql-string[]^#0AIP: $env:REMOTE_ADDR]
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

<h3 class="comments">Уточнить наличие запасной части:</h3>
<p><strong>Название запчасти</strong>: $detail.name_products
^if(def $detail.product_code){<br /><strong>Номер по каталогу</strong>: <strong style="color: Red^;">$detail.product_code</strong>}{}</p>
<p><em>Заполните форму и отправьте нам запрос о наличии запасной части. Мы постараемся <strong>быстро связаться с вами</strong> по вашему телефону или по вашей электронной почте.</em></p>
<form id="comment_form" action="/catalog/spare/ctz/t170/products/detal/?id=$detail.id" method="post" enctype="multipart/form-data">
$err_field_empty
$reply_thanks
<input type="hidden" name="do" value="do" />


<dl class="identity">
	<dt><label style="font-size: 1.5em^;">Ваше Имя<em style="color:red;">*</em></label>
	<input type="Hidden" name="namedetal" value="$detail.name_products" />
	<input type="Hidden" name="codedetal" value="$detail.product_code" />
	<input type="Hidden" name="uri" value="http://$env:SERVER_NAME/catalog/spare/ctz/t170/products/detal/?id=$detail.id" />
	</dt>
	<dd><input type="text" class="filled" name="name" value="$form:name" /></dd>
	<dt><label style="font-size: 1.5em^;">Номер телефона:</label> +7<em style="color:red;">*</em></dt>
    <dd><input type="text" class="filled" name="areacode" value="$form:areacode" style="width:35px;" />
   &#8211^;
    <input name="phone1" type="text" maxlength="3" value="$form:phone1" style="width:35px;" />
   &#8211^;
    <input name="phone2" type="text" maxlength="4" value="$form:phone2" style="width:60px;" /></dd>
	
	<dt><label style="font-size: 1.5em^;">Адрес эл. почты<em style="color:red;">*</em></label></dt>
	<dd><input type="text" class="filled" name="email" value="$form:email" tabindex="5" /></dd>
</dl>			
<dl>
<dt><input style="border: 2px solid #CFBF23^; color: #000^; height: 2em^; background-color: #f5deb3^;" type="Submit" name="submit" value="Уточнить наличие на складе" tabindex="7" /></dt>
</dl>
#@send[]

# метод проверяет все-ли поля формы заполнены. если все хорошо должен вернуть 1, иначе - 0
@is_ok[]
$result(^if(def $form:name && def $form:areacode && def $form:phone1 && def $form:phone2 && def $form:email){1}{0})
#end @is_ok[]
