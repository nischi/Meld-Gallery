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

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('settings'),"?" )>
		<cfset doGetSettings( argumentCollection=arguments ) />
	</cffunction>

	<cffunction name="edit" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfif isDefined("rc.btaction")>
			<!--- cancel? --->
			<cfif arguments.rc.btaction eq rc.mmRBF.key('cancel')>
				<cflocation url="?action=admin:Settings" addtoken="false">
			<!--- update? --->
			<cfelseif rc.btaction eq rc.mmRBF.key('update')>
				<cfset success = doUpdateSettings( argumentCollection=arguments )>
				<cfif success eq true>
					<cflocation url="?action=admin:Settings" addtoken="false">
				</cfif>
			</cfif>
		</cfif>

		<cfset doGetSettings( argumentCollection=arguments ) />

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('Settings'),"?action=admin:Settings" )>
		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key("Edit"),"" )>
	</cffunction>
	
<!--- private --->
	<cffunction name="doGetSettings" access="private" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var GalleryManager		= getBeanFactory().getBean("MeldGalleryManager") />
		<cfset var SettingService		= getBeanFactory().getBean("SettingService") />
		<cfset var displayTypeService	= getBeanFactory().getBean("DisplayTypeService") />
		<cfset var mmFormTools			= getBeanFactory().getBean("mmFormTools") />
		<cfset var SettingsBean			= ArrayNew(1) /> 
		<cfset var iiX					= "" /> 
		<cfset var sArgs				= StructNew() /> 
		<cfset var aDisplayTypes		= ArrayNew(1) /> 

		<cfset sArgs.isActive			= 1 />
		<cfset sArgs.isConfigurable		= 1 />
		<cfset sArgs.orderBy			= "name DESC" />

		<cfset aDisplayTypes = DisplayTypeService.getDisplayTypes( argumentCollection=sArgs ) />

		<cfset SettingsBean = SettingService.getBeanByAttributes( siteID=rc.siteID ) />

		<cfif not SettingsBean.beanExists()>
			<cfset SettingsBean = GalleryManager.getSiteSettings( rc.siteID ) />
		</cfif>

		<cfset mmFormTools.paramaterizeBeanForm(SettingsBean) />

		<cfset rc.DisplayTypeBean 		= "" />

		<cfloop from="1" to="#ArrayLen(aDisplayTypes)#" index="iiX">
			<cfif aDisplayTypes[iiX].getDisplayTypeID() eq SettingsBean.getdefaultDisplayTypeID()>
				<cfset rc.DisplayTypeBean = aDisplayTypes[iiX] />
				<cfbreak/>
			</cfif>
		</cfloop>
		
		<cfset rc.aDisplayTypes 	= aDisplayTypes />
		<cfset rc.SettingsBean		= SettingsBean />
	</cffunction>

	<cffunction name="doUpdateSettings" access="private" returntype="boolean" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var SettingService	= getBeanFactory().getBean("SettingService") />
		<cfset var mmFormTools		= getBeanFactory().getBean("mmFormTools") />
		<cfset var SettingsBean		= SettingService.getBeanByAttributes( siteID=rc.siteID ) />

		<cfset var formData				= StructNew() />
		<cfset var sArgs				= StructNew() /> 
		<cfset var defaultParams		= StructNew() /> 

		<!--- we do paramaterizeBeanBooleans to 'fill in' the form's unsubmitted checkboxes --->
		<cfset mmFormTools.paramaterizeBeanBooleans( SettingsBean,sArgs ) />
		<cfset formData	= mmFormTools.scopeFormSubmission( form,false,false ) />

		<!--- set the new values --->
		<cfset SettingsBean.updateMemento( formData.SettingBean )>

		<cfset SettingService.updateSetting( SettingsBean ) />
	
		<cfif not getErrorManager().hasErrors( rc.$.event() )>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>
</cfcomponent>