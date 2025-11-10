@header[]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<!-- Copyright (c) STROYPROEKTMONTAZH | http://www.htz.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>^page_select[]</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
<meta name="description" content="^page_select[] | Новости строительных рынков тяжелого машиностроения." />
<meta name="keywords" content="^page_select[] | Тракторы, комбайны, бетононасосы, дорожные катки, бульдозеры, фронтальные погрузчики, компакторы, виброкатки." />

<link rel="stylesheet" type="text/css" href="/css/screen.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
<link rel="shortcut icon" href="/ico.ico" /> 
<!--[if gte IE 6]><link href="/css/ie6.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<!--[if gte IE 7]><link href="/css/ie7.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
<script src="/js/functions.js" type="text/javascript" charset="utf-8"></script>	

<link rel="alternate" type="application/rss+xml" title="" href="http://www.htz.ru/news/rss/rss/" />

</head>

<body class="blog">
^headFindBlock[]

@getArticles[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		article_id AS id,
		title,
		lead,
		image,
		last_id,
		dt,
		catalog,
		uri
		^if(^hParam.id.int(0)){
			,body
		}
	FROM
		news, navigation
	WHERE
		is_published = 1 AND
		dt_published <= ^MAIN:pSQL.now[]
		^if(^hParam.id.int(0)){
			AND article_id = ^hParam.id.int(0)
		}
		^if(def $hParam.Where){
			AND $hParam.Where
		}
			AND parents_id = '1'
	ORDER BY
		dt DESC
}[
	^if(def $hParam.Limit){$.limit($hParam.Limit)}
	^if(def $hParam.Offset){$.offset($hParam.Offset)}
]]
#end @getArticles[]

@printArticlesList[tArticle]
<h2>$tArticle.catalog</h2>
^untaint[as-is]{
<ul class="listing">
	^tArticle.menu{
	     ^printArticlesList_cell[]
	}
</ul>
}
#end @printArticlesList[]

@printArticlesList_cell[]
^if($tArticle.id eq $tArticle.last_id){
           <li><dl>
           <dt class="dateindex">^dtf:format[%d.%m.%Y;$tArticle.dt]</dt>
		   <dd><a title="$tArticle.title" href="/news/all/$tArticle.id/"><img src="/upload/small/$tArticle.image" alt="$tArticle.title" /></a></dd>
		   <dd>^printTitle[$tArticle]</dd>
		   <dd>$tArticle.lead</dd></dl></li>
}{
           <li><dl>
           <dt class="dateindex">^dtf:format[%d.%m.%Y;$tArticle.dt]</dt>
		   <dd>^printTitle[$tArticle]</dd>
		   <dd>$tArticle.lead</dd></dl></li>
}
#end@printArticlesList_cell[]

@printTitle[tArticle]
^if(def $tArticle.title && ^tArticle.title.match[\^[[^^\^]]+\^]]){
	$result[^tArticle.title.match[\^[([^^\^]]+)\^]][g]{<a title="$tArticle.title" href="/news/all/$tArticle.id/">$match.1</a>}]
}{
    $result[<a title="$tArticle.title" href="/news/all/$tArticle.id/">$tArticle.title</a>]
}
#end @printTitle[]

@printArticleItem[tArticle]
^untaint[as-is]{
	^if(def $tArticle.title){<h2>^tArticle.title.match[[\[\]]][g]{}</h2>}
	<span>^dtf:format[%d %h %Y;$tArticle.dt;$dtf:rr-locale]</span>
	^printArticleItem_call[]
}

