<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<!--- headers --->
</cfsilent><cfoutput>
<div id="meld-plugin">
	<div id="meld-content">
		<div id="meld-header">
			<div id="meld-bc" class="clearfix">
				#view("/global/bc")#
			</div>
			<div id="meld-logo" class="clearfix">
			<a href="http://www.meldsolutions.com/products/meld-gallery/" target="_new">&nbsp;</a>	
			</div>
		</div>
		<div id="meld-nav" class="clearfix">
			#view("/global/menu")#
		</div>
		<!--- error template --->
		<cfif rc.errors.hasErrors( rc.$.event() )>
		<div id="meld-error" class="section clearfix">
			#view("/global/inc_errors")#
		</div>
		</cfif>
		#body#
	</div>
</div>
</cfoutput>