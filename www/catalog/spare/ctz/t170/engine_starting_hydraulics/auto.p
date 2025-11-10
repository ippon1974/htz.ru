@print_engine[engine_cell]
<ul>
^engine_cell.menu{
       ^print_engine_cell[]
}</ul>

@print_engine_cell[]
<li><a href="/catalog/spare/ctz/t170/engine_starting_hydraulics/id/$engine_cell.categories_id/" title="$engine_cell.name_categories">$engine_cell.name_categories</a></li>

@Item[]
^listing[]

@listing[]
$listing[^getProduct_Categories[]]
$cell[^listing.select($listing.catalog_id==$form:products_id)]
<ul>
^untaint[as-is]{
	^cell.menu{
	   <li><a href="/catalog/spare/ctz/t170/detal/id/$cell.categories_id/" title="$cell.name_categories">$cell.name_categories</a></li>
	}
}</ul>
#@listing[]

@engineT_170[]
^if(!def $form:id){
$pets[ 
   $.70[Двигатель пусковой] 
   $.73[Гидросистема]
]
 <ul>
^pets.foreach[key;value]{ 
       <li><a href="/catalog/spare/ctz/t170/engine_starting_hydraulics/id/$key/" title="$value">$value</a></li>
}</ul>
	
}{
	$engine[^getCatalogNew[]]
	^if($engine){
		$engine_cell[^engine.select($engine.parent_id==$form:id)]
		<ul>
		 ^engine_cell.menu{<li><a href="$engine_cell.patch/products/id/$engine_cell.id/" title="$engine_cell.title">$engine_cell.title</a></li>}</ul>
	}{
		^Lib:location[/404/]
	}
}
#@engineT_170[]

@title[]
$title[^table::load[/_root.cfg]]
^if(^title.locate[uri;$request:uri]){ 
$result[$title.title]
}{ 
$result[^title_id[]]
} 
#@title[]

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