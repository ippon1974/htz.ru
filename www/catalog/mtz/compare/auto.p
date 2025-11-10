@compare[]
^if(!def $cookie:baskets){
$cookie:baskets[
$.value[^math:uuid[]]
$.expires(2)]
}
^hMachines[]
$now[^date::now[]]



$sql[^getTehMTZ[]]

^connect[$connect_string]{
$sql_table[^table::sql{SELECT * FROM machines_tehno_mtz LEFT JOIN machines ON machines.machines_id = machines_tehno_mtz.machines_id}]
}


$compare[$form:tables.id]

^if($compare){
$compare_hash[^compare.hash[field]]
$field_teh_mtz[^table::load[/field_teh_mtz.cfg]]
$img_patch[^db:getImgPatch[]]
$img_patch_hash[^img_patch.hash[id]]
<p><a style="color:#003399^;" href="/catalog/mtz/$form:item/" title="Вернуться в раздел"><strong>&#8592^; Вернуться в раздел</strong></a></p>
<h1>Таблица сравнения технических характеристик тракторов производство ПО &laquo^;МТЗ&raquo^; (Беларусь)</h1>
<p>Если у Вас возникли вопросы по технике &laquo^;МТЗ&raquo^; задайти их нашим сотрудникам по телефону в Москве: ^my_phone_sendmail[]</p>
<p>График работы в рабочие дни с 10 до 18 часов. (Московское время). Выходные дни — суббота и воскресенье.</p>
<table class="compare" border="1" cellpadding="0" cellspacing="0" width="95%">

<tr>
<td class="left_compare">Фото</td>
 ^sql_table.menu{
    $mashine_img_patch[$img_patch_hash.[$sql_table.machines_id].patch_img]
	$str[$mashine_img_patch] 
	$parts[^str.split[,;lh]]
	
 	$compare_all[$compare_hash.[$sql_table.machines_id].field]
	^if($compare_all){
	<td class="left_compare"><img src="/catalog/img/icons/${parts.0}.jpg" alt="$sql_table.namenklatura" border="0"></td>
	}{}
}
</tr>

<tr>
<td class="left_compare">Наменклатура</td>
 ^sql_table.menu{
 	$compare_all[$compare_hash.[$sql_table.machines_id].field]
	^if($compare_all){
	<td class="right_compare"><strong>$sql_table.namenklatura</strong></td>
	}{}
}
</tr>
$sColor1[#ffffff]
$sColor2[#f0f0f0]
^field_teh_mtz.menu{
<tr bgcolor="^Lib:color[$sColor1;$sColor2]">
<td class="left_compare">$field_teh_mtz.description</td>
 ^sql_table.menu{
 	$compare_all[$compare_hash.[$sql_table.machines_id].field]
	^if($compare_all){
	<td class="right_compare">^if(def $sql_table.[$field_teh_mtz.field]){$sql_table.[$field_teh_mtz.field]}{—}</td>
	}{}
}
</tr>
}
</table>

}{<h1>Вы не выбрали технику МТЗ для сравнения!</h1><p><a style="color:#003399^;" href="/catalog/mtz/$form:item/" title="Вернуться в раздел"><strong>&#8592^; Вернуться в раздел</strong></a></p>}
#@compare[]






















