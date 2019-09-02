<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:teidocx="http://www.tei-c.org/ns/teidocx/1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="tei html teidocx xs"
   version="2.0">

   <xsl:import href="../../../../pub-XSLT/Stylesheets/html5-foundation6-chs/to.xsl"/>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
      <desc>
         <p>TEI stylesheet for making HTML5 output (Zurb Foundation 6 http://foundation.zurb.com/sites/docs/).</p>
         <p>This software is dual-licensed:
            
            1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
            Unported License http://creativecommons.org/licenses/by-sa/3.0/ 
            
            2. http://www.opensource.org/licenses/BSD-2-Clause
            
            
            
            Redistribution and use in source and binary forms, with or without
            modification, are permitted provided that the following conditions are
            met:
            
            * Redistributions of source code must retain the above copyright
            notice, this list of conditions and the following disclaimer.
            
            * Redistributions in binary form must reproduce the above copyright
            notice, this list of conditions and the following disclaimer in the
            documentation and/or other materials provided with the distribution.
            
            This software is provided by the copyright holders and contributors
            "as is" and any express or implied warranties, including, but not
            limited to, the implied warranties of merchantability and fitness for
            a particular purpose are disclaimed. In no event shall the copyright
            holder or contributors be liable for any direct, indirect, incidental,
            special, exemplary, or consequential damages (including, but not
            limited to, procurement of substitute goods or services; loss of use,
            data, or profits; or business interruption) however caused and on any
            theory of liability, whether in contract, strict liability, or tort
            (including negligence or otherwise) arising in any way out of the use
            of this software, even if advised of the possibility of such damage.
         </p>
         <p>Andrej Pančur, Institute for Contemporary History</p>
         <p>Copyright: 2013, TEI Consortium</p>
      </desc>
   </doc>
  
   <!-- Uredi parametre v skladu z dodatnimi zahtevami za pretvorbo te publikacije: -->
   <!-- ../../../  -->
   <!-- https://www2.sistory.si/publikacije/ -->
   <xsl:param name="path-general">https://www2.sistory.si/publikacije/</xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/to.xsl -->
   <xsl:param name="outputDir">docs/</xsl:param>
   
   <xsl:param name="homeLabel">ZZDS</xsl:param>
   <xsl:param name="homeURL">http://zzds.si/</xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/my-html_param.xsl -->
   <xsl:param name="title-bar-sticky">false</xsl:param>
   
   <xsl:param name="chapterAsSIstoryPublications">false</xsl:param>
   
   <!-- odstranim pri spodnjih param true -->
   <xsl:param name="numberFigures"></xsl:param>
   <xsl:param name="numberFrontTables"></xsl:param>
   <xsl:param name="numberHeadings"></xsl:param>
   <xsl:param name="numberParagraphs"></xsl:param>
   <xsl:param name="numberTables"></xsl:param>
   
   <!-- V html/head izpisani metapodatki -->
   <xsl:param name="description"></xsl:param>
   <xsl:param name="keywords"></xsl:param>
   <xsl:param name="title"></xsl:param>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Ne procesiram štetja besed v kolofonu</desc>
   </doc>
   <xsl:template name="countWords"/>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za naslovno (index.html) stran</desc>
      <param name="thisChapter-id"></param>
      <param name="thisLanguage"></param>
      <param name="title-bar-type"></param>
      <param name="sistoryParentPath"></param>
   </doc>
   <xsl:template name="header-index">
      <xsl:param name="thisChapter-id"/>
      <xsl:param name="thisLanguage"/>
      <xsl:param name="title-bar-type"/>
      <xsl:param name="sistoryParentPath"/>
      <li>
         <!-- večjezično poimenovanje index html datotek -->
         <xsl:variable name="index-html">
            <xsl:choose>
               <xsl:when test="$thisLanguage != $languages-locale-primary">
                  <xsl:value-of select="concat('index','-',$thisLanguage)"/>
               </xsl:when>
               <xsl:otherwise>index</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:if test="$thisChapter-id = $index-html">
            <xsl:attribute name="class">active</xsl:attribute>
         </xsl:if>
         <a>
            <xsl:attribute name="href">
               <xsl:choose>
                  <xsl:when test="ancestor::tei:teiCorpus and ancestor-or-self::tei:TEI[@xml:id]">
                     <xsl:value-of select="concat($sistoryParentPath,ancestor-or-self::tei:TEI/@xml:id,'.html')"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="concat($sistoryParentPath,$index-html,'.html')"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:attribute>
            <xsl:text>Domov</xsl:text>
         </a>
      </li>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za front front/div</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-front-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>O društvu</xsl:text>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za glavno vsebino (glavna navigacija)</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-body-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>Novice</xsl:text>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za izpis naziva bibliografije na gornji navigaciji</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-bibl-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>Zbirka ZZDS</xsl:text>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za izpis naziva priloge na gornji navigaciji</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-appendix-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>Zborovanja ZZDS</xsl:text>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za izpis study na gornji navigaciji</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-study-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>Nagrade KLIO</xsl:text>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>V css in javascript Hook dodam imageViewer</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="cssHook">
      <xsl:if test="$title-bar-sticky = 'true'">
         <xsl:value-of select="concat($path-general,'themes/css/foundation/6/sistory-sticky_title_bar.css')"/>
      </xsl:if>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.min.css" rel="stylesheet" type="text/css" />
      <link href="{concat($path-general,'themes/plugin/TipueSearch/6.1/tipuesearch/css/normalize.css')}" rel="stylesheet" type="text/css" />
      <link href="{concat($path-general,'themes/css/plugin/TipueSearch/6.1/my-tipuesearch.css')}"  rel="stylesheet" type="text/css" />
      <!-- dodan imageViewer -->
      <link href="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/imageviewer.css')}"  rel="stylesheet" type="text/css" />
   </xsl:template>
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>[html] Hook where extra Javascript functions can be defined</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="javascriptHook">
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/jquery.js')}"></script>
      <!-- za highcharts -->
      <xsl:if test="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']]">
         <xsl:variable name="jsfile" select="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']][1]/tei:graphic[@mimeType = 'application/javascript']/@url"/>
         <xsl:variable name="chart-jsfile" select="document($jsfile)/html/body/script[1]/@src"/>
         <script src="{$chart-jsfile[1]}"></script>
      </xsl:if>
      <!-- za back-to-top in highcharts je drugače potrebno dati jquery, vendar sedaj ne rabim dodajati jquery kodo,
         ker je že vsebovana zgoraj -->
      <!-- dodan imageViewer -->
      <script src="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/imageviewer.js')}"></script>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend='imageviewer']">
      <figure id="{@xml:id}">
         <img class="imageviewer" style="height:600px;" src="{tei:graphic[contains(@url,'normal')]/@url}" data-high-res-src="{tei:graphic[1]/@url}" alt="{normalize-space(tei:head)}"/>
         <figcaption>
            <xsl:value-of select="normalize-space(tei:head)"/>
         </figcaption>
      </figure>
      <br/>
      <br/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Orbit - slides. Vedno so kodirani kot figure/figure</desc>
   </doc>
   <xsl:template match="tei:figure[@rend='orbit']">
      <!-- anchors -->
      <xsl:for-each select="tei:figure">
         <a id="{@xml:id}"></a>
      </xsl:for-each>
      <div class="row">
         <div class="small-12 medium-10 large-8 small-centered columns">
            <div class="orbit" role="region" aria-label="Slike, Pictures" data-orbit="">
               <div class="orbit-wrapper">
                  <div class="orbit-controls">
                     <button class="orbit-previous"><span class="show-for-sr">Previous Slide</span>&#9664;&#xFE0E;</button>
                     <button class="orbit-next"><span class="show-for-sr">Next Slide</span>&#9654;&#xFE0E;</button>
                  </div>
                  <ul class="orbit-container" id="{@xml:id}">
                     <xsl:for-each select="tei:figure">
                        <li>
                           <xsl:attribute name="class">
                              <xsl:choose>
                                 <xsl:when test="position() = 1">orbit-slide is-active</xsl:when>
                                 <xsl:otherwise>orbit-slide</xsl:otherwise>
                              </xsl:choose>
                           </xsl:attribute>
                           <figure class="orbit-figure" style="height: 300px; width: 400px; display: block; margin-left: auto; margin-right: auto;">
                              <img class="orbit-image imageviewer" 
                                 src="{tei:graphic[@n='thumb']/@url}" data-high-res-src="{tei:graphic[@n='normal']/@url}"/>
                              <!--<figcaption class="orbit-caption">
                                 <xsl:value-of select="normalize-space(tei:head)"/>
                              </figcaption>-->
                           </figure>
                        </li>
                     </xsl:for-each>
                  </ul>
               </div>
               <nav class="orbit-bullets">
                  <xsl:for-each select="tei:figure">
                     <button data-slide="{position() - 1}">
                        <xsl:if test="position() = 1">
                           <xsl:attribute name="class">is-active</xsl:attribute>
                        </xsl:if>
                        <span class="show-for-sr">
                           <xsl:value-of select="normalize-space(tei:head)"/>
                        </span>
                     </button>
                  </xsl:for-each>
               </nav>
            </div>
         </div>
      </div>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>Dodam zaključni javascript za ImageViewer</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="bodyEndHook">
      <script type="text/javascript">
         
         $(function () {
         var viewer = ImageViewer();
         $('.imageviewer').click(function () {
         var imgSrc = this.src,
         highResolutionImage = $(this).data('high-res-src');
         viewer.show(imgSrc, highResolutionImage);
         });
         });
      </script>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/what-input.js')}"></script>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/foundation.min.js')}"></script>
      <script src="{concat($path-general,'themes/foundation/6/js/app.js')}"></script>
      <!-- back-to-top -->
      <script src="{concat($path-general,'themes/js/plugin/back-to-top/back-to-top.js')}"></script>
   </xsl:template>
   
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Sem moral okleščiti prvotni listBibl is sistory profila, ker je dvakrat kazal listBibl/head</desc>
   </doc>
   <xsl:template match="tei:listBibl">
      <ul>
         <xsl:if test="@xml:id">
            <xsl:attribute name="id">
               <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates/>
      </ul>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Spremenil samo vrstni red v zgornji navigaciji: dal study za appendix</desc>
      <param name="thisChapter-id"></param>
      <param name="thisLanguage"></param>
      <param name="title-bar-type"></param>
   </doc>
   <xsl:template name="title-bar-list-of-contents">
      <xsl:param name="thisChapter-id"/>
      <xsl:param name="thisLanguage"/>
      <xsl:param name="title-bar-type"/>
      <xsl:variable name="sistoryParentPath">
         <xsl:choose>
            <xsl:when test="self::tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='sistory']">
               <xsl:variable name="teiParentId" select="self::tei:teiCorpus/@xml:id"/>
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="$teiParentId"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='sistory']">
               <xsl:variable name="teiParentId" select="ancestor-or-self::tei:TEI/@xml:id"/>
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="$teiParentId"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
      </xsl:variable>
      <!-- Poiščemo vse možne dele publikacije -->
      <!-- Naslovnica - index.html je vedno, kadar ni procesirano iz teiCorpus in ima hkrati TEI svoj xml:id -->
      <xsl:call-template name="header-index">
         <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
         <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
         <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
         <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
      </xsl:call-template>
      <!-- kolofon: CIP in teiHeader -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:front/tei:divGen[@type='cip' or @type='teiHeader']">
         <xsl:call-template name="header-colophon">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- kolofon CIP za teiCorpus za revije: TODO za večjezičnost-locale -->
      <xsl:if test="self::tei:teiCorpus and $write-teiCorpus-cip='true'">
         <li>
            <xsl:if test="$thisChapter-id='cip'">
               <xsl:attribute name="class">active</xsl:attribute>
            </xsl:if>
            <xsl:variable name="sistoryPath">
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="self::tei:teiCorpus/@xml:id"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:variable>
            <a href="{concat($sistoryPath,'impressum.html')}">
               <xsl:sequence select="tei:i18n('impressum')"/>
            </a>
         </li>
      </xsl:if>
      <!-- TEI kolofon za teiCorpus za revije: TODO za večjezičnost-locale -->
      <xsl:if test="self::tei:teiCorpus and $write-teiCorpus-teiHeader='true'">
         <li>
            <xsl:if test="$thisChapter-id='teiHeader'">
               <xsl:attribute name="class">active</xsl:attribute>
            </xsl:if>
            <xsl:variable name="sistoryPath">
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="self::tei:teiCorpus/@xml:id"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:variable>
            <a href="{concat($sistoryPath,'teiHeader.html')}">
               <xsl:sequence select="tei:i18n('teiHeader')"/>
            </a>
         </li>
      </xsl:if>
      <!-- kazalo toc titleAuthor za teiCorpus za revije (predpogoj: tei:text mora imeti @n): TODO za večjezičnost-locale -->
      <xsl:if test="self::tei:teiCorpus and $write-teiCorpus-toc_titleAuthor='true'">
         <li>
            <xsl:if test="$thisChapter-id='tocJournal'">
               <xsl:attribute name="class">active</xsl:attribute>
            </xsl:if>
            <xsl:variable name="sistoryPath">
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="self::tei:teiCorpus/@xml:id"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:variable>
            <a href="{concat($sistoryPath,'tocJournal.html')}">
               <xsl:sequence select="tei:i18n('tocJournal')"/>
            </a>
         </li>
      </xsl:if>
      <!-- kazalo toc -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:front/tei:divGen[@type='toc']">
         <xsl:call-template name="header-toc">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Uvodna poglavja v tei:front -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:front/tei:div">
         <xsl:call-template name="header-front">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Osrednji del besedila v tei:body - Poglavja -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:body/tei:div">
         <xsl:call-template name="header-body">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Content: divGen, ki požene prazen template divGen-process-content,
             v katerega lahko vstavimo pretvorbo za dinamično prikazovanje glavne vsebine -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:body/tei:divGen[@type='content']">
         <xsl:call-template name="header-content">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- viri in literatura v tei:back -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:back/tei:div[@type='bibliogr']">
         <xsl:call-template name="header-bibliogr">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Priloge v tei:back -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:back/tei:div[@type='appendix']">
         <xsl:call-template name="header-appendix">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Spremne besedila/študije k digitalnim izdajam -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:back/tei:div[@type='study']">
         <xsl:call-template name="header-study">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- povzetki -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:back/tei:div[@type='summary']">
         <xsl:call-template name="header-summary">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Indeksi (oseb, krajev in organizacij) v divGen ali v div -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:back/*[self::tei:divGen or self::tei:div][@type='index']">
         <xsl:call-template name="header-back-index">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- languages - locale -->
      <xsl:if test="$languages-locale='true'">
         <xsl:call-template name="header-locale">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:note[@type='description']">
      <ul class="accordion" data-accordion="" data-allow-all-closed="true">
         <li class="accordion-item" data-accordion-item="">
            <a href="#" class="accordion-title">Življenjepis</a>
            <div class="accordion-content" data-tab-content="">
               <xsl:apply-templates/>
            </div>
         </li>
      </ul>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>Na naslovno stran dam diske z naslovi vseh novic</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template match="tei:titlePage">
      <!-- je samo naslov -->
      <xsl:for-each select="tei:docTitle/tei:titlePart[1]">
         <h1 class="text-center"><xsl:value-of select="."/></h1>
         <xsl:for-each select="following-sibling::tei:titlePart">
            <h1 class="subheader podnaslov"><xsl:value-of select="."/></h1>
         </xsl:for-each>
      </xsl:for-each>
      <figure>
         <img src="wp-legacy/uploads/2016/11/logo-zzds.png"/>
      </figure>
      <br/>
      <hr/>
      <h2>Novice:</h2>
      <xsl:for-each select="ancestor::tei:text/tei:body/tei:div">
         <div class="callout { if (position() = 1) then 'alert' else 'secondary'}" data-closable="">
            <xsl:choose>
               <xsl:when test="position() = 1">
                  <h3>
                     <xsl:value-of select="tei:head"/>
                  </h3>
                  <span class="label alert">
                     <xsl:value-of select="format-date(tei:docDate/@when,'[D1]. [M1]. [Y0001]')"/>
                  </span>
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>
                  <h3>
                     <xsl:value-of select="tei:head"/>
                  </h3>
                  <span class="label secondary">
                     <xsl:value-of select="format-date(tei:docDate/@when,'[D1]. [M1]. [Y0001]')"/>
                  </span>
                  <p>
                     <a href="{@xml:id}.html">Preberi novico</a>
                  </p>
               </xsl:otherwise>
            </xsl:choose>
            <button class="close-button" aria-label="Dismiss alert" type="button" data-close="" style="background-color: inherit;">
               <span aria-hidden="true">&#xD7;</span>
            </button>
         </div>
      </xsl:for-each>
   </xsl:template>
   
</xsl:stylesheet>
