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

@steering_brakingMTZ[]
^if(!def $form:id){
	$steering_braking[^getCategories[]]
	  $steering_braking_select[^steering_braking.select($steering_braking.parent==87)]
	^if($steering_braking_select){
		<ul>
		^steering_braking_select.menu{
			<li><a href="/catalog/spare/mtz/80/steering_braking/id/$steering_braking_select.id/" title="$steering_braking_select.name">$steering_braking_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$steering_braking[^getCategories[]]
	 $steering_braking_select[^steering_braking.select($steering_braking.parent==^form:id.int(0)))]
	 <ul>
	 ^steering_braking_select.menu{
		 <li><a href="/catalog/spare/mtz/80/products/id/$steering_braking_select.id/" title="$steering_braking_select.name">$steering_braking_select.name</a></li>
	 }
	</ul>
}
#@steering_brakingMTZ[]