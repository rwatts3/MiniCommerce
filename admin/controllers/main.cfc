<!---

This file is part of the Meld MiniCommerce application.

Meld MiniCommerce is licensed under the GPL 2.0 license
Copyright (C) 2010 Meld Solutions Inc. http://www.meldsolutions.com/

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
<cfcomponent extends="controller">
	<cffunction name="default" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var pluginEvent 			= createObject("component","mura.MuraScope") />
		<cfset var pluginManager		= rc.$.getBean('pluginManager') />
		<cfset var minicommerceManager	= getBeanFactory().getBean('MeldMiniCommerceManager') />

		<cfset pluginEvent= pluginEvent.init( StructNew() ).getEvent() />
		<cfset pluginEvent.setValue('siteID',rc.siteID ) />
		<cfset rc.renderDashboard		= pluginManager.renderEvent( "onMeldMiniCommerceRenderDashboard",pluginEvent )>

		<cfif not len(rc.renderDashboard)>
			<cfset rc.stats		= minicommerceManager.getDashboard()>
		</cfif>
	</cffunction>
</cfcomponent>