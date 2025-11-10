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

@title[]
$result[Мы предлагаем Вам свои услуги по изготовлению изделий из природного камня.]
#@title[]

@description[]
$result[Изготовления: подоконники, столешницы, ступени, фасады, камины, бордюры, колоны, санузлы, фонтаны.]
#@description[]

@keywords[]
$result[Подоконники, столешницы, ступени, фасады, камины, бордюры, колоны, санузлы, фонтаны.]
#@keywords[]


@shwo[]
<p>Что мы можем сделать: <strong>подоконники</strong>, <strong>столешницы</strong>, <strong>ступени</strong>, <strong>фасады</strong>, <strong>камины</strong>, <strong>бордюры</strong>, <strong>колоны</strong>, <strong>санузлы</strong>, <strong>фонтаны</strong>.</p>
<p>Наше производство расположено не далеко от Москвы в Люберецком районе.</p>
<p>Вы можете заказать у нас любой замер, наш специалист приедет на замер в заранее оговоренное время.</p>
<p>Так же можно будет получить консультацию по вашему объекту у архитектора и дизайнера.</p>
<p><strong>Наши телефоны</strong>: ^my_phone[]</p>
<p><strong>Электропочта</strong>: ^my_email[]</p>
<h3>Примеры наших работ</h3>
<p><em>Количество работ постоянно увеличивается!</em></p>
^menu_work[]
#@shwo[]

@menu_work[]
$hash_work[
 $.type[ 
         $.1[Подоконники]
		 $.2[Столешницы]
 ]
]
$menu_work[^table::load[/store/stone_natural/services/work_menu.cfg]]
<div class="works_works">
 ^menu_work.menu{<ins class="work_works"><div class="r"><a href="/store/stone_natural/services/detal/id/$menu_work.id/"><img style="margin: 0^;" src="/store/stone_natural/services/img/s/${menu_work.img}.jpg" alt="$menu_work.name из природного камня" border="0" /></a><br /><span class="line_bottom"><a href="/store/stone_natural/services/detal/id/$menu_work.id/">$menu_work.name</a></span></div></ins>}
</div>
#@menu_work[]




