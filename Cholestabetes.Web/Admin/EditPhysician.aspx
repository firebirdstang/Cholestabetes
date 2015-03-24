<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPhysician.aspx.cs"
    Inherits="Cholestabetes.Web.Admin.EditPhysician" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .fancybox-skin
        {
            background-color: #E7E7E7;
        }
        .clsTextBox
        {
            width: 90%;
            border: 2px solid black;
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%" border="0" cellpadding="1" cellspacing="0" align="center">
            <tr>
                <td style="width: 559px">
                    <table width="100%" border="0" cellpadding="3" cellspacing="4" style="border-spacing: 8px;
                        border-collapse: separate;">
                        <tr>
                            <td colspan="3">
                                <div align="center">
                                    <b style="color: #C93225">Please update any relevant field below and click the "Update"
                                        Button.</b><br />
                                    <b style="color: #C93225">* PLEASE DO NOT UPDATE ANY OF THE CONTACT FIELDS EXCEPT FOR
                                        PHYSICIAN IMS# FOR PHYSICIANS MARKED AS REGISTERED* <span style="color: #C93225">*</span></b><br />
                                    <br />
                                </div>
                            </td>
                        </tr>
                        <%--<tr>
                            <td align="right" style="height: 28px; width: 118px;">
                                <div class="bold">
                                    <asp:Literal ID="Literal1" runat="server" Text="TerritoryID" />:&nbsp;</div>
                            </td>
                            <td align="left" style="height: 28px" colspan="2">
                                <div class="bold">
                                    <asp:DropDownList CssClass="clsTextBox" ID="DDListTerritory" runat="server" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                    &nbsp;<span style="color: #C93225">*</span>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="DDListTerritory"
                                        Display="Dynamic" ErrorMessage="Territory ID is required！" runat="server" InitialValue="-1"
                                        ValidationGroup="addPhysian" ForeColor="#C93225" />
                                </div>
                            </td>
                        </tr>--%>
                        <%--<tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal2" runat="server" Text="PhysicianIMS" />
                                    <i>#</i>:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <asp:TextBox ID="lblPhysicianIMS" CssClass="clsTextBox" runat="server"></asp:TextBox>&nbsp;
                            </td>
                        </tr>--%>
                        <tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal4" runat="server" Text="FirstName" />:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <asp:TextBox ID="lblFirstname" runat="server" CssClass="clsTextBox"></asp:TextBox>&nbsp;<span
                                    style="color: #C93225">*</span><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="lblFirstname"
                                    Display="Dynamic" ErrorMessage="Firstname is required！" runat="server" ValidationGroup="addPhysian"
                                    ForeColor="#C93225" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal5" runat="server" Text="LastName" />:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <asp:TextBox ID="lblLastname" runat="server" CssClass="clsTextBox"></asp:TextBox>&nbsp;<span
                                    style="color: #C93225">*</span><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="lblLastname"
                                    Display="Dynamic" ErrorMessage="Lastname is required！" runat="server" ValidationGroup="addPhysian"
                                    ForeColor="#C93225" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal3" runat="server" Text="Clinic" />:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <asp:TextBox ID="txtClinic" CssClass="clsTextBox" runat="server"></asp:TextBox>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal6" runat="server" Text="Address" />
                                    :&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <div class="bold">
                                    <asp:TextBox ID="lblAddress_1" runat="server" CssClass="clsTextBox"></asp:TextBox>&nbsp;</div>
                            </td>
                        </tr>
                        <%--<tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal7" runat="server" Text="Address" />
                                    2:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <div class="bold">
                                    <asp:TextBox ID="lblAddress_2" runat="server" CssClass="clsTextBox"></asp:TextBox>&nbsp;</div>
                            </td>
                        </tr>--%>
                        <tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal8" runat="server" Text="City" />:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <div class="bold">
                                    <asp:TextBox ID="lblCity" runat="server" CssClass="clsTextBox"></asp:TextBox>&nbsp;
                                    &nbsp;<span style="color: #C93225">*</span><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="lblCity"
                                        Display="Dynamic" ErrorMessage="City is required！" runat="server" InitialValue=""
                                        ValidationGroup="addPhysian" ForeColor="#C93225" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="height: 28px; width: 88px;">
                                <div class="bold">
                                    <asp:Literal ID="Literal9" runat="server" Text="Province" />:&nbsp;</div>
                            </td>
                            <td align="left" style="height: 28px" colspan="2">
                                <div class="bold">
                                    &nbsp;<asp:DropDownList ID="DDListPro" runat="server" CssClass="clsTextBox" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                    &nbsp;<span style="color: #C93225">*</span><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="DDListPro"
                                        Display="Dynamic" ErrorMessage="Province/State is required！" runat="server" InitialValue=""
                                        ValidationGroup="addPhysian" ForeColor="#C93225" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal10" runat="server" Text="PostalCode" />:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <div class="bold">
                                    <asp:TextBox ID="lblPstCode" runat="server" CssClass="clsTextBox"></asp:TextBox>&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal11" runat="server" Text="Telephone" />:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <div class="bold">
                                    <asp:TextBox ID="lblPhone" runat="server" CssClass="clsTextBox"></asp:TextBox>&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal1" runat="server" Text="Cell Phone" />:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <div class="bold">
                                    <asp:TextBox ID="txtCellPhone" runat="server" CssClass="clsTextBox"></asp:TextBox>&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal12" runat="server" Text="Fax" />:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <div class="bold">
                                    <asp:TextBox ID="lblFax" runat="server" CssClass="clsTextBox"></asp:TextBox>&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 88px">
                                <div class="bold">
                                    <asp:Literal ID="Literal13" runat="server" Text="Email" />:&nbsp;</div>
                            </td>
                            <td align="left" colspan="2">
                                <asp:TextBox ID="lblEmail" runat="server" CssClass="clsTextBox"></asp:TextBox>&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <p>
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Visible="False"></asp:Label></p>
        <p align="right">
            &nbsp;&nbsp;
            <asp:Button ID="btnCloseAddPhysician" runat="server" CausesValidation="false" Text=" Cancel "
                OnClientClick="parent.jQuery.fancybox.close()" CssClass="sexybutton sexysimple sexysmall sexyxxl "
                BackColor="Gray" UseSubmitBehavior="false" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnUpdatePhysician" CausesValidation="true" runat="server" Text="   Update "
                OnClick="btnUpdatePhysician_Click" ValidationGroup="addPhysian" CssClass="sexybutton sexysimple sexysmall sexyxxl"
                BackColor="Maroon" />
            <asp:Button Visible="false" ID="dummyPhysicianbutton" runat="server" />
        </p>
        <table>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
