@next[]
$mail_file_json[^file::load[text;mail.json]]
$str[$mail_file_json.text]
^if(def $str){
 $h_h[^json:parse[^untaint[as-is]{$str}]]
 Name: $h_h.name / Phone: $h_h.phone / Email: $h_h.email / Massage: $h_h.message / check: $h_h.check / Date: $h_h.dt
}{Not data in file}
<br />
^if(def $str){
   ^connect[$connect_string]{
      ^void:sql{insert into user_order_makestone 
         (user_name, user_phone, user_email, user_message, user_check_private, page_title, page_uri, dt, is_published )
      values  
         ('$h_h.name', '$h_h.phone', '$h_h.email', '$h_h.message', '$h_h.check', '$h_h.page_title', '$h_h.page_uri', '$h_h.dt', '1' )
		 
		 $last_insert_id{^int:sql{select last_insert_id()}}		 
} 
	  add message OK and Last Insert ID = ${last_insert_id}
     }
}{ 
   <p>Not data for insert</p><br />
}

^rem{
^if(def $str){
^file:delete[/api/post/order/makestone/mail.json] 
}{result[File not found!]} 
}





