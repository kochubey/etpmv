<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="extDocumentId"/>

    <xsl:template match="/o">
        {"extDocumentId": "<xsl:value-of select="$extDocumentId"/>"}
    </xsl:template>
</xsl:stylesheet>
