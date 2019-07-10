<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="">
    <xsl:template match="/o">
        <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/"
                    xmlns:ws="http://www.informatica.com/dis/ws/ws_"
                    xmlns:_1="http://suggestions.hflabs.ru/model/4_1">
            <S:Header/>
            <S:Body>
                <ws:SuggestAddressRequest>
                    <_1:query>
                        <xsl:value-of select="query"/>
                    </_1:query>
                    <_1:count>
                        <xsl:value-of select="count"/>
                    </_1:count>
                    <ws:locations>
                        <kladr_id>140000000000000</kladr_id>
                    </ws:locations>
                    <ws:locations>
                        <kladr_id>250000000000000</kladr_id>
                    </ws:locations>
                    <ws:locations>
                        <kladr_id>270000000000000</kladr_id>
                    </ws:locations>
                    <ws:locations>
                        <kladr_id>280000000000000</kladr_id>
                    </ws:locations>
                    <ws:locations>
                        <kladr_id>410000000000000</kladr_id>
                    </ws:locations>
                    <ws:locations>
                        <kladr_id>490000000000000</kladr_id>
                    </ws:locations>
                    <ws:locations>
                        <kladr_id>650000000000000</kladr_id>
                    </ws:locations>
                </ws:SuggestAddressRequest>
            </S:Body>
        </S:Envelope>
    </xsl:template>
</xsl:stylesheet>
