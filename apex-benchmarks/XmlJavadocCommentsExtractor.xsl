<?xml version="1.0" encoding="UTF-8"?>
<!--

    Copyright (C) 2016 DataTorrent, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

            http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

-->

<!--
    Document   : XmlJavadocCommentsExtractor.xsl
    Created on : September 16, 2014, 11:30 AM
    Description:
        The transformation strips off all information except for comments and tags from xml javadoc generated by xml-doclet.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" standalone="yes"/>

  <!-- copy xml by selecting only the following nodes, attributes and text -->
  <xsl:template match="node()|text()|@*">
    <xsl:copy>
      <xsl:apply-templates select="root|package|class|interface|method|field|type|comment|tag|text()|@name|@qualified|@text"/>
    </xsl:copy>
  </xsl:template>

  <!-- Strip off the following paths from the selected xml -->
  <xsl:template match="//root/package/interface/interface
                      |//root/package/interface/method/@qualified
                      |//root/package/class/interface
                      |//root/package/class/class
                      |//root/package/class/method/@qualified
                      |//root/package/class/field/@qualified" />

  <xsl:strip-space elements="*"/>
</xsl:stylesheet>
