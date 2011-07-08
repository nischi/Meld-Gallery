<cfsilent>
	<cfif rc.nextN.recordsPerPage gt 1>
		<cfset local.paginationKey="NstartRow">
	<cfelse>
		<cfset local.paginationKey="NpageNum">
	</cfif>
	</cfsilent>
<cfoutput>
<!--- QUESTIONS --->
<!--- PAGING --->
<cfif rc.nextN.numberofpages gt 1>
<dl class="moreResults">
	<cfif rc.nextN.recordsPerPage gt 1><dt>#rc.rbFactory.getKey('list.moreresults')#:</dt></cfif>
	<dd>
		<ul>
		<cfif rc.nextN.currentpagenumber gt 1>
		<li class="navPrev"><a href="#xmlFormat('?#local.paginationKey#=#rc.nextN.previous#')#">&laquo;&nbsp;#rc.rbFactory.getKey('list.previous')#</a></li>
		</cfif>
		<cfloop from="#rc.nextN.firstPage#" to="#rc.nextN.lastPage#" index="i"><cfif rc.nextN.currentpagenumber eq i><li class="current">#i#</li><cfelse><li><a href="#xmlFormat('?#local.paginationKey#=#evaluate('(#i#*#rc.nextN.recordsperpage#)-#rc.nextN.recordsperpage#+1')#')#">#i#</a></li></cfif></cfloop>
		<cfif rc.nextN.currentpagenumber lt rc.nextN.NumberOfPages>
			<li class="navNext"><a href="#xmlFormat('?#local.paginationKey#=#rc.nextN.next#')#">#rc.rbFactory.getKey('list.next')#&nbsp;&raquo;</a></li>
		</cfif>
		</ul>
	</dd>
</dl>
</cfif>
</cfoutput>