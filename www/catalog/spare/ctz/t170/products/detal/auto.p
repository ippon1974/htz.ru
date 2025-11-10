@Itemdetail[detail]
<div id="tehnobody">
^untaint[as-is]{
	^Item_call[]
}</div>

@Item_call[]
^if($detail.id eq $detail.last_insert_id){
$result[
<span>^dtf:format[%d %h %Y;]</span>
<h3>Информация о продукте</h3>

$text(^detail.price.trim[])
$text_nds($text/6.55557)
<h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4><div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>

<dl id="info">
			<dt>Сегодня:</dt>
			<dd><abbr class="dtstart">^dtf:format[%d %h %Y;]г.</abbr></dd>
			<dt>Дата публикации:</dt>
			<dd>^dtf:format[%d %h %Y;$tehno.dt;$dtf:rr-locale]г.</dd>
			<dt>Тип:</dt>
			<dd>$tehno.type_name</dd>
			<dt>Бренд:</dt>
			<dd>&laquo^;$tehno.brand&raquo^;</dd>
			<dt>Страна:</dt>
			<dd>$tehno.country_manufacturer</dd>
			<dt>Номенклатура:</dt>
			<dd><strong>$tehno.nomenclature</strong></dd>
			<dt>Год выпуска:</dt>
			<dd><strong>$tehno.year</strong></dd>
			<dt>Наработка:</dt>
			<dd>$tehno.work (<em>моточасы</em>)</dd>
			<dt>Состояние:</dt>
			<dd>$tehno.state</dd>
			<dt>Описание:</dt>
			<dd>$tehno.lead</dd>
			<dt>Таможня:</dt>
			<dd>Россия</dd>
			<dt>Стоянка:</dt>
			<dd>$tehno.parking</dd>
			<dt>Телефон:</dt>
			<dd>^my_phone[]</dd>
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>	
</dl>

<div><a class="popup" id="feedbackLink" onclick="return false" href="/catalog/use/screen/id/$tehno.id/"><img src="/catalog/use/i/small/$tehno.img_1" alt="$tehno.name" /></a><a class="popup" id="feedbackLink" onclick="return false" href="/catalog/use/screen/id/$tehno.id/"><img src="/catalog/use/i/small/$tehno.img_2" alt="$tehno.name" /></a><a class="popup" id="feedbackLink" onclick="return false" href="/catalog/use/screen/id/$tehno.id/"><img src="/catalog/use/i/small/$tehno.img_3" alt="$tehno.name" /></a></div>

]
}{
$result[

<span>^dtf:format[%d %h %Y;]</span>
<h3>Информация о запчасти</h3>

$text(^detail.price.trim[])
$text_nds($text/6.55557)
^if($detail.price){
<h4>^number_format[^text.format[%.2f];,;.](2) руб.</h4><div class="price">^int2str:money2str($text) В том числе НДС 18%: ^number_format[^text_nds.format[%.2f];,;.](2) руб.</div>
}{

}
<dl id="info">
            <dt>Название:</dt>
			<dd><strong style="background-color: #F5F5DC^;">$detail.name_products</strong></dd>
            ^if(def $detail.product_code){<dt>Номер:</dt><dd><strong style="background-color: #F5F5DC^;">$detail.product_code</strong></dd>}{}
            <dt>Назначение:</dt>
			<dd>ЧТЗ Т-170</dd>
			<dt>Наличие:</dt>
			<dd>$detail.presence</dd>
			<dt>Производство:</dt>
			<dd><a href="/catalog/ctz/">&laquo^;$detail.brand&raquo^;</a></dd>
			<dt>Страна:</dt>
			<dd>$detail.country</dd>
			<dt>Телефон:</dt>
			<dd>^phone_company[]</dd>
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
</dl>
#send[]
]
}
#end @printArticleItem[]


#end @printArticleItem[]

@detail[]
$detail[^getProducts[$.id(^form:id.int(0))]]
^if($detail){
        ^Itemdetail[$detail]
	}{
		^rem{ *** указали такую id, новости с которой не существует... посылаем посетителя на... 404 ошибку. *** }
		^Lib:location[/404/]
	}
#@detail[]

@title[]
$title[^table::load[/_root.cfg]]
^if(^title.locate[uri;$request:uri]){ 
$result[$title.title]
}{ 
$result[^title_id[]]
} 
#@hedpage[]

@title_id[]
   $title_id[^getProducts[]]
      ^if(^title_id.locate[id;$form:id]){ 
$result[$title_id.name_products $title_id.product_code]
}{ 
$result[]
}
#@title_id[]

@description[]
$description[^table::load[/_root.cfg]]
^if(^description.locate[uri;$request:uri]){ 
$result[$description.description]
}{ 
$result[^description_id[]]
} 
#@hedpage[]

@description_id[]
   $description_id[^getProducts[]]
      ^if(^description_id.locate[id;$form:id]){ 
$result[$description_id.description_products]
}{ 
$result[]
}
#@description[]

@keywords[]
$keywords[^table::load[/_root.cfg]]
^if(^keywords.locate[uri;$request:uri]){ 
$result[$keywords.keywords]
}{ 
$result[^keywords_id[]]
} 
#@hedpage[]

@keywords_id[]
   $keywords_id[^getProducts[]]
      ^if(^keywords_id.locate[id;$form:id]){ 
$result[$keywords_id.keywords_products]
}{ 
$result[]
}
#@description[]

@nav_sub_sub_menu[]
 ^if(^form:id.int(0)){

	$product[^getProducts[$.id(^form:id.int(0))]]
    $cat_temp[^getCatalogNew[$.id($product.parent_id)]]
    $cat_root[^getCatalogNew[$.id($cat_temp.parent_id)]]
	
	<div style="margin: 0 0 1em 0^;font-size: 1.2em^;">
    ^switch[$cat_root.catalog_name]{
      ^case[engine]{<a href="$cat_root.patch/engine/" title="Двигатель">Двигатель</a>} / 
      ^case[engine_starting_hydraulics]{<a href="$cat_root.patch/engine_starting_hydraulics/" title="Двигатель пусковой и гидросистема">Двигатель пусковой и гидросистема</a> / }
      ^case[transmission]{<a href="$cat_root.patch/transmission/" title="Трансмиссия">Трансмиссия</a> / }
      ^case[chassis]{<a href="$cat_root.patch/chassis/" title="Ходовая часть">Ходовая часть</a> / }
      ^case[tractor]{<a href="$cat_root.patch/tractor/" title="Управление трактором">Управление трактором</a> / }
      ^case[electric]{<a href="$cat_root.patch/electric/" title="Электрооборудование">Электрооборудование</a> / }
      ^case[body]{<a href="$cat_root.patch/body/" title="Кузов">Кузов</a>}
      ^case[DEFAULT]{} 
    } 
    <a href="$cat_root.patch/$cat_root.catalog_name/id/$cat_root.id/" title="$cat_root.title">$cat_root.title</a>  / <a href="$cat_temp.patch/products/id/$cat_temp.id/" title="$cat_temp.title">$cat_temp.title</a></div>
 }
#@nav_sub_sub_menu[]


