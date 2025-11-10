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
<body class="services b_services">
#end@header[]

@title[]
  ^hWaterjetMaterials[]
  $title[^table::load[/services/cutting/materials_list.cfg]]
  ^if(^title.locate[uri;$request:uri]){$result[${title.nameletter}. Стоимость раскроя. Гидроабразивная резка.]}{}
#@title[]

@description[]
$description[^table::load[/services/cutting/materials_list.cfg]]
^if(^description.locate[uri;$request:uri]){$result[$description.description]}{}
#@description[]

@keywords[]
$keywords[^table::load[/services/cutting/materials_list.cfg]]
^if(^keywords.locate[uri;$request:uri]){$result[$keywords.keywords]}{}
#@description[]