	<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent extends="controller">
	<cffunction name="default" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var imageGroupService		= getBeanFactory().getBean("ImageGroupService") />
		<cfset var imageService				= getBeanFactory().getBean("ImageService") />
		<cfset var displayImageService		= getBeanFactory().getBean("DisplayImageService") />
		<cfset var mmImageRenderer			= getBeanFactory().getBean("mmImageRenderer") />
		<cfset var imageGroupBean			= "" />
		<cfset var sArgs					= StructNew() />
		<cfset var ImageArray				= ArrayNew(1) />
		<cfset var sParams					= rc.displayBean.getParamsData() />

		<cfset var largeImageRenderBean		= "" />
		<cfset var smallImageRenderBean		= "" />

		<cfset sArgs.imageGroupID		= rc.displayBean.getContentID() />
		<cfset imageGroupBean			= imageGroupService.getImageGroup( argumentCollection=sArgs ) />

		<cfset structAppend(rc.params,sParams)>
		<cfset rc.ImageArray			= ArrayNew(1)>
		<cfset rc.imageGroupBean		= imageGroupBean />

		<cfif not isArray( imageGroupBean.getImageIDArray() ) or not ArrayLen( imageGroupBean.getImageIDArray() )>
			<cfreturn>
		</cfif>
		<cftry>
			<cfset sArgs = StructNew() />
			<cfset sArgs.width			= sParams.imagewidth />
			<cfset sArgs.height			= sParams.imageheight />
			<cfset sArgs.resizeType		= sParams.resizetype />
			<cfset sArgs.aspecttype		= sParams.aspecttype />

			<cfset largeImageRenderBean	= mmImageRenderer.createImageRenderBean( argumentCollection=sArgs ) />

			<cfset sArgs = StructNew() />
			<cfset sArgs.width			= sParams.thumbwidth />
			<cfset sArgs.height			= sParams.thumbheight />
			<cfset sArgs.resizeType		= "CropResize" />
			<cfset sArgs.aspecttype		= "MaxAspectXY" />
			<cfset sArgs.qualitytype	= "mediumQuality" />
			<cfset smallImageRenderBean	= mmImageRenderer.createImageRenderBean( argumentCollection=sArgs ) />
		<cfcatch>
			<cfdump var="#cfcatch#"><cfabort>
			<!--- ERROR: PARAMS MISSING --->
		</cfcatch>
		</cftry>

		<cfset sArgs = StructNew() />
		<cfset sArgs.displayBean				= rc.displayBean />
		<cfset sArgs.imageGroupBean				= imageGroupBean />
		<cfset sArgs.largeImageRenderBean		= largeImageRenderBean />
		<cfset sArgs.smallImageRenderBean		= smallImageRenderBean />

		<cfset ImageArray						= imageService.getImagesInDisplay( argumentCollection=sArgs ) />

		<cfset rc.ImageArray = ImageArray />
	</cffunction>
</cfcomponent>