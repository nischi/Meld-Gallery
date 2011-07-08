<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	<cfset variables.framework=getFrameworkVariables()>

	<cffunction name="onApplicationLoad">
		<cfargument name="$">

		<cfset var appreloadKey = $.GlobalConfig().getValue('appreloadKey') />

		<cfif len( appreloadKey ) and structKeyExists(url,appreloadKey)> 
			<cfset url[variables.framework.reload] = true />
		</cfif>

		<!--- invoke onApplicationStart in the application.cfc so the framework can do its thing --->
		<cfinvoke component="#pluginConfig.getPackage()#.Application" method="onApplicationStart" />

		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>

	<cffunction name="onGalleryMeldBodyRender">
		<cfargument name="$">
		
		<cfset var beanfactory			= pluginConfig.getApplication().getValue( 'beanFactory' ) />
		<cfset var meldGalleryManager	= beanfactory.getBean("meldGalleryManager") />
		<cfset var settingsBean			= meldGalleryManager.getSiteSettings( $.event().getValue('siteID') ) />
		<cfset var displayTypeService	= beanfactory.getBean( "displayTypeService" ) />

		<cfset var displayTypeBean		= displayTypeService.getDisplayType( settingsBean.getDefaultDisplayTypeID() ) />
		<cfset var sArgs				= StructNew() />
		<cfset var pluginManager		= $.getBean('pluginManager') />

		<cfset var pluginEvent	 		= createObject("component","mura.MuraScope") />
		
		<cfset var params				= "" />
		<cfset var strOut				= "" />
				
		<cfif not displayTypeBean.getIsActive()>
			<cfreturn />
		</cfif>

		<cfset params					= deserializeJSON( displayTypeBean.getDefaults() ) />
		<cfset params.displayID			= "00000000-0000-F000-0000000000000500" />
		<cfset params.displayTypeID		= settingsBean.getDefaultDisplayTypeID() />
		<cfset params.contentID			= $.content().getContentID() />
		
		<cfset pluginEvent=pluginEvent.init( StructNew() ).getEvent()>
		<cfset pluginEvent.setValue( 'siteID', $.event().getValue('siteID') )>
				
		<cfset sArgs.event				= pluginEvent />
		<cfset sArgs.params				= serializeJSON( params ) />
		<cfset sArgs.moduleID			= pluginConfig.getModuleID() />
		<cfset sArgs.object				= displayTypeBean.getObjectID() />

		<cfset strOut = pluginManager.displayObject( argumentCollection=sArgs ) />

		<cfreturn strOut />
	</cffunction>
	
	<cffunction name="onFileCache">
		<cfargument name="$">
		
		<cfset var sArgs = StructNew () /> 

		<cfif not StructKeyExists(form,"newFile") or not len( form.newFile )>
			<cfreturn />		
		<cfelseif not listFindNoCase( "jpg,gif,png,jpeg",$.event().getValue('fileExt') )>
			<cfreturn />
		</cfif>

		<cfset sArgs.fileID = $.event().getValue('fileID') />
		<cfset sArgs.contentID = $.event().getValue('contentID') />
		<cfset sArgs.fileExt = $.event().getValue('fileExt') />

		<cfset request.MeldGalleryImageFile = sArgs /> 
	</cffunction>
	
	<cffunction name="onFileCacheDelete">
		<cfargument name="$">
		
		<cfset var beanfactory		= pluginConfig.getApplication().getValue( 'beanFactory' ) />
		<cfset var ImageService		= beanfactory.getBean("ImageService") />
		
		<!---
			Won't work if datasource is external to Mura's because event is inside a transaction
		 --->	
		<cftry>
			<cfset ImageService.cleanImages( $.event().getValue('fileID'),$.event().getValue('siteID') ) />
		<cfcatch></cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="onAfterContentSave">
		<cfargument name="$">
		
		<cfset var beanfactory	= pluginConfig.getApplication().getValue( 'beanFactory' ) />

		<cfset var ImageService			= beanfactory.getBean("ImageService") />
		<cfset var mmFormTools			= beanfactory.getBean("mmFormTools") />
		<cfset var meldGalleryManager	= beanfactory.getBean("meldGalleryManager") />
		<cfset var imageBean			= "" />
		<cfset var formData				= StructNew() />

		<cfset var sArgs				= StructNew() /> 
		<cfset var fileID				= "" />
		<cfset var linkURL				= "" />
		<cfset var contentBean			= $.event().getValue("contentBean") />
		<cfset var settingsBean			= meldGalleryManager.getSiteSettings( $.event().getValue('siteID') ) />

		<!--- create an image from Mura Content --->
		<cfif StructKeyExists(request,"MeldGalleryImageFile")>
			<cfset sArgs					= StructNew() /> 
			<cfset sArgs.siteID				= $.event().getValue('siteID') />
			<cfset sArgs.adminID			= $.currentUser().getValue('userID') />
			<cfset sArgs.remoteID			= request.MeldGalleryImageFile.fileID />
			<cfset sArgs.type				= request.MeldGalleryImageFile.fileExt />
			<cfset sArgs.isActive			= 1 />

			<cfif contentBean.getType() eq "Page">
				<cfset sArgs.linkURL = $.getContentRenderer().getURLStem( contentBean.getSiteID(),contentBean.getfileName() ) />
			</cfif>

			<cfset sArgs.name				= contentBean.getTitle() />
			<cfset sArgs.caption			= contentBean.getTitle() />
			<cfset sArgs.summary			= contentBean.getSummary() />
	
			<cfset imageBean = ImageService.createImage( argumentCollection=sArgs ) />
	
			<cfset sArgs.imageBean			= imageBean />
			<cfset sArgs.imageID			= imageBean.getImageID() />
	
			<cfset fileID = doUploadImage( $,sArgs ) />
			<cfset imageBean.setFileID( fileID ) />

			<cfset ImageService.saveImage( imageBean ) />
			<cfreturn />
		</cfif>

 		<cfif not settingsBean.getSyncInfo() or not len( contentBean.getFileID() )>
			<cfreturn />
		</cfif>
		
		<!--- update file title/summary --->
		<cfset sArgs.remoteID = contentBean.getFileID() />
		<cfset imageBean = ImageService.getBeanByAttributes( argumentCollection=sArgs ) />
	
		<cfif not imageBean.beanExists()>
			<cfreturn />
		</cfif>

		<cfset imageBean.setName( contentBean.getTitle() ) />
		<cfset imageBean.setCaption( contentBean.getTitle() ) />
		<cfset imageBean.setDescription( contentBean.getSummary() ) />

		<cfif contentBean.getType() eq "Page">
			<cfset linkURL = $.getContentRenderer().getURLStem( contentBean.getSiteID(),contentBean.getfileName() ) />
			<cfset imageBean.setLinkURL( linkURL ) />
		</cfif>
		
		<cfset ImageService.updateImage( imageBean ) />
	</cffunction>
	
	<cffunction name="onSiteRequestStart">
		<cfargument name="$">
	</cffunction>

	<cffunction name="onSiteRequestInit" output="false" returntype="void">
		<cfargument name="$">
		
	</cffunction>

	<cffunction name="getFrameworkVariables" output="false" access="private">
		<cfset var framework = StructNew() />

		<cfinclude template="../frameworkConfig.cfm" />

		<cfreturn framework />		
	</cffunction>

	<cffunction name="doUploadImage" access="private" returntype="string" output="false">
		<cfargument name="$">
		<cfargument name="rc" type="struct" required="true">

		<cfset var beanfactory	= pluginConfig.getApplication().getValue( 'beanFactory' ) />

		<cfset var mmFileUpload			= beanfactory.getBean("mmFileUpload") />
		<cfset var meldGalleryManager	= beanfactory.getBean("MeldGalleryManager") />
		<cfset var mmImageRenderer		= beanfactory.getBean("mmImageRenderer") />
		<cfset var ImageService			= beanfactory.getBean("ImageService") />
		<cfset var imageBean			= rc.imageBean />

		<cfset var sArgs				= StructNew() /> 
		<cfset var fileID				= "" />
		<cfset var siteID				= $.event().getValue('siteID') />

		<cfset var fileUploadBean		= "" />
		<cfset var settingsBean			= "" />
		<cfset var largeImageRenderBean	= mmImageRenderer.createImageRenderBean() />

		<cfset settingsBean				= meldGalleryManager.getSiteSettings( siteID ) />

		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.imageID			= rc.imageID />

		<!--- FILE --->
		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.contentID			= imageBean.getImageID() />
		<cfset sArgs.siteID				= $.event().getValue('siteID') />
		<cfset sArgs.moduleID			= pluginConfig.getModuleID() />
		<cfset sArgs.FileSizeLimit		= settingsBean.getFileSizeLimit() />
		<cfset sArgs.doClearPrevious	= true />

		<cfset fileUploadBean			= mmFileUpload.createFileUploadBean( argumentCollection=sArgs ) />

		<!--- IMAGES --->
		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.width				= settingsBean.getImageWidth() />
		<cfset sArgs.height				= settingsBean.getImageHeight() />
		<cfset sArgs.resizeType			= settingsBean.getImageResizeType() />
		<cfset sArgs.aspectType			= settingsBean.getImageAspectType() />
		<cfset sArgs.cropType			= settingsBean.getImageCropType() />
		<cfset sArgs.qualityType		= settingsBean.getImageQualityType() />
		<cfset largeImageRenderBean		= mmImageRenderer.createImageRenderBean( argumentCollection=sArgs ) />
		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.width				= settingsBean.getImageWidthMedium() />
		<cfset sArgs.height				= settingsBean.getImageHeightMedium() />
		<cfset sArgs.resizeType			= settingsBean.getImageResizeTypeMedium() />
		<cfset sArgs.aspectType			= settingsBean.getImageAspectTypeMedium() />
		<cfset sArgs.cropType			= settingsBean.getImageCropTypeMedium() />
		<cfset sArgs.qualityType		= settingsBean.getImageQualityTypeMedium() />
		<cfset mediumImageRenderBean	= mmImageRenderer.createImageRenderBean( argumentCollection=sArgs ) />
		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.width				= settingsBean.getImageWidthSmall() />
		<cfset sArgs.height				= settingsBean.getImageHeightSmall() />
		<cfset sArgs.resizeType			= settingsBean.getImageResizeTypeSmall() />
		<cfset sArgs.aspectType			= settingsBean.getImageAspectTypeSmall() />
		<cfset sArgs.cropType			= settingsBean.getImageCropTypeSmall() />
		<cfset sArgs.qualityType		= settingsBean.getImageQualityTypeSmall() />
		<cfset smallImageRenderBean		= mmImageRenderer.createImageRenderBean( argumentCollection=sArgs ) />

		<!--- UPLOAD --->
		<cfset sArgs = StructNew() />
		<cfset sArgs.FormField				= "newFile" />
		<cfset sArgs.FileUploadBean			= fileUploadBean />
		<cfset sArgs.LargeImageRenderBean	= largeImageRenderBean />
		<cfset sArgs.mediumImageRenderBean	= mediumImageRenderBean />
		<cfset sArgs.SmallImageRenderBean	= smallImageRenderBean />

		<cftry>
			<cfset fileID = mmFileUpload.uploadImage( argumentCollection=sArgs ) />
			<cfcatch></cfcatch>
		</cftry>
		
		<cfreturn fileID />	
	</cffunction>

</cfcomponent>