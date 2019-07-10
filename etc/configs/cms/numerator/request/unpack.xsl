<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="">
    <xsl:template match="/o">
        <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:services.cms.rt.com">
            <S:Header/>
            <S:Body>
                <urn:request>
                    <entries>
                        <xsl:for-each select="entities/e">
                            <entry>
                                <id>
                                    <xsl:value-of select="id"/>
                                </id>
                                <entityType>
                                    <xsl:value-of select="type"/>
                                </entityType>
                                <branch>
                                    <xsl:value-of select="branch"/>
                                </branch>
                            </entry>
                        </xsl:for-each>
                    </entries>
                </urn:request>
            </S:Body>
        </S:Envelope>
    </xsl:template>
</xsl:stylesheet>
