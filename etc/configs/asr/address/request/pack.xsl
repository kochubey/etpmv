<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:d="http://datumnode.com/start/api/cms"
                xmlns:p="DatumNode"
                exclude-result-prefixes="d s xsl p">
    <xsl:output method="text" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        {"houseId":"<xsl:copy-of select="/s:Envelope/s:Body/d:get_asr_idResponse/d:get_asr_idResult/d:Parameters/d:result/text()"/>"}
    </xsl:template>
</xsl:stylesheet>
