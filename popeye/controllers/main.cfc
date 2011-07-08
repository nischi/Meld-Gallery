	<!---

This file is part of the Meld Gallery application.

Meld Gallery is licensed under the GPL 2.0 license
Copyright (C) 2010 2011 Meld Solutions Inc. http://www.meldsolutions.com/

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation, version 2 of that license..

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

--->
<cfcomponent extends="controller">

	<cffunction name="default" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var sParams					= rc.displayBean.getParamsData() />

		<cfif StructKeyExists(sParams,"imageArray") and IsArray(sParams.imageArray)>
			<cfset rc.ImageArray = sParams.imageArray />
		<cfelseif StructKeyExists(rc.params,"displayID") and rc.params.displayID eq "00000000-0000-F000-0000000000000500">
			<cfset doGallerySource( argumentCollection=arguments ) />
		<cfelseif StructKeyExists(sParams,"sourcetype") and sParams.sourceType eq "collection">
			<cfset doCollectionSource( argumentCollection=arguments ) />
		<cfelseif not rc.displayBean.beanExists()>
			<cfreturn>
		<cfelse>
			<cfset doImageGroupSource( argumentCollection=arguments ) />
		</cfif>
	</cffunction>

	<cffunction name="doImageGroupSource" access="private" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var imageGroupService		= getBeanFactory().getBean("ImageGroupService") />
		<cfset var imageService				= getBeanFactory().getBean("ImageService") />
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

	<cffunction name="doCollectionSource" access="private" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var galleryFeedManager		= getBeanFactory().getBean("MeldGalleryFeedManager") />
		<cfset var imageService				= getBeanFactory().getBean("ImageService") />
		<cfset var mmImageRenderer			= getBeanFactory().getBean("mmImageRenderer") />
		<cfset var imageGroupBean			= "" />
		<cfset var sArgs					= StructNew() />
		<cfset var ImageArray				= ArrayNew(1) />
		<cfset var sParams					= rc.displayBean.getParamsData() />

		<cfset var largeImageRenderBean		= "" />
		<cfset var smallImageRenderBean		= "" />

		<cfset structAppend(rc.params,sParams)>

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
		<cfset sArgs.largeImageRenderBean		= largeImageRenderBean />
		<cfset sArgs.smallImageRenderBean		= smallImageRenderBean />

		<cfset ImageArray						= galleryFeedManager.getImagesInFeed( argumentCollection=sArgs ) />

		<cfset rc.ImageArray = ImageArray />
	</cffunction>

	<cffunction name="doGallerySource" access="private" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var meldGalleryManager		= getBeanFactory().getBean("meldGalleryManager") />
		<cfset var settingsBean				= meldGalleryManager.getSiteSettings( $.event().getValue('siteID') ) />
		<cfset var galleryGalleryManager		= getBeanFactory().getBean("MeldGalleryGalleryManager") />
		<cfset var imageService				= getBeanFactory().getBean("ImageService") />
		<cfset var mmImageRenderer			= getBeanFactory().getBean("mmImageRenderer") />
		<cfset var imageGroupBean			= "" />
		<cfset var sArgs					= StructNew() />
		<cfset var ImageArray				= ArrayNew(1) />
		<cfset var sParams					= rc.params />

		<cfset var largeImageRenderBean		= "" />
		<cfset var smallImageRenderBean		= "" />

		<cfset rc.displayBean.setDisplayID( rc.params.contentID ) />
		<cfset rc.displayBean.setContentID( rc.params.contentID ) />
		<cfset rc.displayBean.setParamsData( rc.params ) />
		<cfset rc.displayBean.setIsActive( 1 ) />
		<cfset rc.displayBean.setBeanExists( 1 ) />
		<cfset rc.displayBean.setSiteID( rc.siteID ) />
		<cfset rc.displayBean.setDisplayTypeID( rc.params.displayTypeID ) />

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
		<cfset sArgs.largeImageRenderBean		= largeImageRenderBean />
		<cfset sArgs.smallImageRenderBean		= smallImageRenderBean />

		<cfset ImageArray						= galleryGalleryManager.getImagesInGallery( argumentCollection=sArgs ) />

		<cfset rc.ImageArray = ImageArray />
	</cffunction>

</cfcomponent>