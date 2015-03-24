<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPhysician.aspx.cs" Inherits="Cholestabetes.Web.Admin.AddPhysician" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
#body{
	background-color: rgba(255, 255, 255, 0.8);
	padding: 35px;
	border-radius: 25px 25px 0px 0px;
}
.whitesmall{
	font-size: 9px;
	color: #FFF;
}
.blackmedium{
	font-size: 13px;
	color: #000;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.bodySMALL {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333;
}
.blackbold {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 24px;
	color: #000;
	font-weight: bold;
}
.line {
	border-bottom-width: thin;
	border-bottom-style: solid;
	border-bottom-color: #999;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333;
	<style type="text/css">
}
.submit {
	-moz-box-shadow:inset 0px 1px 0px 0px #f29c93;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f29c93;
	box-shadow:inset 0px 1px 0px 0px #f29c93;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ff6e5e), color-stop(1, #ce0100) );
	background:-moz-linear-gradient( center top, #ff6e5e 5%, #ce0100 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff6e5e', endColorstr='#ce0100');
	background-color:#ff6e5e;
	-webkit-border-top-left-radius:20px;
	-moz-border-radius-topleft:20px;
	border-top-left-radius:20px;
	-webkit-border-top-right-radius:20px;
	-moz-border-radius-topright:20px;
	border-top-right-radius:20px;
	-webkit-border-bottom-right-radius:20px;
	-moz-border-radius-bottomright:20px;
	border-bottom-right-radius:20px;
	-webkit-border-bottom-left-radius:20px;
	-moz-border-radius-bottomleft:20px;
	border-bottom-left-radius:20px;
	text-indent:0;
	border:1px solid #d83526;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:90px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #b23e35;
}
.submit:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ce0100), color-stop(1, #ff6e5e) );
	background:-moz-linear-gradient( center top, #ce0100 5%, #ff6e5e 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100', endColorstr='#ff6e5e');
	background-color:#ce0100;
}.submit:active {
	position:relative;
	top:1px;
}
.cancel {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	-webkit-border-top-left-radius:20px;
	-moz-border-radius-topleft:20px;
	border-top-left-radius:20px;
	-webkit-border-top-right-radius:20px;
	-moz-border-radius-topright:20px;
	border-top-right-radius:20px;
	-webkit-border-bottom-right-radius:20px;
	-moz-border-radius-bottomright:20px;
	border-bottom-right-radius:20px;
	-webkit-border-bottom-left-radius:20px;
	-moz-border-radius-bottomleft:20px;
	border-bottom-left-radius:20px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:90px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
}
.cancel:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed) );
	background:-moz-linear-gradient( center top, #dfdfdf 5%, #ededed 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed');
	background-color:#dfdfdf;
}.cancel:active {
	position:relative;
	top:1px;
}
li
{
  list-style: none;   
}
.summary
{  color:Red;
   font-size:12px;
    
}
</style>
</head>
<body>
    <br />
    <form id="Form1" runat="server">
    <table width="600" align="center" cellpadding="10" cellspacing="0" bordercolor="#CCCCCC">
        <tr>
            <td height="35" colspan="3" align="center" bgcolor="#CCCCCC" class="blackbold">
                <br />
                ADD NEW CONTACT<br />
            </td>
        </tr>
        <tr>
            <td height="35" colspan="3" align="center" bgcolor="#CCCCCC" class="blackmedium">
                Please complete the fields below to create a new contact and click the &quot;Submit&quot;
                button.<br />
                Mandatory fields are marked with an asterisk: *<br />
                <br />
            </td>
        </tr>
        <tr>
            <td width="347" height="35" align="right" class="blackmedium">
                Invitiation Rank:
            </td>
            <td colspan="2" align="left">
                <asp:TextBox runat="server" ID="txtInvRank" size="60" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Invitation Rank required"
                    ControlToValidate="txtInvRank" runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician"
                    Text="*" />
            </td>
        </tr>
        <tr>
            <td height="35" align="right" class="blackmedium">
                First Name:
            </td>
            <td height="35" colspan="2" align="left">
                <asp:TextBox runat="server" ID="txtFirstName" size="60" />
                <asp:RequiredFieldValidator ID="reqtxtFirstName" ErrorMessage="First Name required"
                    ControlToValidate="txtFirstName" runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician"
                    Text="*" />
            </td>
        </tr>
        <tr>
            <td height="35" align="right" class="blackmedium">
                Last Name:
            </td>
            <td height="35" colspan="2" align="left">
                <asp:TextBox runat="server" ID="txtLastName" size="60" />
                <asp:RequiredFieldValidator ID="reqtxtLastName" ErrorMessage="Last Name required"
                    ControlToValidate="txtLastName" runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician"
                    Text="*" />
            </td>
        </tr>
        <tr>
            <td height="35" align="right" class="blackmedium">
                Address:
            </td>
            <td height="35" colspan="2" align="left">
                <asp:TextBox runat="server" ID="txtAddress" size="60" />
                <asp:RequiredFieldValidator ID="reqtxtAddress" ErrorMessage="Address required" ControlToValidate="txtAddress"
                    runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician" Text="*" />
            </td>
        </tr>
        <tr>
            <td height="35" align="right" class="blackmedium">
                City:
            </td>
            <td height="35" colspan="2" align="left">
                <asp:TextBox runat="server" ID="txtCity" size="60" />
                <asp:RequiredFieldValidator ID="reqtxtCity" ErrorMessage="City required" ControlToValidate="txtCity"
                    runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician" Text="*" />
            </td>
        </tr>
        <tr>
            <td height="35" align="right" class="blackmedium">
                Province
            </td>
            <td height="35" colspan="2" align="left">
                <asp:DropDownList runat="server" ID="ddProvince">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td height="35" align="right" class="blackmedium">
                Postal Code:
            </td>
            <td height="35" colspan="2" align="left">
                <asp:TextBox runat="server" ID="txtPostal" size="60" />
                <asp:RequiredFieldValidator ID="reqtxtPostal" ErrorMessage="Postal Code required"
                    ControlToValidate="txtPostal" runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician"
                    Text="*" />
            </td>
        </tr>
        <tr>
            <td height="35" align="right" class="blackmedium">
                Telephone:
            </td>
            <td height="35" colspan="2" align="left">
                <asp:TextBox runat="server" ID="txtTelephone" size="60" />
                <asp:RequiredFieldValidator ID="reqtxtTelephone" ErrorMessage="Telephone required"
                    ControlToValidate="txtTelephone" runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician"
                    Text="*" />
            </td>
        </tr>
        <tr>
            <td height="35" align="right" class="blackmedium">
                Fax:
            </td>
            <td height="35" colspan="2" align="left">
                <asp:TextBox runat="server" ID="txtFax" size="60" />
                <asp:RequiredFieldValidator ID="reqtxtFax" ErrorMessage="Fax required" ControlToValidate="txtFax"
                    runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician" Text="*" />
            </td>
        </tr>
        <tr>
            <td height="35" align="right" class="blackmedium">
                Email:
            </td>
            <td height="35" colspan="2" align="left">
                <asp:TextBox runat="server" ID="txtEmail" size="60" />
                <asp:RequiredFieldValidator ID="reqtxtEmail" ErrorMessage="Email required" ControlToValidate="txtEmail"
                    runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician" Text="*" />
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <p class="summary">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="AddPhysician"
                        ShowSummary="true" CssClass="summary" />
                </p>
            </td>
        </tr>
        <tr>
            <td height="35" align="right">
                &nbsp;
            </td>
            <td width="337" height="35" align="right">
                <a href="#" class="cancel" onclick="window.close();">Exit</a>
            </td>
            <td width="224" align="left" valign="top">
                <asp:LinkButton Text="Submit" runat="server" CssClass="submit" ID="btnSave" OnClick="btnSave_Click"
                    ValidationGroup="AddPhysician" />
            </td>
        </tr>
    </table>
    </form>



</body>
</html>
