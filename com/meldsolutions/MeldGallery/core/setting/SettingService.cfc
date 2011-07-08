<!---^^LICENSE-START^^--->
<!---
||MELDGALLERYLICENSE||
--->
<!---^^LICENSE-END^^--->

<cfcomponent name="SettingService" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="SettingService">
		<cfargument name="SettingDAO" type="any" required="true" />
		<cfargument name="SettingGateway" type="any" required="true" />

		<cfset variables.SettingDAO = arguments.SettingDAO />
		<cfset variables.SettingGateway = arguments.SettingGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createSetting" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="SettingsID" type="uuid" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsMaster" type="boolean" required="false" />
		<cfargument name="ImageWidth" type="numeric" required="false" />
		<cfargument name="ImageHeight" type="numeric" required="false" />
		<cfargument name="ImageWidthMedium" type="numeric" required="false" />
		<cfargument name="ImageHeightMedium" type="numeric" required="false" />
		<cfargument name="ImageWidthSmall" type="numeric" required="false" />
		<cfargument name="ImageHeightSmall" type="numeric" required="false" />
		<cfargument name="ImageResizeType" type="string" required="false" />
		<cfargument name="ImageAspectType" type="string" required="false" />
		<cfargument name="ImageQualityType" type="string" required="false" />
		<cfargument name="ImageResizeTypeMedium" type="string" required="false" />
		<cfargument name="ImageAspectTypeMedium" type="string" required="false" />
		<cfargument name="ImageQualityTypeMedium" type="string" required="false" />
		<cfargument name="ImageResizeTypeSmall" type="string" required="false" />
		<cfargument name="ImageAspectTypeSmall" type="string" required="false" />
		<cfargument name="ImageQualityTypeSmall" type="string" required="false" />
		<cfargument name="ImageCropType" type="string" required="false" />
		<cfargument name="ImageCropTypeMedium" type="string" required="false" />
		<cfargument name="ImageCropTypeSmall" type="string" required="false" />
		<cfargument name="DefaultDisplayTypeID" type="string" required="false" />
		<cfargument name="FileSizeLimit" type="numeric" required="false" />
		<cfargument name="SyncInfo" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
				
		<cfset var SettingBean = createObject("component","SettingBean").init(argumentCollection=arguments) />
		<cfreturn SettingBean />
	</cffunction>

	<cffunction name="getSetting" access="public" output="false" returntype="any">
		<!---^^PRIMARY-START^^--->
		<cfargument name="SettingsID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var SettingBean = createSetting(argumentCollection=arguments) />
		<cfset variables.SettingDAO.read(SettingBean) />
		<cfreturn SettingBean />
	</cffunction>

	<cffunction name="getSettings" access="public" output="false" returntype="array">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="SettingsID" type="uuid" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsMaster" type="boolean" required="false" />
		<cfargument name="ImageWidth" type="numeric" required="false" />
		<cfargument name="ImageHeight" type="numeric" required="false" />
		<cfargument name="ImageWidthMedium" type="numeric" required="false" />
		<cfargument name="ImageHeightMedium" type="numeric" required="false" />
		<cfargument name="ImageWidthSmall" type="numeric" required="false" />
		<cfargument name="ImageHeightSmall" type="numeric" required="false" />
		<cfargument name="ImageResizeType" type="string" required="false" />
		<cfargument name="ImageAspectType" type="string" required="false" />
		<cfargument name="ImageQualityType" type="string" required="false" />
		<cfargument name="ImageResizeTypeMedium" type="string" required="false" />
		<cfargument name="ImageAspectTypeMedium" type="string" required="false" />
		<cfargument name="ImageQualityTypeMedium" type="string" required="false" />
		<cfargument name="ImageResizeTypeSmall" type="string" required="false" />
		<cfargument name="ImageAspectTypeSmall" type="string" required="false" />
		<cfargument name="ImageQualityTypeSmall" type="string" required="false" />
		<cfargument name="ImageCropType" type="string" required="false" />
		<cfargument name="ImageCropTypeMedium" type="string" required="false" />
		<cfargument name="ImageCropTypeSmall" type="string" required="false" />
		<cfargument name="DefaultDisplayTypeID" type="string" required="false" />
		<cfargument name="FileSizeLimit" type="numeric" required="false" />
		<cfargument name="SyncInfo" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfreturn variables.SettingGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="SettingsID" type="uuid" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsMaster" type="boolean" required="false" />
		<cfargument name="ImageWidth" type="numeric" required="false" />
		<cfargument name="ImageHeight" type="numeric" required="false" />
		<cfargument name="ImageWidthMedium" type="numeric" required="false" />
		<cfargument name="ImageHeightMedium" type="numeric" required="false" />
		<cfargument name="ImageWidthSmall" type="numeric" required="false" />
		<cfargument name="ImageHeightSmall" type="numeric" required="false" />
		<cfargument name="ImageResizeType" type="string" required="false" />
		<cfargument name="ImageAspectType" type="string" required="false" />
		<cfargument name="ImageQualityType" type="string" required="false" />
		<cfargument name="ImageResizeTypeMedium" type="string" required="false" />
		<cfargument name="ImageAspectTypeMedium" type="string" required="false" />
		<cfargument name="ImageQualityTypeMedium" type="string" required="false" />
		<cfargument name="ImageResizeTypeSmall" type="string" required="false" />
		<cfargument name="ImageAspectTypeSmall" type="string" required="false" />
		<cfargument name="ImageQualityTypeSmall" type="string" required="false" />
		<cfargument name="ImageCropType" type="string" required="false" />
		<cfargument name="ImageCropTypeMedium" type="string" required="false" />
		<cfargument name="ImageCropTypeSmall" type="string" required="false" />
		<cfargument name="DefaultDisplayTypeID" type="string" required="false" />
		<cfargument name="FileSizeLimit" type="numeric" required="false" />
		<cfargument name="SyncInfo" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->

		<cfreturn variables.SettingGateway.getBeanByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getByArray" access="public" output="false" returntype="Struct" >
		<cfargument name="idArray" type="array" required="true" />

		<cfreturn variables.SettingGateway.getByArray(argumentCollection=arguments) />
	</cffunction>
	
	<cffunction name="search" access="public" output="false" returntype="struct">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="false" default="*" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="10"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isPaged" type="numeric" required="false" default="true" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var aSetting			= ArrayNew(1)>
		<cfset var iiX				= "" >
		<cfset var isValid			= false >
		<cfset var sReturn			= StructNew()>
		
		<cfif arguments.isPaged and not arguments.count>
			<cfset arguments.isCount = true>
			<cfset sReturn.count = variables.SettingGateway.search(argumentCollection=arguments) />
			<cfset arguments.isCount = false>
		<cfelse>
			<cfset sReturn.count = arguments.count />
		</cfif>
		
		<cfset aSetting				= variables.SettingGateway.search(argumentCollection=arguments) />

		<cfset sReturn.start		= arguments.start>
		<cfset sReturn.size			= arguments.size>
		<cfset sReturn.itemarray	= aSetting>

		<cfreturn sReturn />
	</cffunction>
	

	<cffunction name="saveSetting" access="public" output="false" returntype="boolean">
		<cfargument name="SettingBean" type="any" required="true" />

		<cfreturn variables.SettingDAO.save(SettingBean) />
	</cffunction>
	
	<cffunction name="updateSetting" access="public" output="false" returntype="boolean">
		<cfargument name="SettingBean" type="any" required="true" />

		<cfset var success =  false />
		<cfset var originalSettingsBean = getSetting( SettingBean.getSettingsID()  ) /> 
		
		<cfif originalSettingsBean.getDefaultDisplayTypeID() neq SettingBean.getDefaultDisplayTypeID()>
			<cfset getDisplayImageService().invalidateMuraGalleryImages( SettingBean.getSiteID() ) />
		</cfif>
				
		<cfset success = variables.SettingDAO.update(SettingBean) />
		<cfset getMeldGalleryManager().clearSiteSettings() />
		
		<cfreturn success />
	</cffunction>

	<cffunction name="deleteSetting" access="public" output="false" returntype="boolean">
		<!---^^PRIMARY-START^^--->
		<cfargument name="SettingsID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var SettingBean = createSetting(argumentCollection=arguments) />
		<cfreturn variables.SettingDAO.delete(SettingBean) />
	</cffunction>
<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->

	<cffunction name="createBaseSiteSettings" access="public" output="false" returntype="any">
		<cfargument name="siteID" type="string" required="true" />

		<cfreturn variables.SettingGateway.createBaseSiteSettings(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="setDisplayImageService" access="public" returntype="void" output="false">
		<cfargument name="DisplayImageService" type="any" required="true" />
		<cfset variables.instance.DisplayImageService = arguments.DisplayImageService />
	</cffunction>
	<cffunction name="getDisplayImageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.DisplayImageService />
	</cffunction>

	<cffunction name="setMeldGalleryManager" access="public" returntype="void" output="false">
		<cfargument name="MeldGalleryManager" type="any" required="true" />
		<cfset variables.instance.MeldGalleryManager = arguments.MeldGalleryManager />
	</cffunction>
	<cffunction name="getMeldGalleryManager" access="public" returntype="any" output="false">
		<cfreturn variables.instance.MeldGalleryManager />
	</cffunction>

<!---^^CUSTOMEND^^--->
</cfcomponent>



