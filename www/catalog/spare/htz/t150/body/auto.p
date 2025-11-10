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

@bodyHTZ[]
^if(!def $form:id){
	$body[^getCategories[]]
	  $body_select[^body.select($body.parent==167)]
	^if($body_select){
		<ul>
		^body_select.menu{
			<li><a href="/catalog/spare/htz/t150/body/id/$body_select.id/" title="$body_select.name">$body_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$body[^getCategories[]]
	 $body_select[^body.select($body.parent==^form:id.int(0)))]
	 <ul>
	 ^body_select.menu{
		 <li><a href="/catalog/spare/htz/t150/products/id/$body_select.id/" title="$body_select.name">$body_select.name</a></li>
	 }
	</ul>
}
#@bodyHTZ[]