@printArticleItem_call[]
^if($tArticle.id eq $tArticle.last_id){
$result[<img src="/upload/$tArticle.image" alt="$tArticle.title" />^tArticle.body.match[(?<![="])((?i:https?://|ftp://|mailto:)(?:[:\w~%{}./?=&@,#-]+))][g]{<a href="$match.1">$match.1</a>}]
}{
$result[^tArticle.body.match[(?<![="])((?i:https?://|ftp://|mailto:)(?:[:\w~%{}./?=&@,#-]+))][g]{<a href="$match.1">$match.1</a>}]
}
#end @printArticleItem[]

@printNewsDescription[tArticle]
^if($tArticle.uri ne $request:uri){
$result[^untaint[as-is]{$tArticle.title}]
}{
$result[$tArticle.catalog]
}
#@printNewsDescription[tArticle]

@page_select[]
	$tArticle[^getArticles[
		$.id(0)
		^if(^form:id.int(0)){
			$.Where[]
		}{
			$.Limit(1)
		}
	]]
	^if($tArticle){$result[^printNewsDescription[$tArticle]]}
}{
	$tArticle[^getArticles[
		$.id(0)
		$.id(^form:id.int(0))
	]]
	^if($tArticle){$result[^printNewsDescription[$tArticle]]
	}
}
#@page_select[]



@getCalendar[lparams][params]
$params[^hash::create[$lparams]]
$result[^MAIN:pSQL.sql[table]{
	SELECT
		^MAIN:pSQL.month[dt] AS month,
		^MAIN:pSQL.year[dt] AS year
	FROM
		news
	WHERE
	    article_type_id = ^hParam.article_type_id.int(0) AND
		is_published = 0 AND
		dt_published <= ^MAIN:pSQL.now[]   		
	GROUP BY
		year DESC,
		month DESC          
}]
#end @getCalendar[]


@printCalendar[calendar][now;curr_year;curr_month;y_hash;ym_hash;i;m]
^if($calendar){
	$now[^date::now[]]
	$curr_year(^form:year.int(^dtf:format[%Y]))
	$curr_month(^form:month.int(^dtf:format[%m]))

	^calendar.offset(-1)
	$min_year($calendar.year)
	$min_month($calendar.month)

	$y_hash[^calendar.hash[year;year][$.distinct(1)]]
	$ym_hash[^calendar.hash{^calendar.year.format[%04d]=^calendar.month.format[%02d]}[month][$.distinct(1)]]
	$year[^y_hash._keys[]]
	^year.sort($year.key)[desc]

	<table align="right" border="0" cellpadding="0" cellspacing="0">
	<tr valign="top">
		<td>
			^year.menu{
				<strong>^if($year.key == $curr_year){
					$year.key &nbsp^;
				}{
					^rem{ *** если кликнем в год, по попадем на последний месяц года, 
						за который у нас есть новости *** }
					^if(^calendar.locate[year;$year.key]){}
					<a href="/news/$year.key/month/$calendar.month/">$year.key</a>
				}
				</strong><br />
			}
		</td>
		<td>
			^if(^year.locate[key;$curr_year]){}
#			^year.menu{
#				^if($year.key == $curr_year){
					^for[i](0;11){
						$m(12-$i)
						^if(def $form:month && $m == $curr_month){
							<b>$dtf:[ri-locale].month.$m</b><br />
						}{
							^if(!($now.year == $year.key && $m > $now.month) && !($year.key == $min_year && $m < $min_month)){
								^if($ym_hash.[^year.key.format[%04d]=^m.format[%02d]]){
									<a href="/news/$year.key/month/$m/">$dtf:[ri-locale].month.$m</a>
								}{
									$dtf:[ri-locale].month.$m
								}
								<br />
							}
						}
					}
#				}
#			}
		</td>
	</tr>
	</table>
}
#end @printCalendar[]
@html_calendar[]
^if(!def $form:id){
	^rem{ *** $form:id не определена: показываем календарь со списком новостей *** }

	^rem{ *** получаем информацию о календаре и выводим его *** }
	
	$calendar[^getCalendar[$.iArticleTypeId(2)]]
    ^printCalendar[$calendar]
}
#@html_news[]


@html_news[]
^if(!def $form:id){
	^rem{ *** $form:id не определена: показываем календарь со списком новостей *** }

	^rem{ *** получаем информацию о календаре и выводим его *** }
	
	^rem{ *** получаем список последних новостей или новостей за указанный период и выводим его *** }
	$tArticle[^getArticles[
		$.iArticleTypeId(0)
		^if(^form:year.int(0)){
			$.Where[dt >= '^form:year.int(0)-^form:month.int(0)-00' AND dt <= '^form:year.int(0)-^form:month.int(0)-31']
		}{
			$.Limit(40)
		}
	]]
	^if($tArticle){
		^printArticlesList[$tArticle]
	}{
		<p>Не найдено ни одной новости за указаный период.</p>
	}
}{
	^rem{ *** $form:id определена: достаем и показываем новость с выбранным id *** }
	$tArticle[^getArticles[
		$.iArticleTypeId(0)
		$.id(^form:id.int(0))
	]]
	^if($tArticle){
		^printArticleItem[$tArticle]
	}{
		^rem{ *** указали такую id, новости с которой не существует... посылаем посетителя на... 404 ошибку. *** }
		^Lib:location[/404/]
	}
}
#@html_news[]


@id_select[]
$sections[^table::load[/news/title.cfg]]
^if(^sections.locate[uri;$request:uri]){
$result[^sections.name.trim[]]
}{
$result[^printTitle[$tArticle]]
}
#end @id_select_cell[]