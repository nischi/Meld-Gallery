<!---^^LICENSE-START^^--->
	<!---
||MELDGALLERYLICENSE||
--->
<!---^^LICENSE-END^^--->
<cfcomponent name="ImagegroupimageService" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="ImagegroupimageService">
		<cfargument name="ImagegroupimageDAO" type="any" required="true" />
		<cfargument name="ImagegroupimageGateway" type="any" required="true" />

		<cfset variables.ImagegroupimageDAO = arguments.ImagegroupimageDAO />
		<cfset variables.ImagegroupimageGateway = arguments.ImagegroupimageGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="createImageGroupImage" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="ImageID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ImageClass" type="string" required="false" />
		<cfargument name="TextClass" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
				
		<cfset var ImageGroupImageBean = createObject("component","ImageGroupImageBean").init(argumentCollection=arguments) />
		<cfreturn ImageGroupImageBean />
	</cffunction>

	<cffunction name="getImageGroupImage" access="public" output="false" returntype="any">
		<!---^^PRIMARY-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var ImageGroupImageBean = createImageGroupImage(argumentCollection=arguments) />
		<cfset variables.ImagegroupimageDAO.read(ImageGroupImageBean) />
		<cfreturn ImageGroupImageBean />
	</cffunction>

	<cffunction name="getImageGroupImages" access="public" output="false" returntype="array">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="ImageID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ImageClass" type="string" required="false" />
		<cfargument name="TextClass" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfreturn variables.ImagegroupimageGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="ImageID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ImageClass" type="string" required="false" />
		<cfargument name="TextClass" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->

		<cfreturn variables.ImagegroupimageGateway.getBeanByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getByArray" access="public" output="false" returntype="Struct" >
		<cfargument name="idArray" type="array" required="true" />

		<cfreturn variables.ImagegroupimageGateway.getByArray(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveImageGroupImage" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupImageBean" type="any" required="true" />

		<cfreturn variables.ImagegroupimageDAO.save(ImageGroupImageBean) />
	</cffunction>
	
	<cffunction name="updateImageGroupImage" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupImageBean" type="any" required="true" />

		<cfreturn variables.ImagegroupimageDAO.update(ImageGroupImageBean) />
	</cffunction>

	<cffunction name="deleteImageGroupImage" access="public" output="false" returntype="boolean">
		<!---^^PRIMARY-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var ImageGroupImageBean = createImageGroupImage(argumentCollection=arguments) />
		<cfreturn variables.ImagegroupimageDAO.delete(ImageGroupImageBean) />
	</cffunction>
<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->

	<cffunction name="deleteByImageID" access="public" output="false" returntype="void">
		<cfargument name="ImageID" type="string" required="true" />

		<cfreturn variables.ImagegroupimageGateway.deleteByImageID(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveImageGroupImages" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupID" type="string" required="true" />
		<cfargument name="ImageIDArray" type="array" required="true" />

		<cfset success = variables.ImagegroupimageGateway.saveImageGroupImages(argumentCollection=arguments) />
		<cfset process = false />
		
		<cfif success>
			<cfset process = getDisplayImageService().cleanImageGroup( ImageGroupID ) />		
		</cfif>
		
		<cfif process>
			<!--- PROCESS IN BG --->
		</cfif>
		
		<cfreturn success>
	</cffunction>

	<cffunction name="getGroupImages" access="public" output="false" returntype="array">
		<cfargument name="ImageGroupID" type="string" required="true" />
		<cfargument name="fieldList" type="string" required="false" default="i.fileID,i.type,i.caption,i.tags,i.isActive,i.imageID" />
		<cfargument name="count" type="numeric" required="false" />

		<!--- do *not* pass this in from url/form! --->
		<cfif StructKeyExists(form,"fieldList") and form.fieldList eq arguments.fieldList>
			<cfset arguments.fieldList = "1234 AS imageGroupID" />
		<cfelseif StructKeyExists(url,"fieldList") and url.fieldList eq arguments.fieldList>
			<cfset arguments.fieldList = "1234 AS imageGroupID" />
		</cfif>

		<cfreturn variables.ImagegroupimageGateway.getGroupImages(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getImagesInGroup" access="public" output="false" returntype="String">
		<cfargument name="ImageGroupID" type="string" required="true" />
		<cfargument name="count" type="numeric" required="false" />

		<cfreturn variables.ImagegroupimageGateway.getImagesInGroup(argumentCollection=arguments) />
	</cffunction>
<!---^^CUSTOMEND^^--->


	<cffunction name="setDisplayImageService" access="public" returntype="void" output="false">
		<cfargument name="DisplayImageService" type="any" required="true" />
		<cfset variables.instance.DisplayImageService = arguments.DisplayImageService />
	</cffunction>
	<cffunction name="getDisplayImageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.DisplayImageService />
	</cffunction>

</cfcomponent>

