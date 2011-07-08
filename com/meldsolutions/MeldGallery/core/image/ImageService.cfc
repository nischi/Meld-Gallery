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
<cfcomponent name="ImageService" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="ImageService">
		<cfargument name="ImageDAO" type="any" required="true" />
		<cfargument name="ImageGateway" type="any" required="true" />

		<cfset variables.ImageDAO = arguments.ImageDAO />
		<cfset variables.ImageGateway = arguments.ImageGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createImage" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageID" type="uuid" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="CategoryID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="FriendlyName" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="Type" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Summary" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
				
		<cfset var ImageBean = createObject("component","ImageBean").init(argumentCollection=arguments) />
		<cfreturn ImageBean />
	</cffunction>

	<cffunction name="getImage" access="public" output="false" returntype="any">
		<!---^^PRIMARY-START^^--->
		<cfargument name="ImageID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var ImageBean = createImage(argumentCollection=arguments) />
		<cfset variables.ImageDAO.read(ImageBean) />
		<cfreturn ImageBean />
	</cffunction>

	<cffunction name="getImages" access="public" output="false" returntype="array">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageID" type="uuid" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="CategoryID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="FriendlyName" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="Type" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Summary" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfreturn variables.ImageGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageID" type="uuid" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="CategoryID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="FriendlyName" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="Type" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Summary" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->

		<cfreturn variables.ImageGateway.getBeanByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getByArray" access="public" output="false" returntype="Struct" >
		<cfargument name="idArray" type="array" required="true" />

		<cfreturn variables.ImageGateway.getByArray(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="search" access="public" output="false" returntype="struct">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="false" default="fileID,type,caption,name,tags,isActive,imageID" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="10"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isPaged" type="numeric" required="false" default="true" />
		<cfargument name="orderby" type="string" required="false" default="caption" />

		<cfset var aImage			= ArrayNew(1)>
		<cfset var iiX				= "" >
		<cfset var isValid			= false >
		<cfset var sReturn			= StructNew()>

		<cfif arguments.isPaged and not arguments.count>
			<cfset arguments.isCount = true>
			<cfset sReturn['count'] = variables.ImageGateway.search(argumentCollection=arguments) />
			<cfset arguments.isCount = false>
		<cfelse>
			<cfset sReturn['count'] = arguments.count />
		</cfif>

		<!--- do *not* pass this in from url/form! --->
		<cfif StructKeyExists(form,"fieldList") and form.fieldList eq arguments.fieldList>
			<cfset arguments.fieldList = "1234 AS imageID" />
		<cfelseif StructKeyExists(url,"fieldList") and url.fieldList eq arguments.fieldList>
			<cfset arguments.fieldList = "1234 AS imageID" />
		</cfif>

		<cfset aImage				= variables.ImageGateway.search(argumentCollection=arguments) />

		<cfset sReturn['start']		= arguments.start>
		<cfset sReturn['size']		= arguments.size>
		<cfset sReturn['itemarray']	= aImage>

		<cfreturn sReturn />
	</cffunction>

	<cffunction name="renderImage" access="public" output="false" returntype="any">
		<cfargument name="ConfigBean" type="any" required="true" />
		<cfargument name="ImageBean" type="any" required="true" />
		<cfargument name="fileID" type="string" required="true">
		<cfargument name="width" type="int" required="false">
		<cfargument name="height" type="int" required="false">
		<cfargument name="resizeType" type="string" required="false">
		<cfargument name="aspectType" type="string" required="false">
		<cfargument name="cropType" type="string" required="false">
		<cfargument name="qualityType" type="string" required="false">

		<cfreturn variables.ImageGateway.renderImage( argumentCollection=arguments ) />
	</cffunction>


	<cffunction name="saveImage" access="public" output="false" returntype="boolean">
		<cfargument name="ImageBean" type="any" required="true" />

		<cfreturn variables.ImageDAO.save(ImageBean) />
	</cffunction>
	
	<cffunction name="updateImage" access="public" output="false" returntype="boolean">
		<cfargument name="ImageBean" type="any" required="true" />

		<cfset var success = variables.ImageDAO.update(ImageBean) />
		
		<cfset getDisplayImageService().invalidateByImageID( ImageBean.getImageID() ) />
		
		<cfreturn success>
	</cffunction>

	<cffunction name="deleteImage" access="public" output="false" returntype="boolean">
		<!---^^PRIMARY-START^^--->
		<cfargument name="ImageID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		<cfset var ImageBean = createImage(argumentCollection=arguments) />

		<cfset getImagegroupimageService().deleteByImageID( ImageBean.getImageID() ) />
		<cfset getDisplayImageService().deleteByImageID( ImageBean.getImageID() ) />
		<cfset variables.ImageDAO.delete(ImageBean) />

		<cfreturn true>
	</cffunction>

<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->
	<cffunction name="getNewDisplayFileID" access="public" output="false" returntype="string" >
		<cfargument name="displayID" type="uuid" required="true" />
		<cfargument name="imageID" type="uuid" required="true" />
		<cfargument name="fileID" type="uuid" required="true" />
		<cfargument name="LargeImageRenderBean" type="any" required="false" />
		<cfargument name="MediumImageRenderBean" type="any" required="false" />
		<cfargument name="SmallImageRenderBean" type="any" required="false" />
		<cfargument name="isExternal" type="boolean" required="false" default="0" />
		<cfargument name="contentID" type="uuid" required="false" />
		<cfargument name="isMuraGallery" type="boolean" required="false" default="0" />

		<cfreturn variables.ImageGateway.getNewDisplayFileID(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getImagesInDisplay" access="public" output="false" returntype="Array" >
		<cfargument name="DisplayBean" type="any" required="true" />
		<cfargument name="ImageGroupBean" type="any" required="true" />
		<cfargument name="LargeImageRenderBean" type="any" required="false" />
		<cfargument name="MediumImageRenderBean" type="any" required="false" />
		<cfargument name="SmallImageRenderBean" type="any" required="false" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="50"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isCount" type="numeric" required="false" default="false" />
		<cfargument name="orderby" type="string" required="false" default="caption" />

		<cfreturn variables.ImageGateway.getImagesInDisplay(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="setDisplayImageService" access="public" returntype="void" output="false">
		<cfargument name="DisplayImageService" type="any" required="true" />
		<cfset variables.instance.DisplayImageService = arguments.DisplayImageService />
	</cffunction>
	<cffunction name="getDisplayImageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.DisplayImageService />
	</cffunction>

	<cffunction name="setImagegroupimageService" access="public" returntype="void" output="false">
		<cfargument name="ImagegroupimageService" type="any" required="true" />
		<cfset variables.instance.ImagegroupimageService = arguments.ImagegroupimageService />
	</cffunction>
	<cffunction name="getImagegroupimageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.ImagegroupimageService />
	</cffunction>

	<cffunction name="setmmFileUpload" access="public" returntype="void" output="false">
		<cfargument name="mmFileUpload" type="any" required="true" />
		<cfset variables.instance.mmFileUpload = arguments.mmFileUpload />
	</cffunction>
	<cffunction name="getmmFileUpload" access="public" returntype="any" output="false">
		<cfreturn variables.instance.mmFileUpload />
	</cffunction>

	<cffunction name="cleanImages" access="public" output="false" returntype="void">
		<cfargument name="fileID" type="uuid" required="true" />
		<cfargument name="siteID" type="string" required="true" />

		<cfreturn variables.ImageGateway.cleanImages(argumentCollection=arguments) />
	</cffunction>
<!---^^CUSTOMEND^^--->
</cfcomponent>




