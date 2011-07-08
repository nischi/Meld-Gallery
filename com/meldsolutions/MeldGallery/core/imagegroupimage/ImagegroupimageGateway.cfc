<!---^^LICENSE-START^^--->
	<!---
||MELDGALLERYLICENSE||
--->
<!---^^LICENSE-END^^--->
<cfcomponent displayname="ImagegroupimageGateway" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="ImagegroupimageGateway">
		<cfargument name="dsn" type="string" required="true">
		<cfargument name="dsnusername" type="string" required="true">
		<cfargument name="dsnpassword" type="string" required="true">
		<cfargument name="dsnprefix" type="string" required="true">
		<cfargument name="dsntype" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfset variables.dsnusername = arguments.dsnusername>
		<cfset variables.dsnpassword = arguments.dsnpassword>
		<cfset variables.dsnprefix = arguments.dsnprefix>
		<cfset variables.dsntype = arguments.dsntype>
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="ImageID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ImageClass" type="string" required="false" />
		<cfargument name="TextClass" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*,'true' AS BeanExists
			FROM	#variables.dsnprefix#mg_imagegroupimage
			WHERE	0=0
		<!---^^VALUES-START^^--->
			<cfif structKeyExists(arguments,"ImageGroupID") and len(arguments.ImageGroupID)>
				AND ImageGroupID = <cfqueryparam value="#arguments.ImageGroupID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageID") and len(arguments.ImageID)>
				AND ImageID = <cfqueryparam value="#arguments.ImageID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Caption") and len(arguments.Caption)>
				AND Caption = <cfqueryparam value="#arguments.Caption#" CFSQLType="cf_sql_varchar" maxlength="255" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
				AND Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_longvarchar" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageClass") and len(arguments.ImageClass)>
				AND ImageClass = <cfqueryparam value="#arguments.ImageClass#" CFSQLType="cf_sql_varchar" maxlength="25" />
			</cfif>
			
			<cfif structKeyExists(arguments,"TextClass") and len(arguments.TextClass)>
				AND TextClass = <cfqueryparam value="#arguments.TextClass#" CFSQLType="cf_sql_varchar" maxlength="25" />
			</cfif>
			<!---^^VALUES-END^^--->
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #rereplace(arguments.orderby,";.*","")#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="ImageID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ImageClass" type="string" required="false" />
		<cfargument name="TextClass" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","ImageGroupImageBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
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
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		

		<cfif qList.recordCount>
			<cfreturn createObject("component","ImageGroupImageBean").init(argumentCollection=queryRowToStruct(qList))>
		<cfelse>
			<cfreturn createObject("component","ImageGroupImageBean").init()>
		</cfif>
	</cffunction>

	
	<cffunction name="getByArray" access="public" output="false" returntype="Struct" >
		<cfargument name="idArray" type="array" required="true" />
		
		<cfset var qList			= "" />		
		<cfset var strObjects			= StructNew() />
		<cfset var tmpObj			= "" />
		<cfset var IDList			= "" />

		<cfif not arrayLen(arguments.idArray)>
			<cfreturn strObjects />
		</cfif>

		<cfset IDList = ArrayToList(arguments.idArray) />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*
			FROM
				#variables.dsnprefix#mg_imagegroupimage
			WHERE
			ImageGroupID IN (<cfqueryparam value="#IDList#" CFSQLType="cf_sql_char" list="true" />)
		</cfquery>
		
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","ImageGroupImageBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset strObjects[qList.ImageGroupID[i]] = tmpObj />
		</cfloop>
		
		<cfreturn strObjects />
	</cffunction>
	
	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[lcase(cols[ii])] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>
