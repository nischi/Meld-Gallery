  	<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent extends="controller">
	<cffunction name="default" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset rc.mmBC.addCrumb( arguments.rc,"Image Groups","?" )>
	</cffunction>

	<cffunction name="edit" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfif isDefined("rc.btaction")>
			<!--- cancel? --->
			<cfif arguments.rc.btaction eq rc.mmRBF.key('cancel')>
				<cflocation url="?action=admin:imagegroup" addtoken="false">
			<!--- save? --->
			<cfelseif rc.btaction eq rc.mmRBF.key('save')>
				<cfset success = doSaveImageGroup( argumentCollection=arguments ) /> 
				<cfif success eq true>
					<cflocation url="?action=admin:imagegroup" addtoken="false">
				</cfif> 
			<!--- update? --->
			<cfelseif rc.btaction eq rc.mmRBF.key('update')>
				<cfset success = doUpdateImageGroup( argumentCollection=arguments )>
				<cfif success eq true>
					<cflocation url="?action=admin:imagegroup" addtoken="false">
				</cfif>
			</cfif>
		<cfelseif isDefined("rc.btdeleteconfirm") and rc.btdeleteconfirm eq "delete">
			<cfset success = doDeleteImageGroup( argumentCollection=arguments )>
			<cfif success eq true>
				<cflocation url="?action=admin:imagegroup" addtoken="false">
			</cfif> 
		</cfif>

		<cfset doGetImageGroup( argumentCollection=arguments ) />

		<cfset rc.mmBC.addCrumb( arguments.rc,"Image Groups","?action=admin:imagegroup" )>
		
		<cfif rc.imageGroupBean.beanExists()>
			<cfset rc.mmBC.addCrumb( arguments.rc,rc.imageGroupBean.getName(),"" )>
		<cfelse>
			<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key("newimagegroup"),"" )>
		</cfif>		
	</cffunction>

	<cffunction name="doDeleteImageGroup" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var ImageGroupService	= getBeanFactory().getBean("ImageGroupService") />

		<cfset var sArgs				= StructNew() /> 

		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.imageGroupID		= rc.imageGroupID />

		<cfset ImageGroupService.deleteImageGroup( argumentCollection=sArgs ) />
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>

	<cffunction name="doSaveImageGroup" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var ImageGroupService	= getBeanFactory().getBean("ImageGroupService") />
		<cfset var mmFormTools			= getBeanFactory().getBean("mmFormTools") />
		<cfset var imageGroupBean		= "" />
		<cfset var formData				= StructNew() />

		<cfset var sArgs				= StructNew() /> 
		<cfset var fileID				= "" />
		<cfset var imageIDArray			= ArrayNew(1) />

		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.imageGroupID		= rc.imageGroupID />
		<cfset sArgs.siteID				= rc.siteID />
		<cfset sArgs.adminID			= rc.$.currentUser('userID') />

		<cfset imageGroupBean	= imageGroupService.createimageGroup( argumentCollection=sArgs ) />

		<!--- we do paramaterizeBeanBooleans to 'fill in' the form's unsubmitted checkboxes --->
		<cfset mmFormTools.paramaterizeBeanBooleans(ImageGroupbean) />
		<cfset formData			= mmFormTools.scopeFormSubmission(form,false,true) />
		<cfset imageIDArray		= deserializeJSON( formData.ImageGroupbean.imageidlist ) />

		<cfif isArray( imageIDArray )>
			<cfset imageGroupBean.setImageIDArray( imageIDArray ) />
		<cfelse>
			<cfset imageGroupBean.setImageIDArray( ArrayNew(1) ) />
		</cfif>

		<!--- set the new values --->
		<cfset imageGroupBean.updateMemento( formData.imageGroupBean )>
		<cfset rc.imageGroupBean = imageGroupBean />

		<cfset ImageGroupService.saveImageGroup( imageGroupBean ) />
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>

	<cffunction name="doUpdateImageGroup" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var ImageGroupService	= getBeanFactory().getBean("ImageGroupService") />
		<cfset var mmFormTools			= getBeanFactory().getBean("mmFormTools") />
		<cfset var imageGroupBean		= "" />
		<cfset var formData				= StructNew() />

		<cfset var sArgs				= StructNew() /> 
		<cfset var fileID				= "" />
		<cfset var imageIDArray			= ArrayNew(1) />

		<cfset sArgs					= StructNew() /> 
		<cfset sArgs.imageGroupID		= rc.imageGroupID />
		<cfset imageGroupBean	= imageGroupService.getImageGroup( argumentCollection=sArgs ) />

		<cfif not imageGroupBean.beanExists()>
			<!--- error --->
			<cfreturn false>
		</cfif>

		<!--- we do paramaterizeBeanBooleans to 'fill in' the form's unsubmitted checkboxes --->
		<cfset mmFormTools.paramaterizeBeanBooleans(ImageGroupbean) />
		<cfset formData			= mmFormTools.scopeFormSubmission(form,false,true) />
		<cfset imageIDArray		= deserializeJSON( formData.ImageGroupbean.imageidlist ) />

		<cfif isArray( imageIDArray )>
			<cfset imageGroupBean.setImageIDArray( imageIDArray ) />
		<cfelse>
			<cfset imageGroupBean.setImageIDArray( ArrayNew(1) ) />
		</cfif>

		<!--- set the new values --->
		<cfset imageGroupBean.updateMemento( formData.imageGroupBean )>
		<cfset rc.imageGroupBean = imageGroupBean />
	
		<cfset ImageGroupService.updateImageGroup( imageGroupBean ) />
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>

	<cffunction name="doGetImageGroup" access="private" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var mmFormTools				= getBeanFactory().getBean("mmFormTools") />
		<cfset var ImagegroupService		= getBeanFactory().getBean("ImagegroupService") />
		<cfset var imageGroupBean			= "" />
		<cfset var sArgs					= StructNew() />

		<cfif StructKeyExists(rc,"imageGroupID")>
			<cfset imageGroupBean = ImagegroupService.getImageGroup( rc.imageGroupID ) />
		<cfelse>
			<cfset sArgs.siteID		= rc.$.event("siteID") />
			<cfset sArgs.isActive	= true />
			<cfset imageGroupBean	= ImagegroupService.createImageGroup( argumentCollection=sArgs ) />
		</cfif>

		<!--- set up for form --->
		<cfset mmFormTools.paramaterizeBeanForm(imageGroupBean) />

		<cfset rc.ImageGroupBean = imageGroupBean />
	</cffunction>
	
</cfcomponent>