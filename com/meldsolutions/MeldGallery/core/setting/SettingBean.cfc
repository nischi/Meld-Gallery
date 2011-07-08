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


<cfcomponent displayname="SettingBean" output="false" extends="MeldGallery.com.meldsolutions.core.MeldBean">
<!---^^GENERATEDSTART^^--->
	<!---^^PROPERTIES-START^^--->
	<cfproperty name="SettingsID" type="uuid" default="" required="true" maxlength="35" />
	<cfproperty name="SiteID" type="string" default="" required="true" maxlength="25" />
	<cfproperty name="DateCreate" type="date" default="" required="true" />
	<cfproperty name="DateLastUpdate" type="date" default="" required="true" />
	<cfproperty name="IsMaster" type="boolean" default="0" required="true" />
	<cfproperty name="ImageWidth" type="numeric" default="1000" required="true" />
	<cfproperty name="ImageHeight" type="numeric" default="750" required="true" />
	<cfproperty name="ImageWidthMedium" type="numeric" default="250" required="true" />
	<cfproperty name="ImageHeightMedium" type="numeric" default="250" required="true" />
	<cfproperty name="ImageWidthSmall" type="numeric" default="40" required="true" />
	<cfproperty name="ImageHeightSmall" type="numeric" default="40" required="true" />
	<cfproperty name="ImageResizeType" type="string" default="Resize" required="true" maxlength="45" />
	<cfproperty name="ImageAspectType" type="string" default="AspectX" required="true" maxlength="45" />
	<cfproperty name="ImageQualityType" type="string" default="highestQuality" required="true" maxlength="45" />
	<cfproperty name="ImageResizeTypeMedium" type="string" default="CropResize" required="true" maxlength="45" />
	<cfproperty name="ImageAspectTypeMedium" type="string" default="Square" required="true" maxlength="45" />
	<cfproperty name="ImageQualityTypeMedium" type="string" default="mediumQuality" required="true" maxlength="45" />
	<cfproperty name="ImageResizeTypeSmall" type="string" default="CropResize" required="true" maxlength="45" />
	<cfproperty name="ImageAspectTypeSmall" type="string" default="Square" required="true" maxlength="45" />
	<cfproperty name="ImageQualityTypeSmall" type="string" default="mediumQuality" required="true" maxlength="45" />
	<cfproperty name="ImageCropType" type="string" default="BestXY" required="true" maxlength="45" />
	<cfproperty name="ImageCropTypeMedium" type="string" default="BestXY" required="true" maxlength="45" />
	<cfproperty name="ImageCropTypeSmall" type="string" default="BestXY" required="true" maxlength="45" />
	<cfproperty name="DefaultDisplayTypeID" type="uuid" default="" maxlength="35" />
	<cfproperty name="FileSizeLimit" type="numeric" default="1500" required="true" />
	<cfproperty name="SyncInfo" type="boolean" default="1" required="true" />
	<!---^^PROPERTIES-END^^--->

	<cfset variables.instance = StructNew() />

	<!--- INIT --->
	<cffunction name="init" access="public" returntype="SettingBean" output="false">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="SettingsID" type="uuid" required="false" default="#CreateUUID()#" />
		<cfargument name="SiteID" type="string" required="false" default="" />
		<cfargument name="DateCreate" type="string" required="false" default="" />
		<cfargument name="DateLastUpdate" type="string" required="false" default="" />
		<cfargument name="IsMaster" type="boolean" required="false" default="0" />
		<cfargument name="ImageWidth" type="numeric" required="false" default="1000" />
		<cfargument name="ImageHeight" type="numeric" required="false" default="750" />
		<cfargument name="ImageWidthMedium" type="numeric" required="false" default="250" />
		<cfargument name="ImageHeightMedium" type="numeric" required="false" default="250" />
		<cfargument name="ImageWidthSmall" type="numeric" required="false" default="40" />
		<cfargument name="ImageHeightSmall" type="numeric" required="false" default="40" />
		<cfargument name="ImageResizeType" type="string" required="false" default="Resize" />
		<cfargument name="ImageAspectType" type="string" required="false" default="AspectX" />
		<cfargument name="ImageQualityType" type="string" required="false" default="highestQuality" />
		<cfargument name="ImageResizeTypeMedium" type="string" required="false" default="CropResize" />
		<cfargument name="ImageAspectTypeMedium" type="string" required="false" default="Square" />
		<cfargument name="ImageQualityTypeMedium" type="string" required="false" default="mediumQuality" />
		<cfargument name="ImageResizeTypeSmall" type="string" required="false" default="CropResize" />
		<cfargument name="ImageAspectTypeSmall" type="string" required="false" default="Square" />
		<cfargument name="ImageQualityTypeSmall" type="string" required="false" default="mediumQuality" />
		<cfargument name="ImageCropType" type="string" required="false" default="BestXY" />
		<cfargument name="ImageCropTypeMedium" type="string" required="false" default="BestXY" />
		<cfargument name="ImageCropTypeSmall" type="string" required="false" default="BestXY" />
		<cfargument name="DefaultDisplayTypeID" type="string" required="false" default="" />
		<cfargument name="FileSizeLimit" type="numeric" required="false" default="1500" />
		<cfargument name="SyncInfo" type="boolean" required="false" default="1" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="BeanExists" type="boolean" required="false" default="false" />

		<!---^^SETTERS-START^^--->
		<cfset setSettingsID( arguments.SettingsID ) />
		<cfset setSiteID( arguments.SiteID ) />
		<cfset setDateCreate( arguments.DateCreate ) />
		<cfset setDateLastUpdate( arguments.DateLastUpdate ) />
		<cfset setIsMaster( arguments.IsMaster ) />
		<cfset setImageWidth( arguments.ImageWidth ) />
		<cfset setImageHeight( arguments.ImageHeight ) />
		<cfset setImageWidthMedium( arguments.ImageWidthMedium ) />
		<cfset setImageHeightMedium( arguments.ImageHeightMedium ) />
		<cfset setImageWidthSmall( arguments.ImageWidthSmall ) />
		<cfset setImageHeightSmall( arguments.ImageHeightSmall ) />
		<cfset setImageResizeType( arguments.ImageResizeType ) />
		<cfset setImageAspectType( arguments.ImageAspectType ) />
		<cfset setImageQualityType( arguments.ImageQualityType ) />
		<cfset setImageResizeTypeMedium( arguments.ImageResizeTypeMedium ) />
		<cfset setImageAspectTypeMedium( arguments.ImageAspectTypeMedium ) />
		<cfset setImageQualityTypeMedium( arguments.ImageQualityTypeMedium ) />
		<cfset setImageResizeTypeSmall( arguments.ImageResizeTypeSmall ) />
		<cfset setImageAspectTypeSmall( arguments.ImageAspectTypeSmall ) />
		<cfset setImageQualityTypeSmall( arguments.ImageQualityTypeSmall ) />
		<cfset setImageCropType( arguments.ImageCropType ) />
		<cfset setImageCropTypeMedium( arguments.ImageCropTypeMedium ) />
		<cfset setImageCropTypeSmall( arguments.ImageCropTypeSmall ) />
		<cfset setDefaultDisplayTypeID( arguments.DefaultDisplayTypeID ) />
		<cfset setFileSizeLimit( arguments.FileSizeLimit ) />
		<cfset setSyncInfo( arguments.SyncInfo ) />
		<!---^^SETTERS-END^^--->
		<cfset setBeanExists( arguments.BeanExists ) />
		
		<cfreturn this />
	</cffunction>

	<cffunction name="setMemento" access="public" returntype="SettingBean" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
	
	<!---^^ACCESSORS-START^^--->
	<cffunction name="setSettingsID" access="public" returntype="void" output="false">
		<cfargument name="SettingsID" type="uuid" required="true" />
		<cfset variables.instance['settingsid'] = arguments.SettingsID />
	</cffunction>
	<cffunction name="getSettingsID" access="public" returntype="uuid" output="false">
		<cfreturn variables.instance.SettingsID />
	</cffunction>
	
	<cffunction name="setSiteID" access="public" returntype="void" output="false">
		<cfargument name="SiteID" type="string" required="true" />
		<cfset variables.instance['siteid'] = arguments.SiteID />
	</cffunction>
	<cffunction name="getSiteID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SiteID />
	</cffunction>
	
	<cffunction name="setDateCreate" access="public" returntype="void" output="false">
		<cfargument name="DateCreate" type="string" required="true" />
		<cfset variables.instance['datecreate'] = arguments.DateCreate />
	</cffunction>
	<cffunction name="getDateCreate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DateCreate />
	</cffunction>
	
	<cffunction name="setDateLastUpdate" access="public" returntype="void" output="false">
		<cfargument name="DateLastUpdate" type="string" required="true" />
		<cfset variables.instance['datelastupdate'] = arguments.DateLastUpdate />
	</cffunction>
	<cffunction name="getDateLastUpdate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DateLastUpdate />
	</cffunction>
	
	<cffunction name="setIsMaster" access="public" returntype="void" output="false">
		<cfargument name="IsMaster" type="boolean" required="true" />
		<cfset variables.instance['ismaster'] = arguments.IsMaster />
	</cffunction>
	<cffunction name="getIsMaster" access="public" returntype="boolean" output="false">
		<cfreturn variables.instance.IsMaster />
	</cffunction>
	
	<cffunction name="setImageWidth" access="public" returntype="void" output="false">
		<cfargument name="ImageWidth" type="numeric" required="true" />
		<cfset variables.instance['imagewidth'] = arguments.ImageWidth />
	</cffunction>
	<cffunction name="getImageWidth" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.ImageWidth />
	</cffunction>
	
	<cffunction name="setImageHeight" access="public" returntype="void" output="false">
		<cfargument name="ImageHeight" type="numeric" required="true" />
		<cfset variables.instance['imageheight'] = arguments.ImageHeight />
	</cffunction>
	<cffunction name="getImageHeight" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.ImageHeight />
	</cffunction>
	
	<cffunction name="setImageWidthMedium" access="public" returntype="void" output="false">
		<cfargument name="ImageWidthMedium" type="numeric" required="true" />
		<cfset variables.instance['imagewidthmedium'] = arguments.ImageWidthMedium />
	</cffunction>
	<cffunction name="getImageWidthMedium" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.ImageWidthMedium />
	</cffunction>
	
	<cffunction name="setImageHeightMedium" access="public" returntype="void" output="false">
		<cfargument name="ImageHeightMedium" type="numeric" required="true" />
		<cfset variables.instance['imageheightmedium'] = arguments.ImageHeightMedium />
	</cffunction>
	<cffunction name="getImageHeightMedium" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.ImageHeightMedium />
	</cffunction>
	
	<cffunction name="setImageWidthSmall" access="public" returntype="void" output="false">
		<cfargument name="ImageWidthSmall" type="numeric" required="true" />
		<cfset variables.instance['imagewidthsmall'] = arguments.ImageWidthSmall />
	</cffunction>
	<cffunction name="getImageWidthSmall" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.ImageWidthSmall />
	</cffunction>
	
	<cffunction name="setImageHeightSmall" access="public" returntype="void" output="false">
		<cfargument name="ImageHeightSmall" type="numeric" required="true" />
		<cfset variables.instance['imageheightsmall'] = arguments.ImageHeightSmall />
	</cffunction>
	<cffunction name="getImageHeightSmall" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.ImageHeightSmall />
	</cffunction>
	
	<cffunction name="setImageResizeType" access="public" returntype="void" output="false">
		<cfargument name="ImageResizeType" type="string" required="true" />
		<cfset variables.instance['imageresizetype'] = arguments.ImageResizeType />
	</cffunction>
	<cffunction name="getImageResizeType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageResizeType />
	</cffunction>
	
	<cffunction name="setImageAspectType" access="public" returntype="void" output="false">
		<cfargument name="ImageAspectType" type="string" required="true" />
		<cfset variables.instance['imageaspecttype'] = arguments.ImageAspectType />
	</cffunction>
	<cffunction name="getImageAspectType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageAspectType />
	</cffunction>
	
	<cffunction name="setImageQualityType" access="public" returntype="void" output="false">
		<cfargument name="ImageQualityType" type="string" required="true" />
		<cfset variables.instance['imagequalitytype'] = arguments.ImageQualityType />
	</cffunction>
	<cffunction name="getImageQualityType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageQualityType />
	</cffunction>
	
	<cffunction name="setImageResizeTypeMedium" access="public" returntype="void" output="false">
		<cfargument name="ImageResizeTypeMedium" type="string" required="true" />
		<cfset variables.instance['imageresizetypemedium'] = arguments.ImageResizeTypeMedium />
	</cffunction>
	<cffunction name="getImageResizeTypeMedium" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageResizeTypeMedium />
	</cffunction>
	
	<cffunction name="setImageAspectTypeMedium" access="public" returntype="void" output="false">
		<cfargument name="ImageAspectTypeMedium" type="string" required="true" />
		<cfset variables.instance['imageaspecttypemedium'] = arguments.ImageAspectTypeMedium />
	</cffunction>
	<cffunction name="getImageAspectTypeMedium" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageAspectTypeMedium />
	</cffunction>
	
	<cffunction name="setImageQualityTypeMedium" access="public" returntype="void" output="false">
		<cfargument name="ImageQualityTypeMedium" type="string" required="true" />
		<cfset variables.instance['imagequalitytypemedium'] = arguments.ImageQualityTypeMedium />
	</cffunction>
	<cffunction name="getImageQualityTypeMedium" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageQualityTypeMedium />
	</cffunction>
	
	<cffunction name="setImageResizeTypeSmall" access="public" returntype="void" output="false">
		<cfargument name="ImageResizeTypeSmall" type="string" required="true" />
		<cfset variables.instance['imageresizetypesmall'] = arguments.ImageResizeTypeSmall />
	</cffunction>
	<cffunction name="getImageResizeTypeSmall" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageResizeTypeSmall />
	</cffunction>
	
	<cffunction name="setImageAspectTypeSmall" access="public" returntype="void" output="false">
		<cfargument name="ImageAspectTypeSmall" type="string" required="true" />
		<cfset variables.instance['imageaspecttypesmall'] = arguments.ImageAspectTypeSmall />
	</cffunction>
	<cffunction name="getImageAspectTypeSmall" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageAspectTypeSmall />
	</cffunction>
	
	<cffunction name="setImageQualityTypeSmall" access="public" returntype="void" output="false">
		<cfargument name="ImageQualityTypeSmall" type="string" required="true" />
		<cfset variables.instance['imagequalitytypesmall'] = arguments.ImageQualityTypeSmall />
	</cffunction>
	<cffunction name="getImageQualityTypeSmall" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageQualityTypeSmall />
	</cffunction>
	
	<cffunction name="setImageCropType" access="public" returntype="void" output="false">
		<cfargument name="ImageCropType" type="string" required="true" />
		<cfset variables.instance['imagecroptype'] = arguments.ImageCropType />
	</cffunction>
	<cffunction name="getImageCropType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageCropType />
	</cffunction>
	
	<cffunction name="setImageCropTypeMedium" access="public" returntype="void" output="false">
		<cfargument name="ImageCropTypeMedium" type="string" required="true" />
		<cfset variables.instance['imagecroptypemedium'] = arguments.ImageCropTypeMedium />
	</cffunction>
	<cffunction name="getImageCropTypeMedium" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageCropTypeMedium />
	</cffunction>
	
	<cffunction name="setImageCropTypeSmall" access="public" returntype="void" output="false">
		<cfargument name="ImageCropTypeSmall" type="string" required="true" />
		<cfset variables.instance['imagecroptypesmall'] = arguments.ImageCropTypeSmall />
	</cffunction>
	<cffunction name="getImageCropTypeSmall" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageCropTypeSmall />
	</cffunction>
	
	<cffunction name="setDefaultDisplayTypeID" access="public" returntype="void" output="false">
		<cfargument name="DefaultDisplayTypeID" type="string" required="true" />
		<cfset variables.instance['defaultdisplaytypeid'] = arguments.DefaultDisplayTypeID />
	</cffunction>
	<cffunction name="getDefaultDisplayTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DefaultDisplayTypeID />
	</cffunction>
	
	<cffunction name="setFileSizeLimit" access="public" returntype="void" output="false">
		<cfargument name="FileSizeLimit" type="numeric" required="true" />
		<cfset variables.instance['filesizelimit'] = arguments.FileSizeLimit />
	</cffunction>
	<cffunction name="getFileSizeLimit" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.FileSizeLimit />
	</cffunction>
	
	<cffunction name="setSyncInfo" access="public" returntype="void" output="false">
		<cfargument name="SyncInfo" type="boolean" required="true" />
		<cfset variables.instance['syncinfo'] = arguments.SyncInfo />
	</cffunction>
	<cffunction name="getSyncInfo" access="public" returntype="boolean" output="false">
		<cfreturn variables.instance.SyncInfo />
	</cffunction>
	<!---^^ACCESSORS-END^^--->

	<!--- BeanExists --->
	<cffunction name="setBeanExists" access="public" output="false" returntype="void">
		<cfargument name="BeanExists" type="boolean" required="true" />
		<cfset variables.BeanExists = arguments.BeanExists >
	</cffunction>
	<cffunction name="BeanExists" access="public" output="false" returntype="boolean">
		<cfreturn variables.BeanExists>
	</cffunction>

	<!--- DUMP --->
	<cffunction name="dump" access="public" output="true" return="void">
		<cfargument name="abort" type="boolean" default="false" />
		<cfdump var="#variables.instance#" />
		<cfif arguments.abort>
			<cfabort />
		</cfif>
	</cffunction>
<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->
<!---^^CUSTOMEND^^--->
</cfcomponent>	



