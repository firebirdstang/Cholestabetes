<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnrollmentSummary.aspx.cs"
    Inherits="Cholestabetes.Web.Admin.EnrollmentSummary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .blackmedium
        {
            font-size: 13px;
            color: #000;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
        .blackbold
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 24px;
            color: #000;
            font-weight: bold;
        }
        .well
        {
            min-height: 20px;
            padding: 19px;
            margin-bottom: 20px;
            background-color: #f5f5f5;
            border: 1px solid #e3e3e3;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
        }
        .well blockquote
        {
            border-color: #ddd;
            border-color: rgba(0,0,0,.15);
        }
        .well-lg
        {
            padding: 24px;
            border-radius: 6px;
        }
        .well-sm
        {
            padding: 9px;
            border-radius: 3px;
        }
        .close
        {
            float: right;
            font-size: 21px;
            font-weight: 700;
            line-height: 1;
            color: #000;
            text-shadow: 0 1px 0 #fff;
            filter: alpha(opacity=20);
            opacity: .2;
        }
        .close:hover, .close:focus
        {
            color: #000;
            text-decoration: none;
            cursor: pointer;
            filter: alpha(opacity=50);
            opacity: .5;
        }
        button.close
        {
            -webkit-appearance: none;
            padding: 0;
            cursor: pointer;
            background: 0 0;
            border: 0;
        }
    </style>
    <style type="text/css">
        html
        {
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            background-attachment: fixed;
            background-image: url(../images/backgroundimage.jpg);
            background-repeat: no-repeat;
            background-position: center center;
        }
        body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
        #wrapper
        {
            width: 1100px;
            margin-right: auto;
            margin-left: auto;
        }
        #header
        {
            background-color: rgba(255, 255, 255, 0.8);
            padding-top: 20px;
            padding-bottom: 20px;
            border-radius: 0px 0px 25px 25px;
        }
        #portal
        {
            margin-bottom: 170px;
            text-align: right;
            padding-right: 20px;
            padding-left: 20px;
        }
        #body
        {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 35px;
            border-radius: 25px 25px 0px 0px;
        }
        #left
        {
            float: left;
            width: 320px;
        }
        #right
        {
            float: left;
            width: 1000px;
        }
        #content
        {
            background-color: #FFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 18px;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        #footer
        {
            padding-top: 20px;
            border-top-width: thin;
            border-top-style: solid;
            border-top-color: #666;
            margin-top: 20px;
        }
        .whitesmall
        {
            font-size: 9px;
            color: #FFF;
        }
        .whitemedium
        {
            font-size: 13px;
            color: #FFF;
        }
        .bodySMALL
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #333;
        }
        .whitelarge
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 16px;
            color: #FFF;
        }
        .line
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #333;
            border: thin solid #999;
        }
        .submit
        {
            -moz-box-shadow: inset 0px 1px 0px 0px #f29c93;
            -webkit-box-shadow: inset 0px 1px 0px 0px #f29c93;
            box-shadow: inset 0px 1px 0px 0px #f29c93;
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ff6e5e), color-stop(1, #ce0100) );
            background: -moz-linear-gradient( center top, #ff6e5e 5%, #ce0100 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff6e5e', endColorstr='#ce0100');
            background-color: #ff6e5e;
            -webkit-border-top-left-radius: 20px;
            -moz-border-radius-topleft: 20px;
            border-top-left-radius: 20px;
            -webkit-border-top-right-radius: 20px;
            -moz-border-radius-topright: 20px;
            border-top-right-radius: 20px;
            -webkit-border-bottom-right-radius: 20px;
            -moz-border-radius-bottomright: 20px;
            border-bottom-right-radius: 20px;
            -webkit-border-bottom-left-radius: 20px;
            -moz-border-radius-bottomleft: 20px;
            border-bottom-left-radius: 20px;
            text-indent: 0;
            border: 1px solid #d83526;
            display: inline-block;
            color: #ffffff;
            font-family: Arial;
            font-size: 15px;
            font-weight: bold;
            font-style: normal;
            height: 40px;
            line-height: 40px;
            width: 90px;
            text-decoration: none;
            text-align: center;
            text-shadow: 1px 1px 0px #b23e35;
        }
        .submit:hover
        {
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ce0100), color-stop(1, #ff6e5e) );
            background: -moz-linear-gradient( center top, #ce0100 5%, #ff6e5e 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100', endColorstr='#ff6e5e');
            background-color: #ce0100;
        }
        .submit:active
        {
            position: relative;
            top: 1px;
        }
        .cancel
        {
            -moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
            -webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
            box-shadow: inset 0px 1px 0px 0px #ffffff;
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
            background: -moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
            background-color: #ededed;
            -webkit-border-top-left-radius: 20px;
            -moz-border-radius-topleft: 20px;
            border-top-left-radius: 20px;
            -webkit-border-top-right-radius: 20px;
            -moz-border-radius-topright: 20px;
            border-top-right-radius: 20px;
            -webkit-border-bottom-right-radius: 20px;
            -moz-border-radius-bottomright: 20px;
            border-bottom-right-radius: 20px;
            -webkit-border-bottom-left-radius: 20px;
            -moz-border-radius-bottomleft: 20px;
            border-bottom-left-radius: 20px;
            text-indent: 0;
            border: 1px solid #dcdcdc;
            display: inline-block;
            color: #777777;
            font-family: Arial;
            font-size: 15px;
            font-weight: bold;
            font-style: normal;
            height: 40px;
            line-height: 40px;
            width: 90px;
            text-decoration: none;
            text-align: center;
            text-shadow: 1px 1px 0px #ffffff;
        }
        .cancel:hover
        {
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed) );
            background: -moz-linear-gradient( center top, #dfdfdf 5%, #ededed 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed');
            background-color: #dfdfdf;
        }
        .cancel:active
        {
            position: relative;
            top: 1px;
        }
    </style>
    <script type="text/javascript">
        function MM_swapImgRestore() { //v3.0
            var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }
        function MM_preloadImages() { //v3.0
            var d = document; if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n); return x;
        }

        function MM_swapImage() { //v3.0
            var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
        }
    </script>
