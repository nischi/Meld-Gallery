<!---
||MELDGALLERYLICENSE||
--->
<cfoutput>
<ul id="meld-nav-main">
	<!---
	<li class="first"><a href="?action=admin:">#rc.mmRBF.key('dashboard')#</a></li>
	--->
	<li class="first"><a href="?action=admin:image">#rc.mmRBF.key('Images')#</a></li>
	<li><a href="?action=admin:imagegroup">#rc.mmRBF.key('ImageGroups')#</a></li>
	<li><a href="?action=admin:display">#rc.mmRBF.key('Displays')#</a></li>
	<li><a href="?action=admin:displaytype">#rc.mmRBF.key('GalleryTypes')#</a>
	<li class="last"><a href="?action=admin:settings">#rc.mmRBF.key('Settings')#</a></li>
	<li class="about">
		<a title="#rc.mmRBF.key('AboutMeldGallery')#" href="?action=admin:about">#rc.mmRBF.key('About')#</a>
		<ul>
			<li class="first"><a href="?action=admin:about">#rc.mmRBF.key('AboutMeldGallery')#</a></li>
			<li><a href="?action=admin:about.documentation">#rc.mmRBF.key('Documentation')#</a></li>
			<li><a href="?action=admin:about.support">#rc.mmRBF.key('Support')#</a></li>
			<li class="last"><a href="?action=admin:about.license">#rc.mmRBF.key('license')#</a></li>
		</ul>
	</li>
</ul>
</cfoutput>