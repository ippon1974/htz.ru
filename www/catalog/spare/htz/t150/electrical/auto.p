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

@electrical[]
^if(!def $form:id){
	$electrical[^getCategories[]]
	  $electrical_select[^electrical.select($electrical.parent==132)]
	^if($electrical_select){
		<ul>
		^electrical_select.menu{
			<li><a href="/catalog/spare/htz/t150/electrical/id/$electrical_select.id/" title="$electrical_select.name">$electrical_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$electrical[^getCategories[]]
	 $electrical_select[^electrical.select($electrical.parent==^form:id.int(0)))]
	 <ul>
	 ^electrical_select.menu{
		 <li><a href="/catalog/spare/htz/t150/products/id/$electrical_select.id/" title="$electrical_select.name">$electrical_select.name</a></li>
	 }
	</ul>
}
#@electrical[]