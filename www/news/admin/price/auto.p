@TblMashins_Price_HTZ[]
 ^hMachines[]
 $now[^date::now[]]
 $mashine[^getMachines[]]
 $mashine_s[^mashine.select($mashine.brand_id==5)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
 
<script src="/shop/admin/js/_01.js" type="text/javascript"></script>
<form method="post">
<input type="hidden" name="update" value="update" />
<table align="center" width="95%">
<tr><td bgcolor="#ffffff"><h1>ОАО &laquo^;ХТЗ&raquo^;</h1></td></tr>
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
<table class="admin" align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
  <tr align="left">
  <th><strong>ID</strong></th>
  <th><strong>Наменклатура</strong></th>
  <th><strong>Краткое описание</strong></th>
  <th><strong>USD</strong></th>
  <th><strong>Рубли РФ</strong></th>
  </tr>
 ^untaint[as-is]{
 ^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
  <input type="hidden" name="product" value="$mashine_s.id" />
  <tr valign="top">
  <td>$mashine_s.id</td>
  <td>$mashine_s.namenklatura</td>
  <td><a target="_blank" href="/catalog/htz/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/">$mashine_s.name_ru</a></td>
  <td align="center"><input type="Text" name="amount_$mashine_s.id" value="$mashine_price" /></td>
  <td align="center">^if($mashine_price){^eval($mashine_price*^exchange_usd[])}{}</td>
  </tr>
 }
}
</table>
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
</form>

^if(def $form:update){
$tProduct[$form:tables.product]
$iUserID(^cookie:baskets.int(0))
^if($tProduct){
	^connect[$connect_string]{
		^tProduct.menu{
			$iProductID(^tProduct.field.int(0))
			$iAmount(^form:[amount_$iProductID].int(0))

			^if($iProductID && $iAmount){
				$sQuery[
					UPDATE machines_price
					SET 
						price = '$iAmount'
					WHERE
						machines_price_id = '$iProductID'
				]
				^void:sql{$sQuery}
^sQuery.save[append;/query.txt])	
$response:location[http://$env:SERVER_NAME/news/admin/price/]
			}
		}
	}
}
}
#@@TblMashins_Price_HTZ[]

@TblMashins_Price_AGROIMPORT[]
 ^hMachines[]
 $now[^date::now[]]
 $mashine[^getMachines[]]
 $mashine_s[^mashine.select($mashine.brand_id==6)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
<script src="/shop/admin/js/_01.js" type="text/javascript"></script>
<form method="post">
<input type="hidden" name="update" value="update" />
<table align="center" width="95%">
<tr><td bgcolor="#ffffff"><h1>ООО &laquo^;Агроимпорт&raquo^;</h1></td></tr>
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
<table class="admin" align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
  <tr align="left">
  <th><strong>ID</strong></th>
  <th><strong>Наменклатура</strong></th>
  <th><strong>Краткое описание</strong></th>
  <th><strong>USD</strong></th>
  <th><strong>Рубли РФ</strong></th>
  </tr>
 ^untaint[as-is]{
 ^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
  <input type="hidden" name="product" value="$mashine_s.id" />
  <tr valign="top">
  <td>$mashine_s.id</td>
  <td>$mashine_s.namenklatura</td>
  <td><a target="_blank" href="/catalog/agroimport/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/">$mashine_s.name_ru</a></td>
  <td><input type="Text" name="amount_$mashine_s.id" value="$mashine_price" /></td>
  <td>^if($mashine_price){^eval($mashine_price*^exchange_usd[])}{}</td>
  </tr>
 }
}
</table>
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
</form>
^if(def $form:update){
$tProduct[$form:tables.product]
$iUserID(^cookie:baskets.int(0))
^if($tProduct){
	^connect[$connect_string]{
		^tProduct.menu{
			$iProductID(^tProduct.field.int(0))
			$iAmount(^form:[amount_$iProductID].int(0))

			^if($iProductID && $iAmount){
				$sQuery[
					UPDATE machines_price
					SET 
						price = '$iAmount'
					WHERE
						machines_price_id = '$iProductID'
				]
				^void:sql{$sQuery}
^sQuery.save[append;/query.txt])	
$response:location[http://$env:SERVER_NAME/news/admin/price/]
			}
		}
	}
}
}
#@TblMashins_Price_AGROIMPORT[]


