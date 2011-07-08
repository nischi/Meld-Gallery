<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<cfparam name="rc.params.pauseonnav" default="false" />
</cfsilent>
<cfif rc.displayBean.beanExists() and ArrayLen(rc.ImageArray) and len(rc.params.style)>
	<cfoutput>#view("main/#rc.params.style#")#</cfoutput>
</cfif>
