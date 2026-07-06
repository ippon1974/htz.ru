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
<link rel="stylesheet" type="text/css" href="/services/css/style.css" media="all" />
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
$title[^table::load[/_root.cfg]]
^if(^title.locate[uri;$request:uri]){ 
$result[$title.title]
}{ 
$result[]
} 
#@title[]

@description[]
$description[^table::load[/_root.cfg]]
^if(^description.locate[uri;$request:uri]){ 
$result[$description.description]
}{ 
$result[]
} 
#@description[]

@keywords[]
$keywords[^table::load[/_root.cfg]]
^if(^keywords.locate[uri;$request:uri]){ 
$result[$keywords.keywords]
}{ 
$result[]
} 
#@keywords[]

@navi_sub_nav[]
 $navi_sub_nav[^table::load[/services/cutting/materials_list.cfg]]
    ^if(^navi_sub_nav.locate[uri;$request:uri]){<div style="margin: 0 0 0.8em 0^; font-size: 1.2em^;"><a href="/services/cutting/" title="Услуги гидроабразивной резки">Услуги гидроабразивной резки</a> / <strong>$navi_sub_nav.nameletter</strong></div>}{} 
#@navi_sub_nav[]

@menu_step_stone_center[]
 $str[$request:uri]
 $parts[^str.split[/;lh]]
 $menu_step_stone_center[^table::load[/services/makestone/step/menu_step_stone_center.cfg]]
 ^stone_center_cell[]
#@menu_step_stone_center[]

@stone_center_cell[]
 ^if(^menu_step_stone_center.locate[item;$parts.4]){$result[<a href="/services/makestone/" title="Изделия из камня">Изделия из камня</a> / <a href="/services/makestone/step/" title="Ступени">Ступени</a> / ^if(def $form:id){<a href="$menu_step_stone_center.uri" title="$menu_step_stone_center.section">$menu_step_stone_center.section</a> / }{<span style="background: #FFFFCC^;">$menu_step_stone_center.section</span>}]}{
  $result[<a href="/services/makestone/" title="Изделия из камня">Изделия из камня</a>]
 }
#@mstone_center_cell[]


@menu_step_stone_right[]
$menu_step_stone[^table::load[/services/makestone/step/menu_step_stone.cfg]]
<ul class="menu_stone_tablestone">
	^menu_step_stone.menu{
		 ^navigation_item[]
		}
</ul>
#@menu_step_stone_right[]

@navigation_item[]
$str[$request:uri]
$parts[^str.split[/;lh]]
^if($menu_step_stone.uri eq $request:uri){ 
  <li style="font-size: 1.1em^; margin: 0^;padding: 0 4px 0 4px^;"><span style="background-color: #FFFFCC^;">$menu_step_stone.section</span></li>
}{ 
	^if($parts.4 eq $menu_step_stone.item){
		  <li style="margin: 0^;padding: 0 4px 0 4px^;"><a href="$menu_step_stone.uri" title="Ступени $menu_step_stone.title"><span style="color:#600^;background-color: #FFFFCC^;">$menu_step_stone.section</a></span></li>
	}{
		  <li style="margin: 0^;padding: 0 4px 0 4px^;"><a href="$menu_step_stone.uri" title="Ступени $menu_step_stone.title">$menu_step_stone.section</a></li>
	}
} 
#@menu_step_stone[]


@agate[item;name]
$agate[^db::getAgateStep[$.limit(1)]] 
<li>
<dl>
<dt><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.agat_step_name}"><img src="/services/makestone/step/$item/img/list/${$item.agat_step_img}.webp" alt="Cтупень из $name ${$item.agat_step_name}" /></a></dt>
<dd class="delta"><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.agat_step_name}">Ступень из $name ${$item.agat_step_name}</a></dd>
<dd class="delta">Полный список <a href="/services/makestone/step/$item/" title="Полный список ступеней из $name Образцы">ступеней из $name</a> Образцы</dd>
</dl>
</li>
#@agate[]

@aglomerate[item;name]
$aglomerate[^db::getAglomerateStep[$.limit(1)]] 
<li>
<dl>
<dt><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.aglomerate_step_name}"><img src="/services/makestone/step/$item/img/list/${$item.aglomerate_step_img}.webp" alt="Cтупень из $name ${$item.aglomerate_step_name}" /></a></dt>
<dd class="delta"><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.aglomerate_step_name}">Ступень из $name ${$item.aglomerate_step_name}</a></dd>
<dd class="delta">Полный список <a href="/services/makestone/step/$item/" title="Полный список ступеней из $name Образцы">ступеней из $name</a> Образцы</dd>
</dl>
</li>
#@aglomerate[]

@amethyst[item;name]
$amethyst[^db::getAmethystStep[$.limit(1)]] 
<li>
<dl>
<dt><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.amethyst_step_name}"><img src="/services/makestone/step/$item/img/list/${$item.amethyst_step_img}.webp" alt="Cтупень из $name ${$item.amethyst_step_name}" /></a></dt>
<dd class="delta"><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.amethyst_step_name}">Ступень из $name ${$item.amethyst_step_name}</a></dd>
<dd class="delta">Полный список <a href="/services/makestone/step/$item/" title="Полный список ступеней из $name Образцы">ступеней из $name</a> Образцы</dd>
</dl>
</li>
#@amethyst[]

