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
$result[Фотографии плиток из природного камня. Все форматы. Все цвета]
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


@html_foto[]
^h_all[]
^foto[]
#@html_foto[]

@foto[]
 $foto[^getProductsStore[]]
  $foto_cell[^foto.select($foto.products_type==1)] 
   <table class="altImg">
          <tr><th><span>Все цветаа</span></th></tr>
              <tr><td><div class="works_works">
     ^foto_cell.menu{
	   <ins class="work_works"><div class="r"><a href="/store/detal/id/$foto_cell.id/"><img style="margin: 0^;" src="/store/img/i/${foto_cell._img}.jpg" alt="$foto_cell.products_name_en" width="50px" height="50px" border="0" /></a><br /><span class="line_bottom"><a href="/store/detal/id/$foto_cell.id/">$foto_cell.products_name_en</a></span></div></ins>
	 }</div></td></tr></table>
  
#end @foto[]








