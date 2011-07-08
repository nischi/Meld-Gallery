  	<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent extends="controller">
	<cffunction name="default" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset doGetDisplayType( argumentCollection=arguments ) />

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('displays'),"?" )>
	</cffunction>

	<cffunction name="choose" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfif isDefined("rc.btaction")>
			<cfif arguments.rc.btaction eq rc.mmRBF.key('cancel')>
				<cflocation url="?action=admin:display" addtoken="false">
			<cfelseif arguments.rc.btaction eq rc.mmRBF.key('next') and len(form.displayTypeID)>
				<cflocation url="?action=admin:display.edit&displayTypeID=#form.displayTypeID#&sourceType=#form.sourceType#" addtoken="false">
			</cfif>
		</cfif>

		<cfset doGetDisplayType( argumentCollection=arguments ) />

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('displays'),"?action=admin:display" )>
		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('choosedisplaytype'),"?" )>
	</cffunction>

	<cffunction name="edit" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfif isDefined("rc.btaction")>
			<!--- cancel? --->
			<cfif arguments.rc.btaction eq rc.mmRBF.key('cancel')>
				<cflocation url="?action=admin:display" addtoken="false">
			<!--- save? --->
			<cfelseif rc.btaction eq rc.mmRBF.key('save')>
				<cfset success = doSaveDisplay( argumentCollection=arguments ) /> 
				<cfif success eq true>
					<cflocation url="?action=admin:display" addtoken="false">
				</cfif> 
			<!--- update? --->
			<cfelseif rc.btaction eq rc.mmRBF.key('update')>
				<cfset success = doUpdateDisplay( argumentCollection=arguments )>
				<cfif success eq true>
					<cflocation url="?action=admin:display" addtoken="false">
				</cfif>
			</cfif>
		<cfelseif isDefined("rc.btdeleteconfirm") and rc.btdeleteconfirm eq "delete">
			<cfset success = doDeleteDisplay( argumentCollection=arguments )>
			<cfif success eq true>
				<cflocation url="?action=admin:display" addtoken="false">
			</cfif> 
		</cfif>

		<cfset doGetDisplay( argumentCollection=arguments ) />

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('displays'),"?action=admin:display" )>
		<cfset rc.mmBC.addCrumb( arguments.rc,rc.displayTypeBean.getName(),"" )>
		
		<cfif rc.DisplayBean.beanExists()>
			<cfset rc.mmBC.addCrumb( arguments.rc,rc.DisplayBean.getName(),"" )>
		<cfelse>
			<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key("newdisplay"),"" )>
		</cfif>		
	</cffunction>

