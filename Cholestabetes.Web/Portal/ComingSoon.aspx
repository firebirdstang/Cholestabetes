<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ComingSoon.aspx.cs" Inherits="Cholestabetes.Web.Portal.ComingSoon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        #box
        {
            width: 620px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #EFEFEF;
            font-size: 14px;
            padding-right: 40px;
            padding-left: 40px;
            margin: 0px !important;
        }
        
        #content
        {
            padding: 0px;
            margin-left: 20px;
        }
    </style>
    <div id="rightbox">
        <table width="100%" cellspacing="0" border="0">
            <tr>
                <td align="center" style="font-size: 34px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                    Welcome
                </td>
            </tr>
        </table>
        <br />
        <div style="padding-left: 10px">
            <a href="ComingSoon.aspx">
                <img src="../images/home_flag.png" /></a></div>
        <div style="background-image: url(images/watermark.png); padding: 20px; background-repeat: no-repeat;
            font-family: Arial, Helvetica, sans-serif; font-size: 14px">
            COMING SOON
            <br />
        </div>
    </div>
</asp:Content>
