

@namenklatura[teh_id]
^hMachines[]
  $namenklatura[^getMachines[]]
  $namenklatura_s[^namenklatura.select($namenklatura.brand_id==8)]
   <ul id="section_id">
   ^namenklatura_s.menu{
      ^if($namenklatura_s.tech_id == $teh_id){
        <li class="four"><a title="$namenklatura_s.name_ru" href="/catalog/belarus/taim/mashine/detal/id/$namenklatura_s.id/">$namenklatura_s.namenklatura</a></li>
      }{
        <li><a title="$namenklatura_s.name_ru" href="/catalog/belarus/taim/mashine/detal/id/$namenklatura_s.id/">$namenklatura_s.namenklatura</a></li>
      }
    }
   <ul>
#@namenklatura[]