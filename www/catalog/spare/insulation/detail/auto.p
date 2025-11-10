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

<link rel="stylesheet" type="text/css" href="/css/callback_mini.css">
<link rel="stylesheet" type="text/css" href="/css/callback.css">

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />

</head>
<body class="spare sparehtz">
#end@header[]

@title[]
^if(def $form:id){
  $title[^getInsulation[
  $.id(^form:id.int(0))
  ]]
  $result[Утеплитель на капот. $title.product_desc]
}{}
#@title[]

@description[]
$description[^getInsulation[$.id(^form:id.int(0))]]
$result[]
#@description[]

@keywords[]
$keywords[^getInsulation[$.id(^form:id.int(0))]]
$result[]
#@keywords[]

@Insulation[]
^hInsulation[]
^if(def $form:id){
$insulation[^getInsulation[$.id(^form:id.int(0))]]
<div><a href="/catalog/spare/insulation/" title="Утеплители моторов для тракторов и спецтехники">Утеплители моторов для тракторов и спецтехники</a> / <a href="/catalog/spare/insulation/${h_Insulation.item.[$insulation.tech_id]}/" title="Утеплитель на капот. ${h_Insulation.factory.[$insulation.tech_id]}">${h_Insulation.factory.[$insulation.tech_id]} ${h_Insulation.factory_desc.[$insulation.tech_id]}</a></div><br />
<h2>Утеплитель на капот. $insulation.product_desc</h2>

<div id="tehnobody">
<span>^dtf:format[%d %h %Y;]</span>

<h3>${h_Insulation.factory.[$insulation.tech_id]} ${h_Insulation.factory_desc.[$insulation.tech_id]}</h3>

$text($insulation.cost)
^if($text){
    <span>Цена:</span>
    $text_nds($text/6.55557)
   <h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4>
   <div class="price">^int2str:money2str($text)</div>
}

    <dl id="info">
        <dt>Производство:</dt>
        <dd>Россия</dd>
        <dt>Материал:</dt>
        <dd>Эластоискожа</dd>
        <dt>Техника:</dt>
        <dd>${h_Insulation.factory_desc.[$insulation.tech_id]}</dd>
        <dt>Наличие:</dt>
        <dd>Заказ (10 рабочих дней)</dd>
        <dt>Кол-во</dt>
        <dd>Минимальный заказ 5 шт.</dd>
        <dt>Телефон:</dt>
        <dd>^phoneForParts[]</dd>
        <dt>Мессенджер:</dt>
        <dd><a href="https://wa.me/79255853371">Whatsapp</a></dd>
        <dt>Почта:</dt>
        <dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СПМ"] (24/7)</dd>
		<dt>Место:</dt>
		<dd>140004, Московская область, Люберцы, Посёлок ВУГИ 1с4</dd>
    </dl>

</div>
}
<h3>Преимущества тракторного утеплителя</h3>
<ul>
<li>Нанесение &mdash^; мягкая, долговечная <strong>эластоискожа</strong> (не ПВХ, не винил), не трескается при любом морозе, приятная на ощупь, выглядит красиво, маслобензостойкая.</li><br />
<li>Нетканая основа чисто белого цвета, разорвать не возможно даже двум взрослым мужчинам, прекрасно держит тепло, на открытом огне плавится.</li><br />
<li>Утеплитель аккуратно окантован, при том что весь, включая даже самые маленькие отверстия, нет ни единого подгиба материала.</li><br />
<li>Используемая нить на сшив деталей &mdash^; ЛЛ50 отечественного производства.</li>
</ul>

<p><a href="/catalog/spare/insulation/img/b/1.jpg" title="Утеплитель на капот для трактора. Упаковка." target="_blank"><img alt="Утеплитель на капот для трактора. Упаковка." src="/catalog/spare/insulation/img/f/1.jpg"></a></p>
<p><a href="/catalog/spare/insulation/img/b/2.jpg" title="Утеплитель на капот для трактора. Упаковка." target="_blank"><img alt="Утеплитель на капот для трактора. Упаковка." src="/catalog/spare/insulation/img/f/2.jpg"></a></p>
<p><a href="/catalog/spare/insulation/img/b/3.jpg" title="Утеплитель на капот для трактора МТЗ" target="_blank"><img alt="Утеплитель на капот для МТЗ." src="/catalog/spare/insulation/img/f/3.jpg"></a></p>
<p><a href="/catalog/spare/insulation/img/b/4.jpg" title="Утеплитель на капот для трактора МТЗ-82" target="_blank"><img alt="Утеплитель на капот для трактора МТЗ-82" src="/catalog/spare/insulation/img/f/4.jpg"></a></p>
<p><a href="/catalog/spare/insulation/img/b/5.jpg" title="Утеплитель на капот для трактора МТЗ-80" target="_blank"><img alt="Утеплитель на капот для трактора МТЗ-80" src="/catalog/spare/insulation/img/f/5.jpg"></a></p>
<p><a href="/catalog/spare/insulation/img/b/6.jpg" title="Утеплитель на капот для трактора ХТЗ Т-150" target="_blank"><img alt="Утеплитель на капот для трактора ХТЗ Т-150" src="/catalog/spare/insulation/img/f/6.jpg"></a></p>
<p><a href="/catalog/spare/insulation/img/b/7.jpg" title="Утеплитель на капот для трактора К700" target="_blank"><img alt="Утеплитель на капот для трактора К700" src="/catalog/spare/insulation/img/f/7.jpg"></a></p>

#@Insulation[]