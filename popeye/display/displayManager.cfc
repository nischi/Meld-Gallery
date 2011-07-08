<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent name="displayManager" output="false" extends="MeldGallery.com.meldsolutions.mura.MuraDisplayManager">
	<!--- Mura Content Object dropdown renderer --->
	<cffunction name="renderAppOptionsRender" output="false" returntype="any">
		<cfargument name="$">
		<cfargument name="event">

		<cfset var beanFactory			= variables.pluginConfig.getApplication().getValue('beanFactory') />
		<cfset var displayTypeService	= beanFactory.getBean("DisplayTypeService") />
		<cfset var displayService		= beanFactory.getBean("DisplayService") />
		<cfset var displayTypeBean		= "" />
		<cfset var aDisplays			= ArrayNew(1) />
		<cfset var str					= "">
		<cfset var iiX					= "">
		<cfset var sArgs				= StructNew() />

		<cfset sArgs.objectID			= $.event().getValue('objectID') />
		<cfset sArgs.isActive			= 1 />
		<cfset displayTypeBean			= displayTypeService.getBeanByAttributes( argumentCollection=sArgs ) />

		<cfif displayTypeBean.beanExists()>
			<cfset sArgs					= StructNew() />
			<cfset sArgs.displayTypeID		= displayTypeBean.getDisplayTypeID() />
			<cfset sArgs.isActive			= 1 />
			<cfset sArgs.siteID				= $.event().getValue('siteID') />
			<cfset aDisplays				= displayService.getDisplays( argumentCollection=sArgs ) /> 	
		</cfif>

		<cfsavecontent variable="str"><cfoutput>
		<select name="availableObjects" id="availableObjects" class="multiSelect" size="14" style="width: 310px;">
			<cfloop from="1" to="#ArrayLen( aDisplays )#" index="iiX">
				<option value='plugin~#aDisplays[iiX].getName()#~#displayTypeBean.getObjectID()#~{"displayID":"#aDisplays[iiX].getDisplayID()#"}'>#aDisplays[iiX].getName()#</option>
			</cfloop>
		</select>
		</cfoutput></cfsavecontent>

		<cfreturn str>
	</cffunction>

</cfcomponent>