<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->

	<cffunction name="saveImageGroupImages" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupID" type="string" required="true" />
		<cfargument name="ImageIDArray" type="array" required="true" />

		<cfset var qDelete	= "" />
		<cfset var qCreate	= "" />
		<cfset var iiX		= "" />
		<cfset var ct		= ArrayLen(arguments.ImageIDArray) />

		<cftransaction>
			<cfquery name="qDelete" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
				DELETE FROM
					#variables.dsnprefix#mg_imagegroupimage
				WHERE
					imageGroupID = <cfqueryparam value="#arguments.ImageGroupID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfquery>
			
			<cfif ct>
				<cfquery name="qCreate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
					INSERT INTO
						#variables.dsnprefix#mg_imagegroupimage
						(
						ImageGroupID,
						ImageID,
						OrderNo
						)
					VALUES
					<cfloop from="1" to="#ct#" index="iiX">
						(
						<cfqueryparam value="#arguments.ImageGroupID#" CFSQLType="cf_sql_char" maxlength="35" />,
						<cfqueryparam value="#arguments.ImageIDArray[iiX]#" CFSQLType="cf_sql_char" maxlength="35" />,
						<cfqueryparam value="#iiX#" CFSQLType="cf_sql_integer" />
						)
						<cfif iiX lt ct>,</cfif>
					</cfloop>
				</cfquery>
			</cfif>
		
		</cftransaction>

		<cfreturn true />
	</cffunction>

	<cffunction name="getGroupImages" access="public" output="false" returntype="array">
		<cfargument name="ImageGroupID" type="string" required="true" />
		<cfargument name="fieldList" type="string" required="false" default="*" />
		<cfargument name="count" type="numeric" required="false" />

		<cfset var arrObjects		= ArrayNew(1)>
		<cfset var qList			= "" />
		<cfset var tmpObj			= "" />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
			<cfif structKeyExists(arguments,"count") AND variables.dsntype eq "mssql">
				TOP #Ceiling(Val(count))#
			</cfif>
				#arguments.fieldList#
			FROM
				#variables.dsnprefix#mg_imagegroupimage igi
			JOIN
				#variables.dsnprefix#mg_image i
			ON
				(igi.imageID = i.imageID)
			WHERE
				ImageGroupID = <cfqueryparam value="#arguments.ImageGroupID#" CFSQLType="cf_sql_char" maxlength="35" />
			AND
				i.isActive = 1
			ORDER BY
				orderNo
			<cfif structKeyExists(arguments,"count") AND variables.dsntype eq "mysql">
				LIMIT <cfqueryparam value="#arguments.count#" CFSQLType="cf_sql_integer" />
			</cfif>
		</cfquery>
		
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = queryRowToStruct(qList,i) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>

		<cfreturn arrObjects />
	</cffunction>

	<cffunction name="deleteByImageID" access="public" output="false" returntype="void">
		<cfargument name="ImageID" type="string" required="true" />

		<cfset var qDelete = "" />

		<cfquery name="qDelete" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			DELETE FROM
				#variables.dsnprefix#mg_imagegroupimage
			WHERE
				imageID = <cfqueryparam value="#arguments.imageID#" CFSQLType="cf_sql_char" maxlength="35" />
		</cfquery>

		<cfset getmmFileUpload().deleteFileByContentID( arguments.imageID ) />
	</cffunction>

	<cffunction name="getImagesInGroup" access="public" output="false" returntype="String">
		<cfargument name="ImageGroupID" type="string" required="true" />
		<cfargument name="count" type="numeric" required="false" />

		<cfset var qList = "" />
		<cfset var sList = "" />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
			<cfif structKeyExists(arguments,"count") AND variables.dsntype eq "mssql">
				TOP #Ceiling(Val(count))#
			</cfif>
				igi.imageID
			FROM
				#variables.dsnprefix#mg_imagegroupimage igi
			JOIN
				#variables.dsnprefix#mg_image i
			ON
				(igi.imageID = i.imageID)
			WHERE
				ImageGroupID = <cfqueryparam value="#arguments.ImageGroupID#" CFSQLType="cf_sql_char" maxlength="35" />
			AND
				i.isActive = 1
			ORDER BY
				orderNo
			<cfif structKeyExists(arguments,"count") AND variables.dsntype eq "mysql">
				LIMIT <cfqueryparam value="#arguments.count#" CFSQLType="cf_sql_integer" />
			</cfif>
		</cfquery>
		
		<cfset sList = valueList( qList.ImageID ) />
		<cfreturn sList />
	</cffunction>
<!---^^CUSTOMEND^^--->

	<cffunction name="setmmFileUpload" access="public" returntype="void" output="false">
		<cfargument name="mmFileUpload" type="any" required="true" />
		<cfset variables.instance.mmFileUpload = arguments.mmFileUpload />
	</cffunction>
	<cffunction name="getmmFileUpload" access="public" returntype="any" output="false">
		<cfreturn variables.instance.mmFileUpload />
	</cffunction>


</cfcomponent>	

