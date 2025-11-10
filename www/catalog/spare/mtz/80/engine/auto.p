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

@engineMTZ[]
^if(!def $form:id){
	$engine[^getCategories[]]
	  $engine_select[^engine.select($engine.parent==1)]
	^if($engine_select){
		<ul>
		^engine_select.menu{
			<li><a href="/catalog/spare/mtz/80/engine/id/$engine_select.id/" title="$engine_select.name">$engine_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$engine[^getCategories[]]
	 $engine_select[^engine.select($engine.parent==^form:id.int(0)))]
	 <ul>
	 ^engine_select.menu{
		 <li><a href="/catalog/spare/mtz/80/products/id/$engine_select.id/" title="$engine_select.name">$engine_select.name</a></li>
	 }
	</ul>
}
#@engineMTZ[]