@granite[item;name]
$granite[^db::getGraniteStep[$.limit(1)]] 
<li>
<dl>
<dt><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.granite_step_name}"><img src="/services/makestone/step/$item/img/list/${$item.granite_step_img}.webp" alt="Cтупень из $name ${$item.granite_step_name}" /></a></dt>
<dd class="delta"><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.granite_step_name}">Ступень из $name ${$item.granite_step_name}</a></dd>
<dd class="delta">Полный список <a href="/services/makestone/step/$item/" title="Полный список ступеней из $name Образцы">ступеней из $name</a> Образцы</dd>
</dl>
</li>
#@granite[]

@labradorite[item;name]
$labradorite[^db::getLabradoriteStep[$.limit(1)]]
<li>
<dl>
<dt><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.labradorite_step_name}"><img src="/services/makestone/step/$item/img/list/${$item.labradorite_step_img}.webp" alt="Cтупень из $name ${$item.labradorite_step_name}" /></a></dt>
<dd class="delta"><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.labradorite_step_name}">Ступень из $name ${$item.labradorite_step_name}</a></dd>
<dd class="delta">Полный список <a href="/services/makestone/step/$item/" title="Полный список ступеней из $name Образцы">ступеней из $name</a> Образцы</dd>
</dl>
</li>
#@labradorite[]

@marble[item;name]
$marble[^db::getMarbleStep[$.limit(1)]]
<li>
<dl>
<dt><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.marble_step_name}"><img src="/services/makestone/step/$item/img/list/${$item.marble_step_img}.webp" alt="Cтупень из $name ${$item.marble_step_name}" /></a></dt>
<dd class="delta"><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.marble_step_name}">Ступень из $name ${$item.marble_step_name}</a></dd>
<dd class="delta">Полный список <a href="/services/makestone/step/$item/" title="Полный список ступеней из $name Образцы">ступеней из $name</a> Образцы</dd>
</dl>
</li>
#@marble[]

@onix[item;name]
$onix[^db::getOnixStep[$.limit(1)]]
<li>
<dl>
<dt><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.onix_step_name}"><img src="/services/makestone/step/$item/img/list/${$item.onix_step_img}.webp" alt="Cтупень из $name ${$item.onix_step_name}" /></a></dt>
<dd class="delta"><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.onix_step_name}">Ступень из $name ${$item.onix_step_name}</a></dd>
<dd class="delta">Полный список <a href="/services/makestone/step/$item/" title="Полный список ступеней из $name Образцы">ступеней из $name</a> Образцы</dd>
</dl>
</li>
#@onix[]

@quartz[item;name]
$quartz[^db::getQuartzStep[$.limit(1)]]
<li>
<dl>
<dt><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.quartz_step_name}"><img src="/services/makestone/step/$item/img/list/${$item.quartz_step_img}.webp" alt="Cтупень из $name ${$item.quartz_step_name}" /></a></dt>
<dd class="delta"><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.quartz_step_name}">Ступень из $name ${$item.quartz_step_name}</a></dd>
<dd class="delta">Полный список <a href="/services/makestone/step/$item/" title="Полный список ступеней из $name Образцы">ступеней из $name</a> Образцы</dd>
</dl>
</li>
#@quartz[]

@travertine[item;name]
$travertine[^db::getTravertineStep[$.limit(1)]]
<li>
<dl>
<dt><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.travertine_step_name}"><img src="/services/makestone/step/$item/img/list/${$item.travertine_step_img}.webp" alt="Cтупень из $name ${$item.travertine_step_name}" /></a></dt>
<dd class="delta"><a href="/services/makestone/step/$item/detail/id/${$item.id}/" title="Ступень из $name ${$item.travertine_step_name}">Ступень из $name ${$item.travertine_step_name}</a></dd>
<dd class="delta">Полный список <a href="/services/makestone/step/$item/" title="Полный список ступеней из $name Образцы">ступеней из $name</a> Образцы</dd>
</dl>
</li>
#@travertine[]

@makestone_show_tabletop[]

^hMakeStone[]

<div id="makestone_show_list">

<h3>Весь цикл от замера до монтажа на вашем объекте. Расчет полной стоимости работ. Собственное производство в Москве.</h3>

<ul class="listing">
^granite[granite;гранита]
^marble[marble;мрамора]
^onix[onix;оникса]
^aglomerate[aglomerate;агломерата]
^quartz[quartz;кварца]
^travertine[travertine;травертина]
^labradorite[labradorite;ламбродарита]
^agate[agate;агата]
^amethyst[amethyst;аметиста]
</ul>

</div>
#@makestone_show[]

@works_secondary[]
<div id="makestone_show_right">
<h3>Каталог камня</h3>
</div>
