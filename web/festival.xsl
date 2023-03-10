<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Módulo: LMSGI
    UD: 04
    Fecha: 09/03/2023
    Autor: Nadia D'Alessio
    Tarea: Tarea Evaluativa 02
    Enunciado: El objetivo de esta tarea es utilizar el lenguaje XPath y el estandar XSLT para transformar 
    un sitio web de manera que obtenga los datos visualizados de un documento XML.
        - Concierto por tipo de música: Mostrar el nombre de festival, nombre de grupo de música(concierto), 
        fecha, hora y lugar de todos los conciertos de "rock" que existan.
	Autoevaluación: https://docs.google.com/document/d/1n9HA2aS4LAwqoysbtVfanXU3q790NPeVlgKrxUmsNNQ/edit?usp=share_link
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" doctype-system="about:legacy-compat" />

<xsl:template match="/reservaeventos">

<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>
		
		<section class="festival">
			<h1>Festivales de rock</h1>
			<table>
				<tr>
					<th>FESTIVAL</th>
					<th>CONCIERTO</th>
					<th>FECHA</th>
					<th>HORA</th>
					<th>LUGAR</th>
				</tr>
                <!-- Aplicando la plantilla de concierto escogiendo solo los grupos de rock -->
                <xsl:apply-templates select="festival/conciertos/concierto[grupo/@tipomusica='rock']"/>
			</table>			
		</section>
		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>    
</xsl:template>

<!-- Plantilla para concierto -->
<xsl:template match="concierto">
    <tr>
        <td><xsl:value-of select="../../nombrefesti"/></td>
        <td><xsl:value-of select="grupo"/></td>
        <td><xsl:value-of select="fecha"/></td>
        <td><xsl:value-of select="hora"/></td>
        <td><xsl:value-of select="../../lugar"/></td>
    </tr>
</xsl:template>

</xsl:stylesheet>