<!--- private --->
	<cffunction name="doGetDisplayType" access="private" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var displayTypeService	= getBeanFactory().getBean("DisplayTypeService") />
		<cfset var aDisplayTypes		= ArrayNew(1) /> 
		<cfset var sArgs				= StructNew() /> 

		<cfset sArgs.isActive			= 1 />
		<cfset sArgs.isConfigurable		= 1 />
		<cfset sArgs.orderBy			= "name DESC" />

		<cfset aDisplayTypes = DisplayTypeService.getDisplayTypes( argumentCollection=sArgs ) />

		<cfset rc.aDisplayTypes = aDisplayTypes />
	</cffunction>

	<cffunction name="doGetDisplay" access="private" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var generalUtility			= getBeanFactory().getBean("generalUtility") />
		<cfset var mmFormTools				= getBeanFactory().getBean("mmFormTools") />
		<cfset var MeldGalleryManager		= getBeanFactory().getBean("MeldGalleryManager") />
		<cfset var displayService			= getBeanFactory().getBean("DisplayService") />
		<cfset var displayTypeService		= getBeanFactory().getBean("DisplayTypeService") />
		<cfset var imageGroupService		= getBeanFactory().getBean("imageGroupService") />
		<cfset var ImagegroupimageService	= getBeanFactory().getBean("ImagegroupimageService") />
		<cfset var feedManager				= getBeanFactory().getBean("MeldGalleryFeedManager") />

		<cfset var displayTypeBean		= "" /> 
		<cfset var displayBean			= "" /> 
		<cfset var imageGroupBean		= "" /> 
		<cfset var feedBean				= "" /> 
		<cfset var aImages				= ArrayNew(1) /> 
		<cfset var sArgs				= StructNew() /> 
		<cfset var sDefaults			= StructNew() />

		<cfset var paramsData			= StructNew() />
		<cfset var displayTypeSettings	= StructNew() />

		<cfif StructKeyExists(rc,"displayID")>
			<cfset displayBean = displayService.getDisplay( rc.displayID ) />

			<cfset rc.displayTypeID			= displayBean.getDisplayTypeID() />
		<cfelse>
			<cfset sArgs.siteID				= rc.$.event("siteID") />
			<cfset sArgs.isActive			= true />
			<cfset sArgs.adminID			= rc.$.currentUser().getUserID() />
			<cfset sArgs.displayTypeID		= rc.displayTypeID />
			<cfset displayBean				= displayService.createDisplay( argumentCollection=sArgs ) />
		</cfif>

		<cfset displayTypeBean				= displayTypeService.getDisplayType( rc.displayTypeID,rc.pluginConfig ) />

		<!--- set up for form --->
		<cfset mmFormTools.paramaterizeBeanForm(displayBean) />

		<cfset paramsData	= displayTypeBean.getDefaultData(rc.$) />

		<cfif displayBean.beanExists()>
			<cfset paramsData	= generalUtility.structMerge( paramsData,displayBean.getParamsData() ) />
		</cfif>

		<cfif StructKeyExists(rc,"sourceType")>
			<cfset paramsData['sourceType'] = rc.sourceType />
		<cfelseif StructKeyExists(paramsData,"sourceType")>
			<cfset rc.sourceType = paramsData.sourceType />
		<cfelse>
			<cfset rc.sourceType = "imagegroup" />
		</cfif>

		<cfset form.params_sourcetype = rc.sourceType />

		<cfif len( displayBean.getContentID() )>
			<cfswitch expression="#rc.sourceType#">
				<cfcase value="collection">
					<cfset feedBean	= feedManager.getFeed( displayBean.getContentID(),rc.siteID ) />
					<cfif isDate(feedBean.getDateCreated())>
						<cfset rc.feedBean = feedBean />
					</cfif>
				</cfcase>
				<cfdefaultcase>
					<cfset sArgs	= StructNew() />
					<cfset sArgs.ImageGroupID	= displayBean.getContentID() />
					<cfset sArgs.count			= 20 />
		
					<cfset imageGroupBean		= imageGroupService.getImageGroup( argumentCollection=sArgs ) />
		
					<cfif imageGroupBean.beanExists()>
						<cfset aImages				= ImagegroupimageService.getGroupImages( argumentCollection=sArgs ) />
						<cfset rc.imageGroupBean	= imageGroupBean />
						<cfset rc.aImages			= aImages />
					</cfif>
				</cfdefaultcase>
			</cfswitch>
		</cfif>
		
		<cfset settingsData = displayTypeBean.getSettingsData() />
		<cfset mmFormTools.paramaterizeStruct(paramsData,"params") />
		
		<cfset rc.displayBean			= displayBean />
		<cfset rc.displayTypeBean		= displayTypeBean />
		<cfset rc.settingsData			= settingsData />
		<cfset rc.paramsData			= paramsData />

		<!--- we want to use the subsystem resource bundle --->
		<cfif fw.getBeanFactory( rc.displayTypeBean.getPackage() ).beanDefinitionExists('localmmResourceBundle')>
			<cfset rc.mmRBFLocal = fw.getBeanFactory( rc.displayTypeBean.getPackage()).getBean('localmmResourceBundle')>
		<cfelse>
			<cfset rc.mmRBFLocal = rc.mmRBF>
		</cfif>		
		
	</cffunction>

	<cffunction name="doDeleteDisplay" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var DisplayService	= getBeanFactory().getBean("DisplayService") />

		<cfset var sArgs			= StructNew() /> 

		<cfset sArgs				= StructNew() /> 
		<cfset sArgs.DisplayID		= rc.DisplayID />

		<cfset DisplayService.deleteDisplay( argumentCollection=sArgs ) />
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>

	<cffunction name="doSaveDisplay" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var displayService		= getBeanFactory().getBean("DisplayService") />
		<cfset var displayTypeService	= getBeanFactory().getBean("DisplayTypeService") />
		<cfset var mmFormTools			= getBeanFactory().getBean("mmFormTools") />
		<cfset var displayBean			= "" />
		<cfset var displayTypeBean		= displayTypeService.getDisplayType( rc.displayTypeID,rc.pluginConfig ) />

		<cfset var formData				= StructNew() />

		<cfset var sArgs				= StructNew() /> 
		<cfset var defaultParams		= StructNew() /> 
		<cfset var params				= StructNew() />

		<cfif len( displayTypeBean.getDefaults() )> 
			<cfset defaultParams		= deserializeJSON( displayTypeBean.getDefaults() ) /> 
		</cfif>

		<cfset sArgs				= StructNew() /> 
		<cfset sArgs.siteID			= rc.siteID />
		<cfset sArgs.moduleID		= rc.pluginConfig.getModuleID() />
		<cfset sArgs.adminID		= rc.$.currentUser('userID') />

		<cfset displayBean	= displayService.createDisplay( argumentCollection=sArgs ) />

		<!--- we do paramaterizeBeanBooleans to 'fill in' the form's unsubmitted checkboxes --->
		
		<cfset mmFormTools.paramaterizeBeanBooleans(displayBean) />
		<cfset formData	= mmFormTools.scopeFormSubmission(form,false,false) />
		
		<cfset structAppend(formData.displayBean,formData.mm_global)>

		<!--- set the new values --->
		<cfset displayBean.updateMemento( formData.DisplayBean )>
		
		<cfset structAppend( defaultParams,formData.params,true ) />
		
		<cfset displayBean.setParamsData( defaultParams )>

		<cfset rc.DisplayBean = displayBean />

		<cfset DisplayService.saveDisplay( DisplayBean ) />
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>

	<cffunction name="doUpdateDisplay" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var displayService		= getBeanFactory().getBean("DisplayService") />
		<cfset var displayTypeService	= getBeanFactory().getBean("DisplayTypeService") />
		<cfset var mmFormTools			= getBeanFactory().getBean("mmFormTools") />
		<cfset var displayBean			= "" />
		<cfset var displayTypeBean		= displayTypeService.getDisplayType( rc.displayTypeID,rc.pluginConfig ) />

		<cfset var formData				= StructNew() />

		<cfset var sArgs				= StructNew() /> 
		<cfset var defaultParams		= StructNew() /> 
		<cfset var params				= StructNew() />

		<cfif len( displayTypeBean.getDefaults() )> 
			<cfset defaultParams		= deserializeJSON( displayTypeBean.getDefaults() ) /> 
		</cfif>

		<cfset sArgs				= StructNew() /> 
		<cfset sArgs.displayID		= rc.displayID />

		<cfset displayBean	= displayService.getDisplay( argumentCollection=sArgs ) />

		<!--- we do paramaterizeBeanBooleans to 'fill in' the form's unsubmitted checkboxes --->
		<cfset mmFormTools.paramaterizeBeanBooleans( displayBean ) />
		<cfset formData	= mmFormTools.scopeFormSubmission( form,false,false ) />

		<cfif not StructKeyExists(formData.displaybean,'contentID') and StructKeyExists(formData,"imagegroupbean") and StructKeyExists(formData.imagegroupbean,'ImageGroupID')>
			<cfset formData.displayBean.contentID =  formData.imagegroupbean.ImageGroupID>
		<cfelseif not StructKeyExists(formData.displaybean,'contentID') and StructKeyExists(formData,"feedBean") and StructKeyExists(formData.feedBean,'FeedID')>
			<cfset formData.displayBean.contentID =  formData.feedBean.FeedID>
		</cfif>

		<cfset structAppend(formData.displayBean,formData.mm_global)>

		<!--- set the new values --->
		<cfset displayBean.updateMemento( formData.DisplayBean )>

		<cfset structAppend( defaultParams,formData.params,true ) />

		<cfset displayBean.setParamsData( defaultParams )>

		<cfset rc.DisplayBean = displayBean />

		<cfset DisplayService.updateDisplay( DisplayBean ) />
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>
</cfcomponent>