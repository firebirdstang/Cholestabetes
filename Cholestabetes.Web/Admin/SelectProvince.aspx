<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectProvince.aspx.cs"
    Inherits="Cholestabetes.Web.Admin.SelectProvince" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            padding-top: 5px;
            padding-bottom: 100px;
            border-radius: 0px 0px 25px 25px;
            padding-right: 20px;
            padding-left: 20px;
        }
        #body
        {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 35px;
            border-radius: 25px 25px 0px 0px;
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
        .whitelarge
        {
            font-size: 20px;
            color: #FFF;
        }
        .small
        {
            font-size: 9px;
        }
           .emailLink
        {
            color:Black; 
            text-decoration:none;  
        }
        
    </style>
    <style type="text/css">
        .classname
        {
            -moz-box-shadow: inset 0px 1px 0px 0px #f5978e;
            -webkit-box-shadow: inset 0px 1px 0px 0px #f5978e;
            box-shadow: inset 0px 1px 0px 0px #f5978e;
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f24537), color-stop(1, #c62d1f) );
            background: -moz-linear-gradient( center top, #f24537 5%, #c62d1f 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537', endColorstr='#c62d1f');
            background-color: #f24537;
            -webkit-border-top-left-radius: 38px;
            -moz-border-radius-topleft: 38px;
            border-top-left-radius: 38px;
            -webkit-border-top-right-radius: 38px;
            -moz-border-radius-topright: 38px;
            border-top-right-radius: 38px;
            -webkit-border-bottom-right-radius: 38px;
            -moz-border-radius-bottomright: 38px;
            border-bottom-right-radius: 38px;
            -webkit-border-bottom-left-radius: 38px;
            -moz-border-radius-bottomleft: 38px;
            border-bottom-left-radius: 38px;
            text-indent: 0px;
            border: 1px solid #d02718;
            display: inline-block;
            color: #ffffff;
            font-family: Arial;
            font-size: 15px;
            font-weight: bold;
            font-style: normal;
            height: 34px;
            line-height: 34px;
            width: 135px;
            text-decoration: none;
            text-align: center;
            text-shadow: 1px 1px 0px #810e05;
        }
        .classname:hover
        {
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f24537) );
            background: -moz-linear-gradient( center top, #c62d1f 5%, #f24537 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24537');
            background-color: #c62d1f;
        }
        .classname:active
        {
            position: relative;
            top: 1px;
        }
    </style>
    <style type="text/css">
        .classname2
        {
            -moz-box-shadow: inset 0px 1px 0px 0px #f5978e;
            -webkit-box-shadow: inset 0px 1px 0px 0px #f5978e;
            box-shadow: inset 0px 1px 0px 0px #f5978e;
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f24537), color-stop(1, #c62d1f) );
            background: -moz-linear-gradient( center top, #f24537 5%, #c62d1f 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537', endColorstr='#c62d1f');
            background-color: #f24537;
            -webkit-border-top-left-radius: 38px;
            -moz-border-radius-topleft: 38px;
            border-top-left-radius: 38px;
            -webkit-border-top-right-radius: 38px;
            -moz-border-radius-topright: 38px;
            border-top-right-radius: 38px;
            -webkit-border-bottom-right-radius: 38px;
            -moz-border-radius-bottomright: 38px;
            border-bottom-right-radius: 38px;
            -webkit-border-bottom-left-radius: 38px;
            -moz-border-radius-bottomleft: 38px;
            border-bottom-left-radius: 38px;
            text-indent: 0px;
            border: 1px solid #d02718;
            display: inline-block;
            color: #ffffff;
            font-family: Arial;
            font-size: 11px;
            font-weight: bold;
            font-style: normal;
            height: 15px;
            line-height: 15px;
            width: 80px;
            text-decoration: none;
            text-align: center;
            text-shadow: 1px 1px 0px #810e05;
        }
        .classname2:hover
        {
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f24537) );
            background: -moz-linear-gradient( center top, #c62d1f 5%, #f24537 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24537');
            background-color: #c62d1f;
        }
        .classname2:active
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
    <form id="form1" runat="server">
    <div id="wrapper">
        <div id="header">
            <img src="../images/logo.png" style="float: left; margin-top: 20px" />
            <table width="25%" border="0" cellspacing="0" cellpadding="5" style="float: right;">
                <tr>
                    <td align="center" valign="middle" style="font-family: Arial, Helvetica, sans-serif;
                        font-size: 10px; text-align: right">
                        <img src="../images/Valeant_logo.png" width="228" height="56" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <img src="../images/home_button.png" />
                                </td>
                                <td>
                                    <img src="../images/contact_button.png" />
                                </td>
                                <td>
                                    <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out"
                                        LogoutPageUrl="~/" LogoutImageUrl="~/images/logout_button.png" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>
        <!--end of header-->
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div id="body">
            <table width="60%" border="0" cellspacing="0" cellpadding="5" align="center" style="border-color: #000;
                border-style: solid; border-width: thin; margin-top: 10px">
                <tr>
                    <td class="whitelarge" style="background-color: #000; font-family: Arial, Helvetica, sans-serif;
                        text-align: center; font-size: 14pt">
                        <p>
                            Please select your region / S'il vous plaît choisir votre région</p>
                    </td>
                </tr>
                <tr>
                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; text-align: center">
                        <p>
                            <br />
                            <asp:ImageButton ImageUrl="~/images/ab-button.png" runat="server" ID="imgAB" OnClick="imgAB_clicked" /><br />
                            <asp:ImageButton ImageUrl="~/images/bc-button.png" runat="server" ID="imgBC" OnClick="imgBC_clicked" /><br />
                            <asp:ImageButton ImageUrl="~/images/mb-button.png" runat="server" ID="imgMB" OnClick="imgMB_clicked" /><br />
                            <asp:ImageButton ImageUrl="~/images/sk-button.png" runat="server" ID="imgSK" OnClick="imgSK_clicked" /><br />
                            <asp:ImageButton ImageUrl="~/images/ontario_button.png" runat="server" ID="imgON"
                                OnClick="imgON_clicked" /><br />
                            <asp:ImageButton ImageUrl="~/images/quebec_button.png" runat="server" ID="imgQC"
                                OnClick="imgQC_clicked" /><br />
                            <asp:ImageButton ImageUrl="~/images/ns-button.png" runat="server" ID="imgNS" OnClick="imgNS_clicked" /><br />
                            <asp:ImageButton ImageUrl="~/images/nb-button.png" runat="server" ID="imgNB" OnClick="imgNB_clicked" /><br />
                            <asp:ImageButton ImageUrl="~/images/nl-button.png" runat="server" ID="imgNL" OnClick="imgNL_clicked" /><br />
                            <asp:ImageButton ImageUrl="~/images/all_button.png" runat="server" ID="imgAll" OnClick="imgAll_clicked" />
                            <br />
                            <br />
                            <br />
                            <br />
                        </p>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <div id="footer">
                <table width="100%" border="0">
                    <tr>
                        <td width="20%">
                            <img src="../images/chrc_logo.png" />
                        </td>
                        <td style="font-family: Arial, Helvetica, sans-serif;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-family: Arial, Helvetica, sans-serif">
                                <tr>
                                    <td width="40%" style="font-size: 14px">
                                        <strong>Lianne Goldin</strong>
                                    </td>
                                    <td width="30%" style="font-size: 14px">
                                        <strong>Dija Chang Kit</strong>
                                    </td>
                                    <td width="30%" style="font-size: 14px">
                                        <strong>Elana Dikchtein</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 10px">
                                        Executive Director, Department of Continuing Medical Education<br />
                                        <br />
                                    </td>
                                    <td style="font-size: 10px">
                                        Project Leader<br />
                                        <br />
                                    </td>
                                    <td style="font-size: 10px">
                                        Project Coordinator<br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 10px;">
                                        <a href="mailto:lgoldin@CHRC.net" class="emailLink">
                                            <asp:Image ID="Image1" ImageUrl="~/images/icon1.png" runat="server" valign="middle" />
                                            lgoldin@CHRC.net</a>
                                    </td>
                                    <td style="font-size: 10px;">
                                        <a href="mailto:changkitdija@chrc.net" class="emailLink">
                                            <asp:Image ID="Image2" ImageUrl="~/images/icon1.png" runat="server" valign="middle" />
                                            changkitdija@chrc.net</a>
                                    </td>
                                    <td style="font-size: 10px;">
                                        <a href="mailto:dikchteine@chrc.net" class="emailLink">
                                            <asp:Image ID="Image3" ImageUrl="~/images/icon1.png" runat="server" valign="middle" />
                                            dikchteine@chrc.net</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 10px;">
                                        <img src="../images/icon2.png" valign="middle" />
                                        416.977.8010 ext 229
                                    </td>
                                    <td style="font-size: 10px;">
                                        <img src="../images/icon2.png" valign="middle" />
                                        416.977.8010 ext 296
                                    </td>
                                    <td style="font-size: 10px;">
                                        <img src="../images/icon2.png" valign="middle" />
                                        416.977.8010 ext 291
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <!--end of footer-->
        </div>
        <!--end of body-->
    </div>
    </form>
</body>
</html>
