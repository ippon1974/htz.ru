@auto[]
$db[^table::load[/../datahtz/connection/db.cfg]]
$connect_string[mysql://$db.dbname:^db.passw.trim[]@$db.server/$db.dbname?charset=cp1251&ClientCharset=windows-1251]
$MAIN:pSQL[^mysql::init[$SQL.connect-string]]

	^rem{*** Go ***}
$sWorkingDir[^file:dirname[$request:uri]]
$sCurrentFile[^file:basename[$request:uri]]

$request:charset[windows-1251]
$response:charset[windows-1251]
$response:content-type[
	$.value[text/html]
	$.charset[$response:charset]
]

$hAntiSpamParams[
	^rem{ *** каталог, где будут hashfile и log. должен быть вне веб пространства. по умолчанию -- /../temp *** }
	$.sDataDir[/../temphtz/]

	^rem{ *** что пишем в log файл. подробнее про константы можно посмотреть в переменной класса LOG_MASK *** }
	$.iLogAccess(1+2+16+32)

	$.hExpires[
		^rem{ *** на сколько баним спамера (в днях). по умолчанию -- 0 (не баним) *** }
		$.dBan(1/24)
	]

	$.hReferer[
		^rem{ *** запрещать работу с пустым referer. по умолчанию -- false, т.е. работа с пустым referer разрешена *** }
#		$.bRefuseEmpty(true)

		^rem{ *** список разрешённых referer при отображения формы *** }
#	$.print[^table::create{sHref^#0A$sWorkingDir/$sCurrentFile}]
		^rem{ *** список разрешённых referer при обработке submt-а формы *** }
#	$.exec[^table::create{sHref^#0A$sWorkingDir/$sCurrentFile}]
	]

#	$.hFields[
		^rem{ *** при отображении формы будем ругаться, если в form будут обнаружены не упомянутые в <form/> поля. по умолчанию -- true *** }
#		$.bRefuseUnknown(true)
		^rem{ *** но мы можем перечислить не упомянутые в <form/> поля, которым разрешено приходить в form, хотя они отсутствуют в <form/> *** }
#		$.tAllowed[^table::create{sName^#0Arequest^#0Alang}]
#	]

	$.hFilter[
		^rem{ *** порог срабатывания защиты *** }
		$.dThreshold(20)
		^rem{ *** список фильтров и их весов, которыми проверяются все поля формы при submit-е данных *** }
		$.tMask[^table::create{dScore	sRegexp
1	<a href=[^^>]+>
3	\sWMZ\s
3	Z\d{12}
}]
	]

	^rem{ *** дополнительное поле с uid будет добавляться с указанными параметрами *** }
#	$.hUid[
#		$.sTag[input]
#		$.sName[uid]
#	]

	^rem{ *** модифицирование action формы *** }
	$.hAction[
#		$.sType[hidden]
		^rem{ *** настоящая кнопка action должна быть обязательно нажата (нельзя постить форму нажатием Enter-а в текстовом поле). по умолчанию -- true *** }
#		$.bRealRequired(true)

		^rem{ *** первый action всегда будет фиктивным. по умолчанию -- true *** }
#		$.bFakeFirst(true)

		^rem{ *** сколько фиктивных кнопок будет добавлено. по умолчанию 0, т.е. фиктивных кнопок добавлено не будет *** }
		$.iFakeCount(3)

		^rem{ *** эти атрибуты будут добавлены к настоящему submit-у *** }
		^rem{ *** тут вы можете использовать junction: $.value{^method[]} *** }
		$.hRealAttr[
			$.class[real]
			$.value[[+]]
		]

		^rem{ *** а эти атрибуты будут добавлены к фиктивным submit-полям *** }
		$.hFakeAttr[
			$.class[fake]
			$.value[[-]]
		]
	]

	^rem{ *** ************************************************************************************ *** }
	^rem{ *** далее идут параметры, нужные классам AntispamTuringMath и/или AntispamTuringCaptcha  *** }

	^rem{ *** в поле form с этим именем будет ожидать получения от пользователя результата теста Тюринга. по умолчанию -- "result" *** }
#	$.sTuringAnswerFieldName[result]

	^rem{ *** каталог, в котором лежат изображения с символами, участвующими в генерации капчи. обязательный параметр *** }
	^rem{ *** этот каталог НЕЛЬЗЯ класть в веб пространство (а если кладёте, то запретите к нему доступ в .htaccess) *** }
	^rem{ *** в каталоге должен быть набор подкаталогов из одного символа. эти символы автоматически будут участвовать в генерации капчи *** }
	^rem{ *** в каждом подкаталоге может быть произвольное число gif файлов. *** }
	^rem{ *** при генерации очередного символа капчи будет использоваться случайный файл *** }
	$.sImageDir[/../data/captcha]

	^rem{ *** количество символов в капче. по умолчанию -- 5 *** }
#	$.iLimit(5)

	^rem{ *** размер изображения капчи. по умолчанию -- 300x25px *** }
#	$.iCaptchaImageWidth(300)
#	$.iCaptchaImageHeight(25)

	^rem{ *** межсимвольное расстояние, px. по умолчанию -- 5 *** }
#	$.iSpaceWidth(5)

	^rem{ *** таблица с используемыми цветами символов. пустая таблица -- не производить замены цветов *** }
#	$.tColor[^table::creare{iColor}]

	^rem{ *** "плотность" шумов в изображении. 0 -- не добавлять шум. по умолчанию -- 30 (каждая 30 точка -- шум) *** }
#	$.iNoiseDensity(30)

	^rem{ *** обрезать изображение по ширине. по умолчанию -- true *** }
#	$.bCropWidth(true)

	^rem{ *** на сколько смещать символы при создании капчи, px. 0 -- не смещать. по умолчанию максимум на 2px в каждую сторону *** }
#	$.iShiftX(2)
#	$.iShiftY(2)
]
#@auto[]

@USE
sql.p
mysql.p
LibCompFull.p
dtf.p
mailto.p
NConvert.p
int2str.p
Erusage.p
scroller.p
tnavigation.p
uri.p
CachePage.p
Antispam.p
db.p
#@USE



@main[]
^header[]
^body[]
#@main[]



@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	       <!-- (c) AG Group | http://www.web.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<!--<meta name="viewport" content="width=device-width">-->
<meta name='yandex-verification' content='4fef9008e58102b3' />
<meta name="yandex-verification" content="e0003757b2981e98" />
<meta name="google-site-verification" content="hi4U8kxDdBxGs2iK01LgI8_1iZSCnOhOl1DMIVoBVQs" />
<meta name="verify-v1" content="JGswrTOQyQN6ty389gRDQyz3d+NStUnXJ94tsfrD0zU=" />

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="Сельскохозяйственная техника, спецтехника заводов: ХТЗ, МТЗ, ВТЗ, ЮМЗ. Доставка дорожно-строительной техники из Китая: бульдозеры, фронтальные погрузчики, бетононасосы, вилочные погрузчики, дорожные катки, грейдеры." />
<meta name="keywords" content="Китайские бульдозеры, погрузчики, экскаваторы, китайские катки, xcmg, shantui, foton, shehwa, бульдозеры SHANTUI, бульдозеры Китай, SANY, ZOOMLION, бетононасосы, фронтальные погрузчики XCMG, бульдозеры SHEHWA." />

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>

<link rel="icon" href="/ico.ico" type="image/x-icon">                          
<link rel="shortcut icon" href="/ico.ico" type="image/x-icon">
<link rel="canonical" href="https://htz.ru/"/>

<link rel="alternate" type="application/rss+xml" title="" href="http://htz.ru/news/rss/rss/" />
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>
</head>
#@header[]

@headFindBlock[]
^if("/" eq $request:uri){
<!--Begin-->
<ul id="skip">
<li><a href="#navigation" title="Пропустить навигацию">Пропустить навигацию</a></li>
</ul>
	
<div id="headerwrap">

<div id="header">
		
<ul id="utility">
<li><a href="/about/contact/" title="Контакты">Контакты</a></li>
<li><a href="/news/" title="Новости">Новости</a></li>
<li id="glossary"><span><a href="/catalog/spare/" title="Каталог запчастей">Каталог запчастей</a></span></li>
<li><a href="/map/" title="Карта сайта">Карта сайта</a></li>
</ul>
	<p></p>		
<h1 title="^my_company_name_[]"><img src="/i/logo.gif" alt="^my_company_name_[]" /></h1>
		
<ul id="languageswitch">
<li class="first">Русский</li>
<li><a href="/en/">English</a></li>
</ul>
			
</div>

</div>
<div id="searchwrapper">

<div id="search">
<form method="get" action="/cgi-bin/search/search.pl"  >
<div>
<input type="hidden" name="stpos" value="0" />
</div>

<p id="searchlabel"><label for="search_textbox">Поиск</label></p>
<dl>
<dt><input class="filled" type="text" id="search_textbox" name="query" value="Найти" tabindex="1" /></dt>
<dd><input type="image" src="/img/widgets/go_button.gif" alt="Поиск по сайту" tabindex="2" /></dd>
</dl>
</form>
</div>
</div>
<!--End-->
}{<ul id="skip">
<li><a href="#navigation" title="Пропустить навигацию">Пропустить навигацию</a></li>
</ul>
	
<div id="headerwrap">
<div id="header">
			
<ul id="utility">
<li><a href="/about/contact/" title="Контакты"><strong>Контакты</strong></a></li>
<li><a href="/news/" title="Новости">Новости</a></li>
<li id="glossary"><span><a href="/catalog/spare/" title="Каталог запчастей">Каталог запчастей</a></span></li>
<li><a href="/map/" title="Карта сайта">Карта сайта</a></li>
</ul>
			
<h1 title="^my_company_name_[]"><a href="/" title="^my_company_name_[]"><img src="/i/logo.gif" alt="^my_company_name_[]" /></a></h1>
		
<ul id="languageswitch">
<li class="first">Русский</li>
<li><a href="/en/">English</a></li>
</ul>
			
</div>		
	
</div>	
	
<div id="searchwrapper">

<div id="search">
<form method="get" action="/cgi-bin/search/search.pl"  >
<div>
<input type="hidden" name="stpos" value="0" />
</div>

<p id="searchlabel"><label for="search_textbox">Поиск</label></p>
<dl>
<dt><input class="filled" type="text" id="search_textbox" name="query" value="Найти" tabindex="1" /></dt>
<dd><input type="image" src="/img/widgets/go_button.gif" alt="Поиск по сайту" tabindex="2" /></dd>
<dd><a href="/map/" title="Карта сайта">Карта сайта</a></dd>
</dl>
</form>
#^navi[]
}
#@headFindBlock[]

@navigation[] 
$sections[^table::load[/menu1.cfg]]
<ul id="navigation">
<li class="home"><a class="home" href="/">Главная</a></li>

<li class="services"><a href="/services/">Услуги</a>
<ul>
^navigation7[]
@navigation7[] 
$sections7[^table::load[/menu7.cfg]]
   ^sections7.menu{ 
      ^if($sections7.uri eq $request:uri){
	  <li class="$sections7.section_id"><strong>$sections7.name</strong></li>
	  }{
      <li class="$sections7.section_id"><a href="$sections7.uri">$sections7.name</a></li>
	  }
   }
</ul>
</li>

<li class="events"><a href="/catalog/">Техника</a>
<ul>
   ^sections.menu{ 
      ^navigation_cell[] 
   } 
</ul></li>
<li class="education"><a href="/sale/">Прайс</a>
<ul>
^navigation6[]
@navigation6[] 
$sections6[^table::load[/menu6.cfg]]
   ^sections6.menu{ 
      ^if($sections6.uri eq $request:uri){
	  <li class="$sections6.section_id"><strong>$sections6.name</strong></li>
	  }{
     <li class="$sections6.section_id"><a href="$sections6.uri">$sections6.name</a></li>
	  }
   }
</ul></li>
<li class="usetehno"><a href="/catalog/use/">Б/У Техника</a></li>
<li class="spare"><a href="/catalog/spare/">Запчасти</a>
<ul>
^navigation5[]

@navigation5[] 
$sections5[^table::load[/menu5.cfg]]
	
	
   ^sections5.menu{ 
	   $sitem[$sections5.uri]
	   $parts[^sitem.split[/;lh]]

	   $sreq[$request:uri]
	   $req[^sreq.split[/;lh]]

	  ^if($sections5.uri eq $request:uri){
		<li class="$sections5.section_id"><strong>$sections5.name</strong></li>
		}{
		^if($parts.3 eq $req.3){<li class="$sections5.section_id"><a style="color:#eb4^;" href="$sections5.uri" title="$sections5.name">$sections5.name</a></li>}{<li class="$sections5.section_id"><a href="$sections5.uri" title="$sections5.name">$sections5.name</a></li>}
	    }
   }

</ul>
</li>
#<li class="stoneinfo"><a href="/stone/">Каталог камня</a></li>
#<li class="store"><a href="/store/">Стройматериалы</a></li>
</li>
<li class="press_room"><a href="/delivery/">Доставка</a></li>


<ul>
@navigation1[] 
$sections1[^table::load[/menu2.cfg]]
   ^sections1.menu{ 
      ^navigation1_cell[] 
   } 
</ul></li>
<li class="blog"><a href="/news/">Новости</a>
<ul>
@navigation2[] 
$sections2[^table::load[/menu3.cfg]]
   ^sections2.menu{ 
      ^navigation2_cell[] 
   } 
</ul></li>
<li class="about"><a href="/about/">О компании</a>
<ul>
@navigation3[] 
$sections3[^table::load[/menu4.cfg]]
   ^sections3.menu{ 
      ^navigation3_cell[] 
   } 
</ul></li>
<li class="contactnew"><a href="/about/contact/">Контакты</a>
</li></ul>

@navigation_cell[]
^if($sections.uri eq $request:uri){
<li class="$sections.section_id"><strong>$sections.name</strong></li>
}{ 
<li class="$sections.section_id"><a href="$sections.uri">$sections.name</a></li>
}

@navigation1_cell[]
^if($sections1.uri eq $request:uri){
<li class="$sections1.section_id"><strong>$sections1.name</strong></li>
}{ 
<li class="$sections1.section_id"><a href="$sections1.uri">$sections1.name</a></li>
}

@navigation2_cell[]
^if($sections2.uri eq $request:uri){
<li class="$sections2.section_id"><strong>$sections2.name</strong></li>
}{ 
<li class="$sections2.section_id"><a href="$sections2.uri">$sections2.name</a></li>
}
#@navigation2_cell[]

@navigation3_cell[]
^if($sections3.uri eq $request:uri){
<li class="$sections3.section_id"><strong>$sections3.name</strong></li>
}{ 
<li class="$sections3.section_id"><a href="$sections3.uri">$sections3.name</a></li>
}
#@navigation3_cell[]

@my_company_rekvizit[]
<noindex>
#<p>Россия, 123242, г. Москва, Пресненский пер., д.6,<br>тел/факс: ^my_phone[]
#<br> 
#ИНН: 7703656832<br>
#КПП: 770301001<br>
#ОГРН: 1087746209319<br>
<p>
Электронная почта: ^mailto:print[mail@htz.ru][mail@htz.ru][Отдел рекламы]
<br />
Телефон в Москве: ^my_phone_new_h[]<br />Режим работы: Пн-Пт с 9:00 до 19:00
</p>
</noindex>
#@my_company_rekvizit[]

@my_company_name_[]
$result[&laquo^;СПМ&raquo^;]
#@my_company_name[]

@my_email_grid[]
^mailto:print[grid@htz.ru][<strong>grid@htz.ru</strong>]["СПМ"]
#@my_email[]


@my_email[]
^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>]["СПМ"]
#@my_email[]

