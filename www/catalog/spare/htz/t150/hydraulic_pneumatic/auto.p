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

@hydraulic_pneumatic[]
^if(!def $form:id){
	$hydraulic_pneumatic[^getCategories[]]
	  $hydraulic_pneumatic_select[^hydraulic_pneumatic.select($hydraulic_pneumatic.parent==152)]
	^if($hydraulic_pneumatic_select){
		<ul>
		^hydraulic_pneumatic_select.menu{
			<li><a href="/catalog/spare/htz/t150/hydraulic_pneumatic/id/$hydraulic_pneumatic_select.id/" title="$hydraulic_pneumatic_select.name">$hydraulic_pneumatic_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$hydraulic_pneumatic[^getCategories[]]
	 $hydraulic_pneumatic_select[^hydraulic_pneumatic.select($hydraulic_pneumatic.parent==^form:id.int(0)))]
	 <ul>
	 ^hydraulic_pneumatic_select.menu{
		 <li><a href="/catalog/spare/htz/t150/products/id/$hydraulic_pneumatic_select.id/" title="$hydraulic_pneumatic_select.name">$hydraulic_pneumatic_select.name</a></li>
	 }
	</ul>
}
#@hydraulic_pneumatic[]