@TblMashins_Price_HONGDA[]
 ^hMachines[]
 $now[^date::now[]]
 $mashine[^getMachines[]]
 $mashine_s[^mashine.select($mashine.brand_id==1)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
<script src="/shop/admin/js/_01.js" type="text/javascript"></script>
<form method="post">
<input type="hidden" name="update" value="update" />
<table align="center" width="95%">
<tr><td bgcolor="#ffffff"><h1>&laquo^;HONGDA&raquo^;</h1></td></tr>
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
<table class="admin" align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
  <tr align="left">
  <th><strong>ID</strong></th>
  <th><strong>Наменклатура</strong></th>
  <th><strong>Краткое описание</strong></th>
  <th><strong>USD</strong></th>
  <th><strong>Рубли РФ</strong></th>
  </tr>
 ^untaint[as-is]{
 ^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
  <input type="hidden" name="product" value="$mashine_s.id" />
  <tr valign="top">
  <td>$mashine_s.id</td>
  <td>$mashine_s.namenklatura</td>
  <td><a target="_blank" href="/catalog/china/hongda/pump/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/">$mashine_s.name_ru</a></td>
  <td><input type="Text" name="amount_$mashine_s.id" value="$mashine_price" /></td>
  <td>^if($mashine_price){^eval($mashine_price*^exchange_usd[])}{}</td>
  </tr>
 }
}
</table>
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
</form>
^if(def $form:update){
$tProduct[$form:tables.product]
$iUserID(^cookie:baskets.int(0))
^if($tProduct){
	^connect[$connect_string]{
		^tProduct.menu{
			$iProductID(^tProduct.field.int(0))
			$iAmount(^form:[amount_$iProductID].int(0))

			^if($iProductID && $iAmount){
				$sQuery[
					UPDATE machines_price
					SET 
						price = '$iAmount'
					WHERE
						machines_price_id = '$iProductID'
				]
				^void:sql{$sQuery}
^sQuery.save[append;/query.txt])	
$response:location[http://$env:SERVER_NAME/news/admin/price/]
			}
		}
	}
}
}
#@TblMashins_Price_HONGDA[]

@TblMashins_Price_SANY[]
 ^hMachines[]
 $now[^date::now[]]
 $mashine[^getMachines[]]
 $mashine_s[^mashine.select($mashine.brand_id==2)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
<script src="/shop/admin/js/_01.js" type="text/javascript"></script>
<form method="post">
<input type="hidden" name="update" value="update" />
<table align="center" width="95%">
<tr><td bgcolor="#ffffff"><h1>&laquo^;SANY&raquo^;</h1></td></tr>
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
<table class="admin" align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
  <tr align="left">
  <th><strong>ID</strong></th>
  <th><strong>Наменклатура</strong></th>
  <th><strong>Краткое описание</strong></th>
  <th><strong>USD</strong></th>
  <th><strong>Рубли РФ</strong></th>
  </tr>
 ^untaint[as-is]{
 ^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
  <input type="hidden" name="product" value="$mashine_s.id" />
  <tr valign="top">
  <td>$mashine_s.id</td>
  <td>$mashine_s.namenklatura</td>
  <td><a target="_blank" href="/catalog/china/sany/pump/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/">$mashine_s.name_ru</a></td>
  <td><input type="Text" name="amount_$mashine_s.id" value="$mashine_price" /></td>
  <td>^if($mashine_price){^eval($mashine_price*^exchange_usd[])}{}</td>
  </tr>
 }
}
</table>
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
</form>
^if(def $form:update){
$tProduct[$form:tables.product]
$iUserID(^cookie:baskets.int(0))
^if($tProduct){
	^connect[$connect_string]{
		^tProduct.menu{
			$iProductID(^tProduct.field.int(0))
			$iAmount(^form:[amount_$iProductID].int(0))

			^if($iProductID && $iAmount){
				$sQuery[
					UPDATE machines_price
					SET 
						price = '$iAmount'
					WHERE
						machines_price_id = '$iProductID'
				]
				^void:sql{$sQuery}
^sQuery.save[append;/query.txt])	
$response:location[http://$env:SERVER_NAME/news/admin/price/]
			}
		}
	}
}
}
#@TblMashins_Price_SANY[]


