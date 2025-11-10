@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Утеплители моторов для тракторов и спецтехники</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="Утеплители моторов для тракторов и спецтехники" />
<meta name="keywords" content="Утеплители для тракторов, утеплители для спецтехники" />

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />
</head>
#@header[]

@getInsulation[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		id AS id,
        tech_id,
        material,
        product_desc, 
        img,
        cost
	FROM
		insulation
	WHERE
	     is_published = 1
		^if(^hParam.id.int(0)){
		 AND id = ^hParam.id.int(0)
		}
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getInsulation[]

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


@Insulation[]
^hInsulation[]
<ul>
	<li><a href="#ins_umz" title="Утеплители моторов для ${h_Insulation.factory.[1]}">${h_Insulation.factory.[1]} ${h_Insulation.factory_desc.[1]}</a></li>
	<li><a href="#ins_mtz" title="Утеплители моторов для ${h_Insulation.factory.[2]}">${h_Insulation.factory.[2]} ${h_Insulation.factory_desc.[2]}</a></li>
	<li><a href="#ins_vtz" title="Утеплители моторов для ${h_Insulation.factory.[3]}">${h_Insulation.factory.[3]} ${h_Insulation.factory_desc.[3]}</a></li>
	<li><a href="#ins_atz" title="Утеплители моторов для ${h_Insulation.factory.[4]}">${h_Insulation.factory.[4]} ${h_Insulation.factory_desc.[4]}</a></li>
	<li><a href="#ins_ltz" title="Утеплители моторов для ${h_Insulation.factory.[5]}">${h_Insulation.factory.[5]} ${h_Insulation.factory_desc.[5]}</a></li>
	<li><a href="#ins_vmtz" title="Утеплители моторов для ${h_Insulation.factory.[6]}">${h_Insulation.factory.[6]} ${h_Insulation.factory_desc.[6]}</a></li>
	<li><a href="#ins_htz" title="Утеплители моторов для ${h_Insulation.factory.[7]}">${h_Insulation.factory.[7]} ${h_Insulation.factory_desc.[7]}</a></li>
	<li><a href="#ins_btz" title="Утеплители моторов для ${h_Insulation.factory.[8]}">${h_Insulation.factory.[8]} ${h_Insulation.factory_desc.[8]}</a></li>
	<li><a href="#ins_ctz" title="Утеплители моторов для ${h_Insulation.factory.[9]}">${h_Insulation.factory.[9]} ${h_Insulation.factory_desc.[9]}</a></li>
	<li><a href="#ins_ptz" title="Утеплители моторов для ${h_Insulation.factory.[10]}">${h_Insulation.factory.[10]} ${h_Insulation.factory_desc.[10]}</a></li>
	<li><a href="#ins_amkodor" title="Утеплители моторов для ${h_Insulation.factory.[11]}">${h_Insulation.factory.[11]} ${h_Insulation.factory_desc.[11]}</a></li>
	<li><a href="#ins_kamaz" title="Утеплители моторов для ${h_Insulation.factory.[12]}">${h_Insulation.factory.[12]} ${h_Insulation.factory_desc.[12]}</a></li>
	<li><a href="#ins_uaz" title="Утеплители моторов для ${h_Insulation.factory.[13]}">${h_Insulation.factory.[13]} ${h_Insulation.factory_desc.[13]}</a></li>
	<li><a href="#ins_ural" title="Утеплители моторов для ${h_Insulation.factory.[14]}">${h_Insulation.factory.[14]} ${h_Insulation.factory_desc.[14]}</a></li>
	<li><a href="#ins_csdm" title="Утеплители моторов для ${h_Insulation.factory.[15]}">${h_Insulation.factory.[15]} ${h_Insulation.factory_desc.[15]}</a></li>
	<li><a href="#ins_gaz" title="Утеплители моторов для ${h_Insulation.factory.[17]}">${h_Insulation.factory.[17]} ${h_Insulation.factory_desc.[17]}</a></li>
</ul>


$insulation[^getInsulation[]]
<h3 id="ins_umz">${h_Insulation.factory.[1]} ${h_Insulation.factory_desc.[1]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_umz[^insulation.select($insulation.tech_id==1)]
^ins_umz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_umz.id/" title="Утеплитель на капот. $ins_umz.product_desc">$ins_umz.product_desc</a></td>
    	<td>$ins_umz.cost</td>
	</tr>
}
</table>

<h3 id="ins_mtz">${h_Insulation.factory.[2]} ${h_Insulation.factory_desc.[2]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_mtz[^insulation.select($insulation.tech_id==2)]
^ins_mtz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_mtz.id/" title="Утеплитель на капот. $ins_mtz.product_desc">$ins_mtz.product_desc</a></td>
    	<td>$ins_mtz.cost</td>
	</tr>
}
</table>

<h3 id="ins_vtz">${h_Insulation.factory.[3]} ${h_Insulation.factory_desc.[3]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_vtz[^insulation.select($insulation.tech_id==3)]
^ins_vtz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_vtz.id/" title="Утеплитель на капот. $ins_vtz.product_desc">$ins_vtz.product_desc</a></td>
    	<td>$ins_vtz.cost</td>
	</tr>
}
</table>

<h3 id="ins_atz">${h_Insulation.factory.[4]} ${h_Insulation.factory_desc.[4]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_atz[^insulation.select($insulation.tech_id==4)]
^ins_atz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_atz.id/" title="Утеплитель на капот. $ins_atz.product_desc">$ins_atz.product_desc</a></td>
    	<td>$ins_atz.cost</td>
	</tr>
}
</table>

<h3 id="ins_ltz">${h_Insulation.factory.[5]} ${h_Insulation.factory_desc.[5]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_ltz[^insulation.select($insulation.tech_id==5)]
^ins_ltz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_ltz.id/" title="Утеплитель на капот. $ins_ltz.product_desc">$ins_ltz.product_desc</a></td>
    	<td>$ins_ltz.cost</td>
	</tr>
}
</table>

<h3 id="ins_vmtz">${h_Insulation.factory.[6]} ${h_Insulation.factory_desc.[6]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_vmtz[^insulation.select($insulation.tech_id==6)]
^ins_vmtz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_vmtz.id/" title="Утеплитель на капот. $ins_vmtz.product_desc">$ins_vmtz.product_desc</a></td>
    	<td>$ins_vmtz.cost</td>
	</tr>
}
</table>

<h3 id="ins_htz">${h_Insulation.factory.[7]} ${h_Insulation.factory_desc.[7]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_htz[^insulation.select($insulation.tech_id==7)]
^ins_htz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_htz.id/" title="Утеплитель на капот. $ins_htz.product_desc">$ins_htz.product_desc</a></td>
    	<td>$ins_htz.cost</td>
	</tr>
}
</table>

<h3 id="ins_btz">${h_Insulation.factory.[8]} ${h_Insulation.factory_desc.[8]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_btz[^insulation.select($insulation.tech_id==8)]
^ins_btz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_btz.id/" title="Утеплитель на капот. $ins_btz.product_desc">$ins_btz.product_desc</a></td>
    	<td>$ins_btz.cost</td>
	</tr>
}
</table>

<h3 id="ins_ctz">${h_Insulation.factory.[9]} ${h_Insulation.factory_desc.[9]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_ctz[^insulation.select($insulation.tech_id==9)]
^ins_ctz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_ctz.id/" title="Утеплитель на капот. $ins_ctz.product_desc">$ins_ctz.product_desc</a></td>
    	<td>$ins_ctz.cost</td>
	</tr>
}
</table>

<h3 id="ins_ptz">${h_Insulation.factory.[10]} ${h_Insulation.factory_desc.[10]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_ptz[^insulation.select($insulation.tech_id==10)]
^ins_ptz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_ptz.id/" title="Утеплитель на капот. $ins_ptz.product_desc">$ins_ptz.product_desc</a></td>
    	<td>$ins_ptz.cost</td>
	</tr>
}
</table>

<h3 id="ins_amkodor">${h_Insulation.factory.[11]} ${h_Insulation.factory_desc.[11]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_amkodor[^insulation.select($insulation.tech_id==11)]
^ins_amkodor.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_amkodor.id/" title="Утеплитель на капот. $ins_amkodor.product_desc">$ins_amkodor.product_desc</a></td>
    	<td>$ins_amkodor.cost</td>
	</tr>
}
</table>

<h3 id="ins_kamaz">${h_Insulation.factory.[12]} ${h_Insulation.factory_desc.[12]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_kamaz[^insulation.select($insulation.tech_id==12)]
^ins_kamaz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_kamaz.id/" title="Утеплитель на капот. $ins_kamaz.product_desc">$ins_kamaz.product_desc</a></td>
    	<td>$ins_kamaz.cost</td>
	</tr>
}
</table>

<h3 id="ins_uaz">${h_Insulation.factory.[13]} ${h_Insulation.factory_desc.[13]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_uaz[^insulation.select($insulation.tech_id==13)]
^ins_uaz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_uaz.id/" title="Утеплитель на капот. $ins_uaz.product_desc">$ins_uaz.product_desc</a></td>
    	<td>$ins_uaz.cost</td>
	</tr>
}
</table>

<h3 id="ins_ural">${h_Insulation.factory.[14]} ${h_Insulation.factory_desc.[14]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_ural[^insulation.select($insulation.tech_id==14)]
^ins_ural.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_ural.id/" title="Утеплитель на капот. $ins_ural.product_desc">$ins_ural.product_desc</a></td>
    	<td>$ins_ural.cost</td>
	</tr>
}
</table>

<h3 id="ins_csdm">${h_Insulation.factory.[15]} ${h_Insulation.factory_desc.[15]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_csdm[^insulation.select($insulation.tech_id==15)]
^ins_csdm.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_csdm.id/" title="Утеплитель на капот. $ins_csdm.product_desc">$ins_csdm.product_desc</a></td>
    	<td>$ins_csdm.cost</td>
	</tr>
}
</table>

<h3 id="ins_gaz">${h_Insulation.factory.[17]} ${h_Insulation.factory_desc.[17]}</h3>
<table class="price_table" cellspacing="0">
<tr>
<th>Название</th>
<th>Цена</th>
</tr>
$ins_gaz[^insulation.select($insulation.tech_id==17)]
^ins_gaz.menu{
    <tr>
    	<td><a href="/catalog/spare/insulation/detail/id/$ins_gaz.id/" title="Утеплитель на капот. $ins_gaz.product_desc">$ins_gaz.product_desc</a></td>
    	<td>$ins_gaz.cost</td>
	</tr>
}
</table>

#end @Insulation[]

@phoneForParts[]
$result[+7 (925) 585-33-71 (c 9:00 до 19:00 в рабочии дни)]