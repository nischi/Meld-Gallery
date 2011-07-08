/*
<!---
||MELDGALLERYLICENSE||
--->
*/
/*
$(document).ready(function() {

	var oSelectTable	= false;
	var initTab			= $("#msTabs").tabs('option', 'selected');

	function doSelect() {
		if (!oSelectTable && $('#ms-datatable').attr('id') != undefined) {
			$('#ms-datatable').selecttable( {
				"url": $('#ms-datatable').attr('data-url')
			} );
			oSelectTable = true;
		}
	}
	
	if (initTab == 1 && !oSelectTable) {
		doSelect();
	}

	$("#msTabs").bind("tabsselect", function(event, ui) {
		if( ui.index == 1 && !oSelectTable)
			doSelect();	
	});
} );
*/