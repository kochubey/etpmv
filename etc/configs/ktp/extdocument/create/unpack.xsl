<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" extension-element-prefixes="ex"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ex="http://exslt.org/dates-and-times"
                xmlns="">
    <xsl:param name="orderId"/>
    <xsl:param name="login"/>
    <xsl:param name="houseId"/>
    <xsl:param name="flat"/>
    <xsl:param name="line"/>

    <xsl:template match="/o">
        <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
            <S:Body>
                <ns2:create xmlns:ns2="http://datumnode.com/cms/ktp/extDocument" xmlns="DatumNode">
                    <ns2:request>
                        <Command>
                            <Operation>ExecuteNonQuery</Operation>
                        </Command>
                        <ns2:Parameters>
                            <ns2:input_xml>
                                <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                <Order>
                                    <SystemName>cms</SystemName>
                                    <OrderId>
                                        <xsl:value-of select="$orderId"/>
                                    </OrderId>
                                    <OrderDate>
                                        <xsl:value-of select="ex:date-time()"/>
                                    </OrderDate>
                                    <Affiliate>201</Affiliate>
                                    <RetryCount>0</RetryCount>
                                    <Operator>
                                        <Login>
                                            <xsl:value-of select="$login"/>
                                        </Login>
                                    </Operator>
                                    <Address>
                                        <HouseId>
                                            <xsl:value-of select="$houseId"/>
                                        </HouseId>
                                        <Flat>
                                            <xsl:value-of select="$flat"/>
                                        </Flat>
                                    </Address>
                                    <OrderActions>
                                        <OrderAction>
                                            <Components>
                                                <Component>
                                                    <Id>AllLoBs</Id>
                                                    <Attributes>
                                                        <Attribute Name="ManualCheck">False</Attribute>
                                                        <Attribute Name="UseManualCheck">False</Attribute>
                                                        <Attribute Name="ExistingLines">
                                                            <ExistingLines>
                                                                <Line>
                                                                    <xsl:value-of select="$line"/>
                                                                </Line>
                                                            </ExistingLines>
                                                        </Attribute>
                                                    </Attributes>
                                                </Component>
                                            </Components>
                                        </OrderAction>
                                    </OrderActions>
                                </Order>
                                <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                            </ns2:input_xml>
                        </ns2:Parameters>
                    </ns2:request>
                </ns2:create>
            </S:Body>
        </S:Envelope>
    </xsl:template>
</xsl:stylesheet>