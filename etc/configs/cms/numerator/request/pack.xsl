<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:d="urn:services.cms.rt.com">
    <xsl:output method="text" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:apply-templates select="s:Envelope/s:Body/d:getNumbersReturn/entries"/>
    </xsl:template>
    <xsl:template match="entries">
        {"entities":[
        <xsl:for-each select="entry">
            <xsl:choose>
                <xsl:when test="position()>1">,</xsl:when>
            </xsl:choose>
            {
            "id":<xsl:value-of select="id"/>,
            "type": "<xsl:value-of select="entityType"/>",
            "branch": "<xsl:value-of select="branch"/>",
            "number": "<xsl:value-of select="number"/>"
            }
        </xsl:for-each>
        ]}
    </xsl:template>
</xsl:stylesheet>