<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Patients.aspx.cs" Inherits="Cholestabetes.Web.Portal.Patients" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../Scripts/jquery.fancybox.pack.js" type="text/javascript"></script>
    <link href="../Styles/jquery.fancybox.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {

            $(".fancybox1").fancybox({
                'width': '400px',

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
    <style>
        .error
        {
            color: Red;
            font-size: 11px;
            padding-top: 5px;
            padding-bottom: 5px;
        }
        .pointerHover
        {
            cursor: pointer;
        }
        .patiendIDCol
        {
            font-size: 25px;
           
            text-decoration: none;
        }    <style>
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
            background-color:   black; 
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
        .noWrap
        {
          white-space:nowrap;   
        }
    </style>
    </style>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div id="rightbox">
        <asp:UpdatePanel ID="UPPatients" runat="server">
            <ContentTemplate>
                <table width="100%" cellspacing="0" border="0">
                    <tr>
                        <td align="center" style="font-size: 25px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                            eCRF Portal
                        </td>
                    </tr>
                </table>
                <br />
                <div style="padding-left: 10px">
                    <a href="../Default.aspx">
                        <img src="../images/home_flag.png" /></a></div>
                <div style="text-align: center; margin: 0 auto; width: 100%;">
                    <div class="error">
                        <asp:ImageButton ImageUrl="~/images/add_patient_button.png" runat="server" ID="imgAdd"
                            OnClick="imgAdd_clicked" />
                    </div>
                    <div class="error">
                        <asp:Label runat="server" ID="lblMssg" />
                    </div>
                </div>
                <div style="text-align: center; margin: 0 auto; width: 100%;padding-left:5px; padding-right:5px;">
                    <dx:ASPxGridView ID="gvPatients" runat="server" AutoGenerateColumns="False" KeyFieldName="PatientID"
                        OnHtmlRowCreated="gvPatients_HtmlRowCreated" OnHtmlDataCellPrepared="gvPatients_HtmlDataCellPrepared"
                        OnHtmlCommandCellPrepared="gvPatients_HtmlCommandCellPrepared" Width="95%">
                        <Settings ShowFilterRow="True" />
                        <Columns>
                            <dx:GridViewDataHyperLinkColumn FieldName="UniqueID" Width="70px" Caption="Patient<br>Info"
                                VisibleIndex="0">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#666666" Border-BorderColor="#666666">
                                </HeaderStyle>
                                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                </CellStyle>
                                <DataItemTemplate>
                                    <asp:HoverMenuExtender ID="hovMenu" runat="server" TargetControlID="hlPopup" PopupControlID="pnlPopup"
                                        PopupPosition="Right">
                                    </asp:HoverMenuExtender>
                                    <asp:Panel runat="server" ID="pnlPopup" CssClass="InfoBody">
                                        <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    Full Name
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" ID="lblName" Text='<%# Eval("PatientName")  %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Phone
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" ID="Label3" Text='<%# Eval("Telephone")  %>' />
                                                </td>
                                            </tr>
                                            
                                        </table>
                                    </asp:Panel>
                                    <asp:HyperLink ID="hlPopup" Text='<%# Eval("AutoNumber")  %>' NavigateUrl='<%# String.Format("PatientInfo.aspx?PATIENTID={0}", DataBinder.Eval(Container.DataItem, "PatientID"))%>'
                                        runat="server" Target="_blank" CssClass="add_open btn btn-success fancybox1 patiendIDCol" />
                                    
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                           
                            <dx:GridViewDataTextColumn Caption="PhysicianID" FieldName="PhysicianID" VisibleIndex="1"
                                Visible="false">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#666666" Border-BorderColor="#666666">
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataColumn FieldName="FirstName" Caption="First Name" Width="200px" VisibleIndex="2"
                                Visible="false">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#666666" Border-BorderColor="#666666">
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                </CellStyle>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="LastName" Caption="Last Name" Width="200px" VisibleIndex="3"
                                Visible="false">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#666666" Border-BorderColor="#666666">
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                </CellStyle>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn Caption="Visit 1 e-CRF" VisibleIndex="4" FieldName="VisitStatus1"
                                Visible="false">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#666666" Border-BorderColor="#666666">
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                </CellStyle>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataHyperLinkColumn VisibleIndex="4" HeaderStyle-Border-BorderColor="#DCDCDC"
                                FieldName="VisitStatus1" HeaderStyle-Border-BorderStyle="None" HeaderStyle-BackColor="#666666"
                                HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" Caption="Visit 1 e-CRF">
                                <HeaderStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center">
                                    <Border BorderColor="Gainsboro" BorderStyle="None" />
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <Settings AllowAutoFilter="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton PatientNum='<%# Eval("AutoNumber") %>' PatientID='<%# Eval("PatientID") %>'
                                        Status='<%# Eval("VisitStatus1") %>' ImageUrl="~/images/grayfoldericon.png" runat="server"
                                        OnClick="imgViewVisit1_Click" CssClass="pointerHover" ID="imgViewVisit1" ScreenID='<%# Eval("Visit1ScreenID") %>' />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataTextColumn Caption="Status" VisibleIndex="5">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#666666" Border-BorderColor="#666666">
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <DataItemTemplate>
                                    <asp:Label runat="server" ID="lblStatus1" />
                                    <br />
                                    <br />
                                    <asp:Label runat="server" ID="lblCompleteDate" Text='<%#DataBinder.Eval(Container.DataItem, "VisitDateTime1", "{0:dd-MMM-yyyy}")%>' />
                                    <br />
                                    <br />
                                    <asp:Label ID="Label4" Text="" runat="server" />
                                    <div class="noWrap" style="color: Green; padding-top: 5px;">
                                        <asp:Label runat="server" ID="Label1" Text='<%#DataBinder.Eval(Container.DataItem, "Visit1StartDate", "{0:dd-MMM-yyyy} -- ")%>' />
                                        <asp:Label runat="server" ID="Label2" Text='<%#DataBinder.Eval(Container.DataItem, "Visit1EndDate", "{0:dd-MMM-yyyy}")%>' />
                                    </div>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Visit 2 e-CRF" VisibleIndex="6" FieldName="VisitStatus2"
                                Visible="false">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#666666" Border-BorderColor="#666666">
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataHyperLinkColumn VisibleIndex="6" HeaderStyle-Border-BorderColor="#DCDCDC"
                                FieldName="VisitStatus2" HeaderStyle-Border-BorderStyle="None" HeaderStyle-BackColor="#666666"
                                HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" Caption="Visit 2 e-CRF">
                                <HeaderStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center">
                                    <Border BorderColor="Gainsboro" BorderStyle="None" />
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <Settings AllowAutoFilter="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton PatientNum='<%# Eval("AutoNumber") %>' PatientID='<%# Eval("PatientID") %>'
                                        Status='<%# Eval("VisitStatus2") %>' ImageUrl="~/images/grayfoldericon.png" runat="server"
                                        OnClick="imgViewVisit2_Click" CssClass="pointerHover" ID="imgViewVisit2" ScreenID='<%# Eval("Visit2ScreenID") %>' />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataTextColumn Caption="Status" VisibleIndex="7">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#666666" Border-BorderColor="#666666">
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <DataItemTemplate>
                                    <asp:Label runat="server" ID="lblStatus2" />
                                    <br />
                                    <br />
                                    <asp:Label runat="server" ID="lblCompleteDate" Text='<%#DataBinder.Eval(Container.DataItem, "VisitDateTime2", "{0:dd-MMM-yyyy}")%>' />
                                    <br />
                                    <br />
                                    <asp:Label ID="Label4" Text="Accessible between" runat="server" Visible='<%# Eval("Visit2EndDate") != null &&  Eval("Visit3StartDate") == null %>' />
                                    <div class="noWrap" style="color: Green; padding-top: 5px;">
                                        <asp:Label Visible='<%# Eval("Visit2EndDate") != null &&  Eval("Visit3StartDate") == null %>'
                                            Text='<%#DataBinder.Eval(Container.DataItem, "Visit2StartDate", "{0:dd-MMM-yyyy} -- ")%>'
                                            runat="server" ID="Label1" />
                                        <asp:Label Visible='<%# Eval("Visit2EndDate") != null &&  Eval("Visit3StartDate") == null %>'
                                            Text='<%#DataBinder.Eval(Container.DataItem, "Visit2EndDate", "{0:dd-MMM-yyyy}")%>'
                                            runat="server" ID="Label2" />
                                    </div>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Visit 3 e-CRF" VisibleIndex="8" FieldName="VisitStatus3"
                                Visible="false">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#666666" Border-BorderColor="#666666">
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataHyperLinkColumn VisibleIndex="8" HeaderStyle-Border-BorderColor="#DCDCDC"
                                FieldName="VisitStatus3" HeaderStyle-Border-BorderStyle="None" HeaderStyle-BackColor="#666666"
                                HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" Caption="Visit 3 e-CRF">
                                <HeaderStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center">
                                    <Border BorderColor="Gainsboro" BorderStyle="None" />
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <Settings AllowAutoFilter="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton PatientNum='<%# Eval("AutoNumber") %>' PatientID='<%# Eval("PatientID") %>'
                                        Status='<%# Eval("VisitStatus3") %>' ImageUrl="~/images/grayfoldericon.png" runat="server"
                                        OnClick="imgViewVisit3_Click" CssClass="pointerHover" ID="imgViewVisit3" ScreenID='<%# Eval("Visit3ScreenID") %>' />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataTextColumn Caption="Status" VisibleIndex="9">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#666666" Border-BorderColor="#666666">
                                </HeaderStyle>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <DataItemTemplate>
                                    <asp:Label runat="server" ID="lblStatus3" />
                                    <br />
                                    <br />
                                    <asp:Label runat="server" ID="lblCompleteDate" Text='<%#DataBinder.Eval(Container.DataItem, "VisitDateTime3", "{0:dd-MMM-yyyy}")%>' />
                                    <br />
                                    <br />
                                    <asp:Label ID="Label4" Text="Accessible between" runat="server" Visible='<%# Eval("Visit3StartDate") != null && Eval("VisitDateTime3") == null%>' />
                                    <div class="noWrap" style="color: Green; padding-top: 5px;">
                                        <asp:Label Visible='<%# Eval("Visit3StartDate") != null && Eval("VisitDateTime3") == null%>'
                                            Text='<%#DataBinder.Eval(Container.DataItem, "Visit3StartDate", "{0:dd-MMM-yyyy} -- ")%>'
                                            runat="server" ID="Label1" />
                                        <asp:Label Visible='<%# Eval("Visit3StartDate") != null && Eval("VisitDateTime3") == null%>'
                                            Text='<%#DataBinder.Eval(Container.DataItem, "Visit3EndDate", "{0:dd-MMM-yyyy}")%>'
                                            runat="server" ID="Label2" />
                                    </div>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFilterRow="True" />
                    </dx:ASPxGridView>
                    <br />
                    <div>
                        <asp:Label runat="server" ID="lblResult" ForeColor="Red" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
