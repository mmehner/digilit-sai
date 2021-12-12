<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
  
  <xsl:output method="xml" encoding="UTF-8" indent="no" omit-xml-declaration="no"/>

  <xsl:preserve-space elements=""/>
  <xsl:strip-space elements=""/>
  
  <!-- identity transformation -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- 1.  Output only <title>, <author>, and <listWit> elements of the teiHeader -->
  <xsl:template match="t:teiHeader">
    <xsl:copy>
      <xsl:apply-templates select="//t:title"/>
      <xsl:apply-templates select="//t:author"/>
      <xsl:apply-templates select="//t:listWit"/>
    </xsl:copy>
  </xsl:template>

  <!-- 2. output only the last child (<rdg>  or <lem>) of each <app> element -->
  <xsl:template match="t:app">
    <xsl:apply-templates select="*[last()]"/>
  </xsl:template>

  <!-- 3. remove the @wit attribute from the resulting <rdg> or <lem> elements -->
  <xsl:template match="t:app/*/@wit"/>
  
</xsl:stylesheet>
