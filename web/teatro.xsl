<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Módulo: LMSGI
    UD: 04
    Fecha: 09/03/2023
    Autor: Nadia D'Alessio
    Tarea: Tarea Evaluativa 02
    Enunciado: El objetivo de esta tarea es utilizar el lenguaje XPath y el estandar XSLT para transformar 
    un sitio web de manera que obtenga los datos visualizados de un documento XML.
        - Listado de las obras de teatro de enero de 2023 ordenadas por fecha, de la más recientes a menos. 
          Y además, las obras con precio menor de 20€ se mostrarán subrayadas.
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
		
		<main class="principal">
			<section class="teatro">
				<h1>PROXIMAS OBRAS DE TEATRO</h1>
				<ul>
                    <xsl:apply-templates select="teatro/fechahora[contains(@dia, '2023-01')]/..">
                        <!-- xsl:sort para ordenar las fechas de la obra de teatro desde la más reciente -->
                        <xsl:sort select="fechahora/@dia" order="descending"/>
                    </xsl:apply-templates>
				</ul>
			</section>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>    
</xsl:template>

<xsl:template match="teatro">
    <!-- xsl:choose, xsl:when, xsl:otherwise para cambiar el estilo de la fecha y obra mostrada según el precio -->
    <xsl:choose>
        <xsl:when test="precio&lt;20">
            <li><u><xsl:value-of select="fechahora/@dia"/>: <xsl:value-of select="obra"/></u></li>
        </xsl:when>
        <xsl:otherwise>
            <li><xsl:value-of select="fechahora/@dia"/>: <xsl:value-of select="obra"/></li>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>
