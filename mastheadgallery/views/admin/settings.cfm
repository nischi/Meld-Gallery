<!---
||MELDGALLERYLICENSE||
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
			<label for="params_gallerywidth">#local.rc.mmRBFLocal.key('gallerywidth')#
					<a href="##" class="tooltip"><span>#local.rc.mmRBFLocal.key('gallerywidth','tip')#</span>&nbsp;</a>
			</label>
			<input class="text tiny" type="text" name="params_gallerywidth" id="params_gallerywidth" value="#form.params_gallerywidth#" size="10" maxlength="10" required="true" message="#local.rc.mmRBFLocal.key('gallerywidth','validate')#"/>
		</li>
		<li>
			<label for="params_menu">#local.rc.mmRBFLocal.key('mastheadingmenu')#
					<a href="##" class="tooltip"><span>#local.rc.mmRBFLocal.key('mastheadingmenu','tip')#</span>&nbsp;</a>
			</label>
			<input class="text" type="text" name="params_menu" id="params_menu" value="#form.params_menu#" size="250" maxlength="250"/>
			<div class="small gray">[mura]dspPrimaryNav(viewDepth='1',id='navPrimary',displayHome='Always',closePortals='true')[/mura]</div>
		</li>
		<li>
			<label for="params_header">#local.rc.mmRBFLocal.key('mastheadingheader')#
					<a href="##" class="tooltip"><span>#local.rc.mmRBFLocal.key('mastheadingheader','tip')#</span>&nbsp;</a>
			</label>
			<textarea class="textarea  small" id="params_header" name="params_header">#form.params_header#</textarea>
		</li>
		<li>
			<label for="params_mast">#local.rc.mmRBFLocal.key('mastheadingmast')#
					<a href="##" class="tooltip"><span>#local.rc.mmRBFLocal.key('mastheadingmast','tip')#</span>&nbsp;</a>
			</label>
			<textarea class="textarea  small" id="params_mast" name="params_mast">#form.params_mast#</textarea>
		</li>
		</fieldset>
	</ul>
</cfoutput>
