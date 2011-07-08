<!---^^LICENSE-START^^--->
<!---
||MELDGALLERYLICENSE||
--->
<!---^^LICENSE-END^^--->




<cfcomponent name="DisplayimageService" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="DisplayimageService">
		<cfargument name="DisplayimageDAO" type="any" required="true" />
		<cfargument name="DisplayimageGateway" type="any" required="true" />

		<cfset variables.DisplayimageDAO = arguments.DisplayimageDAO />
		<cfset variables.DisplayimageGateway = arguments.DisplayimageGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createDisplayimage" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="DisplayImageID" type="uuid" required="false" />
		<cfargument name="DisplayID" type="string" required="false" />
		<cfargument name="ImageID" type="string" required="false" />
		<cfargument name="IsProcessed" type="boolean" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Attempts" type="boolean" required="false" />
		<cfargument name="ProcessDate" type="string" required="false" />
		<cfargument name="IsProcessingID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsExternal" type="boolean" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="IsMuraGallery" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
				
		<cfset var DisplayimageBean = createObject("component","DisplayimageBean").init(argumentCollection=arguments) />
		<cfreturn DisplayimageBean />
	</cffunction>

	<cffunction name="getDisplayimage" access="public" output="false" returntype="any">
		<!---^^PRIMARY-START^^--->
		<cfargument name="DisplayImageID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var DisplayimageBean = createDisplayimage(argumentCollection=arguments) />
		<cfset variables.DisplayimageDAO.read(DisplayimageBean) />
		<cfreturn DisplayimageBean />
	</cffunction>

	<cffunction name="getDisplayImageByImageID" access="public" output="false" returntype="any">
		<cfargument name="DisplayID" type="uuid" required="true" />
		<cfargument name="ImageID" type="uuid" required="true" />
		
		<cfreturn variables.DisplayimageGateway.getBeanByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getDisplayImageByFileID" access="public" output="false" returntype="any">
		<cfargument name="DisplayID" type="uuid" required="true" />
		<cfargument name="FileID" type="uuid" required="true" />
		
		<cfreturn variables.DisplayimageGateway.getBeanByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="DisplayImageID" type="uuid" required="false" />
		<cfargument name="DisplayID" type="string" required="false" />
		<cfargument name="ImageID" type="string" required="false" />
		<cfargument name="IsProcessed" type="boolean" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Attempts" type="boolean" required="false" />
		<cfargument name="ProcessDate" type="string" required="false" />
		<cfargument name="IsProcessingID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsExternal" type="boolean" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="IsMuraGallery" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->

		<cfreturn variables.DisplayimageGateway.getBeanByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getByArray" access="public" output="false" returntype="Struct" >
		<cfargument name="idArray" type="array" required="true" />

		<cfreturn variables.DisplayimageGateway.getByArray(argumentCollection=arguments) />
	</cffunction>
	
	<cffunction name="search" access="public" output="false" returntype="struct">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="false" default="*" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="10"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isPaged" type="numeric" required="false" default="true" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var aDisplayimage			= ArrayNew(1)>
		<cfset var iiX				= "" >
		<cfset var isValid			= false >
		<cfset var sReturn			= StructNew()>
		
		<cfif arguments.isPaged and not arguments.count>
			<cfset arguments.isCount = true>
			<cfset sReturn.count = variables.DisplayimageGateway.search(argumentCollection=arguments) />
			<cfset arguments.isCount = false>
		<cfelse>
			<cfset sReturn.count = arguments.count />
		</cfif>
		
		<cfset aDisplayimage				= variables.DisplayimageGateway.search(argumentCollection=arguments) />

		<cfset sReturn.start		= arguments.start>
		<cfset sReturn.size			= arguments.size>
		<cfset sReturn.itemarray	= aDisplayimage>

		<cfreturn sReturn />
	</cffunction>
	

	<cffunction name="saveDisplayimage" access="public" output="false" returntype="boolean">
		<cfargument name="DisplayimageBean" type="any" required="true" />

		<cfreturn variables.DisplayimageDAO.save(DisplayimageBean) />
	</cffunction>
	
	<cffunction name="updateDisplayimage" access="public" output="false" returntype="boolean">
		<cfargument name="DisplayimageBean" type="any" required="true" />

		<cfreturn variables.DisplayimageDAO.update(DisplayimageBean) />
	</cffunction>

	<cffunction name="deleteDisplayimage" access="public" output="false" returntype="boolean">
		<!---^^PRIMARY-START^^--->
		<cfargument name="DisplayImageID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var DisplayimageBean = createDisplayimage(argumentCollection=arguments) />
		<cfreturn variables.DisplayimageDAO.delete(DisplayimageBean) />
	</cffunction>
<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->
	<cffunction name="setDisplayImages" access="public" output="false" returntype="boolean">
		<cfargument name="DisplayBean" type="any" required="true" />

		<cfreturn variables.DisplayimageGateway.setDisplayImages(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="cleanImageGroup" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupID" type="string" required="true" />

		<cfreturn variables.DisplayimageGateway.cleanImageGroup(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="deleteByImageID" access="public" output="false" returntype="void">
		<cfargument name="ImageID" type="string" required="true" />

		<cfreturn variables.DisplayimageGateway.deleteByImageID(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="deleteByDisplayID" access="public" output="false" returntype="void">
		<cfargument name="DisplayID" type="string" required="true" />

		<cfreturn variables.DisplayimageGateway.deleteByDisplayID(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="invalidateByImageID" access="public" output="false" returntype="void">
		<cfargument name="ImageID" type="string" required="true" />

		<cfreturn variables.DisplayimageGateway.invalidateByImageID(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="invalidateDisplay" access="public" output="false" returntype="void">
		<cfargument name="DisplayID" type="uuid" required="true" />
				
		<cfreturn variables.DisplayimageGateway.inValidateDisplay(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="invalidateMuraGalleryImages" access="public" output="false" returntype="void">
		<cfargument name="SiteID" type="string" required="false" />

		<cfreturn variables.DisplayimageGateway.invalidateMuraGalleryImages(argumentCollection=arguments) />
	</cffunction>

<!---^^CUSTOMEND^^--->
</cfcomponent>





