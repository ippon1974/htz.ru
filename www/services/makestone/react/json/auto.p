@pageresponse[]
$response:Content-Type[application/json]

$str[$request:body]
$parts[^str.split[,;lh]]

$hes[
	$.boy[$request:method] 
	$.field[$parts.0]
	$.body[$request:body]
	$.leb[$response.body]
]

$h[ 
   $.void[] 
   $.bool(true) 
   $.double(1/2) 
   $.string[senao 258]
   $.hash[ 
      $.e[ee] 
   ] 
   $.date[^date::create(2006;08;18;06;09;00)] 
   $.table[^table::create{c1   c2   c3^#0Av1   v2   v3^#0Av4   v5   v6}] 
   $.file[^file::create[text;zigi.txt;file-content]] 
   $.img[^image::create(100;100;0)] 
] 
^json:string[$hes;
   $.indent(true) 
   $.table[array] 
   $.file[base64] 
   $.image[$image_handler] 
] 

@image_handler[key;value;params] 

"custom value of image $key"

