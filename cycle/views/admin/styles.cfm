<cfsilent>
	<cfdirectory action="list" directory="#expandpath("/" & rc.pluginConfig.getPackage())#/#rc.DisplayTypeBean.getPackage()#/views/main/" name="local.dir" filter="*.cfm">
</cfsilent>
<cfoutput query="local.dir">
	<cfset local.name = lcase(rereplacenocase(local.dir.name,"\..*",""))>
	<cfif local.name neq "default" and local.name neq "null">
		<option value="#local.name#"<cfif local.name eq form.params_style> SELECTED</cfif>>#local.rc.mmRBFLocal.key(local.name)#</<option>
	</cfif>
</cfoutput>