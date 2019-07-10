<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="tech"/>
    <xsl:template match="/">
        <xsl:apply-templates select="outparams"/>
    </xsl:template>
    <xsl:template match="outparams">
        {"items":[
        <xsl:for-each select="ROW">
            <xsl:choose>
                <xsl:when test="position()>1">,</xsl:when>
            </xsl:choose>
            {
            "packageId": <xsl:value-of select="PKG_ID"/>,
            "packageName": "<xsl:value-of
                select="normalize-space(translate(PKG_NAME, '\&quot;', ''))"/>",
            "techName": "<xsl:value-of select="$tech"/>",
            "message": "<xsl:value-of select="MESSAGE"/>",
            "packageServiceList":[
            <xsl:for-each select="PKG_SERVICE/PKG_SERVICE_ROW">
                <xsl:choose>
                    <xsl:when test="position()>1">,</xsl:when>
                </xsl:choose>
                {
                "packServiceId": <xsl:value-of select="PKG_POS_ID"/>,
                "serviceName": "<xsl:value-of select="SERV_NAME"/>",
                "isRequired":<xsl:choose>
                    <xsl:when test="IS_MANDATORY = 1">true</xsl:when>
                    <xsl:otherwise>false</xsl:otherwise>
                </xsl:choose>,
                "serviceType": "<xsl:value-of select="SERV_TYP"/>"
                }
            </xsl:for-each>
            ]
            }
        </xsl:for-each>
        ]}
    </xsl:template>
</xsl:stylesheet>
