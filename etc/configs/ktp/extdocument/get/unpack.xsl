<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" extension-element-prefixes="ex"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ex="http://exslt.org/dates-and-times"
                xmlns="">
    <xsl:param name="extDocumentId"/>

    <xsl:template match="/o">
        <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
            <S:Body>
                <ns2:get xmlns:ns2="http://datumnode.com/cms/ktp/extDocument" xmlns="DatumNode">
                    <ns2:request>
                        <Command>
                            <Operation>ExecuteNonQuery</Operation>
                        </Command>
                        <ns2:Parameters>
                            <ns2:public_document_group_id> <xsl:value-of select="$extDocumentId"/></ns2:public_document_group_id>
                        </ns2:Parameters>
                    </ns2:request>
                </ns2:get>
            </S:Body>
        </S:Envelope>
    </xsl:template>
</xsl:stylesheet>