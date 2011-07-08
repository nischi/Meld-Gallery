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
<cfcomponent name="ImageGroupService" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="ImageGroupService">
		<cfargument name="ImageGroupDAO" type="any" required="true" />
		<cfargument name="ImageGroupGateway" type="any" required="true" />

		<cfset variables.ImageGroupDAO = arguments.ImageGroupDAO />
		<cfset variables.ImageGroupGateway = arguments.ImageGroupGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createImageGroup" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
				
		<cfset var ImageGroupBean = createObject("component","ImageGroupBean").init(argumentCollection=arguments) />
		<cfreturn ImageGroupBean />
	</cffunction>

	<cffunction name="getImageGroup" access="public" output="false" returntype="any">
		<!---^^PRIMARY-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var ImageGroupBean	= createImageGroup(argumentCollection=arguments) />
		<cfset var ImageIDArray		= ArrayNew(1) />
		
		<cfset variables.ImageGroupDAO.read(ImageGroupBean) />

		<cfif ImageGroupBean.beanExists()>
			<cfset ImageIDArray = ListToArray( getImagegroupimageService().getImagesInGroup( argumentCollection=arguments ) )/>
			<cfset ImageGroupBean.setImageIDArray( ImageIDArray ) />
		</cfif>

		<cfreturn ImageGroupBean />
	</cffunction>

	<cffunction name="getImageGroups" access="public" output="false" returntype="array">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfreturn variables.ImageGroupGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->

		<cfreturn variables.ImageGroupGateway.getBeanByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getByArray" access="public" output="false" returntype="Struct" >
		<cfargument name="idArray" type="array" required="true" />

		<cfreturn variables.ImageGroupGateway.getByArray(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="search" access="public" output="false" returntype="struct">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="false" default="ig.imageGroupID,ig.name,ig.tags,ig.isActive" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="10"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isPaged" type="numeric" required="false" default="true" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var aImageGroup		= ArrayNew(1)>
		<cfset var iiX				= "" >
		<cfset var isValid			= false >
		<cfset var sReturn			= StructNew()>

		<!--- do *not* pass this in from url/form! --->
		<cfif StructKeyExists(form,"fieldList") and form.fieldList eq arguments.fieldList>
			<cfset arguments.fieldList = "1234 AS imageGroupID" />
		<cfelseif StructKeyExists(url,"fieldList") and url.fieldList eq arguments.fieldList>
			<cfset arguments.fieldList = "1234 AS imageGroupID" />
		</cfif>
		
		<cfif arguments.isPaged and not arguments.count>
			<cfset arguments.isCount = true>
			<cfset sReturn.count = variables.ImageGroupGateway.search(argumentCollection=arguments) />
			<cfset arguments.isCount = false>
		<cfelse>
			<cfset sReturn.count = arguments.count />
		</cfif>
		
		<cfset aImageGroup			= variables.ImageGroupGateway.search(argumentCollection=arguments) />

		<cfset sReturn.start		= arguments.start>
		<cfset sReturn.size			= arguments.size>
		<cfset sReturn.itemarray	= aImageGroup>

		<cfreturn sReturn />
	</cffunction>


	<cffunction name="saveImageGroup" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupBean" type="any" required="true" />

		<cfset var success = variables.ImageGroupDAO.save(ImageGroupBean) />
		
		<cfif isArray( ImageGroupBean.getImageIDArray() )>
			<cfset getImagegroupimageService().saveImageGroupImages( ImageGroupBean.getImageGroupID(),ImageGroupBean.getImageIDArray() ) />
		</cfif>
		
		<cfreturn success />		
	</cffunction>
	
	<cffunction name="updateImageGroup" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupBean" type="any" required="true" />

		<cfset var success = variables.ImageGroupDAO.update(ImageGroupBean) />
		
		<cfif isArray( ImageGroupBean.getImageIDArray() )>
			<cfset getImagegroupimageService().saveImageGroupImages( ImageGroupBean.getImageGroupID(),ImageGroupBean.getImageIDArray() ) />
		</cfif>
		
		<cfreturn success />		
	</cffunction>

	<cffunction name="deleteImageGroup" access="public" output="false" returntype="boolean">
		<!---^^PRIMARY-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var ImageGroupBean = createImageGroup(argumentCollection=arguments) />
		
		<cfset variables.ImageGroupDAO.delete(ImageGroupBean) />
		<!--- by sending an empty array, we will effectively be deleting all image associations --->
		<cfset getImagegroupimageService().saveImageGroupImages( ImageGroupBean.getImageGroupID(),ArrayNew(1) ) />
		
		<cfreturn true>
	</cffunction>
<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->

	<cffunction name="setImagegroupimageService" access="public" returntype="void" output="false">
		<cfargument name="ImagegroupimageService" type="any" required="true" />
		<cfset variables.instance.ImagegroupimageService = arguments.ImagegroupimageService />
	</cffunction>
	<cffunction name="getImagegroupimageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.ImagegroupimageService />
	</cffunction>

<!---^^CUSTOMEND^^--->
</cfcomponent>