</head>
<body>
    <form runat="server">
    <div id="enrollment" class="well" style="max-width: 44em;">
        <table width="600" align="center" cellpadding="10" cellspacing="0" bordercolor="#CCCCCC">
            <tr>
                <td height="35" colspan="3" align="center" bgcolor="#CCCCCC" class="blackbold">
                    <br />
                    <span style="color: #C00">ENROLLMENT SUMMARY</span><br />
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <table width="90%" border="0">
                        <tr>
                            <td width="30%" height="35" align="right" title="Memorandum of Understanding" class="blackmedium">
                                MOU
                            </td>
                            <td colspan="2" align="left">
                                <asp:Label runat="server" ID="lblMou" ForeColor="Green" Text="Not Received" class="blackmedium" />
                            </td>
                        </tr>
                        <tr>
                            <td width="30%" height="35" align="right" title="Memorandum of Understanding" class="blackmedium">
                                Assesment Survey
                            </td>
                            <td colspan="2" align="left">
                                <asp:Label runat="server" ID="lblAsses" ForeColor="Green" Text="Not Received" class="blackmedium" />
                            </td>
                        </tr>
                        <tr>
                            <td width="30%" height="35" align="right" title="Memorandum of Understanding" class="blackmedium">
                                Payee Information
                            </td>
                            <td colspan="2" align="left">
                                <asp:Label runat="server" ID="lblPayee" ForeColor="Green" Text="Not Received" class="blackmedium" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table width="90%" border="0" bgcolor="#CCCCCC" cellpadding="5">
                        <tr>
                            <td width="30%" height="35" align="right" class="blackmedium">
                                <span style="color: #C00; font-size: 16px; text-decoration: underline">Visit 1:</span>
                            </td>
                            <td colspan="2" align="left">
                            </td>
                        </tr>
                        <tr>
                            <td height="35" align="right" class="blackmedium">
                                Number of Patients:
                            </td>
                            <td height="35" colspan="2" align="left">
                                <asp:Label runat="server" ID="lblNumPatientsV1" ForeColor="Green" class="blackmedium" />
                            </td>
                        </tr>
                        <tr>
                            <td height="35" align="right" class="blackmedium">
                                Payment Status:
                            </td>
                            <td height="35" colspan="2" align="left">
                                <asp:TextBox runat="server" size="45" ID="txtPmtStatus1" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table width="90%" border="0" bgcolor="#CCCCCC" cellpadding="5">
                        <tr>
                            <td width="30%" height="35" align="right" class="blackmedium">
                                <span style="color: #C00; font-size: 16px; text-decoration: underline">Visit 2:</span>
                            </td>
                            <td colspan="2" align="left">
                            </td>
                        </tr>
                        <tr>
                            <td height="35" align="right" class="blackmedium">
                                Number of Patients:
                            </td>
                            <td height="35" colspan="2" align="left">
                                <asp:Label runat="server" ID="lblNumPatientsV2" ForeColor="Green" class="blackmedium" />
                            </td>
                        </tr>
                        <tr>
                            <td height="35" align="right" class="blackmedium">
                                Payment Status:
                            </td>
                            <td height="35" colspan="2" align="left">
                                <asp:TextBox runat="server" size="45" ID="txtPmtStatus2" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table width="90%" border="0" bgcolor="#CCCCCC" cellpadding="5">
                        <tr>
                            <td width="30%" height="35" align="right" class="blackmedium">
                                <span style="color: #C00; font-size: 16px; text-decoration: underline">Visit 3:</span>
                            </td>
                            <td colspan="2" align="left">
                            </td>
                        </tr>
                        <tr>
                            <td height="35" align="right" class="blackmedium">
                                Number of Patients:
                            </td>
                            <td height="35" colspan="2" align="left">
                                <asp:Label runat="server" ID="lblNumPatientsV3" ForeColor="Green" class="blackmedium" />
                            </td>
                        </tr>
                        <tr>
                            <td height="35" align="right" class="blackmedium">
                                Payment Status:
                            </td>
                            <td height="35" colspan="2" align="left">
                                <asp:TextBox runat="server" size="45" ID="txtPmtStatus3" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table width="90%" border="0">
                        <tr>
                             
                            <td align="right">
                             <asp:LinkButton Text="Save" runat="server" CssClass="submit" ID="btnSave" OnClick="btnSave_Click" />
                                <a onclick="javascript:parent.$.fancybox.close();" href="#" class="cancel enrollment_close btn btn-default">
                                    Exit</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