@my_email_stone[]
^mailto:print[info1@civek.ru][<strong>info1@civek.ru</strong>][ООО "СИВЕК"]
#@my_email_stone[]

@my_phone[text_before_phone]
<noindex><strong>$text_before_phone</strong></noindex>
#@my_phone[]

@my_phone_reklama[]
<noindex>+ 7 (925) 585 - 33 - 71 (Whatsapp, Telegram)</noindex>
#@my_phone_reklama[]

@my_phone_mtz[]
<noindex>+ 7 (925) 585 - 33 - 71 (Whatsapp, Telegram)</noindex>
#@my_phone[]

@my_phone_catalogstone[]
Нет в наличии. Возможно доставка камня под заказ из Китая, Турции, Испании, Индии, Италии.<br />Уточнить по тел.: <noindex>+7 (925) 585-33-71</noindex><br />Режим работы: Пн-Пт с 10:00 до 19:00
#@my_phone_catalogstone[]

@my_phone_storeshop[text_before_phone]
Нет в наличии. Возможно доставка камня под заказ из Китая, Турции, Испании, Индии, Италии.<br />Уточнить по тел.: <noindex>+7 (925) 585-33-71</noindex><br />Режим работы: Пн-Пт с 10:00 до 19:00
#@my_phone_storeshop[]

