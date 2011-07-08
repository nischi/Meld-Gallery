<!---^^LICENSE-START^^--->
<!---
||MELDGALLERYLICENSE||
--->
<!---^^LICENSE-END^^--->




<cfcomponent displayname="DisplayimageBean" output="false" extends="MeldGallery.com.meldsolutions.core.MeldBean">
<!---^^GENERATEDSTART^^--->
	<!---^^PROPERTIES-START^^--->
	<cfproperty name="DisplayImageID" type="uuid" default="" required="true" maxlength="35" />
	<cfproperty name="DisplayID" type="uuid" default="" required="true" maxlength="35" />
	<cfproperty name="ImageID" type="uuid" default="" maxlength="35" />
	<cfproperty name="IsProcessed" type="boolean" default="0" required="true" />
	<cfproperty name="IsValid" type="boolean" default="0" required="true" />
	<cfproperty name="FileID" type="uuid" default="" maxlength="35" />
	<cfproperty name="Attempts" type="boolean" default="0" required="true" />
	<cfproperty name="ProcessDate" type="date" default="" />
	<cfproperty name="IsProcessingID" type="uuid" default="" maxlength="35" />
	<cfproperty name="DateCreate" type="date" default="" required="true" />
	<cfproperty name="DateLastUpdate" type="date" default="" required="true" />
	<cfproperty name="IsExternal" type="boolean" default="0" required="true" />
	<cfproperty name="LinkURL" type="string" default="" maxlength="150" />
	<cfproperty name="IsMuraGallery" type="boolean" default="0" required="true" />
	<!---^^PROPERTIES-END^^--->

	<cfset variables.instance = StructNew() />

	<!--- INIT --->
	<cffunction name="init" access="public" returntype="DisplayimageBean" output="false">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="DisplayImageID" type="uuid" required="false" default="#CreateUUID()#" />
		<cfargument name="DisplayID" type="string" required="false" default="" />
		<cfargument name="ImageID" type="string" required="false" default="" />
		<cfargument name="IsProcessed" type="boolean" required="false" default="0" />
		<cfargument name="IsValid" type="boolean" required="false" default="0" />
		<cfargument name="FileID" type="string" required="false" default="" />
		<cfargument name="Attempts" type="boolean" required="false" default="0" />
		<cfargument name="ProcessDate" type="string" required="false" default="" />
		<cfargument name="IsProcessingID" type="string" required="false" default="" />
		<cfargument name="DateCreate" type="string" required="false" default="" />
		<cfargument name="DateLastUpdate" type="string" required="false" default="" />
		<cfargument name="IsExternal" type="boolean" required="false" default="0" />
		<cfargument name="LinkURL" type="string" required="false" default="" />
		<cfargument name="IsMuraGallery" type="boolean" required="false" default="0" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="BeanExists" type="boolean" required="false" default="false" />

		<!---^^SETTERS-START^^--->
		<cfset setDisplayImageID( arguments.DisplayImageID ) />
		<cfset setDisplayID( arguments.DisplayID ) />
		<cfset setImageID( arguments.ImageID ) />
		<cfset setIsProcessed( arguments.IsProcessed ) />
		<cfset setIsValid( arguments.IsValid ) />
		<cfset setFileID( arguments.FileID ) />
		<cfset setAttempts( arguments.Attempts ) />
		<cfset setProcessDate( arguments.ProcessDate ) />
		<cfset setIsProcessingID( arguments.IsProcessingID ) />
		<cfset setDateCreate( arguments.DateCreate ) />
		<cfset setDateLastUpdate( arguments.DateLastUpdate ) />
		<cfset setIsExternal( arguments.IsExternal ) />
		<cfset setLinkURL( arguments.LinkURL ) />
		<cfset setIsMuraGallery( arguments.IsMuraGallery ) />
		<!---^^SETTERS-END^^--->
		<cfset setBeanExists( arguments.BeanExists ) />
		
		<cfreturn this />
	</cffunction>

	<cffunction name="setMemento" access="public" returntype="DisplayimageBean" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
	
	<!---^^ACCESSORS-START^^--->
	<cffunction name="setDisplayImageID" access="public" returntype="void" output="false">
		<cfargument name="DisplayImageID" type="uuid" required="true" />
		<cfset variables.instance['displayimageid'] = arguments.DisplayImageID />
	</cffunction>
	<cffunction name="getDisplayImageID" access="public" returntype="uuid" output="false">
		<cfreturn variables.instance.DisplayImageID />
	</cffunction>
	
	<cffunction name="setDisplayID" access="public" returntype="void" output="false">
		<cfargument name="DisplayID" type="string" required="true" />
		<cfset variables.instance['displayid'] = arguments.DisplayID />
	</cffunction>
	<cffunction name="getDisplayID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DisplayID />
	</cffunction>
	
	<cffunction name="setImageID" access="public" returntype="void" output="false">
		<cfargument name="ImageID" type="string" required="true" />
		<cfset variables.instance['imageid'] = arguments.ImageID />
	</cffunction>
	<cffunction name="getImageID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageID />
	</cffunction>
	
	<cffunction name="setIsProcessed" access="public" returntype="void" output="false">
		<cfargument name="IsProcessed" type="boolean" required="true" />
		<cfset variables.instance['isprocessed'] = arguments.IsProcessed />
	</cffunction>
	<cffunction name="getIsProcessed" access="public" returntype="boolean" output="false">
		<cfreturn variables.instance.IsProcessed />
	</cffunction>
	
	<cffunction name="setIsValid" access="public" returntype="void" output="false">
		<cfargument name="IsValid" type="boolean" required="true" />
		<cfset variables.instance['isvalid'] = arguments.IsValid />
	</cffunction>
	<cffunction name="getIsValid" access="public" returntype="boolean" output="false">
		<cfreturn variables.instance.IsValid />
	</cffunction>
	
	<cffunction name="setFileID" access="public" returntype="void" output="false">
		<cfargument name="FileID" type="string" required="true" />
		<cfset variables.instance['fileid'] = arguments.FileID />
	</cffunction>
	<cffunction name="getFileID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FileID />
	</cffunction>
	
	<cffunction name="setAttempts" access="public" returntype="void" output="false">
		<cfargument name="Attempts" type="boolean" required="true" />
		<cfset variables.instance['attempts'] = arguments.Attempts />
	</cffunction>
	<cffunction name="getAttempts" access="public" returntype="boolean" output="false">
		<cfreturn variables.instance.Attempts />
	</cffunction>
	
	<cffunction name="setProcessDate" access="public" returntype="void" output="false">
		<cfargument name="ProcessDate" type="string" required="true" />
		<cfset variables.instance['processdate'] = arguments.ProcessDate />
	</cffunction>
	<cffunction name="getProcessDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ProcessDate />
	</cffunction>
	
	<cffunction name="setIsProcessingID" access="public" returntype="void" output="false">
		<cfargument name="IsProcessingID" type="string" required="true" />
		<cfset variables.instance['isprocessingid'] = arguments.IsProcessingID />
	</cffunction>
	<cffunction name="getIsProcessingID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.IsProcessingID />
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
	
	<cffunction name="setIsExternal" access="public" returntype="void" output="false">
		<cfargument name="IsExternal" type="boolean" required="true" />
		<cfset variables.instance['isexternal'] = arguments.IsExternal />
	</cffunction>
	<cffunction name="getIsExternal" access="public" returntype="boolean" output="false">
		<cfreturn variables.instance.IsExternal />
	</cffunction>
	
	<cffunction name="setLinkURL" access="public" returntype="void" output="false">
		<cfargument name="LinkURL" type="string" required="true" />
		<cfset variables.instance['linkurl'] = arguments.LinkURL />
	</cffunction>
	<cffunction name="getLinkURL" access="public" returntype="string" output="false">
		<cfreturn variables.instance.LinkURL />
	</cffunction>
	
	<cffunction name="setIsMuraGallery" access="public" returntype="void" output="false">
		<cfargument name="IsMuraGallery" type="boolean" required="true" />
		<cfset variables.instance['ismuragallery'] = arguments.IsMuraGallery />
	</cffunction>
	<cffunction name="getIsMuraGallery" access="public" returntype="boolean" output="false">
		<cfreturn variables.instance.IsMuraGallery />
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





