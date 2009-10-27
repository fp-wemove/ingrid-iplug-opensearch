<%@ include file="/WEB-INF/jsp/base/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="de">
<head>
<title>Portal U Administration</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="wemove digital solutions" />
<meta name="copyright" content="wemove digital solutions GmbH" />
<link rel="StyleSheet" href="../css/base/portal_u.css" type="text/css" media="all" />
</head>
<body>
    <div id="header">
        <img src="../images/base/logo.gif" width="168" height="60" alt="Portal U" />
        <h1>Konfiguration</h1>
        <div id="language"><a href="#">Englisch</a></div>
    </div>
    <div id="help"><a href="#">[?]</a></div>

    <c:set var="active" value="osConfig" scope="request"/>
    <c:import url="../base/subNavi.jsp"></c:import>

    <div id="contentBox" class="contentMiddle">
        <h1 id="head">Opensearch Parameter</h1>
        <div class="controls">
            <a href="../base/fieldQuery.html">Zur�ck</a>
            <a href="../base/welcome.html">Abbrechen</a>
            <a href="#" onclick="document.getElementById('osConfig').submit();">Weiter</a>
        </div>
        <div class="controls cBottom">
            <a href="../base/fieldQuery.html">Zur�ck</a>
            <a href="../base/welcome.html">Abbrechen</a>
            <a href="#" onclick="document.getElementById('osConfig').submit();">Weiter</a>
        </div>
        <div id="content">
            <form:form method="post" action="osParams.html" modelAttribute="osConfig">
                <input type="hidden" name="action" value="submit" />
                <input type="hidden" name="id" value="" />
                <table id="konfigForm">
                    <br />
                    <tr>
                        <td colspan="2"><h3>Auswahl der Quelle:</h3></td>
                    </tr>
                    <tr>
                        <td><form:radiobutton path="osDescriptor" value="descriptor" /> Deskriptor</td>
                        <td>
                            <form:input path="opensearchDescriptorUrl" />
                            <form:errors path="opensearchDescriptorUrl" cssClass="error" element="div" />
                            <br />
                            Bitte geben Sie hier die URL des Opensearch-Deskriptors an, die Sie an das InGrid System anschlie�en wollen.
                        </td>
                    </tr>
                    <tr>
                        <td><form:radiobutton path="osDescriptor" value="url" /> Url</td>
                        <td>
                            <form:input path="opensearchUrl" />
                            <form:errors path="opensearchUrl" cssClass="error" element="div" />
                            <br />
                            Bitte geben Sie hier die Opensearch URL mit Platzhaltern an, die Sie an das InGrid System anschlie�en wollen.
                            Verf�gbare Platzhalter sind ...
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><form:errors path="osDescriptor" cssClass="error" element="div" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Ranking Parameter:</h3></td>
                    </tr>
                    <tr>
                        <td class="leftCol">Ranking Unterst�tzung:</td>
                        <td>
                            <form:checkbox path="rankSupport" />
                            <br />
                            Unterst�tzt die Opensearch Schnittstelle ein Ranking der Suchergebnisse? (Wenn aktiviert, 
                            werden die Ergebnisse in die Hauptergbnisliste des Portals aufgenommen.)
                        </td>
                    </tr>
                    <tr>
                        <td class="leftCol">Adapt. Ranking (Mult.):</td>
                        <td>
                            <form:input path="rankMultiplier" />
                            <form:errors path="rankMultiplier" cssClass="error" element="div" />
                            <br />
                            Bitte geben Sie hier den Faktor an, mit dem der ranking score multipliziert werden soll.
                        </td>
                    </tr>
                    <tr>
                        <td class="leftCol">Adapt. Ranking (Add.):</td>
                        <td>
                            <form:input path="rankAddition" />
                            <form:errors path="rankAddition" cssClass="error" element="div" />
                            <br />
                            Bitte geben Sie hier den Faktor an, mit dem der ranking score addiert werden soll.
                        </td>
                    </tr>
                </table>
            </form:form>
        </div>
    </div>

    <div id="footer" style="height:100px; width:90%"></div>
</body>
</html>
