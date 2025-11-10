@products[]
$products[^getProducts[]]
   $products_cell[^products.select($products.categoryID==$form:id)] 
<ul>
    ^products_cell.menu{
      <li><a href="/catalog/spare/htz/t150/products/detal/id/$products_cell.id/" title="$products_cell.name">$products_cell.name</a> <em style="color:#7e7e7e^;">^products_cell.product_code.trim[]</em></li>
      }
</ul>
#@detail[]

@title[]
^if(def form:id){
   $title[^getCategories[$.id(^form:id.int(0))]]
      $result[$title.name]
}
#@title[]

@title_id[]
#@title_id[]

@nav_sub_sub_menu[]
 ^if(^form:id.int(0)){
     $cat[^getCategories[$.id(^form:id.int(0))]]
     $cat_cat[^getCategories[$.id($cat.parent)]]
     $cat_cat_cat[^getCategories[$.id($cat_cat.parent)]]
     <div style="margin: 0 0 1em 0^;font-size: 1.2em^;">
      <a href="$cat_cat_cat.patch" title="$cat_cat_cat.name">$cat_cat_cat.name</a> /
      <a href="^cat_cat_cat.patch.trim[right;/]/id/$cat_cat.id/" title="$cat_cat.name">$cat_cat.name</a> /
      $cat.name
     </div>
 }
#@nav_sub_sub_menu[]

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
$result[$description_id.description]
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
   $keywords_id[^getCategories[]]
      ^if(^keywords_id.locate[id;$form:id]){ 
$result[]
}{ 
$result[]
}
#@description[]