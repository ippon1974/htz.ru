@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Запасные части для дорожно-строительной и сельскохозяйственной техники</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="Сельскохозяйственная техника, спецтехника заводов: ХТЗ, МТЗ, ВТЗ, ЮМЗ, запасные части, доставка по территории Российской Федерации." />
<meta name="keywords" content="Тракторы, тракторы ХТЗ, трактор Т-150, фронтальный погрузчик Т-156, запасные части для трактора Т-150, Т-150, запчасти Т-150." />

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />
</head>
#@header[]


@formsendmail_table[]
<p>Вы можете заполнить форму заказа прямо на нашем сайте.</p>
<div class="formsendmail_table">
<p>
^send_table[]
</p>
</div>
#@formsendmail[]


@send_table[]
$now[^date::now[]]
$item[$request:uri]
$parts[^item.split[/;lh]]
^if(def $form:do){
^if(^is_ok_table[]){
^connect[$connect_string]{
      ^void:sql{INSERT INTO orders_spare_parts 
         (orders_spare_parts_id, item, uin, name, lastname, company, city, code, phone, email, comments, dt) 
      values  
         ('$form:orders_spare_parts_id', '$form:item', '$form:uin', '$form:name', '$form:lastname', '$form:company', '$form:city', '$form:code', '$form:phone', '$form:email', '$form:comments', '$form:dt')}}
$response:location[http://$env:SERVER_NAME/catalog/spare/orders/]
^if(def $form:img){
$extension[^file:justext[$form:img.name]]
$filename[^file:basename[$form:img.name]]
$ext_lower[^extension.lower[]]
$last_id{^int:sql{select last_insert_id()}}
$new_name[^math:uid64[]]
^form:img.save[binary;/catalog/spare/file_users/${new_name}.${ext_lower}]
$response:location[http://$env:SERVER_NAME/catalog/spare/orders/]
^connect[$connect_string]{
# Добавляем в базу
	^void:sql{UPDATE `orders_spare_parts` SET img = '${new_name}.${ext_lower}', last_id ='${last_id}' WHERE `orders_spare_parts_id` = '${last_id}' LIMIT 1}
	}
}{}

}{$err_field_empty[<tr><td style="border-bottom: 1px solid #2f4f4f^; background: #f4a460^;"><p style="margin: 0 10px 0 0^; font-size: 1.0em^;">Не заполнены обязательные поля или <strong>адрес электронной почты</strong> указан не корректно!</p></td></tr>]}
}{}

<form method="post" enctype="multipart/form-data">
<input type="hidden" name="item" value="$parts.3" />
<input type="hidden" name="dt" value="^now.sql-string[]" />
<input type="hidden" name="do" value="do" />
<input type="hidden" name="uin" value="$cookie:orders" />

<table id="sendmail_form" align="center" border="0" cellpadding="0" cellspacing="0">
$err_field_empty
<tr><td><p style="font-size: 1.0em^;">Пожалуйста, заполните обязательные поля формы, которые со знаком (*).</p></td></tr>
<tr><td><label>Файл Вашей заявки:(txt, world, excel, jpg, gif, pdf.).</label><br />


<input class="sendfile" type="File" name="img" value="" />

</td></tr>
<tr><td><label>Имя*</label><br />
<input type="text" name="name" value="$form:name"  /></td></tr>
<tr><td><label>Фамилия*</label><br />
<input type="text" name="lastname" value="$form:lastname" /></td></tr>
<tr><td><label>Компания (<em>не обязательно</em>)</label><br />
<input type="text" name="company" value="$form:company" /></td></tr>
<tr><td><label>Город (<em>не обязательно</em>)</label><br />
<input type="text" name="city" value="$form:city" /></td></tr>
<tr><td>
<label>Номер телефона:</label> +7*<br />
<input class="code" type="text" name="code" value="$form:code" />
<input class="phone" name="phone" type="text" maxlength="20" value="$form:phone" />
</td></tr>
<tr><td><label>Адрес эл. почты*</label><br />
<input type="Text" name="email" value="$form:email" /></td></tr>
<tr><td><label>Текст сообщения (<em>не обязательно</em>)</label><br />
<textarea name="comments" rows="4" cols="40" tabindex="6">$form:comments</textarea><br />
<input class="submit" type="Submit" name="submit" value="Отправить заявку" />
</td></tr>
</table>
</form>
#@send[]

@is_ok_table[]
$result(^if(def $form:name && def $form:lastname && def $form:code && def $form:phone && ^Lib:isEmail[$form:email]){1}{0})
#end @is_ok[]

@formsendmail[]
<p>Вы можете заполнить форму заказа прямо на нашем сайте.</p>
<div class="formsendmail">
<p>
^send[]
</p>
</div>
#@formsendmail[]


@send[]
$to[<mail@htz.ru>]
^rem{ *** от какого адреса будет отправляться письмо *** }
$from[index@$env:SERVER_NAME]

^if($form:action eq "done"){
	^rem{ *** сюда мы попадём после внешнего редиректа когда всё уже успешно отправилось *** }
	^rem{ *** тут пишем посетителю что-нить доброе за то, что он отправил нам пожелание *** }
	$reply_thanks[<div class="true_spare">Спасибо. Ваше сообщение отправлено. Мы постараемся в ближайшее время связаться с вами.</div>]
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
				      $.subject[Запчасти, заказ http://$env:SERVER_NAME/]
				      $.charset[$response:charset] 
				      $.text[Имя: $form:name^#0A^if(def $form:email){Фамилия: $form:lastname^#0A}Компания: $form:company^#0AТелефон: $form:areacode $form:phone1 $form:phone2^#0AЭлектронная почта: $form:email^#0AСтраница: $form:uri^#0AДополнительная информация:^#0A$form:comments^#0A^#0AСообщение отправлено: ^now.sql-string[]] 
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
		$err_field_empty[<div class="err_spare">Не заполнены * поля!</div>]
	}
}
<form action="$request:uri" method="post" enctype="multipart/form-data">
$err_field_empty
$reply_thanks
<input type="hidden" name="do" value="do" />
<input type="hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />
<fieldset id="_spare">
<legend>Файл Вашей заявки:(<em>txt</em>, <em>world</em>, <em>excel</em>, <em>jpg</em>, <em>gif</em>).</legend>
<input type="File" name="file_users" value="" style="padding: 0^; margin: 0 0 0 0^; width:auto; height: 25px^; border: thin solid^; border-color: Black Gray Gray Black^; background: #fffff0^; color: Black^; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif^;" />
</fieldset>
^if(def $form:file_users){
$extension[^file:justext[$form:file_users.name]]
$filename[^file:basename[$form:file_users.name]]
$ext_lower[^extension.lower[]]
$new_name[^math:uid64[]]
$new_name_ext_lower[500]
^form:file_users.save[binary;/catalog/spare/file_users/${new_name}.${ext_lower}]
}{}
<br /><br /><br /><br /><br /><br />
<label style="font-size: 15px^; margin: 0^; padding: 0^;">&nbsp^;&nbsp^;Имя*</label><br />
<input type="text" name="name" value="$form:name" style="width: 95%^; margin: 0 0 0 10px^; height: 25px^; border: thin solid^; border-color: Black Gray Gray Black^; background: #fffff0^; color: Black^; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif^;" /><br />
<label style="font-size: 15px^; padding: 0 0 0 10px^;">Фамилия*</label><br />
<input type="text" name="lastname" value="$form:lastname" style="width: 95%^; margin: 0 0 0 10px^; height: 25px^; border: thin solid^; border-color: Black Gray Gray Black^; background: #fffff0^; color: Black^; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif^;" /><br />
<label style="font-size: 15px^; padding: 0 0 0 10px^;">Компания (<em>не обязательно</em>)</label><br />
<input type="text" name="company" value="$form:company" style="width: 95%^; margin: 0 0 0 10px^; height: 25px^; border: thin solid^; border-color: Black Gray Gray Black^; background: #fffff0^; color: Black^; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif^;" /><br />
<label style="font-size: 15px^; padding: 0 0 0 10px^;">Номер телефона:</label> +7*<br />
<input type="text" name="areacode" value="$form:areacode" style="width: 15%^; margin: 0 0 0 10px^; height: 25px^; border: thin solid^; border-color: Black Gray Gray Black^; background: #fffff0^; color: Black^; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif^;" />
<input name="phone1" type="text" maxlength="5" value="$form:phone1" style="width: 15%^; margin: 0 0 0 10px^; height: 25px^; border: thin solid^; border-color: Black Gray Gray Black^; background: #fffff0^; color: Black^; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif^;" />
<input name="phone2" type="text" maxlength="10" value="$form:phone2" style="width: 57%^; margin: 0 0 0 10px^; height: 25px^; border: thin solid^; border-color: Black Gray Gray Black^; background: #fffff0^; color: Black^; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif^;" /><br />
<label style="font-size: 15px^; padding: 0 0 0 10px^;">Адрес эл. почты*</label><br />
<input type="Text" name="email" value="$form:email" tabindex="5" style="width: 95%^; margin: 0 0 0 10px^; height: 25px^; border: thin solid^; border-color: Black Gray Gray Black^; background: #fffff0^; color: Black^; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif^;" /><br />
<label style="font-size: 15px^; padding: 0 0 0 10px^;">Текст сообщения</label><br />
<textarea name="comments" rows="6" cols="20" tabindex="6" style="width: 95%^; margin: 0 0 0 10px^; border: thin solid^; border-color: Black Gray Gray Black^; background: #fffff0^; color: Black^; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif^;">$form:comments</textarea><br />
<input type="Submit" name="submit" value="Отправить заявку" style=" font-size: 20px^; width: 95%^; height: 30px^; color:#000^; text-transform: uppercase^; margin: 10px 0 0em 10px^; border: 2px solid^; border-color: #eaeaea #000 #000 White^;"  />
</form>
#начало обработки 
#@send[]

# метод проверяет все-ли поля формы заполнены. если все хорошо должен вернуть 1, иначе - 0
@is_ok[]
$result(^if(def $form:name && def $form:lastname && def $form:areacode && def $form:phone1 && def $form:phone2 && def $form:email && def $form:comments){1}{0})
#end @is_ok[]


@menu_namenklatura[]
  $menu_namenklatura[^getMachines[]]
   $menu_namenklatura_brand[^menu_namenklatura.select($menu_namenklatura.brand_id==5)]
   <h3>Номенклатура</h3>
   $str[$request:uri]
   $parts[^str.split[/;lh]] 
   $parts_parts[$parts.4]
   <ul id="section_id">
    ^menu_namenklatura_brand.menu{
	 ^if($menu_namenklatura_brand.translite eq $parts_parts){
	 <li><strong>$menu_namenklatura_brand.namenklatura</strong></li>
	 }{
	 ^if($menu_namenklatura_brand.tehno_info_uri eq $request:uri){<li class="four"><a href="/catalog/htz/$menu_namenklatura_brand.classification_sub_sub_uri/$menu_namenklatura_brand.translite/" title="Трактор $menu_namenklatura_brand.namenklatura">$menu_namenklatura_brand.namenklatura</a></li>}{<li><a href="/catalog/htz/$menu_namenklatura_brand.classification_sub_sub_uri/$menu_namenklatura_brand.translite/" title="Трактор $menu_namenklatura_brand.namenklatura">$menu_namenklatura_brand.namenklatura</a></li>}
	 }
}
   </ul>
#@menu_namenklatura[]


@menu_namenklatura_mtz[]
  $menu_namenklatura[^getMachines[]]
   $menu_namenklatura_brand[^menu_namenklatura.select($menu_namenklatura.brand_id==9)]
   <ul id="section_id">
    ^menu_namenklatura_brand.menu{
	 ^if($menu_namenklatura_brand.id == $form:id){
	 <li><strong>$menu_namenklatura_brand.namenklatura</strong></li>
	 }{
	 ^if($menu_namenklatura_brand.tehno_info_uri eq $request:uri){<li class="four"><a href="/catalog/mtz/detal/id/$menu_namenklatura_brand.id/" title="Трактор $menu_namenklatura_brand.namenklatura">$menu_namenklatura_brand.namenklatura</a></li>}{<li><a href="/catalog/mtz/detal/id/$menu_namenklatura_brand.id/" title="Трактор $menu_namenklatura_brand.namenklatura">$menu_namenklatura_brand.namenklatura</a></li>}
	 }

	}
   </ul>
#@menu_namenklatura_mtz[]

@formsendmail_table_2[]
<p><strong>Вы можете заполнить форму заказа прямо на этой странице</strong>.</p>
<div class="formsendmail_table">
<p>
^send_table_2[]
</p>
</div>
#@formsendmail[]


@send_table_2[][oAntiSpam;bShowForm]
$now[^date::now[]]
$oAntiSpam[^Antispam::create[$hAntiSpamParams]]
$item[$request:uri]
$parts[^item.split[/;lh]]
^debug[$oAntiSpam]

$bShowForm(true)

^oAntiSpam.exec{

	^check[]

	
	<p>Ваш запрос:<br /><strong style="font-size: 0.8em^;">${detail.name_en}. ${detail.classification_ru}.</strong><br />Ваше имя:<br /><strong style="font-size: 0.8em^;">$form:name</strong><br />Почта:<br /><strong style="font-size: 0.8em^;">$form:email</strong></p>
	
^connect[$connect_string]{
^void:sql{INSERT INTO orders_spare_parts 
         (orders_spare_parts_id, item, uin, name, lastname, company, city, code, phone, email, comments, dt) 
      values  
         ('$form:orders_spare_parts_id', '$form:item', '$form:uin', '$form:name', '$form:lastname', '$form:company', '$form:city', '$form:code', '$form:phone', '$form:email', '$form:comments', '$form:dt')}}
$response:location[http://$env:SERVER_NAME/catalog/spare/orders/added/]
^if(def $form:img){
$extension[^file:justext[$form:img.name]]
$filename[^file:basename[$form:img.name]]
$ext_lower[^extension.lower[]]
$last_id{^int:sql{select last_insert_id()}}
$new_name[^math:uid64[]]
^form:img.save[binary;/catalog/spare/file_users/${new_name}.${ext_lower}]
$response:location[http://$env:SERVER_NAME/catalog/spare/orders/added/]
^connect[$connect_string]{
# Добавляем в базу
	^void:sql{UPDATE `orders_spare_parts` SET img = '${new_name}.${ext_lower}', last_id ='${last_id}' WHERE `orders_spare_parts_id` = '${last_id}' LIMIT 1}
	}
}{}


	<h2 style="color:#006633^;">Ваше сообщение отправлено...</h2>
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
<input type="hidden" name="item" value="$parts.3" />
<input type="hidden" name="dt" value="^now.sql-string[]" />
<input type="hidden" name="do" value="do" />
<input type="hidden" name="uin" value="$cookie:orders" />

<table id="sendmail_form" align="center" border="0" cellpadding="0" cellspacing="0">
<tr><td><label>Файл Вашей заявки:(txt, world, excel, jpg, gif, pdf.).</label><br />
<input class="sendfile" type="File" name="img" value="" />
</td></tr>
<tr><td><label>Имя*</label><br />
<input type="text" name="name" value="$form:name"  /></td></tr>
<tr><td><label>Фамилия*</label><br />
<input type="text" name="lastname" value="$form:lastname" /></td></tr>
<tr><td><label>Компания (<em>не обязательно</em>)</label><br />
<input type="text" name="company" value="$form:company" /></td></tr>
<tr><td><label>Город (<em>не обязательно</em>)</label><br />
<input type="text" name="city" value="$form:city" /></td></tr>
<tr><td>
<label>Номер телефона:</label> +7*<br />
<input class="code" type="text" name="code" value="$form:code" />
<input class="phone" name="phone" type="text" maxlength="20" value="$form:phone" />
</td></tr>
<tr><td><label>Адрес эл. почты*</label><br />
<input type="Text" name="email" value="$form:email" /></td></tr>
<tr><td><label>Текст сообщения (<em>не обязательно</em>)</label><br />
<textarea name="comments" rows="8" cols="20" tabindex="6">$form:comments</textarea><br /><br />
<input type="submit" name="action" value="Отправить" class="_post" style="height: 2em^; width: auto^; margin: 0^; " />
</td></tr>
</table>
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
^if(!def $form:code){
	^throw[check.fields;]
}
^if(!def $form:phone){
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

#@send[]