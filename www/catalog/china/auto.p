@title[]
 $title[^table::load[/_root.cfg]]
  ^if(^title.locate[uri;$request:uri]){$result[^untaint[as-is]{$title.title}]}{}
#@title[]