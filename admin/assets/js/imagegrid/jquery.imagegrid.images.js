/*
  	<!---
||MELDGALLERYLICENSE||
--->
*/
$(document).ready(function() {

	var oImageGrid	= false;
	var initTab		= $("#msTabs").tabs('option', 'selected');

	function doGrid() {
		if (!oImageGrid) {
			$('#ms-imagegrid').imagegrid({
				"url": $('#ms-imagegrid').attr('data-url'),
				"initField": "imagegrid_imageIDList"
			});
			oImageGrid = true;
		}
	}
	
	if (initTab == 1 && !oImageGrid) {
		doGrid();
	}

	$("#msTabs").bind("tabsselect", function(event, ui) {
		if( ui.index == 1 && !oImageGrid)
			doGrid();	
	});
} );