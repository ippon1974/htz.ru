@USE
FeedRss.p

@getArticles[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		article_id AS id,
		title,
		lead,
		dt
	FROM
		news
	WHERE
		is_published = 1 AND
		dt_published <= ^MAIN:pSQL.now[]
		^if(^hParam.id.int(0)){
			AND article_id = ^hParam.id.int(0)
		}
		^if(def $hParam.sWhere){
			AND $hParam.sWhere
		}
	ORDER BY
		dt DESC
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#end @getArticles[]


@html_[]
$goods[^getArticles[$.limit(25)]]
^goods.menu{
^oFeed.addItem[
	$.title[$goods.title]
	$.guid[http://$env:SERVER_NAME/news/all/$goods.id/]
	$.pubDate[^date::create[$goods.dt]]
	$.author[^taint[ÑÒÐÎÉÏÐÎÅÊÒÌÎÍÒÀÆ <mail@htz.ru>]]
]
}
