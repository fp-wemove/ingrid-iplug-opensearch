<%@ include file="/WEB-INF/jsp/base/include.jsp" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page import="de.ingrid.admin.security.IngridPrincipal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="de">
<head>
<title><fmt:message key="OpensearchConfig.main.title"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="wemove digital solutions" />
<meta name="copyright" content="wemove digital solutions GmbH" />
<link rel="StyleSheet" href="../css/base/portal_u.css" type="text/css" media="all" />

<script type="text/javascript">

    function setListener() {    
        mappingField = document.getElementById("mapping");
        mappingField.onchange = function() { checkMapping(this); }
        checkMapping(mappingField);
    }
    
    function checkMapping(obj) {
        if (obj.checked == true) {
            document.getElementById("konfigForm").style.display = "block";
        } else {
            document.getElementById("konfigForm").style.display = "none";
        }
    }
</script>

</head>

<body onLoad="setListener()">

	<div id="header">
        <img src="../images/base/logo.gif" width="168" height="60" alt="Portal U" />
        <h1><fmt:message key="OpensearchConfig.main.configuration"/></h1>
        <%
          java.security.Principal  principal = request.getUserPrincipal();
          if(principal != null && !(principal instanceof IngridPrincipal.SuperAdmin)) {
        %>
            <div id="language"><a href="../base/auth/logout.html"><fmt:message key="OpensearchConfig.main.logout"/></a></div>
        <%
          }
        %>
    </div>
    <div id="help"><a href="#">[?]</a></div>

    <c:set var="active" value="osIngridMapping" scope="request"/>
    <c:import url="../base/subNavi.jsp"></c:import>

    <div id="contentBox" class="contentMiddle">
    	<h1 id="head">Opensearch Mapping</h1>
        <div class="controls">
            <a href="../iplug-pages/osParams.html">Zur�ck</a>
            <a href="../base/welcome.html">Abbrechen</a>
            <a href="#" onclick="document.getElementById('mapConfig').submit();">Weiter</a>
        </div>
        <div class="controls cBottom">
            <a href="../iplug-pages/osParams.html">Zur�ck</a>
            <a href="../base/welcome.html">Abbrechen</a>
            <a href="#" onclick="document.getElementById('mapConfig').submit();">Weiter</a>
        </div>
        <div id="content">
        	<form:form method="post" action="osIngridMapping.html" modelAttribute="mapConfig">
				<table>
	            	<tr>
                        <td colspan="2"><h3>Eigenschaften der Quelle:</h3></td>
                    </tr>
                    <tr>
                        <td width="180px" style="vertical-align:top;">Mapping-Unterst�tzung</td>
                        <td>
                        	<form:checkbox path="useMapping" id="mapping" />
                            <br />
                            Aktivieren Sie diese Checkbox, wenn die anzuschlie�ende Opensearch-Schnittstelle die Gruppierung
                            von Ergebnissen unterst�tzt. Es ist dann m�glich nach Dom�ne, Partner und Anbieter zu gruppieren.
                        </td>
                    </tr>
                </table>
                <br />
                <table id="konfigForm">
    				<thead>
    					<tr>
    						<th width="140px" align="left">Mapping aktivieren</th>
    						<th align="left">zu mappen auf:</th>
    						<th width="175px" align="left">als Parameter hinzuf�gen</th>
    					</tr>
    				</thead>
    				<tr>
    					<td><form:checkbox path="forDomain" id="forDomain" label="Domain" /></td>
    					<td>
    						<form:input path="mapDomain" />
    						<form:errors path="mapDomain" cssClass="error" element="div" />
    					</td>
    					<td><form:checkbox path="domainAsParam" id="domainAsParam" /></td>
    				</tr>
    				<tr>
    					<td><form:checkbox path="forProvider" id="forProvider" label="Anbieter" /></td>
    					<td>
    						<form:input path="mapProvider" />
    						<form:errors path="mapProvider" cssClass="error" element="div" />
    					</td>
    					<td><form:checkbox path="providerAsParam" id="providerAsParam" /></td>
    				</tr>
    				<tr>
    					<td><form:checkbox path="forPartner" id="forPartner" label="Partner" /></td>
    					<td>
    						<form:input path="mapPartner" />
    						<form:errors path="mapPartner" cssClass="error" element="div" />
    					</td>
    					<td><form:checkbox path="partnerAsParam" id="partnerAsParam" /></td>
    				</tr>
    				<tr>
    					<td colspan="3">
    						<br />
    						Wird das Mapping aktiviert, dann wird das entsprechende Feld auf einen hier
    						angegebenen neuen Feldnamen gemappt. Steht in der IngridQuery also "partner:bw",
    						dann wird dies zu "&lt;gemapptes Feld von Partner&gt;:bw". Wird die Checkbox "als Parameter
    						hinzuf�gen" ausgew�hlt, dann wird das gemappte Feld inkl. Wert als Parameter an
    						die Opensearch-Query angeh�ngt. Ansonsten wird dieser innerhalb des Suchbegriffs
    						aufgenommen.
    					</td>
    				</tr>
    			</table>
    		</form:form>
    	</div>
    
    </div>
    <div id="footer" style="height:100px; width:90%"></div>
</body>
</html>