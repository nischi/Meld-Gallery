  	<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent extends="controller">
	<cffunction name="default" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset rc.mmBC.addCrumb( arguments.rc,"Images","?" )>
	</cffunction>

	<cffunction name="edit" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfif isDefined("rc.btaction")>
			<!--- cancel? --->
			<cfif arguments.rc.btaction eq rc.mmRBF.key('cancel')>
				<cflocation url="?action=admin:image" addtoken="false">
			<!--- save? --->
			<cfelseif rc.btaction eq  rc.mmRBF.key('save')>
				<cfset success = doSaveImage( argumentCollection=arguments ) /> 
				<cfif success eq true>
					<cflocation url="?action=admin:image" addtoken="false">
				</cfif> 
			<!--- update? --->
			<cfelseif rc.btaction eq  rc.mmRBF.key('update')>
				<cfset success = doUpdateImage( arguments.rc )>
				<cfif success eq true>
					<cflocation url="?action=admin:image" addtoken="false">
				</cfif>
			</cfif>
		<cfelseif isDefined("rc.btdeleteconfirm") and rc.btdeleteconfirm eq "delete">
			<cfset success = doDeleteImage( arguments.rc )>
			<cfif success eq true>
				<cflocation url="?action=admin:image" addtoken="false">
			</cfif> 
		</cfif>

		<cfset doGetImage( argumentCollection=arguments ) />

		<cfset rc.mmBC.addCrumb( arguments.rc,"Images","?action=admin:image" )>

		<cfif rc.imageBean.beanExists()>
			<cfset rc.mmBC.addCrumb( arguments.rc,rc.imageBean.getCaption(),"" )>
		<cfelse>
			<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key("imagenew"),"" )>
		</cfif>		
	</cffunction>

	<cffunction name="doGetImage" access="private" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var mmFormTools		= getBeanFactory().getBean("mmFormTools") />
		<cfset var ImageService		= getBeanFactory().getBean("ImageService") />
		<cfset var imageBean		= "" />
		<cfset var sArgs			= StructNew() />
		<cfset var sPresets			= StructNew() />

		<cfif StructKeyExists(rc,"imageID")>
			<cfset imageBean = ImageService.getImage( rc.imageID ) />
		<cfelse>
			<cfset sArgs.siteID		= rc.$.event("siteID") />
			<cfset sArgs.isActive	= true />
			<cfset imageBean	= ImageService.createImage( argumentCollection=sArgs ) />
		</cfif>

		<!--- set up for form --->
		<cfset mmFormTools.paramaterizeBeanForm(imageBean,sPresets) />

		<cfset rc.ImageBean = imageBean />
	</cffunction>

	<cffunction name="doDeleteImage" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var ImageService		= getBeanFactory().getBean("ImageService") />

		<cfset var sArgs			= StructNew() /> 

		<cfset sArgs				= StructNew() /> 
		<cfset sArgs.imageID		= rc.imageID />

		<cfset ImageService.deleteImage( argumentCollection=sArgs ) />
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>

	<cffunction name="doSaveImage" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var ImageService			= getBeanFactory().getBean("ImageService") />
		<cfset var mmFormTools			= getBeanFactory().getBean("mmFormTools") />
		<cfset var imageBean			= "" />
		<cfset var formData				= StructNew() />

		<cfset var sArgs				= StructNew() /> 
		<cfset var fileID				= "" />

		<cfif not len( form.newImage )>
			<cfset getErrorManager().addError(rc.$.event(),'newimagerequired',"custom",1500)>
			<cfreturn false>
		</cfif>

		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.imageID			= rc.imageID />
		<cfset sArgs.siteID				= rc.siteID />
		<cfset sArgs.adminID			= rc.$.currentUser('userID') />

		<cfset imageBean = ImageService.createImage( argumentCollection=sArgs ) />

		<!--- we do paramaterizeBeanBooleans to 'fill in' the form's unsubmitted checkboxes --->
		<cfset mmFormTools.paramaterizeBeanBooleans(imageBean) />
		<cfset formData = mmFormTools.scopeFormSubmission(form,false,true) />

		<!--- set the new values --->
		<cfset imageBean.updateMemento( formData.imageBean )>
		<cfset rc.imageBean = imageBean />

		<cfset fileID = doUploadImage( argumentCollection=arguments ) />

		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfset imageBean.setFileID( rc.fileID ) />
			<cfset imageBean.setType( rc.fileType ) />
			<cfset ImageService.saveImage( imageBean ) />
		</cfif>	
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
	
		<cfreturn false>
	</cffunction>

	<cffunction name="doUpdateImage" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var ImageService			= getBeanFactory().getBean("ImageService") />
		<cfset var mmFormTools			= getBeanFactory().getBean("mmFormTools") />
		<cfset var imageBean			= "" />
		<cfset var formData				= StructNew() />

		<cfset var sArgs				= StructNew() /> 
		<cfset var fileID				= "" />

		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.imageID			= rc.imageID />

		<cfset imageBean = ImageService.getImage( argumentCollection=sArgs ) />

		<cfif not imageBean.beanExists()>
			<!--- error --->
			<cfreturn false>
		</cfif>

		<!--- we do paramaterizeBeanBooleans to 'fill in' the form's unsubmitted checkboxes --->
		<cfset mmFormTools.paramaterizeBeanBooleans(imageBean) />
		<cfset formData = mmFormTools.scopeFormSubmission(form,false,true) />

		<!--- set the new values --->
		<cfset imageBean.updateMemento( formData.imageBean )>
		<cfset rc.imageBean = imageBean />

		<cfif len( form.newImage )>
			<cfset fileID = doUploadImage( argumentCollection=arguments ) />

			<cfif not getErrorManager().hasErrors( rc.$.event() )>
				<cfset imageBean.setFileID( rc.fileID ) />
				<cfset imageBean.setType( rc.fileType ) />
			</cfif>	
		</cfif>

		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfset ImageService.updateImage( imageBean ) />
		</cfif>	
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>

	<cffunction name="doUploadImage" access="private" returntype="string" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var mmFileUpload			= getBeanFactory().getBean("mmFileUpload") />
		<cfset var meldGalleryManager	= getBeanFactory().getBean("MeldGalleryManager") />
		<cfset var mmImageRenderer		= getBeanFactory().getBean("mmImageRenderer") />
		<cfset var ImageService			= getBeanFactory().getBean("ImageService") />
		<cfset var imageBean			= rc.imageBean />

		<cfset var sArgs				= StructNew() /> 
		<cfset var fileID				= "" />

		<cfset var fileUploadBean		= "" />
		<cfset var settingsBean			= meldGalleryManager.getSiteSettings( rc.siteID ) />
		<cfset var largeImageRenderBean	= mmImageRenderer.createImageRenderBean() />

		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.imageID			= arguments.rc.imageID />

		<!--- FILE --->
		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.contentID			= imageBean.getImageID() />
		<cfset sArgs.siteID				= rc.siteID />
		<cfset sArgs.moduleID			= rc.pluginConfig.getModuleID() />
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
		<cfset sArgs.FormField				= "newImage" />
		<cfset sArgs.FileUploadBean			= fileUploadBean />
		<cfset sArgs.LargeImageRenderBean	= largeImageRenderBean />
		<cfset sArgs.mediumImageRenderBean	= mediumImageRenderBean />
		<cfset sArgs.SmallImageRenderBean	= smallImageRenderBean />

		<cftry>
			<cfset fileID = mmFileUpload.uploadImage( argumentCollection=sArgs ) />
			<cfcatch type="custom">
				<cfset getErrorManager().addError(rc.$.event(),cfcatch.message,"custom",cfcatch.errorcode,cfcatch.detail)>
			</cfcatch>
			<cfcatch>
				<cfset getErrorManager().addError(rc.$.event(),cfcatch.message,cfcatch.type,cfcatch.errorcode,cfcatch.detail)>
			</cfcatch>
		</cftry>

		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfset rc.fileID	= fileID />
			<cfset rc.fileType	= fileUploadBean.getFileData().ServerFileExt />
			<cfreturn fileID>
		</cfif>
		<cfreturn "">
	</cffunction>

</cfcomponent>