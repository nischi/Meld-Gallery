<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
<cfsavecontent variable="local.str"><cfoutput>
<cfif not structKeyExists(request,"MeldGallery_header_cycle_dotnav")>
	<link rel="stylesheet" href="#rc.PluginDirectory##rc.subsystem#/assets/css/dotnav.css" type="text/css" media="screen" />
	<cfset request.MeldGallery_header_cycle_dotnav = true />
</cfif>
<script type="text/javascript">
jQuery(document).ready(function() {
   jQuery('##gal#rc.displayBean.getDisplayID()#')
	.cycle({ 
		fx: '#rc.params.effect#',
		containerResize: 0,
		fit: 0,
		width: #rc.params.imagewidth#,
		height: #rc.params.imageheight#,
	    speed: #rc.params.speed#, 
	    timeout: #rc.params.interval#, 
	    pager:  '##gal#rc.displayBean.getDisplayID()#-nav',
		pagerAnchorBuilder: function(idx, slide){
			return '<a href="##"></a>';
		}
		<cfif rc.params.pauseonnav>,onPagerEvent: doMeldGalleryPause</cfif>
	});
});
</script>
</cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>