@my_phone_ctz[]
Нет в наличии. Возможно под заказ.<br />Уточнить по тел.: <noindex>+7 (925) 585-33-71 (Whatsapp, Telegram)</noindex><br />Режим работы: Пн-Пт с 10:00 до 19:00
#@my_phone_ctz[]

@my_phone_shantui[]
Нет в наличии. Возможно под заказ.<br />Уточнить по тел.: <noindex>+7 (925) 585-33-71 (Whatsapp, Telegram)</noindex><br />Режим работы: Пн-Пт с 10:00 до 19:00
#@my_phone_shantui[]

@my_phone_shehwa[]
Нет в наличии. Возможно под заказ.<br />Уточнить по тел.: <noindex>+7 (925) 585-33-71 (Whatsapp, Telegram)</noindex><br />Режим работы: Пн-Пт с 10:00 до 19:00
#@my_phone_shehwa[]

@my_phone_hongda[]
Нет в наличии. Возможно под заказ.<br />Уточнить по тел.: <noindex>+7 (925) 585-33-71 (Whatsapp, Telegram)</noindex><br />Режим работы: Пн-Пт с 10:00 до 19:00
#@my_phone_hongda[]

@my_phone_sany[]
Нет в наличии. Возможно под заказ.<br />Уточнить по тел.: <noindex>+7 (925) 585-33-71 (Whatsapp, Telegram)</noindex><br />Режим работы: Пн-Пт с 10:00 до 19:00
#@my_phone_sany[]

@my_phone_sendmail[]
$result[<noindex></noindex>]
#@my_phone_sendmail[]

@my_phone_new_h[]
$result[<noindex>+7 (925) 585-33-71 (Whatsapp, Telegram)</noindex>]
#@my_phone_new_h[]

@my_phone_waterjet[]
$result[<noindex>+7 (925) 585-33-71 (Whatsapp, Telegram)</noindex>]
#@my_phone_waterjet[]

@my_email_sendmail[]
$result[mail@htz.ru]
#@my_email_sendmail[]

@my_adress_civekwaterjet[]
$result[Посёлок ВУГИ, 1с4, Люберцы, Московская область, 140004. Территория института &laquo^;ННЦ ГП - ИГД им. А.А. Скочинского&raquo^;]
#@my_adress_civekwaterjet[]
  
@exchange_usd[]
100
#@exchange_usd[]

@exchange_euro[]
110
#@exchange_euro[] 
  
@date[]
$date_now[^date::now[]] 
$date_now.day
$date_now.month
$date_now.year
#@date[]


@getArticles[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		article_id AS id,
		title,
		lead,
		image,
		last_id,
		dt
		^if(^hParam.id.int(0)){
			,body
		}
	FROM
		news
	WHERE
	    article_type_id = ^hParam.iArticleTypeId.int(2) OR
		article_type_id = ^hParam.iArticleTypeId.int(0)
		AND is_published = 1
		AND dt_published <= ^MAIN:pSQL.now[]
		^if(^hParam.id.int(0)){
		AND article_id = ^hParam.id.int(0)
		}
		^if(def $hParam.sWhere){
			AND $hParam.sWhere
		}
	ORDER BY
		dt DESC
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getArticles[]

@printArticlesList[tArticle]
^untaint[as-is]{
		^tArticle.menu{<dl>
		<dt class="dateindex">^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]</dt>
		<dd class="dateindexlead">^printTitle[$tArticle]</dd>
		</dl>
}
}
#end @printArticlesList[]

@printTitle[tArticle]
^if(def $tArticle.title && ^tArticle.title.match[\^[[^^\^]]+\^]]){
	$result[^tArticle.title.match[\^[([^^\^]]+)\^]][g]{<a href="/news/all/$tArticle.id/">$match.1</a>}]
}{
	$result[<a href="/news/all/$tArticle.id/">$tArticle.title</a>]
}
#end @printTitle[]

@printArticlesShow[tArticle]
<h3>Выставки ^dtf:format[%Y;]</h3>
^untaint[as-is]{
	^tArticle.menu{
		^printArticlesShow_cell[]
	}
}
#end @printArticlesShow[]


@printArticlesShow_cell[]
^if($tArticle.id eq $tArticle.last_id){
        <dl>
		<dt class="dateindex">^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]</dt>
		<dd><a style="border-bottom: none^;" href="/news/show/3/$tArticle.id/"><img src="/upload/small/$tArticle.image" alt="$tArticle.title" /></a></dd>
		<dd class="dateindexlead">^printTitle[$tArticle]</dd>
		</dl>
}{
        <dl>
		<dt class="dateindex">^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]</dt>
		<dd class="posttitle">^printTitle[$tArticle]</dd>
		</dl>
}
#end@printArticlesList_cell[]

@html[]
	^if(!def $form:id){
	$tArticle[^getArticles[
		$.iArticleTypeid(2)
		^if(^form:year.int(0)){
			$.sWhere[article_type_id = ^hParam.iArticleTypeId.int(2) AND dt >= '2009-01-09']
		}{
			$.limit(7)
		}
	]]
	^if($tArticle){
		^printArticlesList[$tArticle]
	}
}
#@html[]

