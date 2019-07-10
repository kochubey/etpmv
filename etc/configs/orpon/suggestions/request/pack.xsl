<xsl:stylesheet version="1.0"
                xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns9="http://www.informatica.com/dis/ws/ws_"
                xmlns:ns4="http://suggestions.hflabs.ru/model/4_1">
<xsl:output method="text" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
<xsl:strip-space elements="*"/>
<xsl:template match="/">
    <xsl:apply-templates select="s:Envelope/s:Body/ns9:SuggestResponse"/>
</xsl:template>
<xsl:template match="ns9:SuggestResponse">
    {"items":[
    <xsl:for-each select="ns4:suggestions">
        <xsl:choose>
            <xsl:when test="position()>1">,</xsl:when>
        </xsl:choose>
        {
        "globalId":<xsl:value-of select="ns4:data/global_id"/>,
        "fullAddress": "<xsl:value-of select="ns4:value"/>"
        }
    </xsl:for-each>
    ]}
</xsl:template>
</xsl:stylesheet>
