<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="ManageRegistration.aspx.cs" Inherits="Cholestabetes.Web.Admin.ManageRegistration"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
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
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="text-align: center; margin: 0 auto; width: 100%;">
        <table width="800px" align="center" cellpadding="0" cellspacing="0" id="tbl" runat="server">
            <tbody>
                <tr>
                    <td id="tdAdd" runat="server">
                        <asp:HyperLink NavigateUrl='AddNewContact.aspx?ID=<%# Eval("ID") %>' runat="server"
                            ImageUrl="~/images/add.gif" class="add_open btn btn-success fancybox1" ID="imgAddPhysician" />
                    </td>
                    <td>
                        <img src="../images/user_manual.gif" border="0">
                    </td>
                    <td>
                        <img src="../images/prog_materials.gif" border="0">
                    </td>
                    <td>
                        <asp:HyperLink ID="hlReports" ImageUrl="~/images/reports.gif" NavigateUrl="#" runat="server" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <br />
    <div>
        <asp:UpdatePanel ID="UPCardiologists" runat="server">
            <ContentTemplate>
                <dx:ASPxGridView ID="gvCardiologists" runat="server" AutoGenerateColumns="False"
                    KeyFieldName="ID" OnHtmlRowCreated="gvCardiologists_HtmlRowCreated" OnHtmlDataCellPrepared="gvCardiologists_HtmlDataCellPrepared"
                    OnHtmlCommandCellPrepared="gvCardiologists_HtmlCommandCellPrepared">
                    <Settings ShowFilterRow="True" />
                    <Columns>
                        <dx:GridViewBandColumn VisibleIndex="0" HeaderStyle-Border-BorderWidth="0">
                            <HeaderStyle HorizontalAlign="Center" ForeColor="White" Font-Bold="True" VerticalAlign="Middle"
                                BackColor="#666666">
                                <Border BorderWidth="0px" />
                            </HeaderStyle>
                            <HeaderTemplate>
                                <div class="whitelarge" style="font-size: 35px;">
                                    <asp:Literal ID="Literal1" runat="server" Text="Physician List"></asp:Literal>
                                </div>
                            </HeaderTemplate>
                            <Columns>
                                <dx:GridViewDataHyperLinkColumn FieldName="UniqueID" Width="70px" Caption="Physician<br>Info"
                                    VisibleIndex="0">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" Border-BorderColor="Black">
                                        <Border BorderColor="Black" />
                                    </HeaderStyle>
                                    <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                    <DataItemTemplate>
                                        <a href='PhysicianInfo.aspx?ID=<%# Eval("ID") %>' target="_blank" class="fancybox1">
                                            <img src="../images/icons_info.png" width="36px" height="36px"></img></a></DataItemTemplate>
                                </dx:GridViewDataHyperLinkColumn>
                                <dx:GridViewDataColumn FieldName="FirstName" Caption="First Name" Width="200px" VisibleIndex="2">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" Border-BorderColor="Black">
                                        <Border BorderColor="Black" />
                                    </HeaderStyle>
                                    <Settings FilterMode="DisplayText" AllowAutoFilter="True" AllowSort="True" AllowHeaderFilter="False"
                                        ShowInFilterControl="True" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="LastName" Caption="Last Name" Width="200px" VisibleIndex="3">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" Border-BorderColor="Black">
                                        <Border BorderColor="Black" />
                                    </HeaderStyle>
                                    <Settings FilterMode="DisplayText" AllowAutoFilter="True" AllowSort="True" AllowHeaderFilter="False"
                                        ShowInFilterControl="True" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="Province.Name" Caption="Province" Width="200px"
                                    VisibleIndex="4">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" Border-BorderColor="Black">
                                        <Border BorderColor="Black" />
                                    </HeaderStyle>
                                    <Settings FilterMode="DisplayText" AllowAutoFilter="True" AllowSort="True" AllowHeaderFilter="False"
                                        ShowInFilterControl="True" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <%-- <dx:GridViewDataTextColumn Name="regStatusCol" FieldName="Status" Caption="Participation<br>Status"
                                    Width="160px">
                                    <Settings FilterMode="Value" AllowAutoFilter="True" AllowSort="True" AllowHeaderFilter="True"
                                        ShowInFilterControl="True" />
                                    <DataItemTemplate>
                                        <asp:Label PhysicianID='<% #Eval("ID") %>' Visible="False" runat="server" ID="lblStatus"
                                            Text='<%#Eval("Status")%>' />
                                        <dx:ASPxComboBox AutoPostBack="true" OnSelectedIndexChanged="cmbRegStatus_SelectedIndexChanged"
                                            ID="cmbRegStatus" ClientInstanceName="cmbVariableSource" runat="server" ReadOnly="false"
                                            DropDownStyle="DropDown" Width="100px" ValueField="ID" TextField="Name" ValueType="System.Int32"
                                            IncrementalFilteringMode="StartsWith" EnableSynchronization="False">
                                        </dx:ASPxComboBox>
                                        <asp:DropDownList Visible="false" runat="server" ID="ddRegisStatus" DataTextField="Name"
                                            DataValueField="ID">
                                        </asp:DropDownList>
                                    </DataItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" Border-BorderColor="Black">
                                        <Border BorderColor="Black" />
                                    </HeaderStyle>
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>--%>
                                <dx:GridViewDataTextColumn Caption="Invitation&lt;br&gt;Rank" FieldName="InvitationTier"
                                    VisibleIndex="1" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White">
                                    <HeaderStyle BackColor="Black" ForeColor="White" HorizontalAlign="Center" Border-BorderColor="Black">
                                        <Border BorderColor="Black" />
                                    </HeaderStyle>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                    <Settings FilterMode="DisplayText" AllowAutoFilter="True" AllowSort="True" AllowHeaderFilter="False"
                                        ShowInFilterControl="True" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn VisibleIndex="5" Visible="False" HeaderStyle-Border-BorderWidth="0">
                            <HeaderStyle HorizontalAlign="Left" ForeColor="Black" Font-Bold="True" VerticalAlign="Middle"
                                BackColor="#CCCCCC">
                                <Border BorderWidth="0px" />
                            </HeaderStyle>
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="" Width="100px" VisibleIndex="7">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#B54340"
                                        ForeColor="White" />
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle BackColor="White" VerticalAlign="Middle" HorizontalAlign="Center">
                                    </CellStyle>
                                    <Settings AllowAutoFilter="False" />
                                    <DataItemTemplate>
                                        <%-- <dx:ASPxCheckBox Visible="false" ID="InvitedCheckbox" runat="server" OnCheckedChanged="InvitedCheckbox_CheckedChanged"
                                            AutoPostBack="True" TextAlign="Left" ValueChecked="1" ValueType="System.Int32"
                                            ValueUnchecked="0" Value='<%# Eval("Status") %>' ViewStateMode="Disabled" CheckState="Unchecked">
                                        </dx:ASPxCheckBox>--%>
                                        <asp:Button Visible="False" ID="dummyInvitedCheckbox" runat="server" CommandName='<%# Eval("ID") %>' />
                                    </DataItemTemplate>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Name="PreProgInv" VisibleIndex="7" Visible="False" HeaderStyle-Border-BorderWidth="0">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" BackColor="#CCCCCC">
                                <Border BorderWidth="0px" />
                            </HeaderStyle>
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="True" Caption="Select" VisibleIndex="1"
                                    Width="100px" ButtonType="Button">
                                    <ClearFilterButton Visible="True">
                                    </ClearFilterButton>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#B54340" />
                                    <CellStyle BackColor="White" VerticalAlign="Middle">
                                    </CellStyle>
                                    <HeaderTemplate>
                                        <dx:ASPxCheckBox ID="SelectAllCheckBox" runat="server" ToolTip="Select/Unselect all rows on the page"
                                            TextAlign="Left" CheckState="Unchecked">
                                            <ClientSideEvents CheckedChanged="function(s, e) { gvCardiologists.SelectAllRowsOnPage(s.GetChecked()); }" />
                                        </dx:ASPxCheckBox>
                                    </HeaderTemplate>
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="InvitationSentDate" VisibleIndex="1" Caption="Generate Invitation"
                                    Width="160px">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#B54340"
                                        Font-Bold="True" ForeColor="White" />
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <DataItemTemplate>
                                        <%-- <asp:Button ID="btnInv" runat="server" Text="Generate Invitation" Font-Size="Smaller"
                                            Style="font-family: Candara;" OnClick="btnInv_Click" meta:resourcekey="btnInvResource1" /><br />
                                        <asp:Label runat="server" ID="lblInv" meta:resourcekey="lblInvResource1"></asp:Label>
                                        <asp:Button Visible="False" ID="dummyInv" runat="server" ViewStateMode="Disabled"
                                            CommandName='<%# Eval("ID") %>' />--%>
                                    </DataItemTemplate>
                                    <CellStyle BackColor="White" VerticalAlign="Middle" HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataColumn FieldName="MOU" Caption="MOU<br>Status" Width="200px" VisibleIndex="1">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="MOUDate" Caption="MOU Date" Width="200px" VisibleIndex="1"
                                    Visible="false">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataHyperLinkColumn FieldName="UniqueID" Width="70px" Caption="Enrollment<br>Summary"
                                    VisibleIndex="1">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <DataItemTemplate>
                                        <a href='PhysicianInfo.aspx?ID=<%# Eval("ID") %>' target="_blank" class="fancybox1">
                                            <img src="../images/gridIcon.png" width="27px"></img></a></DataItemTemplate>
                                </dx:GridViewDataHyperLinkColumn>
                                <dx:GridViewDataColumn FieldName="AssesmentSurvey" Caption="Assesment Survey" Width="200px"
                                    VisibleIndex="0" ShowInCustomizationForm="False">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="AssesmentSurveyDate" Caption="Assesment Survey Date"
                                    Width="200px" VisibleIndex="1" ShowInCustomizationForm="False" Visible="false">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="PayeeInformation" Caption="Payee Information" Width="200px"
                                    VisibleIndex="1" ShowInCustomizationForm="False">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="PayeeInformationDate" Caption="Payee Date" Width="200px"
                                    VisibleIndex="1" ShowInCustomizationForm="False" Visible="false">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="Black" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn VisibleIndex="1" HeaderStyle-Border-BorderWidth="0">
                            <Columns>
                                <dx:GridViewDataCheckColumn Caption="Invited<br>by<br>CHRC" Name="colInvitedByCHRC"
                                    FieldName="Invited" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center"
                                    HeaderStyle-Border-BorderColor="#999999" HeaderStyle-BackColor="#999999">
                                    <Settings FilterMode="Value" AllowAutoFilter="True" AllowSort="True" AllowHeaderFilter="False"
                                        ShowInFilterControl="False" />
                                    <DataItemTemplate>
                                        <dx:ASPxCheckBox runat="server" ID="chkCHRC" Checked='<%#Eval("Invited") %>' PhysicianID='<%# Eval("ID") %>'
                                            OnCheckedChanged="chkCHRC_OnCheckedChanged" AutoPostBack="true" Invited='<%#Eval("Invited") %>'>
                                        </dx:ASPxCheckBox>
                                        <asp:Button Visible="False" ID="dummyInv2" runat="server" CommandName='<%# Eval("ID") %>' />
                                    </DataItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center">
                                        <Border BorderColor="#999999" />
                                    </HeaderStyle>
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataComboBoxColumn Name="regStatusCol" FieldName="Status" Caption="Participation<br>Status"
                                    Width="160px">
                                    <PropertiesComboBox DataSourceID="objRegStatusSource" ValueField="ID" IncrementalFilteringMode="StartsWith"
                                        TextField="Name" ValueType="System.Int32" DropDownStyle="DropDown" />
                                    <Settings FilterMode="Value" AllowAutoFilter="True" AllowSort="True" AllowHeaderFilter="True"
                                        ShowInFilterControl="True" />
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#999999" Border-BorderColor="#999999">
                                        <Border BorderColor="#999999" />
                                    </HeaderStyle>
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                    <DataItemTemplate>
                                        <asp:Label PhysicianID='<% #Eval("ID") %>' Visible="False" runat="server" ID="lblStatus"
                                            Text='<%#Eval("Status")%>' />
                                        <dx:ASPxComboBox AutoPostBack="true" OnSelectedIndexChanged="cmbRegStatus_SelectedIndexChanged"
                                            ID="cmbRegStatus" ClientInstanceName="cmbVariableSource" runat="server" ReadOnly="false"
                                            DropDownStyle="DropDown" Width="100px" ValueField="ID" TextField="Name" ValueType="System.Int32"
                                            PhysicianID='<% #Eval("ID") %>'>
                                        </dx:ASPxComboBox>
                                        <%-- <asp:DropDownList Visible="true" runat="server" ID="ddRegisStatus" DataTextField="Name"
                                            DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddRegisStatus_OnSelectedIndexChanged" PhysicianID='<% #Eval("ID") %>'>
                                        </asp:DropDownList>--%>
                                    </DataItemTemplate>
                                </dx:GridViewDataComboBoxColumn>
                                <%--     <dx:GridViewDataTextColumn Caption="Response" Name="colreponse" VisibleIndex="1"
                                    HeaderStyle-BackColor="#999999" HeaderStyle-Border-BorderColor="#999999" HeaderStyle-ForeColor="White">
                                    <HeaderStyle BackColor="#999999" ForeColor="White">
                                        <Border BorderColor="#999999" />
                                    </HeaderStyle>
                                </dx:GridViewDataTextColumn>--%>
                                <dx:GridViewDataHyperLinkColumn Caption="Participation<br>Summary" Name="colParticipationSummary"
                                    VisibleIndex="2" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#999999"
                                    HeaderStyle-Border-BorderColor="#999999" HeaderStyle-ForeColor="White">
                                    <HeaderStyle HorizontalAlign="Center">
                                        <Border BorderColor="#999999" />
                                    </HeaderStyle>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                    <DataItemTemplate>
                                        <a href='EnrollmentSummary.aspx?USERID=<%# Eval("USERID") %>' target="_blank" class="fancybox1">
                                            <img src="../images/icons-view.png" width="36px" height="36px"></img></a></DataItemTemplate>
                                </dx:GridViewDataHyperLinkColumn>
                            </Columns>
                            <HeaderStyle>
                                <Border BorderWidth="0px" />
                            </HeaderStyle>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn VisibleIndex="3" Caption="Generate invitation (English)" HeaderStyle-Border-BorderWidth="0"
                            HeaderStyle-Border-BorderStyle="None" Name="colGenMulEng">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle">
                                <Border BorderWidth="0px" />
                            </HeaderStyle>
                            <HeaderTemplate>
                                <asp:ImageButton ID="imgGenMultipleEnglish" runat="server" ImageUrl="~/images/generateenglish.png"
                                    OnClick="imgGenMultipleEnglish_Click" />
                            </HeaderTemplate>
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="True" Caption=" " VisibleIndex="1"
                                    Name="selCheckCol" ButtonType="Button" HeaderStyle-Border-BorderStyle="None"
                                    HeaderStyle-BackColor="#990000">
                                    <HeaderStyle BackColor="#990000">
                                        <Border BorderStyle="None" />
                                    </HeaderStyle>
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataHyperLinkColumn VisibleIndex="1" HeaderStyle-Border-BorderColor="#DCDCDC"
                                    HeaderStyle-Border-BorderStyle="None" HeaderStyle-BackColor="#990000" HeaderStyle-ForeColor="White"
                                    HeaderStyle-HorizontalAlign="Center" Caption="Generate Invitation<br>(English)">
                                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Center">
                                        <Border BorderColor="Gainsboro" BorderStyle="None" />
                                    </HeaderStyle>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                    <Settings AllowAutoFilter="False" />
                                    <DataItemTemplate>
                                        <asp:ImageButton PhysicianID='<%# Eval("ID") %>' ImageUrl="~/images/icon_download.png"
                                            runat="server" OnClick="imgEnglish_Click" CssClass="pointerHover" ID="imgEnglish" />
                                        <asp:Button Visible="False" ID="dummyInv" runat="server" ViewStateMode="Disabled"
                                            CommandName='<%# Eval("ID") %>' />
                                        <div style="font-size: 10px;">
                                            <asp:Label runat="server" ID="lblInvSentDate" Text='<%# Eval("InvitationSentDate") %>' />
                                        </div>
                                    </DataItemTemplate>
                                </dx:GridViewDataHyperLinkColumn>
                                <%-- <dx:GridViewDataCheckColumn VisibleIndex="0">
                                    <DataItemTemplate>
                                        <asp:CheckBox runat="server" ID="chkGenEnglish" />
                                    </DataItemTemplate>
                                </dx:GridViewDataCheckColumn>--%>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn VisibleIndex="4" Caption="Generate invitation (French)" HeaderStyle-Border-BorderWidth="0"
                            Name="colGenMulFre">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle">
                                <Border BorderWidth="0px" />
                            </HeaderStyle>
                            <HeaderTemplate>
                                <asp:ImageButton ID="imgGenMultipleFrench" runat="server" ImageUrl="~/images/generatefrench.png"
                                    OnClick="imgGenMultipleFrench_clicked" />
                            </HeaderTemplate>
                            <Columns>
                                <dx:GridViewDataHyperLinkColumn VisibleIndex="1" HeaderStyle-Border-BorderColor="#DCDCDC"
                                    HeaderStyle-Border-BorderStyle="None" HeaderStyle-BackColor="#990000" HeaderStyle-ForeColor="White"
                                    HeaderStyle-HorizontalAlign="Center" Caption="Generate Invitation<br>(French)">
                                    <HeaderStyle>
                                        <Border BorderColor="Gainsboro" BorderStyle="None" />
                                    </HeaderStyle>
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <Settings AllowAutoFilter="False" />
                                    <Settings AllowAutoFilter="False" />
                                    <DataItemTemplate>
                                        <asp:ImageButton ID="imgFrench" PhysicianID='<%# Eval("ID") %>' ImageUrl="~/images/icon_download.png"
                                            runat="server" OnClick="imgFrench_Click" CssClass="pointerHover" />
                                        <asp:Button Visible="False" ID="dummyInv" runat="server" ViewStateMode="Disabled"
                                            CommandName='<%# Eval("ID") %>' />
                                        <div style="font-size: 10px;">
                                            <asp:Label runat="server" ID="lblInvSentDate" Text='<%# Eval("InvitationSentDateFrench") %>' />
                                        </div>
                                    </DataItemTemplate>
                                </dx:GridViewDataHyperLinkColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" />
                </dx:ASPxGridView>
                <div>
                    <asp:Label runat="server" ID="lblResult" ForeColor="Red" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:ObjectDataSource runat="server" ID="objRegStatusSource" SelectMethod="GetRecords"
        TypeName="Cholestabetes.Web.Helper.RegistrationStatusHelper"></asp:ObjectDataSource>
</asp:Content>
