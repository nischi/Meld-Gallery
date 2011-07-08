<!---

This file is part of the Meld Gallery application.

Meld Gallery is licensed under the GPL 2.0 license
Copyright (C) 2010,2011 Meld Solutions Inc. http://www.meldsolutions.com/

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
<cfsilent>
</cfsilent>
<cfoutput>
	<ul class="form">
		<li>
			<label for="params_imagewidth">#local.rc.mmRBF.key('imagewidth')#</label>
			<input class="text tiny" type="text" name="params_imagewidth" id="params_imagewidth" value="#form.params_imagewidth#" size="10" maxlength="10" required="true" message="#local.rc.mmRBF.key('imagewidth','validate')#"/>
		</li>
		<li>
			<label for="params_imageheight">#local.rc.mmRBF.key('imageheight')#</label>
			<input class="text tiny" type="text" name="params_imageheight" id="params_imageheight" value="#form.params_imageheight#" size="10" maxlength="10" required="true" message="#local.rc.mmRBF.key('imageheight','validate')#"/>
		</li>
		<li>
			<label for="params_resizetype">#local.rc.mmRBF.key('resizetype')#</label>
			<select name="params_resizetype">
				<cfloop list="crop,resize,cropresize" index="local.item">
					<option value="#local.item#"<cfif local.item eq form.params_resizetype> SELECTED</cfif>>#local.rc.mmRBF.key(local.item)#</option>
				</cfloop>
			</select>
		</li>
		<li>
			<label for="params_imagewidth">#local.rc.mmRBF.key('aspecttype')#</label>
			<select name="params_aspecttype">
				<option value="">#local.rc.mmRBF.key('none')#</option>
				<cfloop list="AspectXY,AspectX,AspectY,MaxAspectXY,Resize" index="local.item">
					<option value="#local.item#"<cfif local.item eq form.params_aspecttype> SELECTED</cfif>>#local.rc.mmRBF.key(local.item)#</option>
				</cfloop>
			</select>
		</li>
		<li>
			<label for="params_imagewidth">#local.rc.mmRBF.key('thumbimagewidth')#</label>
			<input class="text tiny" type="text" name="params_thumbwidth" id="params_thumbwidth" value="#form.params_thumbwidth#" size="10" maxlength="10" required="true" message="#local.rc.mmRBF.key('imagewidthsmall','validate')#"/>
		</li>
		<li>
			<label for="params_thumbheight">#local.rc.mmRBF.key('imageheightsmall')#</label>
			<input class="text tiny" type="text" name="params_thumbheight" id="params_thumbheight" value="#form.params_thumbheight#" size="10" maxlength="10" required="true" message="#local.rc.mmRBF.key('imageheightsmall','validate')#"/>
		</li>
		<fieldset>
		<legend>#local.rc.mmRBF.key('galleryoptions')#</legend>
		<li>
			<label for="params_showname">#local.rc.mmRBFlocal.key('showimagegroupname')#</label>
			<select name="params_showname">
				<cfloop list="true,false" index="local.item">
					<option value="#local.item#"<cfif local.item eq form.params_showname> SELECTED</cfif>>#local.rc.mmRBFlocal.key(local.item)#</option>
				</cfloop>
			</select>
		</li>
		<li>
			<label for="params_showcaption">#local.rc.mmRBFlocal.key('showcaption')#</label>
			<select name="params_showcaption">
				<cfloop list="true,false" index="local.item">
					<option value="#local.item#"<cfif local.item eq form.params_showcaption> SELECTED</cfif>>#local.rc.mmRBFlocal.key(local.item)#</option>
				</cfloop>
			</select>
		</li>
		</fieldset>
	</ul>
</cfoutput>
