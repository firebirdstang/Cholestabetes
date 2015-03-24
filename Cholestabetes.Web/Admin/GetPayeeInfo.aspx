<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="GetPayeeInfo.aspx.cs" Inherits="Cholestabetes.Web.Admin.GetPayeeInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
        .pointerHover
        {
            cursor: pointer;
        }
    </style>
    <style>
        #right
        {
            float: none !important;
            width: 100%;
        }
        .whitelarge
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 16px;
            color: #FFF;
            font-weight: normal !important;
        }
        .whitemedium
        {
            font-size: 13px;
            color: #FFF;
        }
        
        .tbl
        {
            font-size: 12px;
            width: 100%;
        }
    </style>
    <div style="margin: 0 auto; width: 100%; padding: 20px;">
        
        
        
        <table width="100%" align="center" cellpadding="0" cellspacing="0" id="tbl" runat="server">
            <tbody>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" ImageUrl="~/images/arrow_back.png" NavigateUrl="~/Admin/ManageRegistration.aspx"
                            runat="server" />
                    </td>
                </tr>
            </tbody>
        </table>
        <div style="padding:5px;">
            <fieldset style="width:80%;margin:0 auto;">
                <legend>Payee Info</legend>
                <table border="0" cellpadding="10" cellspacing="0" class="tbl">
                    <tr>
                        <td align="right" valign="top">
                            <b>Select a Physcian</b>
                        </td>
                        <td>
                            <asp:ListBox runat="server" ID="lstDocs" Height="200px" SelectionMode="Multiple">
                            </asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label runat="server" ID="lblResult" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:LinkButton Text="Generate Payee Info Report" runat="server" ID="btnGen" OnClick="btnGen_clicked"  CssClass="sameColorLink" />
                        </td>
                    </tr>
                </table>
        </div>
        </fieldset>
    </div>
</asp:Content>
