<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientInfo.aspx.cs" Inherits="Cholestabetes.Web.Portal.PatientInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body class="InfoBody">
    <style>
        .InfoFooter
        {
            font-size: 11px;
        }
        .Infoheading
        {
            font-size: 15px;
        }
        .InfoBody
        {
            color: White;
            font-family: Candara;
            background-color: black;
            padding: 5px;
            padding-left: 8px;
            padding-right: 8px;
            width: 300px;
        }
        
        .InfoLst
        {
            font-size: 14px;
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
    <form id="form1" runat="server">
    <table border="0" cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td>
                Full Name
            </td>
            <td>
                <asp:Label runat="server" ID="lblName" Text=" N/A " />
            </td>
        </tr>
      <%--  <tr>
            <td colspan="2" align="center">
                <a href="#" class="cancel" onclick="javascript:parent.$.fancybox.close();">Exit</a>
            </td>
        </tr>--%>
    </table>
    </form>
</body>
</html>
