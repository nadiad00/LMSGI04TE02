<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Módulo: LMSGI
    UD: 04
    Fecha: 09/03/2023
    Autor: Nadia D'Alessio
    Tarea: Tarea Evaluativa 02
    Enunciado: El objetivo de esta tarea es utilizar el lenguaje XPath y el estandar XSLT para transformar 
    un sitio web de manera que obtenga los datos visualizados de un documento XML.
        -Datos de un restaurante:
            +Mostrar nombre del restaurante y ciudad, así como todos los menús que dispone el restaurante. Conocido el nombre del restaurante, el resto de datos se obtendrán del XML.
            +Al clicar encima del nombre del restaurante se abrirá un link a la página oficial. Su URL también se obtendrá del XML
            +Se deberá guardar el nombre del restaurante en una variable. De manera que si se modifica el nombre del restaurante en la variable, los platos, nombre, ciudad y link también deberán modificarse de forma automática en la página.
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
		
		<main>
			<!-- Variable literal para guardar el nombre del restaurante y usarlo -->
            <xsl:variable name="resNombre">El clarete</xsl:variable>

            <h1>
                <a href="{restaurante[nombrerestaurante=$resNombre]/informacion}" target="_blank">
                    <xsl:value-of select="$resNombre"/> - <xsl:value-of select="restaurante[nombrerestaurante=$resNombre]/ciudad"/>
                </a>
            </h1>
            <!-- for-each anidados para mostrar los menús y platos del restaurante guardado en la variable -->
            <xsl:for-each select="restaurante[nombrerestaurante=$resNombre]/menu">
                <article class="restaurante">
                    <h3><xsl:value-of select="@tipo"/></h3>
                    <xsl:for-each select="plato">
                        <p><xsl:value-of select="."/></p>
                    </xsl:for-each>
                </article>
            </xsl:for-each>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
    
</xsl:template>
</xsl:stylesheet>