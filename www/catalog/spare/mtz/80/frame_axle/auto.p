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

@frame_axleMTZ[]
^if(!def $form:id){
	$frame_axle[^getCategories[]]
	  $frame_axle_select[^frame_axle.select($frame_axle.parent==76)]
	^if($frame_axle_select){
		<ul>
		^frame_axle_select.menu{
			<li><a href="/catalog/spare/mtz/80/frame_axle/id/$frame_axle_select.id/" title="$frame_axle_select.name">$frame_axle_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$frame_axle[^getCategories[]]
	 $frame_axle_select[^frame_axle.select($frame_axle.parent==^form:id.int(0)))]
	 <ul>
	 ^frame_axle_select.menu{
		 <li><a href="/catalog/spare/mtz/80/products/id/$frame_axle_select.id/" title="$frame_axle_select.name">$frame_axle_select.name</a></li>
	 }
	</ul>
}
#@frame_axleMTZ[]