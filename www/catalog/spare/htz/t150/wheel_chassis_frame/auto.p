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

@wheel_chassis_frame[]
^if(!def $form:id){
	$wheel_chassis_frame[^getCategories[]]
	  $wheel_chassis_frame_select[^wheel_chassis_frame.select($wheel_chassis_frame.parent==100)]
	^if($wheel_chassis_frame_select){
		<ul>
		^wheel_chassis_frame_select.menu{
			<li><a href="/catalog/spare/htz/t150/wheel_chassis_frame/id/$wheel_chassis_frame_select.id/" title="$wheel_chassis_frame_select.name">$wheel_chassis_frame_select.name</a></li>
		}
		</ul>
	}{
		<p>Не найдено.</p>
	}
}{
	$wheel_chassis_frame[^getCategories[]]
	 $wheel_chassis_frame_select[^wheel_chassis_frame.select($wheel_chassis_frame.parent==^form:id.int(0)))]
	 <ul>
	 ^wheel_chassis_frame_select.menu{
		 <li><a href="/catalog/spare/htz/t150/products/id/$wheel_chassis_frame_select.id/" title="$wheel_chassis_frame_select.name">$wheel_chassis_frame_select.name</a></li>
	 }
	</ul>
}
#@wheel_chassis_frame[]