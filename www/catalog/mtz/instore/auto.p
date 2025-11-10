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
<body class="events mtz">
#end@header[]

@title[]
 $title[^table::load[/_root.cfg]]
  ^if(^title.locate[uri;$request:uri]){$result[$title.title]}{}
#@title[]


@getALL[]
^if(!def $form:id){
^hMachines[]
 $mashine[^getMachines[]]
  $mashine_s[^mashine.select($mashine.brand_id==9)]
  $mashine_s_s[^mashine_s.select($mashine_s.parking_citi==1)]
  ^mashine_s_s.sort{$mashine_s_s.namenklatura}
  $price[^getPriceMachines[]]
  $price_hash[^price.hash[id]] 
  
  $img_patch[^db:getImgPatch[]]
  $img_patch_hash[^img_patch.hash[id]]
  
  $str[$request:uri] 
  $parts[^str.split[/;lh]]
  <div style="margin: 0 0 0.8em 0^; font-size: 1.5em^;"><a href="/catalog/mtz/" title="Техника ПО МТЗ">Техника ПО &laquo^;МТЗ&raquo^;</a></div>
  <h2>^title[].</h2>
  <ul class="listing">
  <form action="/catalog/mtz/compare/" method="POST">
  <input type="Hidden" name="item" value="$parts.3" />
  ^mashine_s_s.menu{ 
    $mashine_img_patch[$img_patch_hash.[$mashine_s_s.id].patch_img]
	$str[$mashine_img_patch] 
	$parts[^str.split[,;lh]]
    $mashine_price[$price_hash.[$mashine_s_s.id].price] 
	$text(^eval($mashine_price*^exchange_usd[]))
	
	<li>
    <dl>	
    <dt>^if(def $parts.0){<a href="/catalog/mtz/detal/id/$mashine_s_s.id/" title="$mashine_s_s.title"><img src="/catalog/img/front/${parts.0}.jpg" alt="$mashine_s_s.title" /></a>}{} <a href="/catalog/mtz/detal/id/$mashine_s_s.id/" title="$mashine_s_s.title">$mashine_s_s.title</a></dt>
    <dd style="text-transform: uppercase^; font-size: 0.8em^; color: #669933^;">$h_Machines.classification_sub.[$mashine_s_s.classification_sub]</dd>					
    <dd>^if($mashine_price){$text(^eval($mashine_price*^exchange_usd[])) <strong style="color:#ff0000^;">$text</strong> руб. <em style="color: #143B27^; font-size: 0.9em^;">$text_nds($text/6.55557) ^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.}{}</em></dd>					
    <dd><p>$mashine_s_s.lead</p></dd>
    <dd><p align="right"><span style="color:#990000^;">Сравнить</span>&nbsp^;&nbsp^;<input type=checkbox name=id value="$mashine_s_s.id" /></p></dd>
	</dl>
    </li>
	}
  <p align="right"><input type=submit value="Сравнить" style="font-size: 15px^; width: 25%^; height: 30px^; color:#000^; text-transform: uppercase^; margin: 0^; border: 2px solid^; border-color: #eaeaea #000 #000 White^;"></p>
  </form>
  </ul>
}{}
#@getAGROIMPORTGen[]