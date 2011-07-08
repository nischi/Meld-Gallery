<!---
||MELDMANAGERLICENSE||
--->
<cfcomponent displayname="filebean" output="false">
	<cfproperty name="fileID" type="uuid" default="" />
	<cfproperty name="contentID" type="string" default="" />
	<cfproperty name="contentSubType" type="string" default="" />
	<cfproperty name="contentType" type="string" default="" />
	<cfproperty name="fileExt" type="string" default="" />
	<cfproperty name="fileName" type="string" default="" />
	<cfproperty name="fileSize" type="string" default="" />
	<cfproperty name="moduleID" type="string" default="" />
	<cfproperty name="siteID" type="string" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->

	<cffunction name="init" access="public" returntype="filebean" output="false">
		<cfargument name="fileID" type="uuid" required="false" default="#createUUID()#" />
		<cfargument name="contentID" type="string" required="false" default="" />
		<cfargument name="contentSubType" type="string" required="false" default="" />
		<cfargument name="contentType" type="string" required="false" default="" />
		<cfargument name="fileExt" type="string" required="false" default="" />
		<cfargument name="fileName" type="string" required="false" default="1" />
		<cfargument name="fileSize" type="string" required="false" default="0" />
		<cfargument name="moduleID" type="string" required="false" default="0" />
		<cfargument name="siteID" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setfileID(arguments.fileID) />
		<cfset setcontentID(arguments.contentID) />
		<cfset setcontentSubType(arguments.ContentSubType) />
		<cfset setcontentType(arguments.contentType) />
		<cfset setfileExt(arguments.fileExt) />
		<cfset setfileName(arguments.fileName) />
		<cfset setfileSize(arguments.fileSize) />
		<cfset setmoduleID(arguments.moduleID) />
		<cfset setsiteID(arguments.siteID) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="post" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setcontentID" access="public" returntype="void" output="false">
		<cfargument name="contentID" type="uuid" required="true" />
		<cfset variables.instance.contentID = arguments.contentID />
	</cffunction>
	<cffunction name="getcontentID" access="public" returntype="uuid" output="false">
		<cfreturn variables.instance.contentID />
	</cffunction>
	<cffunction name="getpostID" access="public" returntype="uuid" output="false">
		<cfreturn variables.instance.contentID />
	</cffunction>

	<cffunction name="setfileID" access="public" returntype="void" output="false">
		<cfargument name="fileID" type="string" required="true" />
		<cfset variables.instance.fileID = arguments.fileID />
	</cffunction>
	<cffunction name="getfileID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.fileID />
	</cffunction>
	<cffunction name="getattachmentID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.fileID />
	</cffunction>

	<cffunction name="settitle" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfset variables.instance.title = arguments.title />
	</cffunction>
	<cffunction name="gettitle" access="public" returntype="string" output="false">
		<cfreturn variables.instance.title />
	</cffunction>

	<cffunction name="setContentSubType" access="public" returntype="void" output="false">
		<cfargument name="ContentSubType" type="string" required="true" />
		<cfset variables.instance.ContentSubType = arguments.ContentSubType />
	</cffunction>
	<cffunction name="getContentSubType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ContentSubType />
	</cffunction>

	<cffunction name="setcontentType" access="public" returntype="void" output="false">
		<cfargument name="contentType" type="string" required="true" />
		<cfset variables.instance.contentType = arguments.contentType />
	</cffunction>
	<cffunction name="getcontentType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.contentType />
	</cffunction>

	<cffunction name="setfileExt" access="public" returntype="void" output="false">
		<cfargument name="fileExt" type="string" required="true" />
		<cfset variables.instance.fileExt = arguments.fileExt />
	</cffunction>
	<cffunction name="getfileExt" access="public" returntype="string" output="false">
		<cfreturn variables.instance.fileExt />
	</cffunction>

	<cffunction name="setfileName" access="public" returntype="void" output="false">
		<cfargument name="fileName" type="string" required="true" />
		<cfset variables.instance.fileName = arguments.fileName />
	</cffunction>
	<cffunction name="getfileName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.fileName />
	</cffunction>

	<cffunction name="setdateCreate" access="public" returntype="void" output="false">
		<cfargument name="dateCreate" type="string" required="true" />
		<cfset variables.instance.dateCreate = arguments.dateCreate />
	</cffunction>
	<cffunction name="getdateCreate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dateCreate />
	</cffunction>

	<cffunction name="setdateLastUpdate" access="public" returntype="void" output="false">
		<cfargument name="dateLastUpdate" type="string" required="true" />
		<cfset variables.instance.dateLastUpdate = arguments.dateLastUpdate />
	</cffunction>
	<cffunction name="getdateLastUpdate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dateLastUpdate />
	</cffunction>

	<cffunction name="setdateModerated" access="public" returntype="void" output="false">
		<cfargument name="dateModerated" type="string" required="true" />
		<cfset variables.instance.dateModerated = arguments.dateModerated />
	</cffunction>
	<cffunction name="getdateModerated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dateModerated />
	</cffunction>

	<cffunction name="setfileSize" access="public" returntype="void" output="false">
		<cfargument name="fileSize" type="string" required="true" />
		<cfset variables.instance.fileSize = arguments.fileSize />
	</cffunction>
	<cffunction name="getfileSize" access="public" returntype="string" output="false">
		<cfreturn variables.instance.fileSize />
	</cffunction>

	<cffunction name="setmoduleID" access="public" returntype="void" output="false">
		<cfargument name="moduleID" type="string" required="true" />
		<cfset variables.instance.moduleID = arguments.moduleID />
	</cffunction>
	<cffunction name="getmoduleID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.moduleID />
	</cffunction>

	<cffunction name="setsiteID" access="public" returntype="void" output="false">
		<cfargument name="siteID" type="string" required="true" />
		<cfset variables.instance.siteID = arguments.siteID />
	</cffunction>
	<cffunction name="getsiteID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.siteID />
	</cffunction>

	<!---
	DUMP
	--->
	<cffunction name="dump" access="public" output="true" return="void">
		<cfargument name="abort" type="boolean" default="false" />
		<cfdump var="#variables.instance#" />
		<cfif arguments.abort>
			<cfabort />
		</cfif>
	</cffunction>

</cfcomponent>
