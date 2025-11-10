@print_engine[engine_cell]
<ul>
^engine_cell.menu{
       ^print_engine_cell[]
}</ul>

@print_engine_cell[]
<li><a href="/catalog/spare/ctz/t170/transmission/id/$engine_cell.categories_id/">$engine_cell.name_categories</a></li>

@Item[]
^listing[]

@listing[]
$listing[^getProduct_Categories[]]
$cell[^listing.select($listing.catalog_id==$form:products_id)]
<ul>
^untaint[as-is]{
	^cell.menu{
	   <li><a href="/catalog/spare/ctz/t170/detal/id/$cell.categories_id/">$cell.name_categories</a></li>
	}
}</ul>
#@listing[]

@engine[]
^if(!def $form:id){
$pets[ 
   $.98[Элементы трансмиссии] 
   $.110[Валы]
   $.120[Коробка передач]
   $.125[Муфта сцепления]
   $.132[Редукторы бортовые]
]
 <ul>
^pets.foreach[key;value]{ 
       <li><a href="/catalog/spare/ctz/t170/transmission/id/$key/">$value</a></li>
}</ul>
	
}{
	^rem{ *** $form:id определена: достаем и показываем новость с выбранным id *** }
	$engine[^getCatalogNew[]]
	^if($engine){
		$engine_cell[^engine.select($engine.parent_id==$form:id)]
		<ul>
		 ^engine_cell.menu{<li><a href="$engine_cell.patch/products/id/$engine_cell.id/">$engine_cell.title</a></li>}</ul>
	}{
		^rem{ *** указали такую id, новости с которой не существует... посылаем посетителя на... 404 ошибку. *** }
		^Lib:location[/404/]
	}
}
#@html_color[]

@title[]
$title[^table::load[/_root.cfg]]
^if(^title.locate[uri;$request:uri]){ 
$result[$title.title]
}{ 
$result[^title_id[]]
} 
#@hedpage[]

@title_id[]
   $title_id[^getCatalogNew[]]
      ^if(^title_id.locate[id;$form:id]){ 
$result[$title_id.title]
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
   $description_id[^getCatalogNew[]]
      ^if(^description_id.locate[id;$form:id]){ 
$result[$description_id.description_catalog]
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
   $keywords_id[^getCatalogNew[]]
      ^if(^keywords_id.locate[id;$form:id]){ 
$result[$keywords_id.keywords_catalog]
}{ 
$result[]
}
#@description[]