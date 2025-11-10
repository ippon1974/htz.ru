jQuery.noConflict();

(function($) {
	$(document).ready(function () {
		$(".img_container").children("img").each( function(){
				var url = $(this).css("background-image");
				var re = /(url\("?)([^"]+)("?\))/;
				var src = url.replace(re, "$2");
				var img = new Image();
				var el = $(this);
				img.onload = function(){
					var sHeight = this.height;

					el.css("height", sHeight);
				};
				img.src = src;
		});

		$(".thumb a").click( function () {
			var sUrl = $(this).attr("href");
			var el = $(this);

			var img = new Image();
			img.onload = function(){
				var sHeight = this.height;
				el.parents(".details").children(".img_container").children("img").animate({height : sHeight+"px"}, 500);
			};
			img.src = sUrl;
			$(this).parent().addClass("selected");
			$(this).parent().parent().siblings().children(".thumb").removeClass("selected");
			$(this).parents(".details").children(".img_container").children("img").css("background-image","url("+ sUrl +")");

		});
	
		$(".popup").click( function () {
			var sUrl = $(this).attr("href");
			oNewWindow = window.open(sUrl, '', 'width=700, height=700, resizable=1,toolbar=0, scrollbars=1, menubar=0,status=1');
			oNewWindow.focus();
		});

		$(".cut-teaser").click( function () {
			var currElementBody = $(this).next();
			if (currElementBody && currElementBody.css('display') == 'none') {
				 currElementBody.css('display', 'block');
			} else {
				currElementBody.css('display', 'none');
			}
			if($(this).hasClass('expandable')){
				$(this).toggleClass('expanded');
			} else {
				$(this).toggleClass('closed');
			}
		});
		
		$(".geo .pseudo-href").click( function () {
			var currElementBody = $(this).siblings(".map");
			var currElementBg = $(this).siblings(".mapbg");
			if (currElementBody && currElementBody.css('display') == 'none') {
				 currElementBody.css('display', 'block');
				 currElementBg.css('display', 'block');
			} else {
				currElementBody.css('display', 'none');
				 currElementBg.css('display', 'none');
			}
		});
		
		$(".geo .close").click( function () {
			var currElementBody = $(this).parents(".map");
			var currElementBg = currElementBody.siblings(".mapbg");
				currElementBody.css('display', 'none');
				currElementBg.css('display', 'none');
		});
		
		$(".pseudo-href.for-footnote").click( function () {
			var currElementBody = $(this).next();
			currElementBody.toggleClass('hidden');
		});

		$("#site-menu ul li div .pseudo-href").click(function () {
			if(!$(this).parents('li:first').hasClass("expanded")){
				$("#site-menu ul li").each(function () {
					$(this).removeClass("expanded");
				});
				$(this).parents('li:first').addClass("expanded");
				
			}
		});

		$("#Offices .name .pseudo-href").click(function () {
			var thisEl = $(this);
			var parent_dd = thisEl.parents("dd:first");
			var is_first = parent_dd.toggleClass("opened").hasClass("first");
			if(is_first){
				parent_dd.parent("dl").toggleClass("opened");
			}
			if(!$("#Offices > dl > dd").hasClass("opened")){
					$("#Offices").addClass("unselected");
			} else {
				$("#Offices").removeClass("unselected");
			}
		});
		
		// placeholder
		if(!navigator.userAgent.match(/Safari/)){
			$('input#search, input#search-field').each(function(){
				if($(this).val() == ''){
					$(this).val($(this).attr('placeholder'));
					$(this).addClass('empty');
				}
			});	
			$('input#search, input#search-field').focus(function(){ 
				if($(this).val() == $(this).attr('placeholder')){
					$(this).val('');
					$(this).removeClass('empty');
				}
			});

			$('input#search, input#search-field').blur(function(){
				if($(this).val() == ''){
					$(this).val($(this).attr('placeholder'));
					$(this).addClass('empty');
				}
			});
		}
		
		$(".search-results-switch").click(function () {
				$(this).addClass("hidden");
				$("#search-results").addClass("expanded");
				
		});
		

	});
})(jQuery);

