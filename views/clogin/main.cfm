<cfsilent>
<!--- temporary fix for Mura Admin picking up fw/1 framework settings --->
<cfif len(cgi.query_string)>
	<cflocation url="./" />
</cfif>
</cfsilent>