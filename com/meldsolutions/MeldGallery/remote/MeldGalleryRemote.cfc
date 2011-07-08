<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent displayname="MeldGalleryRemote" output="false" hint="Provides remote core functionality calls.">
	<cfset variables.instance = StructNew() />
	
	<cffunction name="init" returntype="MeldGalleryRemote" output="false">
		<cfreturn this>
	</cffunction>

	<cffunction name="getFeedList" access="remote" returntype="any" returnformat="json" output="false" hint="Retrieves products.">
		<cfset var mmFormTools		= getMeldGalleryManager().getBeanFactory().getBean("mmFormTools") />
		<cfset var mmResourceBundle	= getMeldGalleryManager().getBeanFactory().getBean("mmResourceBundle") />
		<cfset var feedManager		= getMeldGalleryManager().getBeanFactory().getBean("MeldGalleryFeedManager") />
		
		<cfset var returnStruct		= StructNew() />
		<cfset var sFeed			= StructNew() />
		<cfset var aFeedData		= ArrayNew(1) />
		<cfset var sCols			= StructNew() />

		<cfset var iiX					= "" />
		<cfset var cFeed			= "" />
		<cfset var aFeed			= ArrayNew(1) />
		<cfset var sData			= mmFormTools.scopeFormSubmission( arguments,true,false )> <!--- data,skip empty,append global --->
		<cfset var sCriteria		= StructNew() />

		<cfset sData['criteria']['siteid'] = session.siteID>

		<!--- sortable columns, as per database query --->
		<cfset sCols['0'] = "">
		<cfset sCols['1'] = "name">
		<cfset sCols['2'] = "type">
		<cfset sCols['3'] = "dateCreated">

		<cfset sCriteria = setCriteria( sData,sCols,1 ) />
		<cfset sFeed = feedManager.getRemoteFeedList( argumentCollection=sCriteria )>

		<cfloop from="1" to="#ArrayLen(sFeed.itemarray)#" index="iiX">
			<cfset cFeed 	= sFeed.itemarray[iiX] />
			<cfset aFeed	= ArrayNew(1) />
			<cfset ArrayAppend(aFeed,"
			<input required='true' type='radio' class='radio ui-radioitem' name='displaybean_contentid' value='#cFeed.FeedID#'></td>			
			" ) />
			<cfset ArrayAppend(aFeed,"#cFeed.name#" ) />
			<cfset ArrayAppend(aFeed,"#cFeed.type#" ) />
			<cfset ArrayAppend(aFeed,"#lsdateFormat(cFeed.dateCreated,"medium")#" ) />
			<cfset ArrayAppend(aFeedData,aFeed) />
		</cfloop>

		<cfset returnStruct['sEcho']					= getTickCount()>
		<cfset returnStruct['iTotalFeedRecords']		= sFeed.count>
		<cfset returnStruct['iTotalRecords']			= sFeed.count>
		<cfset returnStruct['aaData']					= aFeedData>
		<cfset returnStruct['success']					= true>

		<cfcontent type="application/json">
		<cfreturn returnStruct />
	</cffunction>


	<cffunction name="getDisplayList" access="remote" returntype="any" returnformat="json" output="false" hint="Retrieves products.">
		<cfset var mmFormTools			= getMeldGalleryManager().getBeanFactory().getBean("mmFormTools") />
		<cfset var mmResourceBundle		= getMeldGalleryManager().getBeanFactory().getBean("mmResourceBundle") />
		<cfset var DisplayService	= getMeldGalleryManager().getBeanFactory().getBean("DisplayService") />
		
		<cfset var returnStruct			= StructNew() />
		<cfset var sDisplay			= StructNew() />
		<cfset var aDisplayData		= ArrayNew(1) />
		<cfset var sCols				= StructNew() />

		<cfset var iiX					= "" />
		<cfset var cDisplay			= "" />
		<cfset var aDisplay			= ArrayNew(1) />
		<cfset var sData				= mmFormTools.scopeFormSubmission( arguments,true,false )> <!--- data,skip empty,append global --->
		<cfset var sCriteria			= StructNew() />

		<cfset sData['criteria']['siteid'] = session.siteID>

		<!--- sortable columns, as per database query --->
		<cfset sCols['0'] = "">
		<cfset sCols['1'] = "name">
		<cfset sCols['2'] = "imagegroup">
		<cfset sCols['3'] = "displaytype">
		<cfset sCols['4'] = "isActive">

		<cfset sCriteria = setCriteria( sData,sCols,1 ) />
		<cfset sDisplay = DisplayService.search( argumentCollection=sCriteria )>

		<cfloop from="1" to="#ArrayLen(sDisplay.itemarray)#" index="iiX">
			<cfset cDisplay 	= sDisplay.itemarray[iiX] />
			<cfset aDisplay	= ArrayNew(1) />
			
			<cfif cDisplay.sourcetype eq "collection">
				<cfset cDisplay.imagegroup = "<span class='collection'>" & cDisplay.imagegroup & "</span>" />
			</cfif>
			
			<cfset ArrayAppend(aDisplay,"
			<ul class='table-buttons two'>
				<li class='blank'></li>
				<li><span title='#mmResourceBundle.key('Display')#' class='sb-button ui-state-default'><a class='ui-icon ui-icon-pencil' href='?action=admin:display.edit&amp;DisplayID=#cDisplay.DisplayID#'></a></span></li>
			</ul>
			" ) />
			<cfset ArrayAppend(aDisplay,"#cDisplay.name#" ) />
			<cfset ArrayAppend(aDisplay,"#cDisplay.imagegroup#" ) />
			<cfset ArrayAppend(aDisplay,"#cDisplay.displaytype#" ) />
			<cfset ArrayAppend(aDisplay,mmResourceBundle.key("active"& cDisplay.isActive )) />
			<cfset ArrayAppend(aDisplayData,aDisplay) />
		</cfloop>

		<cfset returnStruct['sEcho']					= getTickCount()>
		<cfset returnStruct['iTotalDisplayRecords']		= sDisplay.count>
		<cfset returnStruct['iTotalRecords']			= sDisplay.count>
		<cfset returnStruct['aaData']					= aDisplayData>
		<cfset returnStruct['success']					= true>

		<cfcontent type="application/json">
		<cfreturn returnStruct />
	</cffunction>

	<cffunction name="getDisplayTypeList" access="remote" returntype="any" returnformat="json" output="false" hint="Retrieves products.">
		<cfset var mmFormTools			= getMeldGalleryManager().getBeanFactory().getBean("mmFormTools") />
		<cfset var mmResourceBundle		= getMeldGalleryManager().getBeanFactory().getBean("mmResourceBundle") />
		<cfset var DisplayTypeService		= getMeldGalleryManager().getBeanFactory().getBean("DisplayTypeService") />
		
		<cfset var returnStruct			= StructNew() />
		<cfset var sDisplayType			= StructNew() />
		<cfset var aDisplayTypeData		= ArrayNew(1) />
		<cfset var sCols				= StructNew() />

		<cfset var iiX					= "" />
		<cfset var cDisplayType			= "" />
		<cfset var aDisplayType			= ArrayNew(1) />
		<cfset var sData				= mmFormTools.scopeFormSubmission( arguments,true,false )> <!--- data,skip empty,append global --->
		<cfset var sCriteria			= StructNew() />

		<cfset sData['criteria']['siteid'] = session.siteID>

		<!--- sortable columns, as per database query --->
		<cfset sCols['0'] = "">
		<cfset sCols['1'] = "name">
		<cfset sCols['2'] = "isActive">

		<cfset sCriteria = setCriteria( sData,sCols,1 ) />
		<cfset sDisplayType = DisplayTypeService.search( argumentCollection=sCriteria )>

		<cfloop from="1" to="#ArrayLen(sDisplayType.itemarray)#" index="iiX">
			<cfset cDisplayType 	= sDisplayType.itemarray[iiX] />
			<cfset aDisplayType	= ArrayNew(1) />
			<cfset ArrayAppend(aDisplayType,"
			<ul class='table-buttons two'>
				<li class='blank'></li>
				<li><span title='#mmResourceBundle.key('DisplayType')#' class='sb-button ui-state-default'><a class='ui-icon ui-icon-pencil' href='?action=admin:displaytype.edit&amp;DisplayTypeID=#cDisplayType.DisplayTypeID#'></a></span></li>
			</ul>
			" ) />
			<cfset ArrayAppend(aDisplayType,"#cDisplayType.name#" ) />
			<cfset ArrayAppend(aDisplayType,mmResourceBundle.key("active"& cDisplayType.isActive )) />
			<cfset ArrayAppend(aDisplayTypeData,aDisplayType) />
		</cfloop>

		<cfset returnStruct['sEcho']					= getTickCount()>
		<cfset returnStruct['iTotalDisplayRecords']		= sDisplayType.count>
		<cfset returnStruct['iTotalRecords']			= sDisplayType.count>
		<cfset returnStruct['aaData']					= aDisplayTypeData>
		<cfset returnStruct['success']					= true>

		<cfcontent type="application/json">
		<cfreturn returnStruct />
	</cffunction>

	<cffunction name="getImageGroupList" access="remote" returntype="any" returnformat="json" output="false" hint="Retrieves products.">
		<cfset var mmFormTools				= getMeldGalleryManager().getBeanFactory().getBean("mmFormTools") />
		<cfset var mmResourceBundle			= getMeldGalleryManager().getBeanFactory().getBean("mmResourceBundle") />
		<cfset var ImageGroupService		= getMeldGalleryManager().getBeanFactory().getBean("ImageGroupService") />
		<cfset var ImagegroupimageService		= getMeldGalleryManager().getBeanFactory().getBean("ImagegroupimageService") />
		
		<cfset var returnStruct			= StructNew() />
		<cfset var sImageGroup			= StructNew() />
		<cfset var aImageGroupData		= ArrayNew(1) />
		<cfset var sCols				= StructNew() />

		<cfset var iiX					= "" />
		<cfset var cImageGroup			= "" />
		<cfset var aImageGroupImages	= ArrayNew(1) />
		<cfset var aImages				= ArrayNew(1) />
		<cfset var aImageGroup			= ArrayNew(1) />
		<cfset var sData				= mmFormTools.scopeFormSubmission( arguments,true,false )> <!--- data,skip empty,append global --->
		<cfset var sCriteria			= StructNew() />
		<cfset var sArgs				= StructNew() />

		<cfparam name="arguments.mode" default="list" />

		<cfset sData['criteria']['siteid'] = session.siteID>

		<!--- sortable columns, as per database query --->
		<cfset sCols['0'] = "">
		<cfset sCols['1'] = "name">
		<cfset sCols['2'] = "tags">
		<cfset sCols['3'] = "isActive">

		<cfset sCriteria = setCriteria( sData,sCols,1 ) />
		<cfset sImageGroup = ImageGroupService.search( argumentCollection=sCriteria )>

		<cfset sArgs.count = 6 />

		<cfloop from="1" to="#ArrayLen(sImageGroup.itemarray)#" index="iiX">
			<cfset cImageGroup 			= sImageGroup.itemarray[iiX] />
			<cfset sArgs.ImageGroupID	= cImageGroup.ImageGroupID />
			<cfset aImageGroupImages	= ImagegroupimageService.getGroupImages( argumentCollection=sArgs ) />
			<cfset aImages				= ArrayNew(1) />
			<cfset aImageGroup			= ArrayNew(1) />

			<cfif arraylen( aImageGroupImages ) >
				<cfloop from="1" to="#ArrayLen( aImageGroupImages )#" index="iiY">
					<cfset ArrayAppend(aImages, "<img class='ui-smallimage'
					src='#getMeldGalleryManager().getPluginConfig().getConfigBean().getContext()#/#session.siteID#/cache/file/#aImageGroupImages[iiY].fileID#_small.#aImageGroupImages[iiY].type#'>" ) />
				</cfloop>
			</cfif>
			
			<cfif arguments.mode eq "list">
				<cfset ArrayAppend(aImageGroup,"
				<ul class='table-buttons two'>
					<li class='blank'></li>
					<li><span title='#mmResourceBundle.key('ImageGroup')#' class='sb-button ui-state-default'><a class='ui-icon ui-icon-pencil' href='?action=admin:imageGroup.edit&amp;ImageGroupID=#cImageGroup.ImageGroupID#'></a></span></li>
				</ul>
				" ) />
			<cfelse>
				<cfset ArrayAppend(aImageGroup,"
				<input required='true' type='radio' class='radio ui-radioitem' name='displaybean_contentid' value='#cImageGroup.ImageGroupID#'></td>			
				" ) />
			</cfif>
			<cfset ArrayAppend(aImageGroup,"#cImageGroup.name# (#cImageGroup.imageCount#)" ) />
			<cfset ArrayAppend(aImageGroup,"#cImageGroup.tags#" ) />
			<cfset ArrayAppend(aImageGroup, ArrayToList( aImages,"" ) ) />
			<cfset ArrayAppend(aImageGroup,mmResourceBundle.key("active"& cImageGroup.isActive )) />
			<cfset ArrayAppend(aImageGroupData,aImageGroup) />
		</cfloop>

		<cfset returnStruct['sEcho']					= getTickCount()>
		<cfset returnStruct['iTotalDisplayRecords']		= sImageGroup.count>
		<cfset returnStruct['iTotalRecords']			= sImageGroup.count>
		<cfset returnStruct['aaData']					= aImageGroupData>
		<cfset returnStruct['success']					= true>

		<cfcontent type="application/json">
		<cfreturn returnStruct />
	</cffunction>

	<cffunction name="getSelectTable" access="remote" returntype="any" returnformat="json" output="false" hint="Retrieves products.">
		<cfset var mmFormTools				= getMeldGalleryManager().getBeanFactory().getBean("mmFormTools") />
		<cfset var mmResourceBundle			= getMeldGalleryManager().getBeanFactory().getBean("mmResourceBundle") />
		<cfset var ImageGroupService		= getMeldGalleryManager().getBeanFactory().getBean("ImageGroupService") />
		<cfset var ImagegroupimageService	= getMeldGalleryManager().getBeanFactory().getBean("ImagegroupimageService") />
		
		<cfset var returnStruct			= StructNew() />
		<cfset var sImageGroup			= StructNew() />
		<cfset var aImageGroupData		= ArrayNew(1) />
		<cfset var sCols				= StructNew() />
		<cfset var sArgs				= StructNew() />

		<cfset var iiX					= "" />
		<cfset var cImageGroup			= "" />
		<cfset var aImageGroup			= ArrayNew(1) />
		<cfset var aImageGroupImages	= ArrayNew(1) />
		<cfset var sData				= mmFormTools.scopeFormSubmission( arguments,true,false )> <!--- data,skip empty,append global --->
		<cfset var sCriteria			= StructNew() />

		<cfset sData['criteria']['siteid'] = session.siteID>

		<!--- sortable columns, as per database query --->
		<cfset sCols['0'] = "">
		<cfset sCols['1'] = "name">
		<cfset sCols['2'] = "tags">
		<cfset sCols['3'] = "isActive">

		<cfset sCriteria = setCriteria( sData,sCols,1 ) />
		<cfset sImageGroup = ImageGroupService.search( argumentCollection=sCriteria )>

		<cfloop from="1" to="#ArrayLen(sImageGroup.itemarray)#" index="iiX">
			<cfset cImageGroup 	= sImageGroup.itemarray[iiX] />
			<cfset aImageGroup	= ArrayNew(1) />

			<cfset sArgs	= StructNew() />
			<cfset sArgs.ImageGroupID	= cImageGroup.ImageGroupID />
			<cfset sArgs.count			= 8 />

			<cfset aImageGroupImages = ImagegroupimageService.getGroupImages( argumentCollection=sArgs ) />

			<cfset cImageGroup['images'] = aImageGroupImages />
		</cfloop>

		<cfset returnStruct['path']						= "#getMeldGalleryManager().getPluginConfig().getConfigBean().getContext()#/" />
		<cfset returnStruct['iDisplayStart']			= sImageGroup.start>
		<cfset returnStruct['data']						= sImageGroup.itemarray>
		<cfset returnStruct['sEcho']					= getTickCount()>
		<cfset returnStruct['iTotalDisplayRecords']		= sImageGroup.count>
		<cfset returnStruct['iTotalRecords']			= sImageGroup.count>
		<cfset returnStruct['aaData']					= aImageGroupData>
		<cfset returnStruct['success']					= true>

		<cfcontent type="application/json">
		<cfreturn returnStruct />
	</cffunction>


	<cffunction name="getImageGrid" access="remote" returntype="any" returnformat="json" output="false" hint="Retrieves products.">
		<cfset var returnStruct				= StructNew() />
		<cfset var mmFormTools				= getMeldGalleryManager().getBeanFactory().getBean("mmFormTools") />
		<cfset var mmResourceBundle			= getMeldGalleryManager().getBeanFactory().getBean("mmResourceBundle") />
		<cfset var ImageService				= getMeldGalleryManager().getBeanFactory().getBean("ImageService") />
		<cfset var ImagegroupimageService	= getMeldGalleryManager().getBeanFactory().getBean("ImagegroupimageService") />

		<cfset var sCriteria			= StructNew() />
		<cfset var sData				= mmFormTools.scopeFormSubmission( arguments,true,false )> <!--- data,skip empty,append global --->
		<cfset var sCols				= StructNew() />
		<cfset var sArgs				= StructNew() />
		
		<cfset var imageIDList			= "" />

		<cfset returnStruct['success']	= false>

		<!--- sortable columns, as per database query --->
		<cfset sCols['0'] = "">
		<cfset sCols['1'] = "caption">
		<cfset sCols['2'] = "any">
		<cfset sCols['3'] = "isActive">

		<cfset sData['criteria']['siteid'] = session.siteID>

		<cfset sCriteria = setCriteria( sData,sCols,1 ) />

		<cfset sImage = ImageService.search( argumentCollection=sCriteria )>

		<cfif structKeyExists(arguments,"init") and structKeyExists( arguments,"contentID" )>
			<cfset sArgs.imageGroupID		= arguments.contentID />
			<cfset returnStruct['group']	= ImagegroupimageService.getGroupImages( argumentCollection=sArgs ) />
		</cfif>

		<cfset returnStruct['sEcho']					= getTickCount()>
		<cfset returnStruct['iTotalDisplayRecords']		= sImage.count>
		<cfset returnStruct['iTotalRecords']			= sImage.count>
		<cfset returnStruct['iDisplayStart']			= sImage.start>
		<cfset returnStruct['data']						= sImage.itemarray>
		<cfset returnStruct['path']						= "#getMeldGalleryManager().getPluginConfig().getConfigBean().getContext()#/#session.siteID#/" />
		<cfset returnStruct['success']					= true>

		<cfcontent type="application/json">
		<cfreturn returnStruct />
	</cffunction>

	<cffunction name="saveImageGroup" access="remote" returntype="any" returnformat="json" output="false" hint="Retrieves products.">
		<cfset var returnStruct				= StructNew() />
		<cfset var mmFormTools				= getMeldGalleryManager().getBeanFactory().getBean("mmFormTools") />
		<cfset var mmResourceBundle			= getMeldGalleryManager().getBeanFactory().getBean("mmResourceBundle") />
		<cfset var ImageGroupService		= getMeldGalleryManager().getBeanFactory().getBean("ImageGroupService") />
		<cfset var ImagegroupimageService	= getMeldGalleryManager().getBeanFactory().getBean("ImagegroupimageService") />

		<cfset var aData					= ArrayNew(1) />
		

		<cfset var imageGroupBean		= "" />
		<cfset var imageGroupImages		= ArrayNew(1) />

		<cfset var sArgs				= StructNew() />

		<cfset returnStruct['success']	= false>

		<cfif not structKeyExists(arguments,"contentID")>
			<cfcontent type="application/json">
			<cfreturn returnStruct />
		<cfelseif not structKeyExists(arguments,"imageidlist")>
			<cfcontent type="application/json">
			<cfreturn returnStruct />
		</cfif>

		<cfset aData = deserializeJSON( arguments.imageidlist ) />
		
		<cfif not isArray( aData )>
			<cfset aData = ArrayNew(1)>
		</cfif>
		
		<cfloop from="1" to="#ArrayLen(aData)#" index="iiX">
			<cfset aData[iiX] = mid(aData[iiX],4,40)>
		</cfloop>

		<cfset sArgs.imageGroupID		= arguments.contentID />
		<cfset imageGroupBean			= ImageGroupService.getImageGroup( argumentCollection=sArgs ) />

		<cfset sArgs					= StructNew() />
		<cfset sArgs.isActive			= 1 />
		<cfset sArgs.siteID				= session.siteID />

		<cfset imageGroupBean.updateMemento( sArgs ) />

		<cfif not imageGroupBean.beanExists()>
			<cfset ImageGroupService.saveImageGroup( imageGroupBean ) />
		<cfelse>
			<cfset ImageGroupService.updateImageGroup( imageGroupBean ) />
		</cfif>

		<cfset sArgs					= StructNew() />
		<cfset sArgs.imageGroupID		= imageGroupBean.getImageGroupID() />
		<cfset sArgs.imageIDArray		= aData />

		<cfset ImagegroupimageService.saveImageGroupImages( argumentCollection=sArgs ) />

		<cfset returnStruct['success']	= true>

		<cfcontent type="application/json">
		<cfreturn returnStruct />
	</cffunction>

	<cffunction name="getImageList" access="remote" returntype="any" returnformat="json" output="false" hint="Retrieves products.">
		<cfset var mmFormTools			= getMeldGalleryManager().getBeanFactory().getBean("mmFormTools") />
		<cfset var mmResourceBundle		= getMeldGalleryManager().getBeanFactory().getBean("mmResourceBundle") />
		<cfset var ImageService			= getMeldGalleryManager().getBeanFactory().getBean("ImageService") />
		<cfset var contentRenderer		= getMuraManager().getBean('contentRenderer') />
		
		<cfset var returnStruct			= StructNew() />
		<cfset var sImage				= StructNew() />
		<cfset var aImageData			= ArrayNew(1) />
		<cfset var sCols				= StructNew() />

		<cfset var iiX					= "" />
		<cfset var cImage				= "" />
		<cfset var aImage				= ArrayNew(1) />
		<cfset var sData				= mmFormTools.scopeFormSubmission( arguments,true,false )> <!--- data,skip empty,append global --->
		<cfset var sCriteria			= StructNew() />
		<cfset var menu					= "" />

		<cfset sData['criteria']['siteid'] = session.siteID>

		<!--- sortable columns, as per database query --->
		<cfset sCols['0'] = "">
		<cfset sCols['1'] = "name">
		<cfset sCols['2'] = "tags">
		<cfset sCols['3'] = "isActive">

		<cfif not structKeyExists(sData,"mode")>
			<cfset sData.mode = "edit">
		</cfif>

		<cfset sCriteria = setCriteria( sData,sCols,1 ) />
		<cfset sImage = ImageService.search( argumentCollection=sCriteria )>

		<cfloop from="1" to="#ArrayLen(sImage.itemarray)#" index="iiX">
			<cfset cImage 	= sImage.itemarray[iiX] />
			<cfset aImage	= ArrayNew(1) />

			<cfsavecontent variable="menu"><cfoutput>
			<ul class='table-buttons two'>
				<li class="blank"></li>
				<li><span title='#mmResourceBundle.key('Edit')#' class='sb-button ui-state-default'><a class='ui-icon ui-icon-pencil' href='?action=admin:image.edit&amp;ImageID=#cImage.ImageID#'></a></span></li>
			</ul></cfoutput></cfsavecontent>

			<cfset ArrayAppend(aImage, menu ) />
			<cfset ArrayAppend(aImage,"#cImage.name#" ) />
			<cfset ArrayAppend(aImage, cImage.tags ) />
			<cfset ArrayAppend(aImage,mmResourceBundle.key("active"& cImage.isActive )) />
			<cfset ArrayAppend(aImage, "<a href='#contentRenderer.createHREFForImage(session.siteID,cImage.fileID,cImage.type, 'large')#' rel='[thumbs]' class='sb'><img src='#contentRenderer.createHREFForImage(session.siteID,cImage.fileID,cImage.type, 'small')#'></a>" ) />
			<cfset ArrayAppend(aImageData,aImage) />
		</cfloop>

		<cfset returnStruct['sEcho']					= getTickCount()>
		<cfset returnStruct['iTotalDisplayRecords']		= sImage.count>
		<cfset returnStruct['iTotalRecords']			= sImage.count>
		<cfset returnStruct['aaData']					= aImageData>
		<cfset returnStruct['success']					= true>

		<cfcontent type="application/json">
		<cfreturn returnStruct />
	</cffunction>

	<cffunction name="setCriteria" access="private" returntype="struct" output="false" hint="Creates the search critera structure">
		<cfargument name="sData" required="true" type="struct">
		<cfargument name="cols" required="true" type="struct">
		<cfargument name="defaultSortCol" required="false" type="string" default="1">

		<cfset var sCriteria		= StructNew() />
		<cfset var sortDir			= "" />

		<cfset sCriteria.criteria	= StructNew()>
		<cfset sCriteria.orderBy	= "">

		<cfif structkeyexists(sData,"criteria")>
			<cfset sCriteria.criteria = sData.criteria>
		</cfif>

		<cfif structkeyexists(sData,"mm_global") and structkeyexists(sData.mm_global,"iDisplayStart")>
			<cfset sCriteria.start	= sData['mm_global'].iDisplayStart>
			<cfset sCriteria.size	= sData['mm_global'].iDisplayLength>
			<cfset sCriteria.count	= 0>
		</cfif>

		<cfif structkeyexists(sData,"iSortCol") and structKeyExists( arguments.cols,sData.iSortCol['0'] )>
			<cfif sData.sSortDir['0'] eq "asc">
				<cfset sortDir = "ASC">
			<cfelse>
				<cfset sortDir = "DESC">
			</cfif>
			<cfset sCriteria.orderBy = "#arguments.cols[ sData.iSortCol['0'] ]# #sortDir#">
		<cfelse>
			<cfset sCriteria.orderBy = "#arguments.cols[ arguments.defaultSortCol ]# ASC">
		</cfif>

		<cfreturn sCriteria>	
	</cffunction>

	<cffunction name="setMeldGalleryManager" access="public" returntype="void" output="false">
		<cfargument name="MeldGalleryManager" type="any" required="true" />
		<cfset variables.instance.MeldGalleryManager = arguments.MeldGalleryManager />
	</cffunction>
	<cffunction name="getMeldGalleryManager" access="public" returntype="any" output="false">
		<cfreturn variables.instance.MeldGalleryManager />
	</cffunction>

	<cffunction name="setMuraManager" access="public" returntype="void" output="false">
		<cfargument name="MuraManager" type="any" required="true" />
		<cfset variables.instance.MuraManager = arguments.MuraManager />
	</cffunction>
	<cffunction name="getMuraManager" access="public" returntype="any" output="false">
		<cfreturn variables.instance.MuraManager />
	</cffunction>

</cfcomponent>