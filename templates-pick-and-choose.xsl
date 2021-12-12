<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
  
  <xsl:output method="text" encoding="UTF-8" indent="no" omit-xml-declaration="no"/>

  <xsl:preserve-space elements=""/>
  <xsl:strip-space elements=""/>

  <!-- declaring variables -->
  <xsl:variable name="n">
    <xsl:text>
</xsl:text>
  </xsl:variable>
  
  <!-- building from root element -->
  <xsl:template match="/">
    <xsl:text>Author: </xsl:text>
    <xsl:value-of select="//t:author"/>
    <xsl:value-of select="$n"/>
    <xsl:text>Text: </xsl:text>
    <xsl:value-of select="//t:title"/>
    <xsl:value-of select="$n"/>
    <xsl:value-of select="$n"/>
    <xsl:text>Variants: </xsl:text>
    <xsl:value-of select="$n"/>
    <!-- separate templates for more complex operations -->
    <xsl:apply-templates select="//t:app"/>
    <xsl:value-of select="$n"/>
  </xsl:template>

  <!-- template matching <app> element 
  <xsl:template match="t:app">
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="*"/>
    <xsl:value-of select="$n"/>
  </xsl:template> -->

  <!-- template matching each child of the <app> element
  <xsl:template match="t:app/*">
      <xsl:value-of select="@wit"/>
      <xsl:text>: </xsl:text>
      <xsl:value-of select="."/>
      <xsl:if test="position() != last()">
	<xsl:text>, </xsl:text>
      </xsl:if>
  </xsl:template> -->

  
</xsl:stylesheet>