@TblMashins_Price_FANGYUAN[]
 ^hMachines[]
 $now[^date::now[]]
 $mashine[^getMachines[]]
 $mashine_s[^mashine.select($mashine.brand_id==3)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
<script src="/shop/admin/js/_01.js" type="text/javascript"></script>
<form method="post">
<input type="hidden" name="update" value="update" />
<table align="center" width="95%">
<tr><td bgcolor="#ffffff"><h1>&laquo^;FANGYUAN&raquo^;</h1></td></tr>
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
<table class="admin" align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
  <tr align="left">
  <th><strong>ID</strong></th>
  <th><strong>Наменклатура</strong></th>
  <th><strong>Краткое описание</strong></th>
  <th><strong>USD</strong></th>
  <th><strong>Рубли РФ</strong></th>
  </tr>
 ^untaint[as-is]{
 ^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
  <input type="hidden" name="product" value="$mashine_s.id" />
  <tr valign="top">
  <td>$mashine_s.id</td>
  <td>$mashine_s.namenklatura</td>
  <td><a target="_blank" href="/catalog/china/fangyuan/pump/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/">$mashine_s.name_ru</a></td>
  <td><input type="Text" name="amount_$mashine_s.id" value="$mashine_price" /></td>
  <td>^if($mashine_price){^eval($mashine_price*^exchange_usd[])}{}</td>
  </tr>
 }
}
</table>
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
</form>
^if(def $form:update){
$tProduct[$form:tables.product]
$iUserID(^cookie:baskets.int(0))
^if($tProduct){
	^connect[$connect_string]{
		^tProduct.menu{
			$iProductID(^tProduct.field.int(0))
			$iAmount(^form:[amount_$iProductID].int(0))

			^if($iProductID && $iAmount){
				$sQuery[
					UPDATE machines_price
					SET 
						price = '$iAmount'
					WHERE
						machines_price_id = '$iProductID'
				]
				^void:sql{$sQuery}
^sQuery.save[append;/query.txt])	
$response:location[http://$env:SERVER_NAME/news/admin/price/]
			}
		}
	}
}
}
#@TblMashins_Price_FANGYUAN[]

@TblMashins_Price_ZOOMLION[]
 ^hMachines[]
 $now[^date::now[]]
 $mashine[^getMachines[]]
 $mashine_s[^mashine.select($mashine.brand_id==4)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
<script src="/shop/admin/js/_01.js" type="text/javascript"></script>
<form method="post">
<input type="hidden" name="update" value="update" />
<table align="center" width="95%">
<tr><td bgcolor="#ffffff"><h1>&laquo^;ZOOMLION&raquo^;</h1></td></tr>
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
<table class="admin" align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
  <tr align="left">
  <th><strong>ID</strong></th>
  <th><strong>Наменклатура</strong></th>
  <th><strong>Краткое описание</strong></th>
  <th><strong>USD</strong></th>
  <th><strong>Рубли РФ</strong></th>
  </tr>
 ^untaint[as-is]{
 ^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
  <input type="hidden" name="product" value="$mashine_s.id" />
  <tr valign="top">
  <td>$mashine_s.id</td>
  <td>$mashine_s.namenklatura</td>
  <td><a target="_blank" href="/catalog/china/zoomlion/pump/$mashine_s.classification_sub_sub_uri/$mashine_s.translite/">$mashine_s.name_ru</a></td>
  <td><input type="Text" name="amount_$mashine_s.id" value="$mashine_price" /></td>
  <td>^if($mashine_price){^eval($mashine_price*^exchange_usd[])}{}</td>
  </tr>
 }
}
</table>
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
</form>
^if(def $form:update){
$tProduct[$form:tables.product]
$iUserID(^cookie:baskets.int(0))
^if($tProduct){
	^connect[$connect_string]{
		^tProduct.menu{
			$iProductID(^tProduct.field.int(0))
			$iAmount(^form:[amount_$iProductID].int(0))

			^if($iProductID && $iAmount){
				$sQuery[
					UPDATE machines_price
					SET 
						price = '$iAmount'
					WHERE
						machines_price_id = '$iProductID'
				]
				^void:sql{$sQuery}
^sQuery.save[append;/query.txt])	
$response:location[http://$env:SERVER_NAME/news/admin/price/]
			}
		}
	}
}
}
#@TblMashins_Price_ZOOMLION[]


