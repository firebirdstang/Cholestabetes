<%@ Page Title="Register" Language="C#" MasterPageFile="~/Account/Account.Master"
    AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Cholestabetes.Web.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div style="margin: 0 auto;">
        <asp:CreateUserWizard ID="RegisterUser" runat="server" EnableViewState="false" OnCreatedUser="RegisterUser_CreatedUser">
            <LayoutTemplate>
                <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
                <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
            </LayoutTemplate>
            <WizardSteps>
                <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                    <ContentTemplate>
                        <p>
                            Passwords are required to be a minimum of
                            <%= Membership.MinRequiredPasswordLength %>
                            characters in length.
                        </p>
                        <span class="failureNotification">
                            <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                        </span>
                        <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification"
                            ValidationGroup="RegisterUserValidationGroup" />
                        <div style="margin: 0 auto;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="5" align="center" style="border-color: #000;
                                border-style: solid; border-width: thin; margin-top: 10px">
                                <tr>
                                    <td class="whitemedium" style="background-color: #000; font-family: Arial, Helvetica, sans-serif;
                                        text-align: center; font-size: 25px">
                                        Create a New Account:
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; text-align: center">
                                        <p style="display: none;">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                            <asp:RequiredFieldValidator Enabled="false" ID="UserNameRequired" runat="server"
                                                ControlToValidate="UserName" CssClass="failureNotification" ErrorMessage="User Name is required."
                                                ToolTip="User Name is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="Email" runat="server" CssClass="textEntry" Width="200px"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                            CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required."
                                                            ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" Width="200px"
                                                            TextMode="Password"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                            CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                                            ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="ConfirmPassword" runat="server" Width="200px" CssClass="passwordEntry"
                                                            TextMode="Password"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                        <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification"
                                                            Display="Dynamic" ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired"
                                                            runat="server" ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                            ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic"
                                                            ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </p>
                                        <p class="submitButton">
                                            <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="Create User"
                                                ValidationGroup="RegisterUserValidationGroup" />
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
</asp:Content>
