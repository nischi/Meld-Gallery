<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
<cfsavecontent variable="local.str"><cfoutput>
<script type="text/javascript">
jQuery(document).ready(function() {
    var options = {
        navigation	: 'hover',
        direction	: '#rc.params.direction#',
		width		: #rc.params.thumbwidth#,
		height		: #rc.params.thumbheight#,
		zindex		: 200
    }
    $('##gal#rc.displayBean.getDisplayID()#').popeye(options);
});
</script>
</cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>