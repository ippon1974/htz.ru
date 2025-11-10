@Itemdetail[detail]
<div id="tehnobody">
^untaint[as-is]{
	^Item_call[]
}</div>

@Item_call[]
<span>^dtf:format[%d %h %Y;]</span>
<h3>Информация о запчасти</h3>
<dl id="info">
            <dt>Название:</dt>
			<dd><strong style="background-color: #F5F5DC^;">$detail.name</strong></dd>
            <dt>Номер:</dt><dd><strong style="background-color: #F5F5DC^;">$detail.product_code</strong></dd>
            <dt>Назначение:</dt>
			<dd>ХТЗ Т-150 К09</dd>
			<dt>Наличие:</dt>
			<dd>Под заказ</dd>
			<dt>Телефон:</dt>
			<dd>^phoneForParts[]</dd>
			<dt>Эл. почта:</dt>
			<dd>^mailto:print[mail@htz.ru][<strong>mail@htz.ru</strong>][ООО "СТРОЙПРОЕКТМОНТАЖ"]</dd>
</dl>
#end @printArticleItem[]


@detail[]
$detail[^getProducts[$.id(^form:id.int(0))]]
^if($detail){
        ^Itemdetail[]
	}{^Lib:location[/404/]}
#@detail[]

@title[]
 $title[^getProducts[$.id(^form:id.int(0))]]
       $result[$title.name Номер детали: $title.product_code]
#@title[]

@description[]
  $description[^getProducts[$.id(^form:id.int(0))]]
       $result[Запасные части для трактора ХТЗ Т-150 К09]
#@description[]

@keywords[]
$keywords[^getProducts[$.id(^form:id.int(0))]]
       $result[Запчасти ХТЗ Т-150 К09, Запчасти для трактора Т-150]
#@keywords[]

@nav_sub_sub_menu[]
 ^if(^form:id.int(0)){

	$product[^getProducts[$.id(^form:id.int(0))]]
    $cat[^getCategories[$.id($product.categoryID)]]
	$cat_cat[^getCategories[$.id($cat.parent)]]
	$cat_cat_cat[^getCategories[$.id($cat_cat.parent)]]


   

	 <div style="margin: 0 0 1em 0^;font-size: 1.2em^;">
      <a href="$cat_cat_cat.patch" title="$cat_cat_cat.name">$cat_cat_cat.name</a> /
      <a href="^cat_cat_cat.patch.trim[right;/]/id/$cat_cat.id/" title="$cat_cat.name">$cat_cat.name</a> /
      <a href="/catalog/spare/htz/t150/products/id/$cat.id/" title="$cat.name">$cat.name</a>
     </div>

    
 }
#@nav_sub_sub_menu[]