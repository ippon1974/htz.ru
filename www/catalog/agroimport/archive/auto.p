@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>^title_htz[]</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^title_htz[] ^description[]" />
<meta name="keywords" content="^title_htz[] ^keywords[]" />

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />

</head>
<body class="events competitions">
#end@header[]

@title_htz[]
^hMachines[]
$title_htz[^table::load[/_root.cfg]]
$str[$request:uri]
 ^if(^title_htz.locate[uri;$request:uri]){
   $result[$title_htz.title]
 }{$result[Тракторы общего назначения сборки ООО «Агроимпорт».]}
#@title[]

@description[]
^hMachines[]
 $description[^getMachines[
 $.id(^form:id.int(0))
 ]]
  ^if(^description.locate[translite;$form:translite]){$result[$h_Machines.description.[$description.classification]]}{$result[.]}
#@description[]

@keywords[]
^hMachines[]
 $keywords[^getMachines[]]
  ^if(^keywords.locate[translite;$form:translite]){$result[$h_Machines.keywords.[$keywords.classification]]}{$result[.]}
#@description[]


@getARCHIVE[]
^if(!def $form:translite){
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==6)]
  $price[^getPriceMachines[]]
  $price_hash[^price.hash[id]]  
  <h2>Архив техники производство ООО «Агроимпорт». (Украина).</h2>
  <ul class="listing">
  ^mashine_s.menu{
    ^if($mashine_s.classification_sub_sub_uri eq "archive"){
	
    $mashine_price[$price_hash.[$mashine_s.id].price] 
	$text(^eval($mashine_price*^exchange_usd[]))
	$str[$request:uri]
    $parts[^str.split[/;lh]] 
    $parts_uti[$parts.0/$parts.1/$parts.2]
	<li>
    <dl>
    <dt><a href="$parts_uti/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/" title="$mashine_s.title"><img src="/catalog/img/front/${mashine_s.img_front}.jpg" alt="$mashine_s.title" /></a> <a href="$parts_uti/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/" title="$mashine_s.title">$mashine_s.title</a></dt>
    <dd style="text-transform: uppercase^; font-size: 0.8em^; color: #669933^;">$h_Machines.classification_sub.[$mashine_s.classification_sub]</dd>					
    <dd>^if($mashine_price){$text(^eval($mashine_price*^exchange_usd[])) <strong style="color:#ff0000^;">$text</strong> руб. <em style="color: #143B27^; font-size: 0.9em^;">$text_nds($text/6.55557) ^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.}{}</em></dd>					
    <dd><p>$mashine_s.lead</p></dd>
    </dl>
    </li>
	}{}
	}
  </ul>
}{}
#@getAGROIMPORTGen[]
