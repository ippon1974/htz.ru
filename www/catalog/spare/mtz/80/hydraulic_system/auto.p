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

@hydraulic_systemMTZ[]
^if(!def $form:id){
	$hydraulic_system[^getCategories[]]
	  $hydraulic_system_select[^hydraulic_system.select($hydraulic_system.parent==121)]
	^if($hydraulic_system_select){
		<ul>
		^hydraulic_system_select.menu{
			<li><a href="/catalog/spare/mtz/80/hydraulic_system/id/$hydraulic_system_select.id/" title="$hydraulic_system_select.name">$hydraulic_system_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$hydraulic_system[^getCategories[]]
	 $hydraulic_system_select[^hydraulic_system.select($hydraulic_system.parent==^form:id.int(0)))]
	 <ul>
	 ^hydraulic_system_select.menu{
		 <li><a href="/catalog/spare/mtz/80/products/id/$hydraulic_system_select.id/" title="$hydraulic_system_select.name">$hydraulic_system_select.name</a></li>
	 }
	</ul>
}
#@hydraulic_systemMTZ[]