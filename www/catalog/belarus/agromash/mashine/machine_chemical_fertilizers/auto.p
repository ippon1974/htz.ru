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
<body class="events b_agromash">
#end@header[]

@title[]
 $title[^table::load[/_root.cfg]]
  ^if(^title.locate[uri;$request:uri]){$result[$title.title]}{}
#@title[]


@getAGROMASH[]
^if(!def $form:id){
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==7)]
  $mashine_s_s[^mashine_s.select($mashine_s.classification==20)]
  $price[^getPriceMachines[]]
  $price_hash[^price.hash[id]]  
  <h2>^title[]. ${h_Machines.brand_id.[$mashine_s_s.brand_id]}. ($h_Machines.country_origin_ru.[$mashine_s_s.country_origin_ru])</h2>
  <ul class="listing">
  ^mashine_s_s.menu{ 
    $mashine_price[$price_hash.[$mashine_s_s.id].price] 
	$text(^eval($mashine_price*^exchange_usd[]))
	$str[$request:uri]
    $parts[^str.split[/;lh]] 
    $parts_uti[$parts.0/$parts.1/$parts.2]
	<li>
    <dl>	
    <dt><a href="/catalog/belarus/agromash/mashine/detal/id/$mashine_s_s.id/" title="$mashine_s_s.title"><img src="/catalog/img/front/${mashine_s_s.img_front}.jpg" alt="$mashine_s_s.title" /></a> <a href="/catalog/belarus/agromash/mashine/detal/id/$mashine_s_s.id/" title="$mashine_s_s.title">$mashine_s_s.title</a></dt>
    <dd style="text-transform: uppercase^; font-size: 0.8em^; color: #669933^;">$h_Machines.classification_sub.[$mashine_s_s.classification_sub]</dd>					
    <dd>^if($mashine_price){$text(^eval($mashine_price*^exchange_usd[])) <strong style="color:#ff0000^;">$text</strong> руб. <em style="color: #143B27^; font-size: 0.9em^;">$text_nds($text/6.55557) ^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.}{}</em></dd>					
    <dd><p>$mashine_s_s.lead</p></dd>
    </dl>
    </li>
	}
  </ul>
}{}
#@getAGROIMPORTGen[]