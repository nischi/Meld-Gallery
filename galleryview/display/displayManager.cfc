<!---

This file is part of the Meld Gallery application.

Meld Gallery is licensed under the GPL 2.0 license
Copyright (C) 2010,2011 Meld Solutions Inc. http://www.meldsolutions.com/

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
<cfcomponent name="displayManager" output="false" extends="MeldGallery.com.meldsolutions.mura.MuraDisplayManager">
	<!--- Mura Content Object dropdown renderer --->
	<cffunction name="renderAppOptionsRender" output="false" returntype="any">
		<cfargument name="$">
		<cfargument name="event">

		<cfset var beanFactory			= variables.pluginConfig.getApplication().getValue('beanFactory') />
		<cfset var displayTypeService	= beanFactory.getBean("DisplayTypeService") />
		<cfset var displayService		= beanFactory.getBean("DisplayService") />
		<cfset var displayTypeBean		= "" />
		<cfset var aDisplays			= ArrayNew(1) />
		<cfset var str					= "">
		<cfset var iiX					= "">
		<cfset var sArgs				= StructNew() />

		<cfset sArgs.objectID			= $.event().getValue('objectID') />
		<cfset sArgs.isActive			= 1 />
		<cfset displayTypeBean			= displayTypeService.getBeanByAttributes( argumentCollection=sArgs ) />

		<cfif displayTypeBean.beanExists()>
			<cfset sArgs					= StructNew() />
			<cfset sArgs.displayTypeID		= displayTypeBean.getDisplayTypeID() />
			<cfset sArgs.isActive			= 1 />
			<cfset sArgs.siteID				= $.event().getValue('siteID') />
			<cfset aDisplays				= displayService.getDisplays( argumentCollection=sArgs ) />		
		</cfif>

		<cfsavecontent variable="str"><cfoutput>
		<select name="availableObjects" id="availableObjects" class="multiSelect" size="14" style="width: 310px;">
			<cfloop from="1" to="#ArrayLen( aDisplays )#" index="iiX">
				<option value='plugin~#aDisplays[iiX].getName()#~#displayTypeBean.getObjectID()#~{"displayID":"#aDisplays[iiX].getDisplayID()#"}'>#aDisplays[iiX].getName()#</option>
			</cfloop>
		</select>
		</cfoutput></cfsavecontent>

		<cfreturn str>
	</cffunction>

</cfcomponent>