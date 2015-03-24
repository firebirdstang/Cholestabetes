<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Account.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Cholestabetes.Web.Account.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


  <span class="failureNotification">
        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
    </span>
    <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="ChangeUserPasswordValidationGroup" />
    <div style="margin: 0 auto;">
        <table width="100%" border="0" cellspacing="0" cellpadding="5" align="center" style="border-color: #000;
            border-style: solid; border-width: thin; margin-top: 10px">
            <tr>
                <td class="whitemedium" style="background-color: #000; font-family: Arial, Helvetica, sans-serif;
                    text-align: center; font-size: 25px">
                    Retreive Password:
                </td>
            </tr>
            <tr>
                <td style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; text-align: center">
                    <p>
                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Username or Email:</asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="passwordEntry"  ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtEmail" runat="server" ControlToValidate="txtEmail"
                            CssClass="failureNotification" ErrorMessage="Username/Email is required." ToolTip="Username/Email is required."
                            ValidationGroup="validate">*</asp:RequiredFieldValidator>
                    </p>
                  
                    
                    <p>
                        <asp:Label ID="lblResult" runat="server" ForeColor="Red" />
                    </p>
                    <p class="submitButton">
                        <asp:Button Width="200" ID="CancelPushButton" CssClass="classname" runat="server"
                            CausesValidation="False"   Text="Cancel" size="50" OnClick="CancelPushButton_clicked" />
                        <asp:Button Width="200" ID="btnPassword" CssClass="classname" OnClick="btnPassword_clicked"
                            runat="server" Text="Retreive Password" ValidationGroup="validate" />
                    </p>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
