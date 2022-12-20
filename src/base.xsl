<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" 
	xmlns:exslt="http://exslt.org/common" 
	extension-element-prefixes="exslt">
	<xsl:output method="html" indent="yes"/>
	
	<xsl:template match="bs:roster">
		<xsl:apply-templates select="bs:forces"/>
	</xsl:template>
	
	<xsl:template match="bs:force">
		<html>
			<head>
				<meta charset="UTF-8" />
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<title>
					<xsl:value-of select="../../@name"/>
				</title>
				<style>@import url('https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@500')</style>
				<style type='text/css'>
				@@include_style
				</style>
			</head>
			<body>
				<div class="container">
					
					<div class="title">
						<xsl:value-of select="../../@name"/>
					</div>
					
					<table style="margin: 20px 0; ">
						<tr>
							<td style="width: 90%;">
								<table class="unit-stat">
									<tr>
										<td style="width: 12.5%;">Unit</td>
										<td style="width: 12.5%; text-align: center;">SP</td>
										<td style="width: 12.5%; text-align: center;">RA</td>
										<td style="width: 12.5%; text-align: center;">FI</td>
										<td style="width: 12.5%; text-align: center;">SV</td>
										<td style="width: 12.5%; text-align: center;">AR</td>
										<td style="width: 12.5%; text-align: center;">HP</td>
										<td style="width: 12.5%; text-align: center;">VP</td>
									</tr>
								</table>
							</td>
							<td style="width: 10%;"></td>
						</tr>
					</table>

					<xsl:apply-templates select="bs:selections"/>

					<hr />
					<div>
						<xsl:for-each select="//bs:rule[not(@name=preceding::bs:rule/@name)]">
							<div class="box-border" style="padding: 10px;">
								<div style="font-size: large; font-weight: 600;">
									<xsl:value-of select="@name"/>
								</div>
								<div>
									<xsl:value-of select="bs:description/."/>
								</div>
							</div>
						</xsl:for-each>
					</div>

				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="bs:selection[@type='model']">
		
		<table style="margin: 20px 0; border-width: 1px; border-color: #CCC; border-style: solid; border-radius: 4px; box-shadow: 0 3px 10px rgb(0 0 0 / 0.2);">
			<tr>
				<td style="width: 90%;">
					<table class="unit-stat">
						<tr>
							<td>
								<div>
									<xsl:value-of select="@name"/>
								</div>
								<div style="font-size: small;">
									<xsl:value-of select="bs:categories/bs:category/@name"/>
								</div>
							</td>
							<td>
								<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='SP']"/>
							</td>
							<td>
								<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='RA']"/>
							</td>
							<td>
								<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='FI']"/>
							
							</td>
							<td>
								<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='SV']"/>
							
							</td>
							<td>
								<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='AR']"/>
							
							</td>
							<td>
								<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='HP']"/>
							
							</td>
							<td>
								<xsl:value-of select="format-number(bs:costs/bs:cost[@name=' VP']/@value, '#')"/>
							</td>
						</tr>
					</table>
					
					<hr color="#CCC" size="1" width="95%"/>
					
					<table style="padding: 10px; table-layout: fixed;">
						<tr>
							<th style="width: 20%; text-align: left; font-size: small; font-weight: 500;">Weapon</th>
							<th style="width: 10%; font-size: small; font-weight: 500;">Range</th>
							<th style="width: 10%; font-size: small; font-weight: 500;">AP</th>
							<th style="width: 20%; text-align: left; font-size: small; font-weight: 500;">Keywords</th>
							<th style="width: 20%; text-align: left; font-size: small; font-weight: 500;">Equipment</th>
						</tr>
						<xsl:apply-templates select="bs:selections/bs:selection/bs:profiles"/>
					</table>
				</td>
				
				<td style="width: 10%; border-color: #CCC; border-width: 0 0 0 1px; border-style: solid; padding: 10px; vertical-align: text-top;">
					<div style="font-size: small;">
						<xsl:value-of select="bs:profiles/bs:profile/bs:characteristics/bs:characteristic[@name='Abilities']"/>
					</div>
				</td>
			</tr>
		</table>
		
	</xsl:template>

	<xsl:template match="bs:profile[@typeName='Weapon']">
		<tr class="weapon-stat">
			<td>
				<xsl:value-of select="@name"/>
			</td>
			<td style="text-align: center;">
				<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Range']/."/>
			</td>
			<td style="text-align: center;">
				<xsl:value-of select="bs:characteristics/bs:characteristic[@name='AP']/."/>
			</td>
			<td>
				<xsl:value-of select="bs:characteristics/bs:characteristic[@name='Keywords']/."/>
			</td>
			<td>-</td>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>