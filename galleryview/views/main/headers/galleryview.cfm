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
<cfsavecontent variable="local.str"><cfoutput>
<script type="text/javascript">
jQuery(document).ready(function() {
	jQuery('##gal#rc.displayBean.getDisplayID()#').galleryView({
		gallery_width: #rc.params.imagewidth#,
		gallery_height: #rc.params.imageheight#,
		panel_width: #rc.params.imagewidth#,
		panel_height: #rc.params.imageheight#,
		frame_width: #rc.params.thumbwidth#,
		frame_height: #rc.params.thumbheight#,
		show_panels: #iif(rc.params.panels,true,false)#,
		show_filmstrip: #iif(rc.params.filmstrip,true,false)#,
		pointer_size: 0,
		show_captions: false,
		transition_speed: #rc.params.speed#,
		transition_interval: #rc.params.interval#,
		pause_on_hover: true,
		pause_on_click: true,
		nav_theme: 'light',
		frame_gap: 2,
		overlay_position: '#rc.params.overlaypos#',
		overlay_height: #rc.params.overlayheight#
	<!---
		start_frame: 1,
		filmstrip_size: 3,
		overlay_opacity: 0.7,
		frame_opacity: 0.3,
		easing: 'swing',
		filmstrip_position: 'bottom',
		panel_scale: 'nocrop',
		frame_scale: 'crop',
		frame_gap: 5,
		fade_panels: true,
 	--->
	});
});
</script>
</cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
<!---
		show_panels: true,					//BOOLEAN - flag to show or hide panel portion of gallery
		show_filmstrip: true,				//BOOLEAN - flag to show or hide filmstrip portion of gallery

		start_frame: 1,						//INT - index of panel/frame to show first when gallery loads
		filmstrip_size: 3,
		transition_speed: 800,				//INT - duration of panel/frame transition (in milliseconds)
		transition_interval: 4000,			//INT - delay between panel/frame transitions (in milliseconds)

		overlay_opacity: 0.7,				//FLOAT - transparency for panel overlay (1.0 = opaque, 0.0 = transparent)
		frame_opacity: 0.3,					//FLOAT - transparency of non-active frames (1.0 = opaque, 0.0 = transparent)

		pointer_size: 0,					//INT - Height of frame pointer (in pixels)

		nav_theme: 'light',					//STRING - name of navigation theme to use (folder must exist within 'themes' directory)
		easing: 'swing',					//STRING - easing method to use for animations (jQuery provides 'swing' or 'linear', more available with jQuery UI or Easing plugin)

		filmstrip_position: 'bottom',		//STRING - position of filmstrip within gallery (bottom, top, left, right)
		overlay_position: 'bottom',			//STRING - position of panel overlay (bottom, top, left, right)

		panel_scale: 'nocrop',				//STRING - cropping option for panel images (crop = scale image and fit to aspect ratio determined by panel_width and panel_height, nocrop = scale image and preserve original aspect ratio)
		frame_scale: 'crop',				//STRING - cropping option for filmstrip images (same as above)

		frame_gap: 5,						//INT - spacing between frames within filmstrip (in pixels)

		show_captions: false,				//BOOLEAN - flag to show or hide frame captions
		fade_panels: true,					//BOOLEAN - flag to fade panels during transitions or swap instantly
		pause_on_hover: true				//BOOLEAN - flag to pause slideshow when user hovers over the gallery
 --->



</cfsilent>