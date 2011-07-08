<!---
||MELDGALLERYLICENSE||
--->
<cfif rc.displayBean.beanExists() and ArrayLen(rc.ImageArray)>
<cfsilent>
	<!--- headers --->
	<cfinclude template="headers/base.cfm">
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div class="meld-body">
	<!-- CONTENT HERE -->
	<div id="gal#rc.displayBean.getDisplayID()#" class="gallerySlideShow">
	<cfloop from="1" to="#ArrayLen(rc.ImageArray)#" index="local.iiX">
		<cfset local.cImage = rc.ImageArray[local.iiX] />
		<cfif len(local.cImage.getLinkUrl())><a href="#local.cImage.getLinkUrl()#"></cfif><img alt="image" title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'large')#" width="#rc.params.imagewidth#" height="#rc.params.imageheight#"><cfif len(local.cImage.getLinkUrl())></a></cfif>
	</cfloop>
	[null]
	</div>
</div>	
<!--- end content --->
</cfoutput>
</cfif>
