@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^description[]" />
<meta name="keywords" content="^keywords[]" />

<link rel="stylesheet" type="text/css" href="/css/callback_mini.css">
<link rel="stylesheet" type="text/css" href="/css/callback.css">

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

<body class="store">

@title[]
^h_all[]
^if(def $form:id){
 $title[^getProductsStore[$.id(^form:id.int(0))]]
 $result[${h_detal.products_type.[$title.products_type]}. $title.products_name_en  ^if(def $title.w){$title.w &times^;}{} ^if(def $title.h){$title.h &times^;}{} ^if(def $title.i){${title.i}мм}{}  ${h_detal.products_format_type.[$title.products_format_type]}.]
 }{}
#@Ititle[]

@description[]
^h_all[]
^if(def $form:id){
 $description[^getProductsStore[$.id(^form:id.int(0))]]
 $result[${h_detal.products_type.[$description.products_type]}. $description.products_name_en  ^if(def $description.w){$description.w &times^;}{} ^if(def $description.h){$description.h &times^;}{} ^if(def $description.i){${description.i}мм}{} под заказ  ${h_detal.products_format_type.[$description.products_format_type]}.]
 }{}
#@description[]

@keywords[]
^h_all[]
^if(def $form:id){
 $keywords[^getProductsStore[$.id(^form:id.int(0))]]
 $result[${h_detal.products_type.[$keywords.products_type]} $keywords.products_name_en,  ^if(def $keywords.w){$keywords.w &times^;}{} ^if(def $keywords.h){$keywords.h &times^;}{} ^if(def $keywords.i){${keywords.i}мм}{} под заказ,  ${h_detal.products_format_type.[$keywords.products_format_type]}.]
 }{}
#@keywords[]



@Info[]
^if(def $form:id){
 $info[^getProductsStore[$.id(^form:id.int(0))]]
 $result[
<div id="tehnobody">
<p><a href="/store/stone_natural/$h_detal.item.[$info.products_type]/">$h_detal.products_type.[$info.products_type]</a></p>
<h2>${h_detal.products_format.[$info.products_type]}. $info.products_name_en ${h_detal.products_format_type_size.[$info.products_format_type_size]}мм. ${h_detal.products_format_type.[$info.products_format_type]}.</h2>
<span>^dtf:format[%d %h %Y;]</span>
<h3>Информация</h3>
           
            <dl id="info">
			<dt>Номер для заказа:</dt>
			<dd># $info.id</dd>
			^if(def $info.products_name_en){<dt>На английском:</dt><dd>$info.products_name_en</dd>}{}
			^if(def $info.products_name_en){<dt>На русском:</dt><dd>$info.products_name_ru</dd>}{}
			^if(def $info.products_format_type){<dt>Камень:</dt><dd><a href="/store/stone_natural/$h_detal.item.[$info.products_type]/products_format_type/$info.products_format_type/">$h_detal.products_format_type.[$info.products_format_type]</a></dd>}{}
			^if(def $info.products_type){<dt>Формат:</dt><dd><a href="/store/stone_natural/$h_detal.item.[$info.products_type]/">$h_detal.products_format.[$info.products_type]</a></dd>}{}
			^if(def $info.color){<dt>Цвет:</dt><dd><a href="/store/stone_natural/$h_detal.item.[$info.products_type]/color/$info.color/">$h_detal.color_name.[$info.color]</a></dd>}{}
			^if(def $info.w){<dt>Длина:</dt><dd>${info.w}мм</dd>}{}
			^if(def $info.h){<dt>Высота:</dt><dd>${info.h}мм</dd>}{}
			^if(def $info.i){<dt>Толщина:</dt><dd>${info.i}мм</dd>}{}
			<dt>Телефон:</dt>
			<dd>^my_phone_storeshop[]</dd>
			<dt>Эл. почта:</dt>
			<dd>^my_email_stone[]</dd>
			<dt><a href="/store/stone_natural/services/">Изделия из камня</a>:</dt>
			<dd>Если у вас есть вопросы по изготовлению изделий из природного камня: <strong>камины</strong>, <strong>подоконники</strong>, <strong>лестницы</strong>, <strong>цокали</strong>, <strong>кухни</strong>, <strong>бордюры</strong> обращайтесь за помощью по телефону: ^my_phone[]</dd>
			<dt><strong>Запрос</strong></dt>
			<dd>
            <form class="callme" method="post">
            <input onclick="document.getElementById('divCallMe').style.display=document.getElementById('divCallMe').style.display!='block'?'block':'none'^; return false^;" type="Submit" style="font-size: 1.0em^; border-right: 2px solid #484848^; border-bottom: 2px solid #484848^; border-top: 2px solid #fcfcfc^; border-left: 2px solid #fcfcfc^; color:#000^; width: auto^; padding: 0 5px^; " value="Запрос" />
            </form>
            </dd>
</dl>
^Callback[]
</div>
<div>
<div style="float: leftt^; clear: both^;">
^if(def $info._img){
<a href="/store/img/def/${info._img}.jpg">$photo[^image::measure[/store/img/b/${info._img}.jpg]] 
^photo.html[
$.border[0] 
$.alt[$info.products_name_en]
]</a>}{}</div>
<div class="detalpay"><p style="margin-bottom: 0^;">USD <strong class="u">$h_detal.exchange_rate.[1]</strong><br />EUR <strong class="e">$h_detal.exchange_rate.[2]</strong></p><p>Цена:&nbsp^;&nbsp^; <em>$info.pay^$</em><br />Евро:&nbsp^;&nbsp^; <em>^eval($info.pay*$h_detal.exchange_rate.[3])€</em><br />Рубли:&nbsp^;&nbsp^; <em>^eval($info.pay*$h_detal.exchange_rate.[1]).00руб.</em><br />НДС18% включен</p></div>
</div>
$altImg[^getProductsStore[]]
 $altImg_select[^altImg.select($altImg.products_type==$info.products_type)]
       $altImg_select_sub[^altImg_select.select($altImg_select.products_format_type==$info.products_format_type)]
            $altImg_select_sub_size[^altImg_select_sub.select($altImg_select_sub.products_format_type_size==$info.products_format_type_size)]
			       $altImg_select_sub_color[^altImg_select_sub_size.select($altImg_select_sub_size.color==$info.color)]
                     
					 ^if($altImg_select_sub_color > 1){
                        <table class="altImg">
                        <tr><th><span>Альтернатива</span></th></tr>
                        <tr><td><div class="works">
	                      ^altImg_select_sub_color.menu{
								 <ins class="work"><div class="r"><a href="/store/detal/id/$altImg_select_sub_color.id/"><img style="margin: 0^;" src="/store/img/i/${altImg_select_sub_color._img}.jpg" alt="$altImg_select_sub_color.products_name_en" width="50px" height="50px" border="0" /></a><br /><span class="line_bottom"><a href="/store/detal/id/$altImg_select_sub_color.id/">$altImg_select_sub_color.products_name_en</a></span></div></ins>
								 }</div>
					     }</td><br /><br /><br /><br /><br /><br /><br /><br /><br /></tr></table><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
						 
]}{}
#@Info[]

