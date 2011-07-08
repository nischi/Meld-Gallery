<!---^^LICENSE-START^^--->
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
<!---^^LICENSE-END^^--->

<cfcomponent name="DisplayService" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="DisplayService">
		<cfargument name="DisplayDAO" type="any" required="true" />
		<cfargument name="DisplayGateway" type="any" required="true" />

		<cfset variables.DisplayDAO = arguments.DisplayDAO />
		<cfset variables.DisplayGateway = arguments.DisplayGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createDisplay" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="DisplayID" type="uuid" required="false" />
		<cfargument name="DisplayTypeID" type="string" required="false" />
		<cfargument name="ObjectID" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="Params" type="string" required="false" />
		<cfargument name="Notes" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="ModuleID" type="string" required="false" />
		<cfargument name="ContentID" type="string" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="Settings" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
				
		<cfset var DisplayBean = createObject("component","DisplayBean").init(argumentCollection=arguments) />
		<cfreturn DisplayBean />
	</cffunction>

	<cffunction name="getDisplay" access="public" output="false" returntype="any">
		<!---^^PRIMARY-START^^--->
		<cfargument name="DisplayID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var DisplayBean = createDisplay(argumentCollection=arguments) />
		<cfset variables.DisplayDAO.read(DisplayBean) />
		<cfreturn DisplayBean />
	</cffunction>

	<cffunction name="getDisplays" access="public" output="false" returntype="array">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="DisplayID" type="uuid" required="false" />
		<cfargument name="DisplayTypeID" type="string" required="false" />
		<cfargument name="ObjectID" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="Params" type="string" required="false" />
		<cfargument name="Notes" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="ModuleID" type="string" required="false" />
		<cfargument name="ContentID" type="string" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="Settings" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfreturn variables.DisplayGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="DisplayID" type="uuid" required="false" />
		<cfargument name="DisplayTypeID" type="string" required="false" />
		<cfargument name="ObjectID" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="Params" type="string" required="false" />
		<cfargument name="Notes" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="ModuleID" type="string" required="false" />
		<cfargument name="ContentID" type="string" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="Settings" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->

		<cfreturn variables.DisplayGateway.getBeanByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getByArray" access="public" output="false" returntype="Struct" >
		<cfargument name="idArray" type="array" required="true" />

		<cfreturn variables.DisplayGateway.getByArray(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="search" access="public" output="false" returntype="struct">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="false" default="d.displayID,d.displayTypeID,d.name,d.isactive" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="10"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isPaged" type="numeric" required="false" default="true" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var aDisplay			= ArrayNew(1)>
		<cfset var iiX				= "" >
		<cfset var isValid			= false >
		<cfset var sReturn			= StructNew()>
		
		<cfif arguments.isPaged and not arguments.count>
			<cfset arguments.isCount = true>
			<cfset sReturn.count = variables.DisplayGateway.search(argumentCollection=arguments) />
			<cfset arguments.isCount = false>
		<cfelse>
			<cfset sReturn.count = arguments.count />
		</cfif>
		
		<cfset aDisplay				= variables.DisplayGateway.search(argumentCollection=arguments) />

		<cfset sReturn.start		= arguments.start>
		<cfset sReturn.size			= arguments.size>
		<cfset sReturn.itemarray	= aDisplay>

		<cfreturn sReturn />
	</cffunction>

	<cffunction name="saveDisplay" access="public" output="false" returntype="boolean">
		<cfargument name="DisplayBean" type="any" required="true" />

		<cfset var success = false />
		<cfset var process = false />

		<cfset success = variables.DisplayDAO.save(DisplayBean) />
		
		<cfif success and len( DisplayBean.getContentID() )>
			<cfset process = getDisplayImageService().setDisplayImages( argumentCollection=arguments ) />
		</cfif>

		<cfif process>
			<!--- PROCESS IN BG --->
		</cfif>

		<cfreturn success>	
	</cffunction>
	
	<cffunction name="updateDisplay" access="public" output="false" returntype="boolean">
		<cfargument name="DisplayBean" type="any" required="true" />

		<cfset validateDisplay( argumentCollection=arguments ) />	

		<cfreturn variables.DisplayDAO.update(DisplayBean) />
	</cffunction>
	
	<cffunction name="validateDisplay" access="public" output="false" returntype="boolean">
		<cfargument name="DisplayBean" type="any" required="true" />

		<cfset var currentDisplayBean	= getDisplay( displayBean.getDisplayID() ) />
		<cfset var existParams			= currentDisplayBean.getParamsData() /> 
		<cfset var newParams			= displayBean.getParamsData() /> 

		<cfset var isValid 				= getGeneralUtility().StructCompare( existParams,newParams ) />
		<cfset var process 				= false />

		<cfif isValid>
			<cfset isValid 				= DisplayBean.getContentID() eq currentDisplayBean.getContentID()  />
		</cfif>

		<cfif not isValid>
			<cfset getDisplayImageService().invalidateDisplay( arguments.DisplayBean.getDisplayID() ) />
			<cfset process = getDisplayImageService().setDisplayImages( argumentCollection=arguments ) />
		</cfif>

		<cfif process>
			<!--- PROCESS IN BG --->
		</cfif>

		<cfset arguments.DisplayBean.setIsValid( isValid ) />

		<cfreturn isValid />
	</cffunction>

	<cffunction name="deleteDisplay" access="public" output="false" returntype="boolean">
		<!---^^PRIMARY-START^^--->
		<cfargument name="DisplayID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var DisplayBean = createDisplay(argumentCollection=arguments) />

		<cfset variables.DisplayDAO.delete( DisplayBean ) />
		<cfset getDisplayImageService().deleteByDisplayID( arguments.displayID ) />

		<cfreturn  true />
	</cffunction>
<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->
<!---^^CUSTOMEND^^--->
	<cffunction name="setGeneralUtility" access="public" returntype="void" output="false">
		<cfargument name="GeneralUtility" type="any" required="true" />
		<cfset variables.instance.GeneralUtility = arguments.GeneralUtility />
	</cffunction>
	<cffunction name="getGeneralUtility" access="public" returntype="any" output="false">
		<cfreturn variables.instance.GeneralUtility />
	</cffunction>

	<cffunction name="setdisplayImageService" access="public" returntype="void" output="false">
		<cfargument name="displayImageService" type="any" required="true" />
		<cfset variables.instance.displayImageService = arguments.displayImageService />
	</cffunction>
	<cffunction name="getdisplayImageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.displayImageService />
	</cffunction>
</cfcomponent>


















