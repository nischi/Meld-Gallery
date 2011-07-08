/*
<!---
||MELDGALLERYLICENSE||
--->
*/

(function($) {
	$.fn.selecttable = function( settings ) {
		var settings		= $.extend({},$.fn.selecttable.defaults,settings);
		var self			= this;
		var $container		= $(this);

		var $divContent		= $(".ui-selecttable-body",$container);
		var $divHeader		= $(".ui-selecttable-header",$container);
		var $tdGroup		= $(".ui-selecttable-table",$container);

		var $divTotalVal	= $("#ui-totalbox");

		var $pg				= $("#ui-selecttable-pages");
		var $pgFirst		= $("<li id='ui-page-first' class='ui-nv'>&laquo;&laquo;</li>");
		var $pgBack			= $("<li id='ui-page-back' class='ui-nv'>&laquo;</li>");
		var $pgNext			= $("<li id='ui-page-next' class='ui-nv'>&raquo;</li>");
		var $pgLast			= $("<li id='ui-page-last' class='ui-nv'>&raquo;&raquo;</li>");
		var $pgPos1			= $("<li id='ui-page-ps1' class='ui-pg'></li>");
		var $pgPos2			= $("<li id='ui-page-ps2' class='ui-pg'></li>");
		var $pgPos3			= $("<li id='ui-page-ps3' class='ui-pg'></li>");
		var $pgPos4			= $("<li id='ui-page-ps4' class='ui-pg'></li>");
		var $pgPos5			= $("<li id='ui-page-ps5' class='ui-pg'></li>");

		self.dataPaging		= {};
		self.isLoading		= false;

		self.showModal = function() {
			$(".ui-selecttable-modal",$container).show();
		}
	
		self.hideModal = function() {
			$(".ui-selecttable-modal",$container).hide();
		}

		self.hideModal();

		renderInit();
		renderGrid();

		function renderInit() {
			$(".ui-radioitem",$tdGroup).live('click',function( event ) {
				$("#ui-selecttable-default").val( 1 );	
			});
			
			$(".ui-en",$pg).live('click',function( event ) {
				if( $(this).attr('id') == "ui-page-first" ) {
					doNavigation( 1 );
				}
				else if( $(this).attr('id') == "ui-page-back" ) {
					doNavigation( self.dataPaging.iCurrentPage-1 );
				} 
				else if ($(this).attr('id') == "ui-page-last") {
					doNavigation(self.dataPaging.iTotalPages);
				}
				else if ($(this).attr('id') == "ui-page-next") {
					doNavigation(self.dataPaging.iCurrentPage + 1);
				}
				else if ($(this).is(".ui-pg")) {
					doNavigation( $(this).html() );
				}
			});

			$("#ui-do-filter").click(function(){
				remoteLoadData();
			});
			
			$("#ui-clear-filter").click(function(){
				$(".ui-filter").val('');		
				remoteLoadData();
			});
			$("#ui-filter").bind("keypress", function(e) {
				if (e.keyCode == 13) {
					e.preventDefault();
					remoteLoadData();
				}
			});
			$("#ui-filter-image").bind("keypress", function(e) {
				if (e.keyCode == 13) {
					e.preventDefault();
					remoteLoadData();
				}
			});
		}

		// internal functions
		function renderPaging() {
		}

		function doInitGroup( data ) {			
			for(var i = 0;i < data.length;i++) {
				var item = data[i];
				self.data.images[ item.imageid ] = item;
				doAddToGroup( item.imageid );
			}
		}

		function doRenderData( data, rerender) {
			var	item			= "";
			var	images			= "";
								
			$('.row',$tdGroup).remove();			
			
			for(var i = 0;i < data.data.length;i++) {
				item	= data.data[i];
				images	= item.images;
				
				var $colName = $("<td class='midWidth'></td>");
				$colName.html( item.name + " (" + item.imagecount + ")" );

				var $colImages = $("<td class='midWidth'></td>");

				for(var x = 0;x < images.length;x++) {
					var $image = $("<img src='" + data.path + "default/cache/file/" + images[x].fileid + "_small."+ images[x].type +"' />");
					$colImages.append( $image );
				}

				var $colForm = $("<td class='bitWidth'><input required='true' type='radio' class='radio ui-radioitem' name='" + settings.fieldname + "' value='" + item[settings.ident] + "'></td>");

				var $row = $("<tr class='row'></tr>");
				if( i % 2 == 0)
					$row.addClass("even");
					
				$row.append( $colForm );
				$row.append( $colName );
				$row.append( $colImages );
							
				$tdGroup.append( $row );
			}

			doRenderPaging( data );

			if( data.group != undefined )
				doInitGroup( data );
		}

		function doUpdatePaging( data ) {

			self.dataPaging.iTotalRecords	= data.iTotalRecords;
			self.dataPaging.iDisplayStart	= data.iDisplayStart;
			
			self.dataPaging.iTotalPages		= Math.ceil( self.dataPaging.iTotalRecords/settings.iDisplayLength );

			self.dataPaging.iCurrentPage	= data.iDisplayStart/settings.iDisplayLength+1;

			if (self.dataPaging.iCurrentPage > 3) {
				if (self.dataPaging.iTotalPages - self.dataPaging.iCurrentPage < 2) 
					self.dataPaging.iPos1Page = self.dataPaging.iCurrentPage - 2 - (2 - (self.dataPaging.iTotalPages - self.dataPaging.iCurrentPage));
				else 
					self.dataPaging.iPos1Page = self.dataPaging.iCurrentPage - 2;
					
				if( self.dataPaging.iPos1Page < 1 )
					self.dataPaging.iPos1Page = 1;
			}
			else 
				self.dataPaging.iPos1Page = 1;

//			$divTotalVal.html( self.dataPaging.iTotalRecords );
						
//			alert( myDump( self.dataPaging,"","  ",0,30) );

		}

		
		function doRenderPaging( data ) {
			var pgPos = 0;
			
			if( self.dataPaging.iTotalPages == 1 )
				$pg.hide();
			else
				$pg.show();

			if( self.dataPaging.iCurrentPage == 1) {
				$pgFirst.removeClass("ui-en");
				$pgBack.removeClass("ui-en");
			}
			else {
				$pgFirst.addClass("ui-en");
				$pgBack.addClass("ui-en");
			}
			
			$(".ui-pg").hide();
			$(".ui-pg").removeClass("ui-en");
			$(".ui-pg").removeClass("current");
			
			for(var i = self.dataPaging.iPos1Page;i <= self.dataPaging.iTotalPages;i++) {
				pgPos++;
				var $cPage = $("#ui-page-ps" + pgPos); 
				$cPage.show();
				$cPage.html( i );
				if( i == self.dataPaging.iCurrentPage)
					$cPage.addClass("current");
				else
					$cPage.addClass("ui-en");
				if(pgPos >= 5)
					break;
			}

			if( self.dataPaging.iCurrentPage == self.dataPaging.iTotalPages) {
				$pgNext.removeClass("ui-en");
				$pgLast.removeClass("ui-en");
			}
			else {
				$pgNext.addClass("ui-en");
				$pgLast.addClass("ui-en");
			}
		}

		function renderGrid(){
			self.showModal();

			$pg.hide();

			$pg.append($pgFirst);
			$pg.append($pgBack);
			$pg.append($pgPos1);
			$pg.append($pgPos2);
			$pg.append($pgPos3);
			$pg.append($pgPos4);
			$pg.append($pgPos5);
			$pg.append($pgNext);
			$pg.append($pgLast);

			self.dataPaging.iDisplayStart	= 0;
			
			$container.addClass("ui-imagegrid");

			if(settings.width != 0)
				$container.width(settings.width);
			else
				$container.width( '100%' );

			self.hideModal();
			self.isLoading = false;
	
			$container.show();
			remoteLoadData( {init:true} );
		}

		function doNavigation( pg ) {
			var pos = (pg-1) * settings.iDisplayLength;
			
			remoteLoadData( {iDisplayStart:pos,iTotalRecords:self.dataPaging.iTotalPages,iTotalDisplayRecords:self.dataPaging.iTotalPages} );
		}

		function remoteLoadData( options ) {
			self.showModal();
			$("#ui-selecttable-default").val( '' );	

			options	= $.extend( options,settings.loadOptions,{ iDisplayLength: settings.iDisplayLength } );
			options.criteria_any = $("#ui-filter").val();

			if( options.iDisplayStart == undefined )
				options.iDisplayStart=0;

			$.ajax({
				url: settings.url,
				data: options,
				success: function( response ) {
					// Check to see if the request was successful.
					if (response.success) {
//						alert( myDump( response,"","  ",0,30) );
						self.hideModal();
						doUpdatePaging( response );
						doRenderData( response );
					} else {
						self.hideModal();
						alert("selecttable BORKED");
					}
				},
				error: function(){
					self.hideModal();
					alert("selecttable PROCESS BORKED");
				}
				
			});		
		}
	};

	$.selecttable = {};

	$.fn.selecttable.defaults = {
		width				: '100%',
		url					: '',
		contentid			: '',
		iDisplayLength		: 10,
		fieldname			: 'displaybean_contentid',
		ident				: 'imagegroupid',
		text				: {deletegroupconfirm:"Are you sure you wish to remove all images from this group?"},
		loadOptions			: {method: 'getSelectTable',returnFormat: 'json'}
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