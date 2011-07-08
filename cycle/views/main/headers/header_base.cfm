<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
<cfsavecontent variable="local.str"><cfoutput>
<script type="text/javascript">
jQuery(document).ready(function() {
   jQuery('##gal#rc.displayBean.getDisplayID()#').cycle({
		fx: '#rc.params.effect#',
		containerResize: 0,
		fit: 0,
		width: #rc.params.imagewidth#,
		height: #rc.params.imageheight#,
	    speed: #rc.params.speed#, 
	    timeout: #rc.params.interval#
		<cfif rc.params.pauseonnav>,onPagerEvent: doMeldGalleryPause</cfif>
	});
});
</script>
</cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>