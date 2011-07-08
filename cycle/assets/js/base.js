/*
 * 
 */
function doMeldGalleryCycleSize( tgt ) {
	var panelWidth = jQuery(".slide",tgt).outerWidth();
	var imgWidth = jQuery("img",tgt).width();
	var descWidth = jQuery(".desc",tgt).outerWidth()-jQuery(".desc",tgt).width()+5;
	var descFinalWidth = panelWidth - imgWidth - descWidth;
	jQuery('.desc',tgt).each( function() {
		jQuery(this).width( descFinalWidth );		
	});
}
function doMeldGalleryPause( panel,tgt ) {
	jQuery("#"+ jQuery(tgt).parent().attr('id'))
	.cycle('pause'); 
}
