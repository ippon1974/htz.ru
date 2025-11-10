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

@tools[]
^if(!def $form:id){
	$tools[^getCategories[]]
	  $tools_select[^tools.select($tools.parent==192)]
	^if($tools_select){
		<ul>
		^tools_select.menu{
			<li><a href="/catalog/spare/htz/t150/tools/id/$tools_select.id/" title="$tools_select.name">$tools_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$tools[^getCategories[]]
	 $tools_select[^tools.select($tools.parent==^form:id.int(0)))]
	 <ul>
	 ^tools_select.menu{
		 <li><a href="/catalog/spare/htz/t150/products/id/$tools_select.id/" title="$tools_select.name">$tools_select.name</a></li>
	 }
	</ul>
}
#@tools[]