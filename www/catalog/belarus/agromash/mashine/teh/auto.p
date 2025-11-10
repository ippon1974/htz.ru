@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title[] | " />
<meta name="keywords" content="^title[] | " />

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
<body class="events b_agromash seven">
#end@header[]

@title[]
^if(def $form:id){
  ^hMachines[]
^connect[$connect_string]{
$title[^table::sql{SELECT * FROM machines LEFT JOIN tech_bobruysk ON tech_bobruysk.machines_id = machines.machines_id}]
}
^if(^title.locate[tech_id;$form:id]){$result[Технические характеристики. ${title.name_ru}. Производство $h_Machines.brand_id.[$title.brand_id] (Беларусь).]}{}

}{
 $title[^table::load[/_root.cfg]]
  ^if(^title.locate[uri;$request:uri]){$result[$title.title]}{}
}
#@title[]


@navi_sub_nav[]
 $navi_sub_nav[^getMachines[]]
    ^if(^navi_sub_nav.locate[tech_id;$form:id]){<div style="margin: 0 0 0.8em 0^; font-size: 1.5em^;"><a href="/catalog/belarus/agromash/mashine/detal/id/$navi_sub_nav.id/">$navi_sub_nav.name_ru</a></div>}{} 
#@navi_sub_nav[]


@detalTEHNO[]
^if(!def $form:id){
^hMachines[]
^connect[$connect_string]{
$sql_table[^table::sql{SELECT * FROM machines LEFT JOIN tech_bobruysk ON tech_bobruysk.machines_id = machines.machines_id}]
}
$sql_table_s[^sql_table.select($sql_table.brand_id==7)] 

<h2>^title[]</h2>
<table cellspacing="0">
<tr>
<th scope="col" class="name">Название машин</th>
</tr>
^sql_table_s.menu{
 ^if($sql_table_s.tech_id){
<tr>
	<td><a href="/catalog/belarus/agromash/mashine/teh/id/$sql_table_s.tech_id/">$sql_table_s.name_ru</a></td>
</tr>}{}
}
</table>
}{

^hMachines[]
^connect[$connect_string]{
$sql_table[^table::sql{SELECT * FROM machines LEFT JOIN tech_bobruysk ON tech_bobruysk.machines_id = machines.machines_id}]
}

^navi_sub_nav[]
<h2>^title[]</h2>
^if(^sql_table.locate[tech_id;$form:id]){<h3 title="" class="en" style="margin: 0 0 0.5em 0^;">$sql_table.namenklatura</h3>}{}
<table cellspacing="0">
<tr>
<th scope="col" class="name">Название</th>
<th scope="col" class="name">Параметры</th>
</tr>
^if(def $sql_table.load_capacity){
<tr>
<td>Грузоподъемность</td>
<td>$sql_table.load_capacity т.</td>
</tr>}{}
^if(def $sql_table.capacity_body){
<tr>
<td>Вместимость кузова</td>
<td>$sql_table.capacity_body м&sup3^;</td>
</tr>}{}
^if(def $sql_table.bunker_volume){
<tr>
<td>Объем бункера</td>
<td>$sql_table.bunker_volume л.</td>
</tr>}{}
^if(def $sql_table.length){
<tr>
<td>Длина</td>
<td>$sql_table.length м.</td>
</tr>}{}
^if(def $sql_table.width){
<tr>
<td>Ширина</td>
<td>$sql_table.width м.</td>
</tr>}{}
^if(def $sql_table.height){
<tr>
<td>Высота</td>
<td>$sql_table.height м.</td>
</tr>}{}
^if(def $sql_table.weight){
<tr>
<td>Масса</td>
<td>$sql_table.weight т.</td>
</tr>}{}
^if(def $sql_table.speed){
<tr>
<td>Рабочая скорость</td>
<td>$sql_table.speed км/ч</td>
</tr>}{}
^if(def $sql_table.doses_fertilizers){
<tr>
<td>Дозы внесения</td>
<td>$sql_table.doses_fertilizers</td>
</tr>}{}
^if(def $sql_table.on_course){
<tr>
<td>Неравномерность внесения не более<br />
по ходу движения<br />по ширине внесения</td>
<td><br />$sql_table.on_course<br />$sql_table.on_width</td>
</tr>}{}
^if(def $sql_table.tractor){
<tr>
<td>Класс трактора</td>
<td>$sql_table.tractor</td>
</tr>}{}
^if(def $sql_table.productivity){
<tr>
<td>Производительность</td>
<td>$sql_table.productivity га/ч</td>
</tr>}{}
^if(def $sql_table.fuel_consumption){
<tr>
<td>Удельный расход топлива</td>
<td>$sql_table.fuel_consumption кг/га</td>
</tr>}{}
</table>
}
#@detalTEHNO[]