<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<!--- headers --->
	<cfinclude template="headers/jquery-datatable-displaytype.cfm">
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-datatable.cfm">
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-ui.cfm">
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
	<div id="meld-actions" class="section clearfix">
		#view("displaytype/includes/default_actions")#
	</div>
	#view("displaytype/includes/default_list")#
</div>	
<!--- end content --->
</cfoutput> 