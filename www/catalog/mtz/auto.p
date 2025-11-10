@navi_sub_nav[]
 $navi_sub_nav[^getMachines[]]
    ^if(^navi_sub_nav.locate[id;$form:id]){<div style="margin: 0 0 0.8em 0^; font-size: 1.5em^;"><a href="/catalog/mtz/$navi_sub_nav.classification_sub_sub_uri/" title="$h_Machines.classification_item.[$navi_sub_nav.classification_item] $h_Machines.brand_id.[$navi_sub_nav.brand_id]">$h_Machines.classification_item.[$navi_sub_nav.classification_item] $h_Machines.brand_id.[$navi_sub_nav.brand_id]</a> / <strong>$mashine_s.namenklatura</strong></div>}{} 
#@navi_sub_nav[]

@namenklatura[]
   $menu_namenklatura[^getMachines[]]
   $menu_namenklatura_teh[^getTehMTZ[$.id(^form:id.int(0))]]
   $menu_namenklatura_brand[^menu_namenklatura.select($menu_namenklatura.brand_id==9)]
   ^menu_namenklatura_brand.sort{$menu_namenklatura_brand.namenklatura}
   <ul id="section_id">
    ^menu_namenklatura_brand.menu{
	 ^if($menu_namenklatura_brand.id == $form:id){
	 <li><strong>$menu_namenklatura_brand.namenklatura</strong></li>
	 }{
	 ^if(def $form:id){^if($menu_namenklatura_brand.id==$menu_namenklatura_teh.machines_id){<li class="four"><a href="/catalog/mtz/detal/id/$menu_namenklatura_brand.id/">$menu_namenklatura_brand.namenklatura</a></li>}{<li><a href="/catalog/mtz/detal/id/$menu_namenklatura_brand.id/">$menu_namenklatura_brand.namenklatura</a></li>}
	 }{
	 ^if($menu_namenklatura_brand.tehno_info_uri eq $request:uri){<li class="four"><a href="/catalog/mtz/detal/id/$menu_namenklatura_brand.id/">$menu_namenklatura_brand.namenklatura</a></li>}{<li><a href="/catalog/mtz/detal/id/$menu_namenklatura_brand.id/">$menu_namenklatura_brand.namenklatura</a></li>}
	 }
	 }

	}
   </ul>
#@namenklatura[]
