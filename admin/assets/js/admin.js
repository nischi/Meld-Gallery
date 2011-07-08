/*

This file is part of the Meld Gallery application.

Meld Gallery is licensed under the GPL 2.0 license
Copyright (C) 2010 2011 Meld Solutions Inc. http://www.meldsolutions.com/

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation, version 2 of that license..

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

*/
function doShowHide( src,tgt ) {
	if ( $("#"+src).is(':checked') ) {
		$("#"+tgt).show();
	}
	else {
		$("#"+tgt).hide();
	}
}
function doClickShowHide( tgt,act,editor ) {
	if ( $("#"+tgt).is(':hidden') || act == true ) {
		$("#"+tgt).show();
		if( editor.length ) {
			jQuery('#'+editor).ckeditor({
				toolbar:'Summary',
				height:'120',
	     		customConfig : 'config.js.cfm'},
	     		htmlEditorOnComplete
	     	);
		}
	}
	else {
		$("#"+tgt).hide();
	}
}

$(document).ready(function() {

	enableImgResize = function() {
		var status = 0;
		$("#ui-swapsize").click( function( event ) {
			if(status == 0) {
				$('.ui-smallimage').each( function() {
					var src			= $(this).attr('src');
					var srcNew		= src.replace(/_small/i, "_medium");
			 		$(this).attr('src',srcNew);
			 		$(this).addClass('ui-mediumimage');
			 		$(this).removeClass('ui-smallimage');
				});
				status = 1;
			}
			else {
				$('.ui-mediumimage').each( function() {
					var src			= $(this).attr('src');
					var srcNew		= src.replace(/_medium/i, "_small");
			 		$(this).attr('src',srcNew);
			 		$(this).addClass('ui-smallimage');
			 		$(this).removeClass('ui-mediumimage');
				});
				status = 0;
			}
			
		});

		$(".ui-smallimage").live('click',function( event ) {
			var src			= $(this).attr('src');
			var srcNew		= src.replace(/_small/i, "_medium");
	 		$(this).attr('src',srcNew);
	 		$(this).addClass('ui-mediumimage');
	 		$(this).removeClass('ui-smallimage');
		});
		$(".ui-mediumimage").live('click',function( event ) {
			var src			= $(this).attr('src');
			var srcNew		= src.replace(/_medium/i, "_small");
	 		$(this).attr('src',srcNew);
	 		$(this).addClass('ui-smallimage');
	 		$(this).removeClass('ui-mediumimage');
		});
		
	}


	$("#ui-button-cancel","#meld-edit-form").click(function() {
		$("#meld-edit-form").attr("onsubmit","");
		$('#meld-edit-form').submit();
	});

	$(":submit","#meld-edit-form").click(function( e ) {
		if ($(this).attr('id') != 'btdelete') {
			return true;
		}
		else {
			var $dialog = $("<div>" + $(this).attr('data-message') + "</div>");

			$dialog.dialog("destroy");

			$dialog.dialog({
				resizable: false,
				height: 140,
				modal: true,
				dialogClass: 'ui-state-highlight',
				title: $(this).attr('data-title'),
				buttons: {
					"Cancel": function(){
						$(this).dialog('close');
					},
					"Delete": function(){
						$('#btdeleteconfirm').val('delete');
						$('#meld-edit-form').submit();
					}
				}
			});
			return false;
		}
	});
});
