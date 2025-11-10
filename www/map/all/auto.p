@printSanyPump[]
$SanyPump[^getMachines[]]
 $SanyPump_select[^SanyPump.select($SanyPump.brand_id==2)]
  $SanyPump_select_cell[^SanyPump_select.select($SanyPump_select.classification==1)]
  <ul>
    ^SanyPump_select_cell.menu{
	<li><a href="/catalog/china/sany/pump/$SanyPump_select_cell.classification_sub_sub_uri/$SanyPump_select_cell.translite/">$SanyPump_select_cell.name_ru</a>
<ul>
<li><a href="$SanyPump_select_cell.tehno_info_uri">Характерискики SANY $SanyPump_select_cell.namenklatura</a></li>
<li><a href="$SanyPump_select_cell.complect_uri">Стандартная комплектация</a></li>
</ul>
	}
#@printSanyPump[]

@printHongdaPump[]
$HongdaPump[^getMachines[]]
 $HongdaPump_select[^HongdaPump.select($HongdaPump.brand_id==1)]
  $HongdaPump_select_cell[^HongdaPump_select.select($HongdaPump_select.classification==1)]
  <ul>
    ^HongdaPump_select_cell.menu{
	<li><a href="/catalog/china/hongda/pump/$HongdaPump_select_cell.classification_sub_sub_uri/$HongdaPump_select_cell.translite/">$HongdaPump_select_cell.name_ru</a>
<ul>
<li><a href="$HongdaPump_select_cell.tehno_info_uri">Характерискики HONGDA $HongdaPump_select_cell.namenklatura</a></li>
</ul>
	}
#@printHongdaPump[]

@printFY[]
$FYPump[^getMachines[]]
 $FYPump_select[^FYPump.select($FYPump.brand_id==3)]
  $FYPump_select_cell[^FYPump_select.select($FYPump_select.classification==1)]
  <ul>
    ^FYPump_select_cell.menu{
	<li><a href="/catalog/china/fangyuan/pump/$FYPump_select_cell.classification_sub_sub_uri/$FYPump_select_cell.translite/">$FYPump_select_cell.name_ru</a>
<ul>
<li><a href="$FYPump_select_cell.tehno_info_uri">Характерискики FANG YUAN $FYPump_select_cell.namenklatura</a></li>
</ul>
	}
#@printFY[]

@printZoom[]
$ZoomPump[^getMachines[]]
 $ZoomPump_select[^ZoomPump.select($ZoomPump.brand_id==4)]
  $ZoomPump_select_cell[^ZoomPump_select.select($ZoomPump_select.classification==1)]
  <ul>
    ^ZoomPump_select_cell.menu{
	<li><a href="/catalog/china/zoomlion/pump/$ZoomPump_select_cell.classification_sub_sub_uri/$ZoomPump_select_cell.translite/">$ZoomPump_select_cell.name_ru</a>
<ul>
<li><a href="$ZoomPump_select_cell.tehno_info_uri">Характерискики ZOOMLION $ZoomPump_select_cell.namenklatura</a></li>
</ul>
	}
#@printZoom[]


@printagroimport[]
$general[^table::load[/catalog/agroimport/nomenclature.cfg]]
$cell[^general.select($general.type==1)]
<ul>
   ^cell.menu{
      <li><a href="$cell.uri">$cell.name_detal</a></li>
}</ul>
#end @printagroimport[]

@printagrospec[]
$general[^table::load[/catalog/agroimport/nomenclature.cfg]]
$cell[^general.select($general.type==2)]
<ul>
   ^cell.menu{
      <li><a href="$cell.uri">$cell.name_detal</a></li>
}</ul>
#end @printagroimport[]

@printhtz[]
$general[^table::load[/catalog/htz/nomenclature.cfg]]
<ul>
   ^general.menu{
      <li><a href="$general.uri">$general.name_detal</a></li>
}</ul>
#end @printhtz[]

@printshantui[]
$general[^table::load[/catalog/china/shantui/nomenclature.cfg]]
<ul>
   ^general.menu{
      <li><a href="$general.uri">$general.name_detal</a></li>
}</ul>
#end @printhtz[]


@printctz[]
$general[^table::load[/catalog/ctz/nomenclature.cfg]]
<ul>
   ^general.menu{
      <li><a href="$general.uri">$general.name_detal</a></li>
}</ul>
#end @printctz[]











