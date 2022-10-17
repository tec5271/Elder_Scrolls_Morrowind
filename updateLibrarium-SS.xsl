<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:svg="http://www.w3.org/2000/svg"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="math"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:variable name="librarium" as="document-node()+" select="collection('docs/librarium/?select=*.html')"/>
    
    <xsl:template match="/">
        <xsl:for-each select="$librarium">
            <xsl:variable name="currentFileName" select="current()/base-uri() ! tokenize(., '/')[last()]"/>
            <xsl:result-document method="xhtml" html-version="5" omit-xml-declaration="yes" indent="yes" href="docs/librarium2/{$currentFileName}">
            <xsl:apply-templates/> 
            </xsl:result-document>
        </xsl:for-each>
        
    </xsl:template>
    
    <xsl:template match="svg">
        <xsl:element name="svg" namespace="http://www.w3.org/2000/svg">
            <xsl:for-each select="@*">
                <xsl:copy select="."/>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
        
        
    </xsl:template>
    
    
</xsl:stylesheet>