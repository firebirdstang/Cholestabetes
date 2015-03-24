<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Account.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Cholestabetes.Web.Admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <style type="text/css">
        li
        {
            list-style: none;
        }
        .summary
        {
            color: Red;
            font-size: 12px;
        }
    </style>
    <asp:Panel ID="Panel1" runat="server" DefaultButton="LoginButton">
        <span class="failureNotification">
            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
        </span>
        <div style="margin: 0 auto;">
            <table width="60%" border="0" cellspacing="0" cellpadding="5" align="center" style="border-color: #000;
                border-style: solid; border-width: thin; margin-top: 10px">
                <tr>
                    <td class="whitemedium" style="background-color: #000; font-family: Arial, Helvetica, sans-serif;
                        text-align: center; font-size: 25px">
                        <asp:Label   runat="server"  ID="lblMssg" Text="Registered Participant Login:" />
                    </td>
                </tr>
                <tr>
                    <td style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; text-align: center">
                        <p>
                            Username:<br />
                            <asp:TextBox ID="UserName" size="50" runat="server" CssClass="textEntry"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            Password:<br />
                            <asp:TextBox ID="Password" size="50" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification summary"
                                ValidationGroup="LoginUserValidationGroup" />
                        </p>
                        <%-- <p>
                        <asp:CheckBox ID="RememberMe" runat="server" />
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                    </p>--%>
                        <p class="submitButton">
                            <asp:Button CssClass="logInBtn" ID="LoginButton" runat="server" CommandName="Login"
                                ValidationGroup="LoginUserValidationGroup" OnClick="LoginButton_clicked" />
                        </p>
                        <%--<span class="small"><a href="ChangePhysicianPassword.aspx">Forgot your password?</a></span>--%><br />
                        <br />
                        <asp:Label ID="lblLoginResult" runat="server"  ForeColor="Red"/>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>