@Info_right[]
  $Info_right[^getProductsStore[$.id(^form:id.int(0))]]
      ^if($Info_right.products_type==1){^plate_foto[]^plate_stone[]^plate_size[]^plate_color_right[]}{}
	  ^if($Info_right.products_type==2){}{}
	  ^if($Info_right.products_type==3){^slabs_foto[]^slabs_stone[]^slabs_size[]^slabs_color_right[]}{}
	  ^if($Info_right.products_type==4){^sett_color_right[]^sett_size[]}{}
#@Info_right[]


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
	<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">Ваш запрос: $info.products_name_en</p>
	<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">Формат камня: $h_detal.products_format.[$info.products_type]</p>
	<p style="margin:0 0 0.3em 0^; font-size: 1.4em^;">Стоимость: ^eval($info.pay*$h_detal.exchange_rate.[1]).00руб.</p>
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
				      $.subject[Запрос товара из магазина: http://$env:SERVER_NAME/]
				      $.charset[$response:charset] 
				      $.text[Название камня: $form:stone_name^#0AСтраница камня на сайте: $form:uri^#0AПримерный объем камня: $form:size м^#0AСтомиость камня: — $form:price .^#0AГород/Область — $form:city^#0AИмя клиента: $form:name^#0A^if(def $form:email){Фамилия: $form:lastname^#0A}Телефон: $form:phone^#0AЭлектронная почта: $form:email^#0AКомментарий клиента: $form:comments^#0A^#0AСообщение отправлено: ^now.sql-string[]]
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


<form action="/store/detal/?id=$info.id" method="post" enctype="multipart/form-data">
<input type="hidden" name="do" value="do" />
<input type="Hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />
<input type="Hidden" name="stone_name" value="$info.products_name_en" />
<input type="Hidden" name="price" value="$info.pay^$" />

<table class="postmashine" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr valign="top">
	<td>
	<p style="font-size: 1.1em^; margin: 0^;">Название камня: <strong>$info.products_name_en</strong></p>
	<p style="font-size: 1.1em^; margin: 0^;">Тип: $h_detal.products_format_type.[$info.products_format_type]</p>
	<p style="font-size: 1.1em^; margin: 0^;">Формат: ^if(def $info.products_type){<strong>$h_detal.products_format.[$info.products_type]</strong>}{}</p>
	<p style="font-size: 1.1em^; margin: 0^;">Стоимость в ^$(США): $info.pay^$</p>
	<p style="font-size: 1.1em^; margin: 0^;">Стоимость в ЕВРО (EUR): ^eval($info.pay*$h_detal.exchange_rate.[3])€</p>
	<p style="font-size: 1.1em^; margin: 0^;">Стоимость в рублях: ^eval($info.pay*$h_detal.exchange_rate.[1]).00руб.</p>
	<label style="color:#000^; font-size: 0.8em^;">Объем: м&sup3^;</label><br />
	<p style="font-size: 1.1em^; margin: 0^;"><input type="Text" name="size" value="" style="background: #fffff0^; width: 20%^; border-color:  #5a5a5a #eaeaea  #eaeaea #5a5a5a" /></p>
	</td>
	<td width="50px">^if(!def $form:translite){<img src="/store/img/i/${info._img}.jpg" alt="$mashine.name_ru">}{<img src="/catalog/img/front/${mashine_s_s.img}.jpg" alt="$mashine_s_s.name_ru">}</td>
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
$result(^if(def $form:name && def $form:lastname && def $form:phone && ^Lib:isEmail[$form:email]){1}{0})
#end @is_ok[]
























