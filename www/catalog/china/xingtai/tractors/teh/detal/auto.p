@title[]
$title[^getTehXingtai[$.id(^form:id.int(0))]]
$result[Технические характеристики трактора $title.namenklatura сборки ("XINGTAI")]
#@title[]

@getMTZ[]
$teh[^getTehXingtai[$.id(^form:id.int(0))]]
$field_teh[^table::load[/field_teh_xingtai.cfg]]
#@getMTZ[]

^navi_sub_nav_[]

<h2>Технические характеристики трактора $teh.namenklatura</h2>
<h3 title="$teh.namenklatura" class="en">$teh.namenklatura</h3>	

<table cellspacing="0">
^if(def $teh.constructive_weight){
<tr>
<th scope="col" colspan="2" class="name">Общие данные</th>
</tr>}{}
^field_teh.menu{
^if($field_teh.id <= "24"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
  }{}
}
^if(def $teh.mark || def $teh.model || def $teh.maximum_torque){
<tr><th colspan="2">Двигатель</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "25"){
^if($field_teh.id <= "36"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.generator_power || def $teh.voltage_electrical_system || def $teh.voltage_engine_starting){
<tr><th colspan="2">Электрооборудование</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "39"){
^if($field_teh.id <= "41"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.clutch || def $teh.transmission || def $teh.number_forward || def $teh.number_reverse || def $teh.reducer){
<tr><th colspan="2">Трансмиссия</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "42"){
^if($field_teh.id <= "46"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.type_bridge_front || def $teh.type_wheel || def $teh.type_differential || def $teh.fda_drive || def $teh.managing_fda){
<tr><th colspan="2">Передний мост</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "47"){
^if($field_teh.id <= "51"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.type_bridge_axle || def $teh.type_gear_wheel || def $teh.type_differential_axle || def $teh.drive_zm){
<tr><th colspan="2">Задний мост</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "52"){
^if($field_teh.id <= "56"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.labor){
<tr><th colspan="2">Тормоза</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "57"){
^if($field_teh.id <= "61"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.cabin_type || def $teh.cabin_heater || def $teh.cabin_airconditioner || def $teh.cabin_radiotel || def $teh.cabin_safety){
<tr><th colspan="2">Кабина</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "62"){
^if($field_teh.id <= "67"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.rear_pto){
<tr><th colspan="2">Вал отбора мощности</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "68"){
^if($field_teh.id <= "77"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.steering_type || def $teh.steering_type_swing){
<tr><th colspan="2">Рулевое управление</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "78"){
^if($field_teh.id <= "79"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.gns_back || def $teh.capacity_lower_front_sot || def $teh.number_hydraulic_front_gns || def $teh.number_hydraulic_outlets){
<tr><th colspan="2">Гидронавесная система (ГНС)</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "80"){
^if($field_teh.id <= "86"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.type_pump || def $teh.pump_displacement || def $teh.maximum_pressure || def $teh.pump_capacity || def $teh.hydraulic_system_capacity){
<tr><th colspan="2">Гидросистема</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "87"){
^if($field_teh.id <= "91"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.running_type){
<tr><th colspan="2">Ходовая система</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "92"){
^if($field_teh.id <= "93"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

^if(def $teh.add_pneumatic || def $teh.add_haulage_gauge || def $teh.add_rear_wheel_weights || def $teh.add_shuttle_hitch || def $teh.add_gidrokryuk || def $teh.add_spacers_wheels || def $teh.add_front_ballast || def $teh.add_hodoumenshitel || def $teh.add_drive_pulley || def $teh.add_dual_wheels){
<tr><th colspan="2">Дополнительная комплектация</th></tr>
}{}
^field_teh.menu{
^if($field_teh.id >= "94"){
^if($field_teh.id <= "103"){
^if(def $teh.[$field_teh.field]){
<tr>
<td class="name">$field_teh.description</td>
<td>$teh.[$field_teh.field]</td>
</tr>}{}
}{}
}{}
}

</table>
#@getTehMTZ[]
