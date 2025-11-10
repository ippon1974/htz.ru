@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title[]</title>
<meta http-equiv="Content-Type" content="text/html^; charset=windows-1251" />
<meta name="description" content="^title[] | Продажа техники завода ХТЗ" />
<meta name="keywords" content="^title[] | ХТЗ, запчасти для тракторов ХТЗ" />

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />

</head>

<body class="events concerts four">
^headFindBlock[]
#@header[]

@title[]
  ^hMachines[]
   $title[^getMachines[]]
    ^if(^title.locate[tehno_info_uri;$request:uri]){$result[Технические характеристики $title.namenklatura ${h_Machines.classification.[$title.classification]}. Сборка ${h_Machines.brand_id.[$title.brand_id]}. ${h_Machines.country_origin_ru.[$title.country_origin_ru]}.]
	}{
	$result[Технические характеристики техники сборки завода &laquo^;ХТЗ&raquo^;]
	}
#@title[]

@namenklatura[]
 $namenklatura[^getMachines[]]
  ^if(^namenklatura.locate[tehno_info_uri;$request:uri]){$namenklatura.namenklatura}{}
#@namenklatura[]

@getTehno[]
^hMachines[]
 $getTehno[^getMachines[]]
   $getTehno_s[^getTehno.select($getTehno.brand_id==5)]
   <table cellspacing="0">
<tr>
<th scope="col" class="name">Номенклатура</th>
<th scope="col">Характеристики</th>
</tr>
    ^getTehno_s.menu{<tr><td>$getTehno_s.namenklatura</td><td><a href="$getTehno_s.tehno_info_uri">$h_Machines.classification.[$getTehno_s.classification] $getTehno_s.namenklatura</a></td></tr>}
</table>
#@getTehno[]