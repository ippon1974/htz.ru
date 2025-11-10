@products[]
$products[^getProducts[]]
   $products_cell[^products.select($products.parent_id==$form:id)] 
<ul>
    ^products_cell.menu{<li><a href="/catalog/spare/ctz/t170/products/detal/id/$products_cell.id/" title="$products_cell.name_products">$products_cell.name_products</a> <em style="color:#7e7e7e^;">^products_cell.product_code.trim[]</em></li>}
</ul>
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
   $keywords_id[^getCatalogNew[]]
      ^if(^keywords_id.locate[id;$form:id]){ 
$result[$keywords_id.keywords_catalog]
}{ 
$result[]
}
#@description[]

@nav_sub_sub_menu[]
 ^if(^form:id.int(0)){

     $cat[^getCatalogNew[$.id(^form:id.int(0))]]
     $cat_temp[^getCatalogNew[$.id($cat.parent_id)]]
     $cat_root[^getCatalogNew[$.id($cat_temp.parent_id)]]
     
     <div style="margin: 0 0 1em 0^;font-size: 1.2em^;">
      ^switch[$cat.catalog_name]{ 
      ^case[engine]{<a href="$cat.patch/engine/" title="ƒвигатель">ƒвигатель</a>}
      ^case[engine_starting_hydraulics]{<a href="$cat.patch/engine_starting_hydraulics/" title="ƒвигатель пусковой и гидросистема">ƒвигатель пусковой и гидросистема</a>}
      ^case[transmission]{<a href="$cat.patch/transmission/" title="“рансмисси€">“рансмисси€</a>}
      ^case[chassis]{<a href="$cat.patch/chassis/" title="’одова€ часть">’одова€ часть</a>}
      ^case[tractor]{<a href="$cat.patch/tractor/" title="”правление трактором">”правление трактором</a>}
      ^case[electric]{<a href="$cat.patch/electric/" title="Ёлектрооборудование">Ёлектрооборудование</a>}
      ^case[body]{<a href="$cat.patch/body/" title=" узов"> узов</a>}
      ^case[DEFAULT]{}
    } 
     / 
     <a href="$cat_temp.patch/$cat.catalog_name/id/$cat_temp.id/" title="$cat_temp.title">$cat_temp.title</a> / $cat.title

     </div>
 }
#@nav_sub_sub_menu[]