@html_show[]
^if(!def $form:id){
	$tArticle[^getArticles[
		$.iArticleTypeId(3)
		^if(^form:year.int(0)){
			$.sWhere[dt >= '^form:year.int(0)-^form:month.int(0)-00' AND dt <= '^form:year.int(0)-^form:month.int(0)-31']
		}{
			$.limit(3)
		}
	]]
	^if($tArticle){
		^printArticlesShow[$tArticle]
	}{
		<p>Не найдено выставок</p>
	}
}{
	$tArticle[^getArticles[
		$.iArticleTypeId(3)
		$.id(^form:id.int(0))
	]]
	^if($tArticle){
		^printArticleItem[$tArticle]
	}{
		^Lib:location[/404/]
	}
}
#@html_show[]

@showWeatherInfo[][d;fRss;xRss;result]
$d[^date::now[]]
^cache[/../data/cache/yr/^math:md5[$d.year $d.month $d.day]](60*60*12){
	$fRss[^file::load[text;http://www.htz.ru/sale/data/exchange.xml]]
	$xRss[^xdoc::create{^untaint{$fRss.text}}]
	$xRss[^xRss.transform[/../data/templates/exchange.xsl]] 
	^xRss.string[$.method[html]]
}
#end @showWeatherInfo[][result]

@navi[]
$nav[^TNavigation::Init[]]
<ul id="breadcrumbs">
^nav.ShowSecondNav[]
</ul>
#@navi[]

@tree[]
$sections[^table::load[/forest.cfg]]

## Выдираем из файла разделов id тех разделов, которые имеют детей
$roots_hash[
	^sections.menu{
		$.[$sections.parent_id][1]
	}
]

## Хэш по таблице
$sections_hash[^sections.hash[id]]

## Хэш разделов, которые уже проверялись
$show_childs_hash[^hash::create[]]

^sections.menu{
	^child_out[$sections.id]
}
#@tree[]

@child_out[parent_id][parent_id;show_childs_temp_hash;subsections]
^if(!$show_childs_hash.$parent_id){
## Если не проверяли этот раздел
	$show_childs_temp_hash[
		$.$parent_id[1]
	]
	^show_childs_hash.add[$show_childs_temp_hash]
	^if($roots_hash.$parent_id){
## Если раздел - родитель
		$subsections[^sections.select($sections.parent_id == $parent_id)]
		<li><a href="^create_link[$sections_hash.$parent_id.id]" title="$sections_hash.$parent_id.name">$sections_hash.$parent_id.name</a>
		<ul>
		^subsections.menu{
			^child_out[$subsections.id]
		}</ul></li>
	}{
## Если раздел - конечное дитё
		<li><a href="^create_link[$sections_hash.$parent_id.id]" title="$sections_hash.$parent_id.name">$sections_hash.$parent_id.name</a></li>
	}
}
#@child_out[]

@create_link[id][id]
$sect_table[^table::create{counter	path}]
$counter(0)
^while(^sections.locate[id;$id]){
	^sect_table.append{$counter	$id}
	$id($sections.parent_id)
	^counter.inc[]
}
^sect_table.sort($sect_table.counter)[desc]
$result[/^sect_table.menu{$sections_hash.[$sect_table.path].dir}[/]/]
$sect_table[]
^memory:compact[]

#create_link[]

@spec_tehno[]
$machines[^getMachines[]]
$machines_s[^machines.select($machines.brand_id==5)]
$price[^getPriceMachines[]]
$price_hash[^price.hash[id]]
  Цены указаны <strong>с НДС18%</strong><br /><em>на ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>.<br />
  ^machines_s.menu{
   $machines_s_price[$price_hash.[$machines_s.id].price]
    ^if($machines_s_price){
        <strong><a href="/catalog/htz/$machines_s.classification_sub_sub_uri/$machines_s.translite/" title="Трактор $machines_s.namenklatura">$machines_s.namenklatura</a></strong> &mdash^; ^eval($machines_s_price*^exchange_usd[]) руб.<br /> 
    }{}  

  } 
#@spec_tehno[]

@spec_tehno_Ai[]
$machines[^getMachines[]]
$machines_s[^machines.select($machines.brand_id==6)]
$price[^getPriceMachines[]]
$price_hash[^price.hash[id]]
  Цены указаны <strong>с НДС18%</strong><br /><em>на ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>.<br />
  ^machines_s.menu{
   $machines_s_price[$price_hash.[$machines_s.id].price]
    ^if($machines_s_price){
        <strong><a href="/catalog/agroimport/$machines_s.classification_sub_sub_uri/$machines_s.translite/" title="Трактор $machines_s.namenklatura">$machines_s.namenklatura</a></strong> &mdash^; ^eval($machines_s_price*^exchange_usd[]) руб.<br /> 
    }{}  

  } 
#@spec_tehno[]

@spec_waterjet[]
$spec_waterjet[^table::load[/services/cutting/materials_list.cfg]]
^spec_waterjet.menu{<a href="$spec_waterjet.uri" title="${spec_waterjet.nameletter}. Гидроабразив."><strong>$spec_waterjet.nameletter</strong></a>}[, ]
#@spec_waterjet[]

@spec_tehno_MTZ[price_hash]
$machines[^getMachines[]]
$machines_s[^machines.select($machines.brand_id==9)]
$price[^getPriceMachines[]]
$price_hash[^price.hash[id]]

<dt>Техника &laquo^;МТЗ&raquo^;</dt>
  Цены указаны <strong>с НДС18%</strong><br /><em>на ^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]г</em>.<br />
  ^machines_s.menu{
   $machines_s_price[$price_hash.[$machines_s.id].price]
    ^if($machines_s_price){
        <strong><a href="/catalog/mtz/detal/id/$machines_s.id/" title="Трактор $machines_s.namenklatura">$machines_s.namenklatura</a></strong> &mdash^; ^eval($machines_s_price*^exchange_usd[]) руб.<br /> 
    }{}  

  }
#@spec_tehno_MTZ[]
	
	
@getCalendar[lparams][params]
$params[^hash::create[$lparams]]
$result[^MAIN:pSQL.sql[table]{
	SELECT
		^MAIN:pSQL.month[dt] AS month,
		^MAIN:pSQL.year[dt] AS year
	FROM
		news
	WHERE
		article_type_id = ^hParam.article_type_id.int(2) AND
		is_published = 1 AND
		dt_published <= ^MAIN:pSQL.now[]
	GROUP BY
		year DESC,
		month DESC
}]
#end @getCalendar[]

@printCalendar[calendar][now;curr_year;curr_month;y_hash;ym_hash;i;m]
^if($calendar){
	$now[^date::now[]]
	$curr_year(^form:year.int(^dtf:format[%Y]))
	$curr_month(^form:month.int(^dtf:format[%m]))

	^calendar.offset(-1)
	$min_year($calendar.year)
	$min_month($calendar.month)

	$y_hash[^calendar.hash[year;year][$.distinct(1)]]
	$ym_hash[^calendar.hash{^calendar.year.format[%04d]=^calendar.month.format[%02d]}[month][$.distinct(1)]]
	$year[^y_hash._keys[]]
	^year.sort($year.key)[desc]

	<table id="tcalendar" border="0">
	<tr><td colspan="2"><p>Календарь</p></td></tr>
	<tr valign="top">
		<td>
			^year.menu{
				<strong>^if($year.key == $curr_year){
					$year.key &nbsp^;
				}{
					^rem{ *** если кликнем в год, по попадем на последний месяц года, 
						за который у нас есть новости *** }
					^if(^calendar.locate[year;$year.key]){}
#<a href="/year/$year.key/month/$calendar.month/">$year.key</a>
					<a href="/test.html?year=$year.key&month=$calendar.month">$year.key</a>
				}
				</strong><br />
			}
		</td>
		<td>
			^if(^year.locate[key;$curr_year]){}
#			^year.menu{
#				^if($year.key == $curr_year){
					^for[i](0;11){
						$m(12-$i)
						^if(def $form:month && $m == $curr_month){
							<strong>$dtf:[ri-locale].month.$m</strong><br />
						}{
							^if(!($now.year == $year.key && $m > $now.month) && !($year.key == $min_year && $m < $min_month)){
								^if($ym_hash.[^year.key.format[%04d]=^m.format[%02d]]){
#<a href="/news/marketnews/year/$year.key/month/$m/">$dtf:[ri-locale].month.$m</a>
                         <a href="/test.html?year=$year.key&month=$m">$dtf:[ri-locale].month.$m</a>
								}{
									$dtf:[ri-locale].month.$m
								}
								<br />
							}
						}
					}
#				}
#			}
		</td>
	</tr>
	</table>
}
#end @printCalendar[]

@html_calendar[]
^if(!def $form:id){
	^rem{ *** $form:id не определена: показываем календарь со списком новостей *** }

	^rem{ *** получаем информацию о календаре и выводим его *** }
	
	$calendar[^getCalendar[$.iArticleTypeId(2)]]
    ^printCalendar[$calendar]
}
#@html_news[]


@getBanner[]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		banner_id AS id,
		channel,
		source
	FROM
		banner
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND banner_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getCatalog[]

@showBanner[]

^if("/catalog/spare/htz/t150/" eq $request:uri){}{<br />
<p><strong><a style="color:#4682b4^;" href="/catalog/spare/htz/t150/" title="Запчасти для трактора Т-150 (ХТЗ)">Запчасти для трактора Т-150 (ХТЗ)</a></strong></p>
<p>Более 5000 запчастей в наличии и на заказ. </p>
<p>Доставка РФ.</p>}
<br />
<p><a href="/catalog/spare/insulation/" title="Утеплители на капот для тракторов и спецтехники">Утеплители на капот для тракторов и спецтехники</a></p>
<br />
<div class="begun_banner_1">

 <div style="padding: 0.5em 0; font-size: 0.8em;">Реклама</div>
 
<dl>
<dt><a style="border-bottom: none;" href="https://wcut.ru/" title="Гидроабразивная резка. Гидрорез." target="_blank">Гидроабразивная резка. Гидрорез.</a></dt>
<dd>Услуги гидрорезки. Металл, гранит, мрамор, керамика, пластик (более 100 видов материалов)</dd>
</dl>
 
<dl>
<dt><a style="border-bottom: none;" href="https://ivt.su/products/helios/" title="Институт высоких технологий Белгородского государственного университета" target="_blank">Институт высоких технологий Белгородского государственного университета</a></dt>
<dd>Программно-аппаратный комплекс (ПАК) «Гелиос» разработан на базе технических решений Института высоких технологий Белгородского государственного университета. Компоненты комплекса внесены в реестр российской промышленной продукци</dd>
</dl>

<dl>
<dt><a style="border-bottom: none;" href="https://www.avito.ru/moskva/odezhda_obuv_aksessuary/krossovki_zhenskie_new_balance_530_4371425360?utm_campaign=native&utm_medium=item_page_ios&utm_source=soc_sharing_seller" title="" target="_blank">Кроссовки New Balance 530. Беж. Китай.</a></dt>
<dd>Доставка по России</dd>
</dl>

<dl>
<dt><a style="border-bottom: none;" href="http://izabor.com" title="Ограждения. Заборы. Автоматика. Ворота." target="_blank">Ограждения. Заборы. Автоматика. Ворота.</a></dt>
<dd>Калитки и комплектующие под ключ.</dd>
</dl>

<dl>
<dt><a style="border-bottom: none;" target="_blank" href="http://land.htz.ru" title="Продажа земельного участка под коммерческую деятельность в Белгородской области">Продажа земельного участка под коммерческую деятельность в Белгородской области</a></dt>
<dd>По своему расположению участок подходит под строительство заправочных станций (АЗС), магазинов оптово-розничной торговли (Пятерочка, Магнит и т.д.), под строительство складских помещений, под оптову-розничную торговлю строительными материалами.</dd>
</dl>

</div>
#@showBanner[]

@showBanner234_60[]
 $banner234_60[^getBanner[]]
 ^untaint[as-is]{
  ^if($banner234_60){
<p>$banner234_60.source</p>
  }{}
 }
#@showBanner234_60[]

@getProductsStore[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		products_id AS id,
		categories_id,
		products_type,
		products_format_type,
		products_format_type_size,
		title,
		products_name_ru,
		products_name_en,
		color,
		w,
		h,
		i,
		d,
		_img,
		img1,
		img2,
		img3,
		img4,
		img5,
		country,
		description_products,
		description,
		keywords,
		pay,
		pay_discont,
		presence,
		dt,
		last_insert_id
	FROM
		shop_products
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND products_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
	^if(def $hParam.where){$.where($hParam.where)}
]]
#end @getProductsStore[]

