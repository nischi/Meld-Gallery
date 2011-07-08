/*
<!---
||MELDGALLERYLICENSE||
--->
*/
(function($) {
	$.fn.mastheadfader = function( settings ) {
		var settings		= $.extend({},$.fn.mastheadfader.defaults,settings);
		var self			= this;
		var $container		= $(this);

		var $imgFront		= $("#ms-msg-front",$container);
		var $imgBack		= $("#ms-msg-back",$container);
		var $imgMask		= $("#ms-msg-mask",$container);

		var $infoBox		= $("#ms-msg-infobox",$container);
		var $infoBody		= $("#ms-msg-content",$infoBox);
		var $infoLink		= $("#ms-msg-link",$infoBox);
		var $infoMast		= $("#ms-msg-mast",$container);


		var $thumbsBox		= $("#ms-msg-thumbs",$infoBox);
		var $thumbList		= $("#ms-msg-thumbs-list",$infoBox);
		var $navBox			= $("#ms-msg-nav",$infoBox);

		var $sourceImg		= $("#" & settings.sourceImg );

		var refreshIntervalId = "";
		var inTransit		= false;

		var rCount			= 0;

		$sourceImg.hide();
		$imgFront.hide();
		$imgBack.hide();
		$thumbsBox.css('visibility','visible');

		doSetData();
		doLoadImages();
		
		function doSetData() {
			self.data			= {};
			self.current		= "";
			self.next			= "";
			
			self.data.images	= {};
			self.data.pos	= [];
		}
		
		function doLoadImages() {
			var aImg = $(".ms-msg-main","#meld-msg-img");
			for(var i = 0;i < aImg.length;i++) {
				var img = {};
				var $item = $(aImg[i]);
				img.pos		= i;
				img.src		= $("img",$item).attr('src');
				img.title	= $("img",$item).attr('title');
//				img.link	= $("a",$item).attr('href');
				img.body	= $("div",$item).html();
				img.id		= $item.attr('id');
				self.data.images[img.id] = img;
				self.data.pos.push( img.id );

				if( i == 0 )
					self.current = img;
			}
			$sourceImg.remove();
			doBuild();
		}

		function doBuild() {
			$imgFront.height( settings.height + "px" );
			$imgBack.height( settings.height + "px" );
			$imgMask.height( settings.height + "px" );
			$infoBox.height( settings.height + "px" );
			$thumbsBox.css('top', settings.thumbPos + "px" );

			$infoBox.width( settings.width + "px" );

			$imgFront.show();
			$imgBack.show();
			
			doTransition( self.current.id );

			$("li",$thumbList).click(function(e) {
				clearInterval(refreshIntervalId);
				doTransition( "img" + $(this).attr('id') );				
			});
			refreshIntervalId = setInterval(doShift, settings.timer);
		}

		function doShift() {
			rCount++
			
			if (rCount >= settings.rotateLimit) {
				clearInterval(refreshIntervalId);
				return;
			}
			
			if(inTransit)
				return;
	
			var pos = self.current.pos+1;
			if( pos >= self.data.pos.length)
				pos = 0;

			var id = self.data.pos[pos];
			doTransition( id ); 
		}

		function doTransition( id ) {
			if(inTransit)
				return;
				
			inTransit = true;
			
			self.next = self.data.images[id];
//			alert( myDump( self.next,"","  ",0,30) );
//			alert( $imgFront.css('background-image') );

			$imgBack.css('background-image', "url('" + self.next.src + "')" );
			$infoBody.html( self.next.body );
//			$infoLink.html( '' );

			$("li",$thumbList).removeClass('current');
			$("#" + id.substr(3,40)).addClass('current');

/*
			if( self.next.link && self.next.link.length > 2 ) {
				var $link = $("<a>" + settings.linkLabel + "</a>");
				$link.attr('href',self.next.link);
				$infoLink.append( $link );
			}
*/
			$imgFront.fadeOut('slow', function() {
				$imgFront.css('background-image', "url('" + self.next.src + "')" );
				
				$imgFront.css('opacity',1);
				$imgFront.show();
				inTransit = false;
				self.current = self.next;
			});	
		}
	};

	$.mastheadfader = {};
	
	$.fn.mastheadfader.defaults = {
		sourceImg			: "meld-msg-img",
		linkLabel			: "more &raquo;",
		height				: "300",
		width				: "950",
		thumbPos			: "150",
		timer				: 8000,
		rotateLimit			: 50
	};

	myDump = function(obj, name, indent, depth, maxdepth) {
   		var self = this;

		if(!maxdepth)
			maxdepth = 1;
	
		if (depth > maxdepth) {
		     return indent + name + ": <Maximum Depth Reached>\n";
		}
		
		if (typeof obj == "object") {
		     var child = null;
		     var output = indent + name + "\n";
		     indent += "\t";
		     for (var item in obj)
		     {
		           try {
		                  child = obj[item];
		           } catch (e) {
		                  child = "<Unable to Evaluate>";
		           }
		           if (typeof child == "object") {
						  output += myDump(child, item, indent,depth++,maxdepth);
		           } else {
		                  output += indent + item + ": " + child + "\n";
		           }
		     }
		     return output;
		} else {
		     return obj;
		}
   }

})($);