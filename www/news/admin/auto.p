@getNewsEdit[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		article_id AS id,
		article_type_id,
		title,img,
		lead,body,
		is_published,
		image,
		last_id,
		dt,
		dt_published
	FROM
		news
	ORDER BY
		dt DESC
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#@getWorkClassification[]

@TblUsers[]
$now[^date::now[]]
$iNewsEdit[^getNewsEdit[]]
<table class="w" id="жж" align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><a href="/news/admin/index.html">АДМИНИСТРАТОР НОВОСТЕЙ</a> &raquo;&raquo; <strong>Редактор новостей</strong></td>
</tr>
</table>

<h1 style="width: 95%; text-align: center; font-weight: normal;">Редактор новостей</h1>

<table class="w" id="жж" align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><em>Новостей в таблице — ^iNewsEdit.count[]</em></td>
</tr>
</table>

<script src="/shop/admin/js/_01.js" type="text/javascript"></script>
<form method="post">
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Удалить новость" /></td>
</tr>
</table>
<table class="admin" align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
  <tr align="left">
  <th><strong>Удалить</strong></th>
  <th><strong>ID</strong></th>
  <th><strong>Заголовок</strong></th>
  <th><strong>Краткое описание</strong></th>
  <th><strong>Дата</strong></th>
  </tr>
  ^untaint[as-is]{
  ^iNewsEdit.menu{
  <tr valign="top">
  <td><input type="Checkbox" name="delet" value="$iNewsEdit.id" /></td>
  <td>$iNewsEdit.id</td>
  <td>$iNewsEdit.title</td>
  <td>$iNewsEdit.lead</td>
  <td>^dtf:format[%d.%m.%Y;$iNewsEdit.dt]</td>
  </tr>}}
</table>
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Удалить новость" /></td>
</tr>
</table>
</form>
<hr style="width: 95%;">
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff">&copy;Алла Тур 2007&mdash;$now.year</td>
</tr>
</table>

$dNews[$form:tables.delet]
  ^if($dNews){
	^connect[$connect_string]{
	        ^dNews.menu{
	            ^void:sql{DELETE FROM `news` WHERE `article_id` IN (^dNews.menu{'$dNews.field'}[,])}
				}
				$response:location[http://$env:SERVER_NAME/news/admin/]
			}	
}{}

#@TblUsers[]




@TblMashins[]
$now[^date::now[]]
$TblMashins[^getMachines[]]
<table class="w" id="жж" align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><a href="/news/admin/index.html">АДМИНИСТРАТОР</a> &raquo;&raquo; <strong>Редактор прайс-листа</strong></td>
</tr>
</table>

<h1 style="width: 95%; text-align: center; font-weight: normal;">Редактор прайс-листа</h1>

<table class="w" id="жж" align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><em>Товаров в таблице: ^TblMashins.count[]</em></td>
</tr>
</table>

<script src="/shop/admin/js/_01.js" type="text/javascript"></script>
<form method="post">
<input type="hidden" name="update" value="update" />
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff"><input style="background-color: #ffd700;" type="Submit" name="action" value="Сохранить изменения" /></td>
</tr>
</table>
<table class="admin" align="center" border="0" cellpadding="2" cellspacing="2" width="95%">
  <tr align="left">
  <th><strong>ID</strong></th>
  <th><strong>Наменклатура</strong></th>
  <th><strong>Краткое описание</strong></th>
  <th><strong>Цена</strong></th>
  </tr>
  ^untaint[as-is]{
  ^TblMashins.menu{
  <input type="hidden" name="product" value="$TblMashins.id" />
  <tr valign="top">
  <td>$TblMashins.id</td>
  <td>$TblMashins.namenklatura</td>
  <td>$TblMashins.name_ru</td>
  <td><input type="Text" name="amount_$TblMashins.id" value="$TblMashins.price" /></td>
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
<hr style="width: 95%;">
<table align="center" width="95%">
<tr>
	<td bgcolor="#ffffff">&copy;СТРОЙПРОЕКТМОНТАЖ 2007&mdash;$now.year</td>
</tr>
</table>


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
					UPDATE machines
					SET 
						price = '$iAmount'
					WHERE
						machines_id = '$iProductID'
				]
				^void:sql{$sQuery}
^sQuery.save[append;/query.txt])	
$response:location[http://$env:SERVER_NAME/news/admin/price/]
			}
		}
	}
}
}
#@TblUsers[]









