<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--@If(fldName="BB"; "Интернет"; fldName="VoIP"; "IP-Телефония"; fldName="PSTN"; "Телефония"; fldName="IPTV"; "Интерактивное ТВ"; fldName)    -->
    <!--(ТВ нет, ТВ есть, ручное уточнение)-->
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:apply-templates select="/Responce/ServiceableServices"/>
    </xsl:template>
    <xsl:template match="ServiceableServices">
        {"items":[
        <xsl:for-each select="ServiceableService/Services/LoB">
            <xsl:choose>
                <xsl:when test="position()>1">,</xsl:when>
            </xsl:choose>
            {
            "id":<xsl:value-of select="position()"/>,
            <xsl:choose>
                <xsl:when test="Name='BB'">"product":"Интернет",</xsl:when>
                <xsl:when test="Name='VoIP'">"product":"IP-Телефония",</xsl:when>
                <xsl:when test="Name='PSTN'">"product":"Телефония",</xsl:when>
                <xsl:when test="Name='IPTV'">"product":"Интерактивное ТВ",</xsl:when>
                <xsl:otherwise>
                    "product":"<xsl:value-of select="Name"/>",
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="Name='BB'">"productGroupId":4,</xsl:when>
                <xsl:when test="Name='VoIP'">"productGroupId":3,</xsl:when>
                <xsl:when test="Name='PSTN'">"productGroupId":2,</xsl:when>
                <xsl:when test="Name='IPTV'">"productGroupId":5,</xsl:when>
                <xsl:otherwise>
                    "productGroupId":1/>",
                </xsl:otherwise>
            </xsl:choose>
            "tech": "<xsl:value-of select="../../TechName"/>",
            "lineData":"<xsl:value-of
                select="normalize-space(translate(translate(../../LineData/text(), '&#xa;', ''), '&#xd;', ''))"/>",
            <xsl:choose>
                <xsl:when test="Status='N'">"checkResult":"ТВ нет"</xsl:when>
                <xsl:when test="Status='Y'">"checkResult":"ТВ есть"</xsl:when>
                <xsl:when test="Status='M'">"checkResult":"ручное уточнение"</xsl:when>
                <xsl:otherwise>
                    "checkResult":"<xsl:value-of select="Status"/>"
                </xsl:otherwise>
            </xsl:choose>
            }
        </xsl:for-each>
        ]}
    </xsl:template>

</xsl:stylesheet>