@getTechnoMachines[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		tech_id AS id,
		machines_id,
		load_capacity,
		capacity_body,
		bunker_volume,
		time_loading,
		width_fertilizers,
		doses_fertilizers,
		depth_loading,
		length,
		width,
		height,
		road_gleam,
		weight,
		speed,
		width_capture,
		tractor,
		on_course,
		on_width,
		productivity,
		fuel_consumption,
		description,
		keywords
	FROM
		tech_bobruysk
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND tech_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getTechnoMachines[hParam]

@hMachines[]
$h_Machines[ 
   $.classification[ 
         $.1[Бетононасос]
		 $.5[Трактор]
		 $.6[Бульдозер]
		 $.8[Фронтальный погрузчик]
		 $.9[Траншейный цепной экскаватор]
		 $.11[Маневровый мотовоз]
		 $.12[Колесный трактор на комбинированом железнодорожном ходу]
		 $.13[Трактор лесопромышленный повышенной проходимости]
         $.14[Специализированная машина для ремонтно-строительных работ на пневмоколесном ходу на базе трактора Т-150]
		 $.15[Трубоукладчик]
		 $.16[Гусеничный погрузчик]
		 $.17[Виброкаток]
		 $.18[Компактор]
         $.19[Машины для внесения органических удобрений]
		 $.20[Машины для внесения минеральных удобрений]
		 $.21[Машины для заготовки, хранения и раздачи кормов]
		 $.22[Экскаваторное оборудование]
		 $.23[Навесные пылесосы]
		 $.24[Автономные пылесосы]
		 $.25[Измельчители веток]
		 $.26[Дровоколы]
		 $.27[Машины вакуумноуборочные]
		 $.28[Бетоносместители навесные]
		 $.29[Бетоносместители автономные]
		 $.30[Снегоочистители]
		 $.31[Погрузочное оборудование]
		 $.32[Машины коммунальные подметальные]
		 $.33[Бульдозерное оборудование]
   ]
  $.classification_sub[ 
         $.1[Дизельный]
		 $.2[Электрический]
		 $.4[Общего назначения]
		 $.5[Пахотно-пропашной]
		 $.6[Фронтальный погрузчик]
		 $.7[Трактор малой мощности]
		 $.8[Спецтехника]
		 $.9[Бульдозер]
		 $.10[Болотоходный]
   ]
   
   $.classification_item[ 
         $.1[Трактора общего назначения]
		 $.2[Тракторы малой мощности]
		 $.3[Спецтехника]
   ]
   
 $.brand_id[ 
         $.1[&laquo^;HONGDA&raquo^;]
		 $.5[ОАО &laquo^;ХТЗ&raquo^;]
		 $.6[ООО &laquo^;Агроимпорт&raquo^;]
		 $.7[ОАО &laquo^;Бобруйскагромаш&raquo^;]
		 $.8[ОАО &laquo^;ТАиМ&raquo^;]
		 $.9[ПО &laquo^;МТЗ&raquo^;]
		 $.10[&laquo^;XINGTAI&raquo^;]
   ]
 $.img_patch[
         $.1[/catalog/img/external]
		 $.2[/catalog/img/def]
		 $.3[/catalog/img/detal]
		 $.4[/catalog/img/front]
		 $.5[/catalog/img/icons]
   ]
 $.item[ 
         $.1[]
		 $.5[]
		 $.6[]
		 $.7[]
		 $.8[]
		 $.9[mtz]
		 $.10[xingtai]
   ]
 $.country_origin_ru[ 
         $.1[Россия]
		 $.2[Украина]
		 $.3[Китай]
		 $.4[Беларусь]
		 $.5[Турция]
   ]
 $.customs[ 
         $.1[Таможня 100%]
		 $.2[Нет]
   ]
   
 $.status[ 
         $.1[Новый]
		 $.2[Б/У]
   ]
 $.parking[ 
         $.1[Российская Федерация]
		 $.2[Украина]
		 $.3[Китай]
		 $.4[Республика Беларусь]
   ]
 $.parking_citi[ 
         $.1[<span style="color:green^;">г. Москва. В наличии.</span>]
		 $.2[г. Харьков. Доставка 45 дней.]
		 $.3[г. Пекин. Доставка 65 дней.]
		 $.4[г. Белгород. РФ. Доставка 45 дней.]
		 $.5[г. Минск. Доставка 15 дней.]
   ]
   
 $.delivery[ 
         $.1[Автотранспортом по РФ]
		 $.2[ЖД платформа по РФ]
   ]
   
 $.description[ 
         $.1[Предлагаем бетононасосы из Китая. Доставляем бетононасосы в любой регион России.  Запасные части, комплектующие для бетононасосов.]
		 $.2[]
   ]
 $.keywords[ 
         $.1[Бетононасосы HONGDA,  SANY,  Fangyuan, запасные части для бетононасосов, заказать бетононасос в Китае, китайские бетононасосы, купить бетононасос.]
		 $.2[]
   ]
 $.css[ 
         $.1[seven]
		 $.2[]
   ]
 $.db_field[
   		 $.1[machines_id]
		 $.2[tech_id] 
		 $.3[item] 
		 $.4[uri] 
		 $.5[name_ru]
		 $.6[title] 
		 $.7[translite] 
		 $.8[namenklatura] 
		 $.9[classification]
		 $.10[classification_sub] 
		 $.11[classification_sub_sub_uri] 
		 $.12[classification_item]
		 $.13[producer] 
		 $.14[producer_about] 
		 $.15[brand] 
		 $.16[brand_id] 
		 $.17[country_origin_en] 
		 $.18[country_origin_ru]
		 $.19[year] 
		 $.20[customs]
		 $.21[status]
		 $.22[parking]
		 $.23[parking_citi]
		 $.24[tehno_info_id]
		 $.25[tehno_info_uri]
		 $.26[complect_uri]
		 $.27[css]
		 $.28[lead]
		 $.29[volume]
		 $.30[body]
		 $.31[pdf]
		 $.32[description]
		 $.33[keywords]
		 $.34[delivery]
		 $.35[web_link]
   ]
 ]
 
#@hMachines[]

@getMachines[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		machines_id AS id,
		tech_id,
		item,
		uri,
		name_ru,
		title,
		translite,
		namenklatura,
		classification,
		classification_sub,
		classification_sub_sub_uri,
		classification_item,
		producer,
		producer_about,
		brand,
		brand_id,
		country_origin_en,
		country_origin_ru,
		year,
		customs,
		status,
		parking,
		parking_citi,
		tehno_info_id,
		tehno_info_uri,
		complect_uri,
		css,
		lead,
		volume,
		body,
		pdf,
		description,
		description,
		keywords,
		delivery,
		web_link,
		img_def,
		img_front,
		img,
		img_1,
		img_2,
		img_3,
		img_4,
		img_5,
		img_6
	FROM
		machines
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND machines_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getMachines[]

@getMachinesPrice[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		machines_price_id AS id,
		price
	FROM
		machines_price
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND machines_price_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getMachinesPrice[]


@getPriceMachines[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		machines_price_id AS id,
		price
	FROM
		machines_price
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND machines_price_id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#@getPriceMachines[]


@getTehMTZ[hParam]
$field_teh_mtz[^table::load[/field_teh_mtz.cfg]]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		machines_tehno_mtz_id AS id,
		machines_id,
		namenklatura,
		^field_teh_mtz.menu{$field_teh_mtz.field}[, ]
		 ,
		web_link,
		description,
		keywords
	FROM
		machines_tehno_mtz
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND machines_tehno_mtz_id = ^hParam.id.int(0)
		}
		ORDER BY
		id DESC
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getTehMTZ[]

@getTehXingtai[hParam]
$field_teh_xingtai[^table::load[/field_teh_xingtai.cfg]]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		machines_tehno_xingtai_id AS id,
		machines_id,
		namenklatura,
		^field_teh_xingtai.menu{$field_teh_xingtai.field}[, ]
		 ,
		web_link,
		description,
		keywords
	FROM
		machines_tehno_xingtai
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND machines_tehno_xingtai_id = ^hParam.id.int(0)
		}
		ORDER BY
		id DESC
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getTehXingtai[]

@color[]
$news[^getArticles[]]
$color1[#ffefd5]
$color2[#f0e68c]
# ^if($switcher eq 0){
# «eq» — оператор для сравнения строк,
# для сравнения чисел — «==»
<table border="0" cellpadding="10" cellspacing="11" width="75%">
^news.menu{
^if(!def $switcher){$switcher(0)}
^switcher.mod(2)
^if($switcher == 0){
	<tr bgcolor="$color1 ^switcher.inc[]"><td>Один цвет</td></tr>
}{
	<tr bgcolor="$color2 ^switcher.inc[]"><td>Другой цвет</td></tr>
}
}
</table>
<br /><br /><br /><br />
<table border="0" cellpadding="10" cellspacing="11" width="75%">
$sColor1[#ff4500]
$sColor2[#6c6c6c]
^news.menu{
<tr bgcolor="^Lib:color[$sColor1;$sColor2]"><td>ого</td></tr>}
</table>
#@color[]

@hSpecial[]
$h_Special[ 
   $.parent_id[ 
         $.1[Бетононасос]
		 $.2[]
   ]
   $.products_type[ 
         $.1[Камнеобрабатывающие оборудование]
		 $.2[Изделия из природного камня]
		 $.3[Природный камень различного формата]
   ]
   $.deliv[ 
         $.1[Возможен самовывоз. Возможна доставка по Москве и по РФ.]
		 $.2[]
		 $.3[]
   ]
   $.payment_methods[ 
         $.1[Наличный и безналичный расчет]
		 $.2[]
		 $.3[]
   ]
 ]
#@hSpecial[]

@hStock[]
$h_stock[
    $.stone_status_id[
        $.1[В наличии на складе]
		$.2[В пути]
   ]
    $.stone_type_id[
        $.14[Гранит]
 		$.22[Мрамор]
   ]
   $.stone_format_id[
        $.1[Слеб]
		$.2[Полоса]
 		$.3[Плитка]
   ]
   $.img_patch[
         $.1[/stock/img/def]
		 $.2[/stock/img/h]
		 $.3[/stock/img/b]
		 $.4[/stock/img/f]
		 $.5[/stock/img/s]
		 $.6[/stock/img/watermark]
   ]
   $.db_field[
         $.1[stone_status_id]
		 $.2[stone_id]
		 $.3[stone_type_id]
		 $.4[stone_format_id]
		 $.5[country_id]
		 $.6[stone_en]
		 $.7[stone_ru]
		 $.8[stone_alternative_name_en]
		 $.9[amount_stone]
		 $.10[s_length]
		 $.11[s_width]
		 $.12[s_height]
		 $.13[dt_add]
		 $.14[dt_add_stone]
		 $.15[add_info]
		 $.16[description]
		 $.17[keywords]
		 $.18[is_special]
		 $.19[is_pdf]
		 $.20[is_archive]
		 $.21[price]
		 $.22[price_type]
   ]
 ]
#@hStock[]

@num_decline[num;nominative;genitive_singular;genitive_plural]
^if($num > 10 && (($num % 100) \ 10) == 1){
        $result[$genitive_plural]
}{
        ^switch($num % 10){
                ^case(1){$result[$nominative]}
                ^case(2;3;4){$result[$genitive_singular]}
                ^case(5;6;7;8;9;0){$result[$genitive_plural]}
        }
}
#@num_decline[]

@hWaterjetMaterials[]
$h_waterjet_material[
    $.material_type_id[
        $.1[Алюминий]
		$.2[Гранит]
		$.3[Керамика]
		$.4[Керамогранит]
		$.5[Латунь]
		$.6[Медь]
		$.7[Мрамор]
		$.8[Нержавеющая сталь]
		$.9[Оргстекло]
		$.10[Поролон]
		$.11[Резина]
		$.12[Сталь]
		$.13[Стекло]
		$.14[Титан]
		$.15[Фторопласт]
		$.16[Агломерат]
		$.17[Текстолит]
		$.18[Винипласт]
		$.19[Капролон]
		$.20[Полиуретан]
		$.21[Поропласт]
		$.22[Оникс]
		$.23[Фанера]
		$.24[Карбит кремния]
   ]
   $.material_name_ru[
        $.1[Алюминий]
		$.2[Гранит]
		$.3[Керамика]
		$.4[Керамогранит]
		$.5[Латунь]
		$.6[Медь]
		$.7[Мрамор]
		$.8[Нержавеющая сталь]
		$.9[Оргстекло]
		$.10[Поролон]
		$.11[Резина]
		$.12[Сталь]
		$.13[Стекло]
		$.14[Титан]
		$.15[Фторопласт]
		$.16[Агломерат]
		$.17[Текстолит]
		$.18[Винипласт]
		$.19[Капролон]
		$.20[Полиуретан]
		$.21[Поропласт]
		$.22[Оникс]
		$.23[Фанера]
		$.24[Карбит кремния]
   ]
   $.material_name_en[
        $.1[Aluminum]
		$.2[Granite]
		$.3[Ceramics]
		$.4[Gres]
		$.5[Brass]
		$.6[Copper]
		$.7[Marble]
		$.8[Stainless steel]
		$.9[Plexiglas]
		$.10[Foam rubber]
		$.11[Rubber]
		$.12[Steel]
		$.13[Glass]
		$.14[Titan]
		$.15[Fluoroplastic]
		$.16[Agglomerate]
		$.17[Textolite]
		$.18[Vinyl]
		$.19[Kaprolone]
		$.20[Polyurethane]
		$.21[Sponge]
		$.22[Onyx]
		$.23[Plywood]
		$.24[Silicon carbide]
   ]
   $.material_item[
        $.1[aluminum]
		$.2[granite]
		$.3[ceramics]
		$.4[gres]
		$.5[brass]
		$.6[copper]
		$.7[marble]
		$.8[stainless_steel]
		$.9[plexiglas]
		$.10[foam_rubber]
		$.11[rubber]
		$.12[steel]
		$.13[glass]
		$.14[titan]
		$.15[fluoroplastic]
		$.16[agglomerate]
		$.17[textolite]
		$.18[vinyl]
		$.19[kaprolone]
		$.20[polyurethane]
		$.21[sponge]
		$.22[onyx]
		$.23[plywood]
		$.24[silicon_carbide]
   ]
   $.db_field[
         $.1[material_type_id]
		 $.2[material_work_id]
		 $.3[material_name_ru]
		 $.4[material_name_en]
		 $.5[material_size]
		 $.6[material_price_rub]
		 $.7[material_desc]
		 $.8[material_img]
		 $.9[description]
		 $.10[keywords]
   ]
   $.db_field_works[
         $.1[work_type_id]
		 $.2[work_materials_type_id]
		 $.3[work_materials_size]
		 $.4[work_meters_price]
		 $.5[work_meters_count]
		 $.6[work_title]
		 $.7[work_title_short]
		 $.8[work_desc]
		 $.9[work_img]
		 $.10[work_description]
		 $.11[work_keywords]
		 $.12[work_delivery_dt]
   ]
   $.works_img_patch[
         $.1[/img/services/waterjet/works/def]
		 $.2[/img/services/waterjet/works/h]
		 $.3[/img/services/waterjet/works/b]
		 $.4[/img/services/waterjet/works/f]
		 $.5[/img/services/waterjet/works/s]
		 $.6[/img/services/waterjet/works/watermark]
   ]
   
 ]
#@hWaterjetMaterials[]


@hWaterjetGrille[]
$h_waterjet_grille[
    $.grille_type_id_short[
        $.1[Стандартная]
		$.2[Дверная]
		$.3[Оконная]
		$.4[Круглая]
		$.5[Радиусная]
   ]
   $.grille_type_id[
        $.1[Стандартная решетка]
		$.2[Дверная решетка]
		$.3[Оконная решетка]
		$.4[Круглая решетка]
		$.5[Радиусная решетка]
   ]
   $.grille_patterns_ru[
        $.1[Египетский]
		$.2[Испанский]
		$.3[Испанский]
		$.4[Испанский]
   ]
   $.grille_patterns_en[
        $.1[]
		$.2[]
   ]
   $.grille_item[
        $.1[aluminum]
		$.2[granite]
   ]
   $.material_name_ru[
        $.1[Нержавейка]
		$.2[Латунь]
		$.3[Алюминий]
		$.4[Дерево]
		$.5[Камень]
   ]
   $.db_field[
         $.1[grille_type_id]
		 $.2[grille_patterns_id]
		 $.3[grille_material_id]
		 $.4[grille_material_size]
		 $.5[grille_name]
		 $.6[grille_desc]
		 $.7[grille_img]
		 $.8[grille_description]
		 $.9[grille_keywords]
   ]
   $.db_field_works[
         $.1[]
		 $.2[work_materials_type_id]
		 $.3[work_materials_size]
		 $.4[work_meters_price]
		 $.5[work_meters_count]
		 $.6[work_title]
		 $.7[work_title_short]
		 $.8[work_desc]
		 $.9[work_img]
		 $.10[work_description]
		 $.11[work_keywords]
		 $.12[work_delivery_dt]
   ]
   $.grille_img_patch[
         $.1[/img/services/grille_factory/grille/def]
		 $.2[/img/services/grille_factory/grille/h]
		 $.3[/img/services/grille_factory/grille/b]
		 $.4[/img/services/grille_factory/grille/f]
		 $.5[/img/services/grille_factory/grille/s]
		 $.6[/img/services/grille_factory/grille/watermark]
   ]
   $.pattern_img_patch[
         $.1[/img/services/grille_factory/patterns/def]
		 $.2[/img/services/grille_factory/patterns/h]
		 $.3[/img/services/grille_factory/patterns/b]
		 $.4[/img/services/grille_factory/patterns/f]
		 $.5[/img/services/grille_factory/patterns/s]
		 $.6[/img/services/grille_factory/patterns/watermark]
   ]
   
 ]
#@hWaterjetGrille[]

#@hInsulation[]
@hInsulation[]
$h_Insulation[
	$.item[ 
         $.1[umz]
		 $.2[mtz]
		 $.3[btgz] 
		 $.4[atz]
		 $.5[ltz]
		 $.6[vmtz]
		 $.7[htz]
		 $.8[btz]
		 $.9[ctz]
         $.10[ptz]
		 $.11[amkodor]
		 $.12[kamaz]
		 $.13[uaz]
		 $.14[ural]
         $.15[ccdm]
		 $.16[brars]
		 $.17[gaz]
   ]
   $.factory[ 
         $.1[ЮМЗ]
		 $.2[МТЗ]
		 $.3[ВТГЗ]
		 $.4[АТЗ]
		 $.5[ЛТЗ]
		 $.6[ВМТЗ]
		 $.7[ХТЗ]
		 $.8[БТЗ]
		 $.9[ЧТЗ]
         $.10[ПТЗ]
		 $.11[Амкодор]
		 $.12[КАМАЗ]
		 $.13[УАЗ]
		 $.14[УРАЛ]
         $.15[ЧСДМ]
		 $.16[Брянский арсенал]
		 $.17[ГАЗ]
   ]
  $.factory_desc[ 
         $.1[Южмаш]
		 $.2[Минский тракторный завод]
		 $.3[Волгоградский тракторный завод]
		 $.4[Алтайский тракторный завод]
		 $.5[Липецкий тракторный завод]
		 $.6[Владимирский моторо-тракторный завод]
		 $.7[Харьковский тракторный завод]
		 $.8[Брянский тракторный завод]
		 $.9[Челябинский тракторный завод]
         $.10[Петербургский тракторный завод]
		 $.11[Белорусский холдинг «Амкодор»]
		 $.12[ПАО КАМАЗ]
		 $.13[Ульяновский автомобильный завод]
		 $.14[Уральский автомобильный завод]
         $.15[Челябинские строительно-дорожные машины]
		 $.16[Машиностроительный завод «Брянский арсенал»]
		 $.17[Горьковский автомобильный завод]
   ]]
#end @hInsulation[]

@getListInsulation[]
<a style="font-weight:bold" href="/catalog/spare/insulation/umz/" title="Утеплители на копот для ЮМЗ">ЮМЗ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/mtz/" title="Утеплители на копот для МТЗ">МТЗ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/btgz/" title="Утеплители на копот для ВТГЗ">ВТГЗ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/atz/" title="Утеплители на копот для ЛТЗ">АТЗ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/ltz/" title="Утеплители на копот для">ЛТЗ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/vmtz/" title="Утеплители на копот для ВМТЗ">ВМТЗ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/htz/" title="Утеплители на копот для ХТЗ">ХТЗ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/btz/" title="Утеплители на копот для БТЗ">БТЗ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/ctz/" title="Утеплители на копот для ЧТЗ">ЧТЗ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/ptz/" title="Утеплители на копот для ПТЗ">ПТЗ</a>,
<a style="font-weight:bold" href="/catalog/spare/insulation/amkodor/" title="Утеплители на копот для Амкодор">Амкодор</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/kamaz/" title="Утеплители на копот для КАМАЗ">КАМАЗ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/uaz/" title="Утеплители на копот для УАЗ">УАЗ</a>,
<a style="font-weight:bold" href="/catalog/spare/insulation/ural/" title="Утеплители на копот для УРАЛ">УРАЛ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/ccdm/" title="Утеплители на копот для ЧСДМ">ЧСДМ</a>, 
<a style="font-weight:bold" href="/catalog/spare/insulation/gaz/" title="Утеплители на копот для ГАЗ">ГАЗ</a>
#end @getListInsulation[]

@CNStats[]
^connect[mysql://$db.dbname:^db.passw.trim[]@$db.server/$db.dbname?charset=cp1251&ClientCharset=windows-1251]{ 
    $stats[^table::sql{select r_hits AS id,
		t_u_hits
		from cns_counter}]
}
$result[$stats.t_u_hits]
#CNStats[]

@footer[]
$now[^date::now[]]
<div id="footer">
<!-- <ul id="site"><li>Контактный телефон: <noindex><strong>+7 (925) 585-33-71</strong></noindex></li></ul>-->

<ul>
<li><a href="/" title="Главная">Главная</a></li>	
<li><a href="/about/contact/" title="Контакты">Контакты</a></li>
<li><a href="/map/" title="Карта сайта">Карта сайта</a></li>
<li><a href="/ad/" title="Реклама на сайте">Реклама на сайте</a></li>
</ul>

<ul id="site">
<li>Разработка и поддержка сайта AG</li>
</ul>

^if($request:uri eq "/"){
$found(^CNStats[])
<ul>
<li>Всего ^CNStats[] ^num_decline[$found;посетитель;посетителя;посетителей]</li>
</ul>}{}

<ul>
<li><a href="http://www.parser.ru/" target="_blank">Parser 3</a> &mdash^; в сердце сайта</li>
</ul>

<ul id="copyright">
<li class="first">&copy; 2004&mdash;$now.year ^my_company_name_[]</li>
</ul>


<!-- Statistika begin -->
<span id="cnstats_span"><script type="text/javascript">
cnsd=document;
cnst=escape(cnsd.title);
cnst=cnst.replace(/\+/g,'%2B');
cnsa=navigator.appName;
cnsn=(cnsa.substring(0,2)=='Mi')?0:1;
cnss=screen;cnspx=(cnsn==0)?cnss.colorDepth:cnss.pixelDepth;
if (cnsd.getElementById)
{
	var i=cnsd.createElement('img');
	var amp=String.fromCharCode(38);
	var iurl='http://htz.ru/php/cnstats/cnt-gif1x1.php?';
	iurl+='e='+cnss.width+'.'+cnss.height;
	iurl+=amp+'d='+cnspx+amp+'r='+escape(cnsd.referrer);
	iurl+=amp+'p='+escape(cnsd.location)+amp+'t='+cnst;
	i.src=iurl;
	i.width=1;i.height=1;i.border=0;
	cnsd.getElementById('cnstats_span').appendChild(i);
}
</script></span><noscript><img src="http://htz.ru/php/cnstats/cnt-gif1x1.php?468&amp;c=0" width="1" height="1" border="0" alt="" /></noscript>
<!-- Statistika end -->


<!-- Yandex.Metrika -->
<script src="//mc.yandex.ru/metrika/watch.js" type="text/javascript"></script>
<div style="display:none;"><script type="text/javascript">
try { var yaCounter1729861 = new Ya.Metrika(1729861);
yaCounter1729861.clickmap();
yaCounter1729861.trackLinks({external: true});
} catch(e){}
</script></div>
<noscript><div style="position:absolute"><img src="//mc.yandex.ru/watch/1729861" alt="" /></div></noscript>
<!-- /Yandex.Metrika -->

</div>
#@footer[]