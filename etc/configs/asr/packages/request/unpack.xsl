<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="">
    <xsl:template match="/a/e">
        <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
            <S:Body>
                <ns2:get_tariff_plans xmlns:ns2="http://datumnode.com/start/api/cms" xmlns="DatumNode">
                    <ns2:request>
                        <Connection>
                            <Connection>
                                <xsl:choose>
                                    <xsl:when test="FILIALNAME = 'DV_AM'">amr.*</xsl:when>
                                    <xsl:when test="FILIALNAME = 'DV_KA'">kam.*</xsl:when>
                                    <xsl:when test="FILIALNAME = 'DV_MA'">mag.*</xsl:when>
                                    <xsl:when test="FILIALNAME = 'DV_PR'">prm.*</xsl:when>
                                    <xsl:when test="FILIALNAME = 'DV_SA'">skh.*</xsl:when>
                                    <xsl:when test="FILIALNAME = 'DV_ST'">stk.*</xsl:when>
                                    <xsl:when test="FILIALNAME = 'DV_HA'">hab.*</xsl:when>
                                    <xsl:otherwise>*.*</xsl:otherwise>
                                </xsl:choose>
                            </Connection>
                        </Connection>
                        <Command>
                            <Operation>ExecuteNonQuery</Operation>
                        </Command>
                        <ns2:Parameters>
                            <ns2:p_request>
                                <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                <request source="GET_TARIFF_PLANS">
                                    <params>
                                        <serv_typ>package</serv_typ>
                                        <tech><xsl:value-of select="TECH"/></tech>
                                        <user_type_id><xsl:value-of select="CLIENTTYPE"/></user_type_id>
                                    </params>
                                </request>
                                <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                            </ns2:p_request>
                        </ns2:Parameters>
                    </ns2:request>
                </ns2:get_tariff_plans>
            </S:Body>
        </S:Envelope>
    </xsl:template>
</xsl:stylesheet>
