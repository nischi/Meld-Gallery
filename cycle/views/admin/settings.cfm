<!---

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
<cfsilent>
	<cfparam name="form.params_effect" default="fade" />
	<cfparam name="form.params_speed" default="500" />
	<cfparam name="form.params_style" default="" />
	<cfparam name="form.params_interval" default="3000" />
	<cfparam name="form.params_pauseonnav" default="0" />
</cfsilent>
<cfoutput>
	<ul class="form">
		<li>
			<label for="params_imagewidth">#local.rc.mmRBF.key('imagewidth')#</label>
			<input class="text tiny" type="text" name="params_imagewidth" id="params_imagewidth" value="#form.params_imagewidth#" size="10" maxlength="10" required="true" validate="number" message="#local.rc.mmRBF.key('imagewidth','validate')#"/>
		</li>
		<li>
			<label for="params_imageheight">#local.rc.mmRBF.key('imageheight')#</label>
			<input class="text tiny" type="text" name="params_imageheight" id="params_imageheight" value="#form.params_imageheight#" size="10" maxlength="10" required="true" validate="number" message="#local.rc.mmRBF.key('imageheight','validate')#"/>
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
		<fieldset>
		<legend>#local.rc.mmRBF.key('galleryoptions')#</legend>
		<li>
			<label for="params_showcaption">#local.rc.mmRBFLocal.key('effect')#</label>
			<select name="params_effect">
				<cfloop list="blindX,blindY,blindZ,cover,curtainX,curtainY,fade,fadeZoom,growX,growY,scrollUp,scrollDown,scrollLeft,scrollRight,scrollHorz,scrollVert,shuffle,slideX,slideY,toss,turnUp,turnDown,turnLeft,turnRight,uncover,wipe,zoom" index="local.item">
					<option value="#local.item#"<cfif local.item eq form.params_effect> SELECTED</cfif>>#local.item#</option>
				</cfloop>
			</select>
		</li>
		<li>
			<label for="params_speed">#local.rc.mmRBFLocal.key('transitionspeed')#</label>
			<select name="params_speed">
				<cfloop list="250,500,750,1000,1500,2000" index="local.item">
					<option value="#local.item#"<cfif local.item eq form.params_speed> SELECTED</cfif>>#local.item# #local.rc.mmRBFLocal.key('msec')#</option>
				</cfloop>
			</select>
		</li>
		<li>
			<label for="params_interval">#local.rc.mmRBFLocal.key('intervalspeed')#</label>
			<select name="params_interval">
				<cfloop list="0,2000,3000,4000,5000,6000,7000,8000,9000,10000,15000,20000,30000" index="local.item">
					<option value="#local.item#"<cfif local.item eq form.params_interval> SELECTED</cfif>>#(local.item/1000)# #local.rc.mmRBFLocal.key('seconds')#</option>
				</cfloop>
			</select>
		</li>
		<li>
			<label for="params_showcaption">#local.rc.mmRBFLocal.key('style')#</label>
			<select name="params_style">
				<cfinclude template="styles.cfm" />
			</select>
		</li>
		<li>
			<label for="params_interval">
			<input type="checkbox" name="params_pauseonnav" value="1" <cfif form.params_pauseonnav>CHECKED</cfif>>
			#local.rc.mmRBFLocal.key('pauseonnav')#
			</label>
		</li>
		</fieldset>
	</ul>
</cfoutput>
