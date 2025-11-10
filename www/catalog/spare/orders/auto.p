@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[] | Продажа запасных частей для дорожно-строительной техники.</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[] | HOWO Запчасти — Продажа запасных частей для китайских грузовиков ХОВО" />
<meta name="keywords" content="^title[] | HOWO Запчасти — Продажа запасных частей для китайских грузовиков ХОВО" />

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
<body class="spare sparehtz">
#@header[]

@title[]
$title[^table::load[/_root.cfg]]
^if(^title.locate[uri;$request:uri]){ 
$result[$title.title]
}{ 
$result[Ваша предварительная заявка на запчасти успешно отправлена.]
} 
#@hedpage[]@header[]

@getOrdersSpare[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		orders_spare_parts_id AS id,
		item,
		uin,
		name,
		lastname,
		company,
		city,
		code,
		phone,
		email,
		comments,
		img,
		last_id,
		dt
	FROM
		orders_spare_parts
	WHERE
	    is_published = 1
		^if(^hParam.id.int(0)){
		AND orders_spare_parts_id = ^hParam.id.int(0)
		}
		ORDER BY
		orders_spare_parts_id DESC
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getOrdersSpare[]


@html_orders[]
$orders[^getOrdersSpare[]]
^untaint[as-is]{
^if(^orders.locate[uin;$cookie:orders]){
$s[$orders.item]
$rep[^table::create{from	to
faw	FAW
htz	ХТЗ
zshs	Т-16
howo	HOWO
ctz	ЧТЗ
mtz	МТЗ
kraz	КРАЗ
maz	МАЗ
kamaz	КАМАЗ
ural	УРАЛ
shantui	SHANTUI
shehwa	SHEHWA
xcmg	XCMG}]
<h2 style="color:#2f4f4f^;">Ваша предварительная заявка на запчасти &laquo^;^s.replace[$rep]&raquo^; успешно отправлена.</h2>
<h3>Мы постараемся в ближайшее время связаться с Вами по телефону или электронной почте.</h3>
<h4 style="font-size: 2em^; padding: 0^; margin: 1em 0 0 0^; font-style: normal^;">Ваши контакты</h4>
<dl id="info">
<dt>Имя:</dt>
<dd>$orders.name</dd>
<dt>Фамилия:</dt>
<dd>$orders.lastname</dd>
<dt>Компания:</dt>
<dd>^if(def $orders.company){$orders.company}{Не указана}</dd>
<dt>Телефон:</dt>
<dd>+7 ($orders.code) $orders.phone</dd>
<dt>Эл. почта:</dt>
<dd>$orders.email</dd>
<dt>Файл-заявка:</dt>
<dd>^if(def $orders.img){Успешно отправлен $orders.img}{Нет файла-заявки}</dd>
<dt>Комментарий:</dt>
<dd>^if(def $orders.comments){$orders.comments}{Нет}</dd>
</dl>
<p>На Вашу почту выслана памятка о заявке на запасные части для: &laquo^;<strong>^s.replace[$rep]</strong>&raquo^;.</p>
<p>Наш контактный телефон: ^my_phone_sendmail[]</p>
<p><a href="/catalog/spare/$orders.item/">&#8592^;Вернуться в раздел запчастей &laquo^;^s.replace[$rep]&raquo^;</a></p>
^sendmailUsers[]
}{^Lib:location[/404/]}
}
#@html_orders[]

@sendmailUsers[]
$orders[^getOrdersSpare[]]
$s[$orders.item]
$rep[^table::create{from	to
faw	FAW
htz	ХТЗ
zshs	Т-16
howo	HOWO
ctz	ЧТЗ
mtz	МТЗ
kraz	КРАЗ
maz	МАЗ
kamaz	КАМАЗ
ural	УРАЛ
shantui	SHANTUI
shehwa	SHEHWA
xcmg	XCMG}]
^if(^orders.locate[uin;$cookie:orders]){
^mail:send[ 
      $.from[<^my_email_sendmail[]>]
      $.to[$orders.email] 
      $.subject[Ваш заказ запчастей ^s.replace[$rep]]
	  $.charset[$response:charset]
	  $.text[
	  Спасибо. Вы сделали предварительный заказ на запчасти: ^s.replace[$rep].
	  Мы постараемся в ближайшее время связаться с вами по телефону или по электронной почте.
	  Ссылка на страницу заказа: http://$env:SERVER_NAME/catalog/spare/$orders.item/
	  Ваше имя: $orders.name
	  Ваше фамилия: $orders.lastname
	  Компания: ^if(def $orders.company){$orders.company}{Нет}
	  Город: ^if(def $orders.city){$orders.city}{Нет}
	  Ваш телефон: +7 ($orders.code) $orders.phone
	  Ваша электронная почта: $orders.email
	  Ваш комментарий к заявке: ^if(def $orders.comments){$orders.comments}{Нет}
	  Дата / время заказа: $orders.dt
	  -------------------------------
	  С уважением "СТРОЙПРОЕКТМОНТАЖ"
	  Контактный телефон: ^my_phone_sendmail[]
	  Электронная почта: ^my_email_sendmail[]
	  Сайт в Интернет: http://www.htz.ru/catalog/spare/]
]
}{}
#@@sendmailUsers[]

@sendmailAdmin[]
$orders[^getOrdersSpare[]]
$s[$orders.item]
$rep[^table::create{from	to
faw	FAW
htz	ХТЗ
zshs	Т-16
howo	HOWO
ctz	ЧТЗ
mtz	МТЗ
kraz	КРАЗ
maz	МАЗ
kamaz	КАМАЗ
ural	УРАЛ
shantui	SHANTUI
shehwa	SHEHWA
xcmg	XCMG}]
^if(^orders.locate[uin;$cookie:orders]){
^mail:send[ 
      $.from[$orders.email]
      $.to[<^my_email_sendmail[]>] 
      $.subject[Заказ запчастей ^s.replace[$rep]]
	  $.charset[$response:charset]
	  $.text[
	  Запчасти для техники: ^s.replace[$rep]
	  Ссылка на страницу заказа: http://$env:SERVER_NAME/catalog/spare/$orders.item/
	  Имя клиента: $orders.name
	  Фамилия клиента: $orders.lastname
	  Контактный телефон: +7 ($orders.code) $orders.phone
	  Город: ^if(def $orders.city){$orders.city}{Нет}
	  Электронная почта клиента: $orders.email
	  Комментарий к заявке: ^if(def $orders.comments){$orders.comments}{Нет}
	  Файл заявки: ^if(def $orders.img){http://$env:SERVER_NAME/catalog/spare/file_users/$orders.img}{Нет}
	  Дата / время заказа: $orders.dt
	  ]
]
}{}
#@sendmailAdmin[]