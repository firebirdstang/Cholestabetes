<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Account.Master" AutoEventWireup="true"
    CodeBehind="ChangePhysicianPassword.aspx.cs" Inherits="Cholestabetes.Web.Account.ChangePhysicianPassword" %>

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
                    Change Password:
                </td>
            </tr>
            <tr>
                <td style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; text-align: center">
                    <p>
                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Old Password:</asp:Label>
                        <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                            CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Old Password is required."
                            ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                        <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                            CssClass="failureNotification" ErrorMessage="New Password is required." ToolTip="New Password is required."
                            ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                        <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                            CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                            ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                            ControlToValidate="ConfirmNewPassword" CssClass="failureNotification" Display="Dynamic"
                            ErrorMessage="The Confirm New Password must match the New Password entry." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                    </p>
                    <p>
                        <asp:Label ID="lblResult" runat="server" ForeColor="Red" />
                    </p>
                    <p class="submitButton">
                        <asp:Button Width="200" ID="CancelPushButton" CssClass="classname" runat="server"
                            CausesValidation="False"   Text="Cancel" size="50" OnClick="CancelPushButton_clicked" />
                        <asp:Button Width="200" ID="ChangePasswordPushButton" CssClass="classname" OnClick="ChangePasswordPushButton_clicked"
                            runat="server" Text="Change Password" ValidationGroup="ChangeUserPasswordValidationGroup" />
                    </p>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
