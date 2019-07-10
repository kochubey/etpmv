<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="">
    <xsl:template match="/a/e">
        <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
            <S:Body>
                <ns2:get_start_services xmlns:ns2="http://datumnode.com/start/api/cms" xmlns="DatumNode">
                    <ns2:request>
                        <Connection>
                            <Connection>
                                <xsl:choose>
                                    <xsl:when test="FILIALCODE = 'DV_AM'">amr.*</xsl:when>
                                    <xsl:when test="FILIALCODE = 'DV_KA'">kam.*</xsl:when>
                                    <xsl:when test="FILIALCODE = 'DV_MA'">mag.*</xsl:when>
                                    <xsl:when test="FILIALCODE = 'DV_PR'">prm.*</xsl:when>
                                    <xsl:when test="FILIALCODE = 'DV_SA'">skh.*</xsl:when>
                                    <xsl:when test="FILIALCODE = 'DV_ST'">stk.*</xsl:when>
                                    <xsl:when test="FILIALCODE = 'DV_HA'">hab.*</xsl:when>
                                    <xsl:otherwise>*.*</xsl:otherwise>
                                </xsl:choose>
                            </Connection>
                        </Connection>
                        <Command>
                            <Operation>ExecuteNonQuery</Operation>
                        </Command>
                        <ns2:Parameters>
                            <ns2:request>
                                <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                <request source="GET_SERVICES">
                                    <params>
                                        <house_id><xsl:value-of select="GLOBALID"/></house_id>
                                    </params>
                                </request>
                                <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                            </ns2:request>
                        </ns2:Parameters>
                    </ns2:request>
                </ns2:get_start_services>
            </S:Body>
        </S:Envelope>
    </xsl:template>
</xsl:stylesheet>
