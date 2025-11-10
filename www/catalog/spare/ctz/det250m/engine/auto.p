@print_engine[engine_cell]
<ul>
^engine_cell.menu{
       ^print_engine_cell[]
}</ul>

@print_engine_cell[]
<li><a href="http://www.htz.ru/catalog/spare/ctz/det250m/engine/id/$engine_cell.id/">$engine_cell.name</a></li>

@Item[color]
^listing[]

@listing[]
$listing[^getProducts[]]
$cell[^listing.select($listing.category_id==$form:id)]
<ul>
^untaint[as-is]{
	^cell.menu{
          ^listClass_cell[]
	}
}</ul>

@listClass_cell[]
^if(def $cell.product_code){
<li><a href="http://www.htz.ru/catalog/spare/ctz/det250m/detal/id/$cell.id/">$cell.name</a> (<em>номер: $cell.product_code</em> )</li>
}{
<li><a href="http://www.htz.ru/catalog/spare/ctz/det250m/detal/id/$cell.id/">$cell.name</a></li>
}


#@listClass[]

@engine[]
^if(!def $form:id){
	$engine[^getCategories[]]
	  $engine_cell[^engine.select($engine.catalog_id==1)]
	^if($engine_cell){
		^print_engine[$engine_cell]
	}{
		<p>Не найдено.</p>
	}
}{
	^rem{ *** $form:id определена: достаем и показываем новость с выбранным id *** }
	$engine[^getCategories[$.id(^form:id.int(0))]]
	^if($engine){
		^Item[$engine]
	}{
		^rem{ *** указали такую id, новости с которой не существует... посылаем посетителя на... 404 ошибку. *** }
		^Lib:location[/404/]
	}
}
#@html_color[]