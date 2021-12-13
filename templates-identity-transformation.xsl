<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="xml" encoding="UTF-8" indent="no" omit-xml-declaration="no"/>

  <xsl:preserve-space elements=""/>
  <xsl:strip-space elements=""/>
  
  <!-- identity transformation -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- cutting a whole branch
  <xsl:template match="t:teiHeader"/> 
   -->
  
  <!-- skipping an element, but apply templates to children 
  <xsl:template match="t:body">
    <xsl:apply-templates/>
  </xsl:template>
  -->

  <!-- expanding an element
  <xsl:template match="t:p">
    <xsl:copy>
      <subsection>
	<xsl:apply-templates/>
      </subsection>
    </xsl:copy>
  </xsl:template>
  -->

  <!-- applying templates to the first child of an element only
  <xsl:template match="t:app">
    <xsl:apply-templates select="*[1]"/>
  </xsl:template> -->

  <!-- expanding attributes to elements 
  <xsl:template match="@wit">
    <xsl:element name="wit">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>
  -->
  
  <!-- collapsing elements to attributes 
  <xsl:template match="t:mentioned">
    <xsl:copy>
      <xsl:attribute name="text">
	<xsl:value-of select="."/>
      </xsl:attribute>
      <xsl:apply-templates select="*"/>
    </xsl:copy>
  </xsl:template>
  -->

  <!-- relocating corresponding <note>-elements as a child-element
  <xsl:template match="*[@xml:id]">
    <xsl:copy>
      <xsl:copy-of select="@*"/> 
      <xsl:apply-templates/>
      <xsl:call-template name="look-for-target"/>
    </xsl:copy>
  </xsl:template>


  <xsl:template name="look-for-target">
    <xsl:variable name="correspkey" select="concat('#', @xml:id )"/>
    <xsl:if test="//t:note[@target = $correspkey]">
      <xsl:for-each select="//t:note[@target = $correspkey]">
	<xsl:element name="corresp">
	  <xsl:apply-templates select="child::*"/>
	</xsl:element>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <xsl:template match="t:note[@target]"/>
  -->
  
</xsl:stylesheet>
