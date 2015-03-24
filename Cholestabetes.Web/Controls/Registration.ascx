<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Registration.ascx.cs"
    Inherits="Cholestabetes.Web.Controls.Registration" %>
<table width="25%" border="0" cellspacing="0" cellpadding="5" style="float: right;">
    <tr>
        <td style="font-family: Arial, Helvetica, sans-serif; font-size: 10px; text-align: right">
            <strong>FRANÇAIS</strong>
        </td>
    </tr>
    <tr>
        <td class="whitemedium" style="background-color: #000; font-family: Arial, Helvetica, sans-serif;
            text-align: center; font-size: 14px; border-color: #000; border-style: solid;
            border-width: thin">
            <strong>New Registration:</strong>
        </td>
    </tr>
    <tr>
        <td style="font-family: Arial, Helvetica, sans-serif; font-size: 11px; text-align: center;
            border-color: #000; border-style: solid; border-width: thin">
            Enter Unique Registration ID<br />
            <asp:TextBox runat="server" size="30" ID="txtRegCode" ValidationGroup="RegCode" />
            <asp:RequiredFieldValidator ID="reqtxtRegCode" ControlToValidate="txtRegCode" ValidationGroup="RegCode"
                runat="server" ForeColor="Red" ErrorMessage="Registration Code Required *"></asp:RequiredFieldValidator>
            <div style="padding-bottom: 5px;">
                <asp:Label ID="lblRegResult" ForeColor="Red" runat="server" />
            </div>
            <%-- <a href="#" class="classname2">REGISTER</a><br />--%>
            <asp:Button runat="server" OnClick="btnRegister_clicked" ID="btnRegister" ValidationGroup="RegCode"
                CssClass="registerBtn" />
            <br />
            <br />
            <span class="small">If you don't have a unique Registration ID, <a href="#" onclick="window.open('not_me.htm', 'newwindow', 'width=450, height=230'); return false;">
                click here</a></span>
        </td>
    </tr>
</table>
