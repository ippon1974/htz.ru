@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[] | фото | Б/У Техника |  Сельскохозяйственная техника, спецтехника заводов: ХТЗ, МТЗ, ВТЗ, ЮМЗ. Доставка дорожно-строительной техники из Китая: бульдозеры, фронтальные погрузчики, бетононасосы, вилочные погрузчики, дорожные катки, грейдеры." />
<meta name="keywords" content="^title[] | Фото | Как продать технику? | Б/У Техника |  Китайские бульдозеры, погрузчики, экскаваторы, китайские катки, xcmg, shantui, foton, shehwa, бульдозеры SHANTUI, бульдозеры Китай, SANY, ZOOMLION, бетононасосы, фронтальные погрузчики XCMG, бульдозеры SHEHWA." />

<link rel="STYLESHEET" type="text/css" href="25/css/screen.css">

<link rel="shortcut icon" href="/ico.ico" /> 
<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />

<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->

<style media="screen" type="text/css">

* { margin: 0; padding: 0; }
body { font: normal 95.5% 'Times New Roman', "Lucida Grande", Arial, Georgia, serif; border-top: 10px solid #ffcc33; background-color: #000; color: #BEBEBE; }
a { color: #0099D0; text-decoration: underline; border-bottom: 1px solid #369; }
a:hover, a:focus { color: #0099D0; border-bottom: 1px solid #600; }
a:visited { color: #AB73A2; border-bottom: 1px solid #600; }


div#contents {width: 600px; text-align: left;}
div#contents h1 {text-align: left; margin: 0.2em 0 0.2em 0;}
div#contents p {text-align: left; margin: 0.2em 0 0.2em 0;}
div#contents img { margin: 0.2em 0 0.5em 0; border: 1px solid #BEBEBE; display: block; text-align: center;}
div#footerscreen { text-align: left;}
div#footerscreen p {  margin: 0.2em 0 0.5em 0;}

hr {
    color: #BEBEBE; /*для IE */
    background-color:#BEBEBE; /*для Firefox, Opera, Safari*/
    border:0px none;
    height:1px; /* высота 1px IE, Firefox, Opera, Safari */
    clear:both; /* для очистки, если тег идет после float елемента */
}

</style>


</head>

<body>
$now[^date::now[]]

@print[tehno]

#end @printArticlesShow[]

@print_call[]
^if($tehno.id eq $tehno.last_insert_id){
$result[<tr><td><a href="/catalog/use/tehno/$tehno.id/"><img src="/catalog/use/i/$tehno.img_icon" alt="$tehno.name" /></a></td><td><a href="/catalog/use/tehno/$tehno.id/">$tehno.name</a></td><td>$tehno.year</td><td><strong>$tehno.price</strong> руб.</td></tr>]
}{
$result[<tr><td>$tehno.id</td><td><a href="/catalog/use/tehno/$tehno.id/">$tehno.name</a></td><td>$tehno.year</td><td><strong>$tehno.price</strong> руб.</td></tr>]
}
#end @print_call[]



@Item[tehno;amount]
<div align="center">
<div id="contents">
^untaint[as-is]{
	^if(def $tehno.name){<p><a href="/catalog/use/">Б/У Техника</a></p><h1>^tehno.name.match[[\[\]]][g]{}</h1>}
	^Item_call[]
}</div></div>

@Item_call[]
^if($tehno.id){
$result[
<p>Тип: $tehno.type_name</p>
<p>Бренд: &laquo^;$tehno.brand&raquo^;</p>
<p>Номенклатура: $tehno.nomenclature</p>
<p>Год выпуска: $tehno.year</p>
<p>Стоимость: $text(^tehno.price.trim[])
$text_nds($text/6.55557)
^number_format[^text.format[%.2f];,;.](2) руб. (<em>^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</em>)</p>
^if(def $tehno.phone_users){<p>Телефон: <noindex>$tehno.phone_users</noindex></p>}{<p>Телефон: <noindex>^my_phone[]</noindex></p>}
^if(def $tehno.body_img_1){<img src="/catalog/use/i/$tehno.body_img_1" alt="$tehno.name" border="0">}{}
^if(def $tehno.body_img_2){<img src="/catalog/use/i/$tehno.body_img_2" alt="$tehno.name" border="0">}{}
^if(def $tehno.body_img_3){<img src="/catalog/use/i/$tehno.body_img_3" alt="$tehno.name" border="0">}{}
^if(def $tehno.body_img_4){<img src="/catalog/use/i/$tehno.body_img_4" alt="$tehno.name" border="0">}{}
^if(def $tehno.body_img_5){<img src="/catalog/use/i/$tehno.body_img_5" alt="$tehno.name" border="0">}{}
^if(def $tehno.body_img_6){<img src="/catalog/use/i/$tehno.body_img_6" alt="$tehno.name" border="0">}{}
^if(def $tehno.body_img_7){<img src="/catalog/use/i/$tehno.body_img_7" alt="$tehno.name" border="0">}{}
<div id="footerscreen">
<hr />
<p><a href="/">Главная</a> | <a href="/about/contact/">Контакты</a> | <a href="/map/">Карта сайта</a></p>
<p>&copy^; 2004&mdash^;$now.year СТРОЙПРОЕКТМОНТАЖ</p>
</div>
]
}{
$result[]
}
#end @printArticleItem[]


@htmlscreen[]
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
$result[Б/У Техника]
}{
$result[$title.name]
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












