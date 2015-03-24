<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Account.Master" AutoEventWireup="true"
    CodeBehind="PhysicianRegistration.aspx.cs" Inherits="Cholestabetes.Web.Account.PhysicianRegistration1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
   
    <script src="../Scripts/jquery.mask.js" type="text/javascript"></script>
    <script type="text/javascript">

        $('#<%=txtPhone.ClientID %>').mask("999-999-9999");
        $('#<%=txtFax.ClientID %>').mask("999-999-9999");
    
    </script>
    <asp:MultiView ID="regView" runat="server" ActiveViewIndex="0">
        <asp:View runat="server" ID="Step1">
            <div>
                <table width="60%" border="0" cellspacing="0" cellpadding="5" align="center" style="border-color: #000;
                    border-style: solid; border-width: thin; margin-top: 10px">
                    <tr>
                        <td class="whitemedium" style="background-color: #000; font-family: Arial, Helvetica, sans-serif;
                            text-align: center; font-size: 25px; padding: 20px; font-variant: small-caps">
                            please review the information provided below for accuracy and click the 'confirm'
                            button to proceed
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; text-align: center">
                            <br />
                            Your Last Name:<br />
                            <asp:TextBox runat="server" size="50" ID="txtLastName" ReadOnly="true" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" ID="reqtxtLastName"
                                ForeColor="Red" RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ValidationGroup="Step1"
                                Enabled="false"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            Your First Name:<br />
                            <asp:TextBox runat="server" size="50" ID="txtFirstName" ReadOnly="true" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" ID="reqtxtFirstName"
                                ForeColor="Red" RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ValidationGroup="Step1"
                                Enabled="false"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            Your City:
                            <br />
                            <asp:TextBox runat="server" size="50" ID="txtCity" ReadOnly="true" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity" ID="reqtxtCity"
                                ForeColor="Red" RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ValidationGroup="Step1"
                                Enabled="false"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            Your Province<br />
                            <asp:TextBox runat="server" size="50" ID="txtProvince" ReadOnly="true" />
                            <br />
                            <br />
                            <br />
                            <br />
                            <asp:Button runat="server" OnClientClick="window.open('not_me.htm', 'newwindow', 'width=450, height=230'); return false;"
                                CssClass="NotMeBtn" />
                            <asp:Button ValidationGroup="Step1" runat="server" OnClick="lbtnConfirm1_clicked"
                                CssClass="confirmBtn" ID="lbtnConfirm1" />
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:View>
        <asp:View runat="server" ID="Step2">
            <div>
                <table width="60%" border="0" cellspacing="0" cellpadding="5" align="center" style="border-color: #000;
                    border-style: solid; border-width: thin; margin-top: 10px">
                    <tr>
                        <td class="whitemedium" style="background-color: #000; font-family: Arial, Helvetica, sans-serif;
                            text-align: center; font-size: 25px; padding: 20px;">
                            REGISTRATION PAGE:
                        </td>
                    </tr>
                    <tr>
                        <td class="whitemedium" style="background-color: #000; font-family: Arial, Helvetica, sans-serif;
                            text-align: center; font-size: 18px;">
                            PLEASE REVIEW FOR ACCURACY<br />
                            UPDATE AND COMPLETE BLANK FIELDS WHERE APPLICABLE
                        </td>
                    </tr>
                    <tr>
                        <td class="whitemedium" style="background-color: #000; font-family: Arial, Helvetica, sans-serif;
                            text-align: center; font-size: 13px; padding: 20px;">
                            *REQUIRED FIELD
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; text-align: center">
                            <br />
                            <table width="100%" border="0" style="text-align: left" cellpadding="10">
                                <tr>
                                    <td>
                                        First Name
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtFirstName2" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName2" ID="reqtxtFirstName2"
                                            ForeColor="Red" RequiredFieldValidator ErrorMessage="* First Name required" Display="Dynamic"
                                            ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        Last Name
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtLastName2" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName2" ID="reqtxtLastName2"
                                            ForeColor="Red" ErrorMessage="* Last Name required" Display="Dynamic" ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Clinic Name
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtClinicName" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtClinicName" ID="reqtxtClinicName"
                                            Enabled="false" ForeColor="Red" ErrorMessage="* Clinic Name required" Display="Dynamic"
                                            ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        Address
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtAddress" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" ID="reqtxtAddress"
                                            ForeColor="Red" ErrorMessage="* Address required" Display="Dynamic" ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        City
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtCity2" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity2" ID="reqtxtCity2"
                                            ForeColor="Red" ErrorMessage="* City required" Display="Dynamic" ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        Province*<br />
                                        <asp:DropDownList runat="server" ID="ddProvince2">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:CompareValidator ID="cmpddProvince2" runat="server" ControlToValidate="ddProvince2"
                                            ValueToCompare="-1" ErrorMessage="error" Text="* Province Required" Type="String"
                                            Operator="NotEqual" ValidationGroup="Step2" Display="Dynamic" ForeColor="Red">
                                        </asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Postal Code
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtPostalCode" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPostalCode" ID="reqtxtPostalCode"
                                            ForeColor="Red" ErrorMessage="* Postal Code required" Display="Dynamic" ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        Phone Number
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtPhone" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone" ID="reqtxtPhone"
                                            ForeColor="Red" ErrorMessage="* Phone required" Display="Dynamic" ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cell Phone / Pager
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtCell" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCell" ID="reqtxtCell"
                                            Enabled="false" ForeColor="Red" ErrorMessage="* Cell Phone required" Display="Dynamic"
                                            ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        Fax Number
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtFax" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFax" ID="reqtxtFax"
                                            ForeColor="Red" ErrorMessage="* Fax required" Display="Dynamic" ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table width="100%" border="0" cellpadding="10" style="border-top-color: #000; border-top-style: solid;
                                border-top-width: medium">
                                <tr>
                                    <td colspan="2">
                                        <strong>User Name (Your Email Address)</strong>
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtEmail2" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail2" ID="reqtxtEmail2"
                                            ForeColor="Red" ErrorMessage="* Email required" Display="Dynamic" ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ForeColor="Red" ValidationGroup="Step2" ControlToValidate="txtEmail2" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Password</strong>
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtPass2" TextMode="Password" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPass2" ID="reqtxtPass2"
                                            ForeColor="Red" ErrorMessage="* Password required" Display="Dynamic" ValidationGroup="Step2"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <strong>Confirm Password</strong>
                                        <br />
                                        <asp:TextBox runat="server" size="50" ID="txtConfirmPass2" TextMode="Password" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPass2" ID="reqtxtConfirmPass2"
                                            ErrorMessage="* Password required" Display="Dynamic" ValidationGroup="Step2"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="txtPass2"
                                            ControlToValidate="txtConfirmPass2" ErrorMessage="Your passwords do not match!"
                                            Display="Dynamic" ValidationGroup="Step2" ForeColor="Red" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label ForeColor="Red" runat="server" ID="lblMssg" />
                            <br />
                            <br />
                            <asp:Button ValidationGroup="Step2" Width="300" runat="server" OnClick="lbtnCompleteRegStep2_clicked"
                                CssClass="completeBtn" ID="lbtnCompleteRegStep2" />
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:View>
        <asp:View ID="Step3" runat="server">
            Congrats you have successfully registered with our system. Click <a href="Login.aspx">
                here</a> to log in
        </asp:View>
    </asp:MultiView>
</asp:Content>
