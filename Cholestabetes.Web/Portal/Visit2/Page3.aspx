<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Page3.aspx.cs" Inherits="Cholestabetes.Web.Portal.Visit2.Page3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="rightbox">
                <asp:Panel runat="server" ID="pnlMain">
                    <table width="100%" cellspacing="0" border="0">
                        <tr>
                            <td align="center" style="font-size: 25px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                                E-CRF PORTAL VISIT 2 PAGE 3
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div style="padding-left: 10px">
                        <a href="../Default.aspx">
                            <img src="../../images/home_flag.png" /></a></div>
                    <div id="visit1">
                        <table width="100%" border="0" cellpadding="10" align="center" bgcolor="#333333"
                            style="font-family: Arial, Helvetica, sans-serif">
                            <tr>
                                <td align="center">
                                    <span style="color: #FFF; font-size: 30px"></span>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </div>
                </asp:Panel>
                <table width="100%" border="0" align="center">
                    <tr>
                        <td width="33%" align="left">
                            <a href="#">
                                <asp:Button runat="server" OnClick="imgBack_clicked" ID="imgBack" align="absmiddle"
                                    CssClass="BackBtn" />
                        </td>
                        <td width="33%" align="center">
                            <asp:Button runat="server" OnClick="imgSave_clicked" ID="imgSave" align="absmiddle"
                                ValidationGroup="Validate" CssClass="saveBtn" />
                        </td>
                        <td width="33%" align="right">
                            <asp:Button runat="server" OnClick="imgNext_clicked" ID="imgNext" align="absmiddle"
                                ValidationGroup="Validate" CssClass="btnSubmit_Yellow" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
