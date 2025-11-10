@title[]
^if(!def $form:id){
$str[$request:uri] 
$parts[^str.split[/;lh]] 
$uri[$parts.5/]
$title[^table::load[/catalog/spare/mtz/80/_section.cfg]]
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

@transmissionHTZ[]
^if(!def $form:id){
	$transmission[^getCategories[]]
	  $transmission_select[^transmission.select($transmission.parent==46)]
	^if($transmission_select){
		<ul>
		^transmission_select.menu{
			<li><a href="/catalog/spare/mtz/80/transmission/id/$transmission_select.id/" title="$transmission_select.name">$transmission_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$transmission[^getCategories[]]
	 $transmission_select[^transmission.select($transmission.parent==^form:id.int(0)))]
	 <ul>
	 ^transmission_select.menu{
		 <li><a href="/catalog/spare/mtz/80/products/id/$transmission_select.id/" title="$transmission_select.name">$transmission_select.name</a></li>
	 }
	</ul>
}
#@transmissionHTZ[]