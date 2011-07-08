<!---
||MELDGALLERYLICENSE||
--->
<cfif rc.displayBean.beanExists() and ArrayLen(rc.ImageArray)>
<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc			= rc>
	<!--- headers --->
	<cfoutput>
	<cfinclude template="headers/popeye.cfm">
	</cfoutput>
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
	<div class="ppy1" id="gal#rc.displayBean.getDisplayID()#">
		<div class="ppy-outer">
		    <div class="ppy-stage">
		        <div class="ppy-nav">
		            <a class="ppy-prev" title="Previous image">Previous image</a>
		            <a class="ppy-switch-enlarge" title="Enlarge">Enlarge</a>
		            <a class="ppy-switch-compact" title="Close">Close</a>
		            <a class="ppy-next" title="Next image">Next image</a>
		        </div>
		    </div>
		</div>
		<div class="ppy-caption">
		    <div class="ppy-counter">
		        #rc.mmRBF.key('image')# <strong class="ppy-current"></strong> #rc.mmRBF.key('of')# <strong class="ppy-total"></strong> 
		    </div>
		    <span class="ppy-text"></span>
		</div>
		<ul class="ppy-imglist">
		<cfloop from="1" to="#ArrayLen(rc.ImageArray)#" index="local.iiX">
			<cfset local.cImage = rc.ImageArray[local.iiX] />
			<li class="ppy-img"><a href="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'large')#">
				<img width="#rc.params.thumbwidth#" height="#rc.params.thumbheight#" <cfif rc.params.showCaption>alt="#local.cImage.getCaption()#"</cfif> title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'small')#">
			</a>
			<cfif rc.params.showCaption>
			<span class="ppy-extcaption">
				<h3>#local.cImage.getCaption()#</h3>
				#local.cImage.getDescription()#
				<cfif len(local.cImage.getLinkURL())><span class="link"><a href="#local.cImage.getLinkURL()#">#rc.mmRBF.key('link')#</a></span></cfif>
			</span>
			</cfif>
			</li>
		</cfloop>
		</ul>
	</div>	
<!--- end content --->
</cfoutput> 
</cfif>
