﻿<!---

This file is part of the Meld Gallery application.

Meld Gallery is licensed under the GPL 2.0 license
Copyright (C) 2010 2011 Meld Solutions Inc. http://www.meldsolutions.com/

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation, version 2 of that license..

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

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