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

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('gallerydisplays'),"?" )>
	</cffunction>

	<cffunction name="edit" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfif isDefined("rc.btaction")>
			<!--- cancel? --->
			<cfif arguments.rc.btaction eq rc.mmRBF.key('cancel')>
				<cflocation url="?action=admin:displaytype" addtoken="false">
			<!--- update? --->
			<cfelseif rc.btaction eq rc.mmRBF.key('update')>
				<cfset success = doUpdateDisplayType( argumentCollection=arguments )>
				<cfif success eq true>
					<cflocation url="?action=admin:displaytype" addtoken="false">
				</cfif>
			</cfif>
		</cfif>

		<cfset doGetDisplayType( argumentCollection=arguments ) />

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('displaytype'),"?action=admin:displaytype" )>
		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key("displayType"),"" )>
		<cfset rc.mmBC.addCrumb( arguments.rc,rc.displayTypeBean.getName(),"" )>
	</cffunction>

<!--- private --->
	<cffunction name="doGetDisplayType" access="private" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var displaytypeService	= getBeanFactory().getBean("displaytypeService") />
		<cfset var mmFormTools			= getBeanFactory().getBean("mmFormTools") />
		<cfset var displayTypeBean		= ArrayNew(1) /> 
		<cfset var sArgs				= StructNew() /> 

		<cfset var paramsData			= StructNew() />

		<cfset sArgs.displayTypeID		= rc.DisplayTypeID />

		<cfset displayTypeBean = displaytypeService.getdisplaytype( argumentCollection=sArgs ) />
		<cfset settingsData = displayTypeBean.getSettingsData() />

		<cfset paramsData	= displayTypeBean.getDefaultData(rc.$) />
		<cfset mmFormTools.paramaterizeStruct(paramsData,"params") />
		<cfset mmFormTools.paramaterizeBeanForm(displayTypeBean) />
		
		<cfset rc.displayTypeBean		= displayTypeBean />
		<cfset rc.params				= settingsData />

		<!--- we want to use the subsystem resource bundle --->
		<cfif fw.getBeanFactory( rc.displayTypeBean.getPackage() ).beanDefinitionExists('localmmResourceBundle')>
			<cfset rc.mmRBFLocal = fw.getBeanFactory( rc.displayTypeBean.getPackage()).getBean('localmmResourceBundle')>
		<cfelse>
			<cfset rc.mmRBFLocal = rc.mmRBF>
		</cfif>		

	</cffunction>

	<cffunction name="doUpdateDisplayType" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var displayService		= getBeanFactory().getBean("DisplayService") />
		<cfset var displaytypeService	= getBeanFactory().getBean("displaytypeService") />
		<cfset var mmFormTools			= getBeanFactory().getBean("mmFormTools") />
		<cfset var displayTypeBean		= displaytypeService.getDisplayType( rc.displayTypeID ) />

		<cfset var formData				= StructNew() />
		<cfset var sArgs				= StructNew() /> 
		<cfset var defaultParams		= StructNew() /> 

		<cfset sArgs.isConfigurable		= 1 />

		<!--- we do paramaterizeBeanBooleans to 'fill in' the form's unsubmitted checkboxes --->
		<cfset mmFormTools.paramaterizeBeanBooleans( displayTypeBean,sArgs ) />
		<cfset formData	= mmFormTools.scopeFormSubmission( form,false,false ) />

		<!--- set the new values --->
		<cfset displayTypeBean.updateMemento( formData.DisplayTypeBean )>
		<cfset displayTypeBean.setDefaultData( formData.params ) />

		<cfset DisplayTypeService.updateDisplaytype( DisplayTypeBean ) />
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>
</cfcomponent>