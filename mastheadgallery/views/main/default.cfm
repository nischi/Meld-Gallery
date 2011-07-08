<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc			= rc>
	<!--- headers --->
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
<cfif not rc.displayBean.getIsActive()>
	#local.rc.mmRBF.key('displaynotactive')#
<cfelse>
<script type="text/javascript">
$(document).ready(function() {
	$('##meld-masthead-gallery').mastheadfader( {
		height: #rc.params.imageheight#,
		width: #rc.params.gallerywidth#
	} );
});	
</script>
		<div id="meld-masthead-gallery">
			<div id="ms-msg-back"></div>
			<div id="ms-msg-front"
			<cfif ArrayLen(rc.ImageArray)>
			style="background-image: url('#rc.ImageArray[1].getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,rc.ImageArray[1].getDisplayFileID(),rc.ImageArray[1].getType(), 'large')#')"
			</cfif>
			>
				<ul id="meld-msg-img">
					<cfloop from="1" to="#ArrayLen(rc.ImageArray)#" index="local.iiX">
						<cfset local.cImage = rc.ImageArray[local.iiX] />
						<li class="ms-msg-main" id="img#local.cImage.getImageID()#">
							<img title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'large')#">
							<div>
							<cfif len(#local.cImage.getCaption()#)><h3>#local.cImage.getCaption()#</h3></cfif>
							#local.cImage.getDescription()#
							</div>
						</li>
						<cfif local.iiX gt 6>
							<cfbreak>
						</cfif>
					</cfloop>
				</ul>
			</div>
			<div id="ms-msg-mask"></div>
			<div id="ms-msg-infobox">
				<div id="ms-msg-mast">
					<cfif len( rc.params.mast )>
						#rc.$.getContentRenderer().setDynamicContent(rc.params.mast)#
					</cfif>
				</div>
				<div id="ms-msg-header">
					<cfif len( rc.params.header )>
						#rc.$.getContentRenderer().setDynamicContent(rc.params.header)#
					</cfif>
				</div>
				<div id="ms-msg-body">
					<div id="ms-msg-content">
						<cfif ArrayLen(rc.ImageArray)>
						<cfset local.cImage = rc.ImageArray[1] />
						<cfif len(#local.cImage.getCaption()#)><h3>#local.cImage.getCaption()#</h3></cfif>
						#local.cImage.getDescription()#
						</cfif>
					</div>
					<div id="ms-msg-link">
					</div>
					<div id="ms-msg-thumbs">
						<ul id="ms-msg-thumbs-list">
						<cfloop from="1" to="#ArrayLen(rc.ImageArray)#" index="local.iiX">
							<cfset local.cImage = rc.ImageArray[local.iiX] />
							<li id="#local.cImage.getImageID()#" class=""><img title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'small')#"></li>
							<cfif local.iiX gt 6>
								<cfbreak>
							</cfif>
						</cfloop>
						</ul>
					</div>
				</div>
				<div id="ms-msg-nav">
					<cfif len( rc.params.menu )>
						#rc.$.getContentRenderer().setDynamicContent( rc.params.menu )#
					</cfif>
				</div>
			</div>
		</div>
</cfif>
	</div>	
<!--- end content --->
</cfoutput> 