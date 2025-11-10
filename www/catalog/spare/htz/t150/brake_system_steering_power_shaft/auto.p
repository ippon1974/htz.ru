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
		$result[]
	} 
}
#@title[]

@description[]
#@description[]

@brake_system_steering_power_shaft[]
^if(!def $form:id){
	$brake[^getCategories[]]
	  $brake_select[^brake.select($brake.parent==113)]
	^if($brake_select){
		<ul>
		^brake_select.menu{
			<li><a href="/catalog/spare/htz/t150/brake_system_steering_power_shaft/id/$brake_select.id/" title="$brake_select.name">$brake_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$brake[^getCategories[]]
	 $brake_select[^brake.select($brake.parent==^form:id.int(0)))]
	 <ul>
	 ^brake_select.menu{
		 <li><a href="/catalog/spare/htz/t150/products/id/$brake_select.id/" title="$brake_select.name">$brake_select.name</a></li>
	 }
	</ul>
}
#@brake_system_steering_power_shaft[]