@TblMashins_Price_BOBR[]
 ^hMachines[]
 $now[^date::now[]]
 $mashine[^getMachines[]]
 $mashine_s[^mashine.select($mashine.brand_id==7)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
<script src="/shop/admin/js/_01.js" type="text/javascript"></script>
<form method="post">
<input type="hidden" name="update" value="update" />
<table align="center" width="95%">
<tr><td bgcolor="#ffffff"><h1>ОАО &laquo^;Бобруйскагромаш&raquo^;</h1></td></tr>
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
<table class="admin" align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
  <tr align="left">
  <th><strong>ID</strong></th>
  <th><strong>Наменклатура</strong></th>
  <th><strong>Краткое описание</strong></th>
  <th><strong>USD</strong></th>
  <th><strong>Рубли РФ</strong></th>
  </tr>
 ^untaint[as-is]{
 ^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
  <input type="hidden" name="product" value="$mashine_s.id" />
  <tr valign="top">
  <td>$mashine_s.id</td>
  <td>$mashine_s.namenklatura</td>
  <td><a target="_blank" href="/catalog/belarus/agromash/mashine/detal/id/$mashine_s.id/">$mashine_s.name_ru</a></td>
  <td><input type="Text" name="amount_$mashine_s.id" value="$mashine_price" /></td>
  <td>^if($mashine_price){^eval($mashine_price*^exchange_usd[])}{}</td>
  </tr>
 }
}
</table>
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
</form>
^if(def $form:update){
$tProduct[$form:tables.product]
$iUserID(^cookie:baskets.int(0))
^if($tProduct){
	^connect[$connect_string]{
		^tProduct.menu{
			$iProductID(^tProduct.field.int(0))
			$iAmount(^form:[amount_$iProductID].int(0))

			^if($iProductID && $iAmount){
				$sQuery[
					UPDATE machines_price
					SET 
						price = '$iAmount'
					WHERE
						machines_price_id = '$iProductID'
				]
				^void:sql{$sQuery}
^sQuery.save[append;/query.txt])	
$response:location[http://$env:SERVER_NAME/news/admin/price/]
			}
		}
	}
}
}
#@TblMashins_Price_BOBR[]

@TblMashins_Price_TAIM[]
 ^hMachines[]
 $now[^date::now[]]
 $mashine[^getMachines[]]
 $mashine_s[^mashine.select($mashine.brand_id==8)]
 $price[^getPriceMachines[]]
 $price_hash[^price.hash[id]]
<script src="/shop/admin/js/_01.js" type="text/javascript"></script>
<form method="post">
<input type="hidden" name="update" value="update" />
<table align="center" width="95%">
<tr><td bgcolor="#ffffff"><h1>ОАО &laquo^;ТАиМ&raquo^;</h1></td></tr>
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
<table class="admin" align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
  <tr align="left">
  <th><strong>ID</strong></th>
  <th><strong>Наменклатура</strong></th>
  <th><strong>Краткое описание</strong></th>
  <th><strong>USD</strong></th>
  <th><strong>Рубли РФ</strong></th>
  </tr>
 ^untaint[as-is]{
 ^mashine_s.menu{  
    $mashine_price[$price_hash.[$mashine_s.id].price] 
#   проверяем - есть ли цена на товар в нашем hash 
     
  <input type="hidden" name="product" value="$mashine_s.id" />
  <tr valign="top">
  <td>$mashine_s.id</td>
  <td>$mashine_s.namenklatura</td>
  <td><a target="_blank" href="/catalog/belarus/taim/mashine/detal/id/$mashine_s.id/">$mashine_s.name_ru</a></td>
  <td><input type="Text" name="amount_$mashine_s.id" value="$mashine_price" /></td>
  <td>^if($mashine_price){^eval($mashine_price*^exchange_usd[])}{}</td>
  </tr>
 }
}
</table>
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
</form>
^if(def $form:update){
$tProduct[$form:tables.product]
$iUserID(^cookie:baskets.int(0))
^if($tProduct){
	^connect[$connect_string]{
		^tProduct.menu{
			$iProductID(^tProduct.field.int(0))
			$iAmount(^form:[amount_$iProductID].int(0))

			^if($iProductID && $iAmount){
				$sQuery[
					UPDATE machines_price
					SET 
						price = '$iAmount'
					WHERE
						machines_price_id = '$iProductID'
				]
				^void:sql{$sQuery}
^sQuery.save[append;/query.txt])	
$response:location[http://$env:SERVER_NAME/news/admin/price/]
			}
		}
	}
}
}
#@TblMashins_Price_TAIM[]