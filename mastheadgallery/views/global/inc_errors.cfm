<cfsilent>
	<cfset local.rc = rc />
</cfsilent>
<cfoutput>
	<cfif local.rc.errors.hasErrors(rc.$.event(),"notice")>
	<div class="notice">
		#local.rc.errors.displayErrorsHTML(rc.$.event(),"notice")#
	</div>
	</cfif>
	<cfif local.rc.errors.hasErrors(rc.$.event(),"custom")>
	<div class="error">
		#local.rc.errors.displayErrorsHTML(rc.$.event(),"custom")#
	</div>
	</cfif>
	<cfif local.rc.errors.hasErrors(rc.$.event(),"other")>
	<div class="error">
		#local.rc.errors.displayErrorsHTML(rc.$.event(),"other")#
	</div>
	</cfif>
</cfoutput>