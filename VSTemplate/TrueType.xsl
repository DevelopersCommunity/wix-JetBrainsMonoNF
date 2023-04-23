<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:wix="http://schemas.microsoft.com/wix/2006/wi" version="2.0">
  <xsl:output method="xml" indent="yes" />

  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="wix:File">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" />
      <xsl:attribute name="TrueType">yes</xsl:attribute>
    </xsl:copy>
  </xsl:template>
</xsl:transform>
