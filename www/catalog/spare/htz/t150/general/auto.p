@title[]
^if(!def $form:id){
$str[$request:uri] 
$parts[^str.split[/;lh]] 
$uri[$parts.5/]
$title[^table::load[/catalog/spare/htz/t150/_section.cfg]]
^if(^title.locate[uri;^uri.trim[]]){ 
	$result[$title.title]
}{ 
	$result[404]
} 
}{
	$title[^getCategories[]]
	^if(^title.locate[id;^form:id.int(0)]){ 
		$result[$title.name]
	}{ 
		$result[404]
	} 
}
#@title[]

@description[]
#@description[]

@general[]
^if(!def $form:id){
	$general[^getCategories[]]
	  $general_select[^general.select($general.parent==198)]
	^if($general_select){
		<ul>
		^general_select.menu{
			<li><a href="/catalog/spare/htz/t150/general/id/$general_select.id/" title="$general_select.name">$general_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$general[^getCategories[]]
	 $general_select[^general.select($general.parent==^form:id.int(0)))]
	 <ul>
	 ^general_select.menu{
		 <li><a href="/catalog/spare/htz/t150/products/id/$general_select.id/" title="$general_select.name">$general_select.name</a></li>
	 }
	</ul>
}
#@general[]