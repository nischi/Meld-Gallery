<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<cfset local.rc = rc>
</cfsilent><cfoutput>
<ul class="meld-nav-secondary">
	<li>
		<a href="?action=admin:image.edit" title="#local.rc.mmRBF.key('addnewimage','tip')#">#local.rc.mmRBF.key('addnewimage')#</a>				
	</li>
</ul>
</cfoutput>