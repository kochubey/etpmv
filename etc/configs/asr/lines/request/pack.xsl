<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
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
            "id":<xsl:value-of select="position()"/>,
            "accountId": "<xsl:value-of select="USER_ID"/>",
            "accountNumber": "<xsl:value-of select="ACCOUNT"/>",
            "clientName": "<xsl:value-of select="NAME"/>",
            <xsl:choose>
                <xsl:when test="LINE">
                    "lineNumber":"<xsl:value-of select="LINE"/>",
                </xsl:when>
            </xsl:choose>
            "phoneNumber": "<xsl:value-of select="DEV_ID"/>"
            }
        </xsl:for-each>
        ]}
    </xsl:template>
</xsl:stylesheet>
