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

@ptoMTZ[]
^if(!def $form:id){
	$pto[^getCategories[]]
	  $pto_select[^pto.select($pto.parent==109)]
	^if($pto_select){
		<ul>
		^pto_select.menu{
			<li><a href="/catalog/spare/mtz/80/pto/id/$pto_select.id/" title="$pto_select.name">$pto_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$pto[^getCategories[]]
	 $pto_select[^pto.select($pto.parent==^form:id.int(0)))]
	 <ul>
	 ^pto_select.menu{
		 <li><a href="/catalog/spare/mtz/80/products/id/$pto_select.id/" title="$pto_select.name">$pto_select.name</a></li>
	 }
	</ul>
}
#@ptoMTZ[]