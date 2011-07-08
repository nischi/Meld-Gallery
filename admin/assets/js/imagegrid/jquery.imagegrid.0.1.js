/*
<!---
||MELDGALLERYLICENSE||
--->
*/
(function($) {
	$.fn.imagegrid = function( settings ) {
		var settings		= $.extend({},$.fn.imagegrid.defaults,settings);
		var self			= this;
		var $container		= $(this);
		var $divContent		= $(".ui-imagegrid-body",$container);
		var $divHeader		= $(".ui-imagegrid-header",$container);
		var $divList		= $(".ui-imagegrid-select-list",$container);
		var $divGroup		= $(".ui-imagegrid-group-list",$container);

		var $divTotalVal	= $("#ui-totalbox");

		var $pg				= $("#ui-imagegrid-pages");
		var $pgFirst		= $("<li id='ui-page-first' class='ui-nv'>&laquo;&laquo;</li>");
		var $pgBack			= $("<li id='ui-page-back' class='ui-nv'>&laquo;</li>");
		var $pgNext			= $("<li id='ui-page-next' class='ui-nv'>&raquo;</li>");
		var $pgLast			= $("<li id='ui-page-last' class='ui-nv'>&raquo;&raquo;</li>");
		var $pgPos1			= $("<li id='ui-page-ps1' class='ui-pg'></li>");
		var $pgPos2			= $("<li id='ui-page-ps2' class='ui-pg'></li>");
		var $pgPos3			= $("<li id='ui-page-ps3' class='ui-pg'></li>");
		var $pgPos4			= $("<li id='ui-page-ps4' class='ui-pg'></li>");
		var $pgPos5			= $("<li id='ui-page-ps5' class='ui-pg'></li>");

		self.data			= {};
		self.dataMap		= {};
		self.dataPaging		= {};

		self.isLoading		= false;

		$container.hide();

		$divGroup.sortable();

		// external functions	
		self.getSaveData = function() {
			return getDataForSave();
		}

		// external functions	
		self.save = function() {
			return remoteSaveData();
		}

		self.showModal = function() {
			$(".ui-imagegrid-modal",$container).show();
		}
	
		self.hideModal = function() {
			$(".ui-imagegrid-modal",$container).hide();
		}
		self.hideModal();
		renderInit();
		renderGrid();

		function renderInit() {
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

			$("li.ui-image",$divList).live('click',function( event ) {
				var id = $(this).attr('id').substring(3,40);
				if( isInGroup( id ) == false )
					doAddToGroup( id );
				else
					doRemoveFromGroup( id );
			});
			$("#ui-filter").bind("keypress", function(e) {
				if (e.keyCode == 13) {
					e.preventDefault();
					remoteLoadData();
				}
			});
			$("#ui-filter-selected").bind("change", function(e) {
				e.preventDefault();
				remoteLoadData();
			});
			
			$("#ui-imagegrid-save").click(function(){
				remoteSaveGroup();				
			});
			$("#ui-imagegrid-deleteall").click(function(){
				$("<div>" + settings.text.deletegroupconfirm + "</div>").dialog({
					title: '!',
					modal: true,
					dialogClass: 'ui-state-highlight',
					resizable: false,
					buttons: {
						Yes: function() {
							doRemoveAllFromGroup();
							$(this).dialog('close');
						},
						Cancel: function() {
							$(this).dialog('close');
						}
					}
				});
			});
						
			$("#ui-do-filter").click(function(){
				remoteLoadData();
			});
			
			$("#ui-clear-filter").click(function(){
				$("#ui-filter").val('');		
				remoteLoadData();
			});
			
			self.dataMap.imageGroup = {};
		}
		
		function doNavigation( pg ) {
			var pos = (pg-1) * settings.iDisplayLength;
			
			remoteLoadData( {iDisplayStart:pos,iTotalRecords:self.dataPaging.iTotalPages,iTotalDisplayRecords:self.dataPaging.iTotalPages} );
		}
		
		function isInGroup( id ) {
			return self.dataMap.imageGroup[ id ] != undefined;			
		}

		function doAddToGroup( id ) {
			var item	= "";
			
			if( isInGroup( id ) == true )
				return;

			self.dataMap.imageGroup[ id ] = id;
			item = self.data.images[ id ];
			
			$item = $("<li class='ui-image' id='grp"+ id +"'><img src='" + self.data.path + "cache/file/" + item.fileid + "_medium."+ item.type +"' width='75' height='75' /></li>");

			// do this way to avoid '/" issues
			if (item.caption.length)
				$item.attr('title',item.caption);

			$divGroup.append($item);
			$("#img"+id +" img").addClass('isSelected');
			$("#ui-countbox").html( $divGroup.children().length );
									
		}

		function doRemoveFromGroup( id ) {
			if( isInGroup( id ) == false )
				return;

			$("#grp"+id).remove();

			delete self.dataMap.imageGroup[ id ];			
			$("#img"+id +" img").removeClass('isSelected');			
			$("#ui-countbox").html( $divGroup.children().length );
		}

		function doRemoveAllFromGroup() {
			for (var i in self.dataMap.imageGroup) {
				doRemoveFromGroup(i);
			}
		}

		// internal functions
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
			var $item			= "";
			self.data			= {};
			self.data.images	= {};
			self.data.path		= data.path;
						
			$divList.children().remove();			
						
			for(var i = 0;i < data.data.length;i++) {
				var item = data.data[i];
				self.data.images[ item.imageid ] = item;
				$item = $("<li class='ui-image' id='img"+ item.imageid +"'><img src='" + data.path + "cache/file/" + item.fileid + "_medium."+ item.type +"' width='85' height='85' /></li>");
				// do this way to avoid '/" issues
				if (item.caption.length)
					$item.attr('title', item.caption);
				$divList.append($item);
				if( isInGroup( item.imageid ) )
					$("#img"+ item.imageid +" img",$divList).addClass('isSelected');			
			}

			doRenderPaging( data );

			if( data.group != undefined )
				doInitGroup( data.group );
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

			$divTotalVal.html( self.dataPaging.iTotalRecords );
						
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

		function remoteLoadData( options ) {
			self.showModal();

			var order = "";

			options	= $.extend( options,settings.loadOptions,{ iDisplayLength: settings.iDisplayLength } );
			options.criteria_any = $("#ui-filter").val();
			options.criteria_selected = $("#ui-filter-selected").val();
			if (options.criteria_selected.length > 0) {
				order = $divGroup.sortable('toArray');
				options.criteria_selectedlist = JSON.stringify(order);
			}

			if( options.iDisplayStart == undefined )
				options.iDisplayStart=0;

			$.ajax({
				url: settings.url,
				data: options,
				type: 'POST',
				success: function( response ) {
					// Check to see if the request was successful.
					if (response.success) {
//						alert( myDump( response,"","  ",0,30) );
						self.hideModal();
						doUpdatePaging( response );
						doRenderData( response );
					} else {
						self.hideModal();
						alert("imagegrid BORKED");
					}
				},
				error: function(){
					self.hideModal();
					alert("imagegrid PROCESS BORKED");
				}
				
			});		
		}

		function remoteSaveGroup( options ) {
			self.showModal();

			options	= $.extend( options,settings.saveOptions);

			var order = $divGroup.sortable('toArray');
			options.imageidlist = JSON.stringify( order );

			$.ajax({
				url: settings.url,
				type: 'POST',
				data: options,
				success: function( response ) {
					// Check to see if the request was successful.
					if (response.success) {
//						alert( myDump( response,"","  ",0,30) );
						self.hideModal();
					} else {
						self.hideModal();
						alert("imagegrid BORKED");
					}
				},
				error: function(){
					self.hideModal();
					alert("imagegrid PROCESS BORKED");
				}
				
			});		
		}

		$("#meld-edit-form").submit( function( e ) {
//			e.preventDefault();
			var order = $divGroup.sortable('toArray');
			var orderString = JSON.stringify( order ).replace(/\"grp/g, '\"');
			$("#imagegroupbean_imageidlist").val( orderString );
		});
	};

	$.imagegrid = {};

	$.fn.imagegrid.defaults = {
		width				: '100%',
		url					: '',
		initField			: '',		
		contentid			: '',
		iDisplayLength		: 30,
		text				: {deletegroupconfirm:"Are you sure you wish to remove all images from this group?"},
		onRenderComplete	: function() {},
		loadOptions			: {method: 'getImageGrid',returnFormat: 'json'},
		saveOptions			: {method: 'saveImageGroup',returnFormat: 'json'}
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