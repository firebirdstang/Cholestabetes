<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhysicianInfo.aspx.cs"
    Inherits="Cholestabetes.Web.Admin.PhysicianInfo" %>

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
 .missing
        {
          color:Red;   
          font-size:11px;
        }
</style>
    <script type="text/javascript">
        function MM_swapImgRestore() { //v3.0
            var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }
        function MM_preloadImages() { //v3.0
            var d = document; if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n); return x;
        }

        function MM_swapImage() { //v3.0
            var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
        }
    </script>
</head>
<body>
    <br />
    <form runat="server">
    <div id="physicianinfo" class="well" style="max-width: 44em;">
        <table width="600" align="center" cellpadding="10" cellspacing="0" bordercolor="#CCCCCC">
            <tr>
                <td height="35" colspan="3" align="center" bgcolor="#CCCCCC" class="blackbold">
                    <br />
                    <span style="color: #C00">PHYSICIAN CONTACT INFORMATION</span><br />
                </td>
            </tr>
            <tr>
                <td height="35" colspan="3" align="center" bgcolor="#CCCCCC" class="blackmedium">
                    Please update any revelant field below and click the &quot;Update&quot; button.
                    <br />
                    <br />
                    * PLEASE DO NOT UPDATE ANY OF THE CONTACT FIELDS
                    <br />
                    FOR PHYSICIANS MARKED AS <span style="text-decoration: underline; color: #C00">REGISTERED</span>*
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td width="347" height="35" align="right" class="blackmedium">
                    Invitation Rank:
                </td>
                <td colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtInvRank" size="60" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Invitation Rank required"
                        Enabled="false" ControlToValidate="txtInvRank" runat="server" CssClass="whitelarge"
                        ValidationGroup="AddPhysician" Text="*" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    First Name:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtFirstName" size="60" />
                    <asp:RequiredFieldValidator ID="reqtxtFirstName" ErrorMessage="First Name required"
                        ControlToValidate="txtFirstName" runat="server" CssClass="whitelarge missing"
                        ValidationGroup="AddPhysician" Text="*<br>First Name required" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    Last Name:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtLastName" size="60" />
                    <asp:RequiredFieldValidator ID="reqtxtLastName" ErrorMessage="Last Name required"
                        ControlToValidate="txtLastName" runat="server" CssClass="whitelarge missing"
                        ValidationGroup="AddPhysician" Text="*<br>Last Name required" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    Clinic Name:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtClinic" size="60" />
                    <asp:RequiredFieldValidator ID="reqtxtClinic" ErrorMessage="Clinic Name required"
                        ControlToValidate="txtClinic" runat="server" CssClass="whitelarge missing" ValidationGroup="AddPhysician"
                        Text="*<br>Clinic Name required" Enabled="false" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    Address:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtAddress" size="60" />
                    <asp:RequiredFieldValidator ID="reqtxtAddress" ErrorMessage="Address required" ControlToValidate="txtAddress"
                        Enabled="false" runat="server" CssClass="whitelarge missing" ValidationGroup="AddPhysician"
                        Text="*<br>Address required" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    City:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtCity" size="60" />
                    <asp:RequiredFieldValidator ID="reqtxtCity" ErrorMessage="City required" ControlToValidate="txtCity"
                        Enabled="false" runat="server" CssClass="whitelarge missing" ValidationGroup="AddPhysician"
                        Text="*<br>City required" />
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
                        ControlToValidate="txtPostal" runat="server" CssClass="whitelarge missing" ValidationGroup="AddPhysician"
                        Enabled="false" Text="*<br>Postal Code required" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    Telephone:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtTelephone" size="60" />
                    <asp:RequiredFieldValidator ID="reqtxtTelephone" ErrorMessage="Telephone required"
                        Enabled="false" ControlToValidate="txtTelephone" runat="server" CssClass="whitelarge missing"
                        ValidationGroup="AddPhysician" Text="*<br>Telephone required" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    Fax:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtFax" size="60" />
                    <asp:RequiredFieldValidator Enabled="false" ID="reqtxtFax" ErrorMessage="Fax required"
                        ControlToValidate="txtFax" runat="server" CssClass="whitelarge missing" ValidationGroup="AddPhysician"
                        Text="*<br>Fax required" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    Email:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtEmail" size="60" />
                    <asp:RequiredFieldValidator ID="reqtxtEmail" ErrorMessage="Email required" ControlToValidate="txtEmail"
                        Enabled="false" runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician"
                        Text="*" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    Username:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtUserName" size="60" ReadOnly="true" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    Reg Code:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtRegCode" size="60" ReadOnly="true" />
                </td>
            </tr>
            <tr>
                <td height="35" align="right" class="blackmedium">
                    Comments:
                </td>
                <td height="35" colspan="2" align="left">
                    <asp:TextBox runat="server" ID="txtComments" TextMode="MultiLine" Width="100%" Rows="5" />
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Email required" ControlToValidate="txtEmail"
                        Enabled="false" runat="server" CssClass="whitelarge" ValidationGroup="AddPhysician"
                        Text="*" />--%>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <p class="summary">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="AddPhysician"
                            ShowSummary="true" CssClass="summary" Enabled="false" />
                    </p>
                </td>
            </tr>
            <tr>
                <td height="35" align="right">
                    &nbsp;
                </td>
                <td width="337" height="35" align="right">
                    <a href="#" class="cancel" onclick="javascript:parent.$.fancybox.close();">Exit</a>
                </td>
                <td width="224" align="left" valign="top">
                    <asp:LinkButton Text="Save" runat="server" CssClass="submit" ID="btnSave" OnClick="btnUpdatePhysician_Click"
                        ValidationGroup="AddPhysician" />
                </td>
            </tr>
        </table>
        <asp:Panel runat="server" ID="pnlEmailInvittaion" Width="600" HorizontalAlign="Center"
            Style="margin: 0 auto;">
            <fieldset style="border: solid 1px grey; margin-top: 10px;">
                <legend class="blackmedium">Email Invitation</legend>
                <table width="600" align="center" cellpadding="10" cellspacing="0" bordercolor="#CCCCCC">
                    <tr>
                        <td height="35" align="right" class="blackmedium" width="100">
                            Email:
                        </td>
                        <td height="35" align="left">
                            <asp:TextBox runat="server" ID="txtEmailInvitation" Width="200px" />
                        </td>
                    </tr>
                    <tr>
                        <td height="35" align="right" class="blackmedium" width="100">
                            Is French:
                        </td>
                        <td height="35" align="left">
                            <asp:CheckBox Text="" runat="server" ID="chkFrench" />
                        </td>
                    </tr>
                    <tr>
                        <td height="35" align="right" class="blackmedium" width="100">
                        </td>
                        <td height="35" align="left">
                            <asp:Label runat="server" ForeColor="Green" ID="lblInvResult" />
                        </td>
                    </tr>
                    <tr>
                        <td height="35" align="center" class="blackmedium" width="100" colspan="2">
                            <a href="#" class="cancel" onclick="javascript:parent.$.fancybox.close();">Exit</a>
                            <asp:LinkButton ID="btnInvite" Text="Invite" runat="server" CssClass="submit" OnClick="btnInvite_clicked" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
