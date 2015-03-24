<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Page6.aspx.cs" Inherits="Cholestabetes.Web.Portal.Visit1.Page6" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Scripts/jquery.fancybox.pack.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            $(".fancybox1").fancybox({
                'width': '800px',
                'height': '800px',
                'autoScale': false,
                'transitionIn': 'none',
                'transitionOut': 'none',
                'type': 'iframe',
                'onClosed': function () {
                    alert("onclosed");
                    window.location.reload(true);
                },
                'onCleanup': function () {
                    alert("oncleanup");
                    return window.location.reload();
                }
            });

            $(".fancybox2").fancybox({
                openEffect: 'none',
                closeEffect: 'none'



            });
        });

    </script>
    <style type="text/css">
        #box
        {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #EFEFEF;
            padding: 20px;
        }
        .blackmedium
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="box">
                <table width="100%" border="0" cellpadding="10" align="center" bgcolor="#333333"
                    style="font-family: Arial, Helvetica, sans-serif">
                    <tr>
                        <td align="center">
                            <span style="color: #FFF; font-size: 30px">6 - This e-CRF is COMPLETE </span>
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0">
                                <tr>
                                    <td>
                                        <span class="patientIDLabel">Patient Number:</span>
                                    </td>
                                    <td align="left">
                                        <asp:Label runat="server" ID="lblPatientNum" CssClass="patientNum"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="10" style="font-family: Arial, Helvetica, sans-serif;
                    border: thin solid #333;">
                    <tr>
                        <td align="center" style="background-color: #CCC">
                            <span style="font-size: 20px; font-weight: bold;">You have successfully completed the
                                e-CRF for this patient.<br />
                                You can either Submit or Review / Modify the e-CRF </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <%--   <asp:ImageButton ImageUrl="~/images/submitecrf-button.png" runat="server" ID="imgSubmit"
                                OnClick="imgSubmit_clicked" />--%>
                            <a href='Visit1SubmitPopup.aspx?PATIENTID=<%=patientID%>&READONLY=<%=isReadonly?1:0%>'
                                target="_blank" class="fancybox1">
                                <img src="../../images/submitecrf-button.png" />
                            </a>
                            <br />
                            <table width="100%" border="1" bgcolor="#B1FFAE" cellspacing="0" cellpadding="10">
                                <tr>
                                    <td align="center">
                                        <strong>If you click the "SUBMIT e-CRF" button, the data entered for this patient will
                                            be considered final and no modifications to any of the data fields can be made.</strong>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="border-top: medium; border-top-color: #000; border-style: dotted">
                            <asp:ImageButton ImageUrl="~/images/reviewecrf-button.png" runat="server" ID="imgReview"
                                OnClick="imgReview_clicked" />
                            <br />
                            <table width="100%" border="1" bgcolor="#FFC37D" cellspacing="0" cellpadding="10">
                                <tr>
                                    <td align="center">
                                        <strong>If you click the "REVIEW e-CRF" button, you will be able to review all previous
                                            pages of this e-CRF and make any applicable modifications if warranted. Once you
                                            have reviewed / modified the e-CRF to your satisfaction, you will be able to submit
                                            the final version.</strong>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
