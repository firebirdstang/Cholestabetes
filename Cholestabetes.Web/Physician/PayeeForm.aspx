<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PayeeForm.aspx.cs" Inherits="Cholestabetes.Web.Physician.PayeeForm" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            if (!$("input[name='<%=rblPayMethod.UniqueID %>']").is(':checked')) {
                // $('div#Institution').hide();
            }
            if ($("input[name='<%=rblPayMethod.UniqueID %>']").is(':checked')) {
                if ($("input[name='<%=rblPayMethod.UniqueID %>']:checked").val() == "Institution") {

                    //$('div#Institution').show();
                    // $('#TRInternalRefNum').show();
                    $('#TRInternal').show();
                    $('#TRAttentionTo').show();
                    $('#TRTaxNumber').show();
                    $('#TrAttentionTo').show();

                    $('#divCompayName').show();
                    
                }
                else {

                    //$('div#Institution').show();
                    //  $('#TRInternalRefNum').hide();
                    $('#TRInternal').hide();
                    $('#TRAttentionTo').hide();
                    $('#TRTaxNumber').hide();
                    $('#TrAttentionTo').hide();
 
                    $('#divCompayName').hide();
                }
            }

            $('input[name="<%=rblPayMethod.UniqueID %>"]').click(function () {
                if ($("input[name='<%=rblPayMethod.UniqueID %>']:checked").val() == "Institution") {


                    $('#TRInternal').show();
                    $('#TRAttentionTo').show();
                    $('#TRTaxNumber').show();
                    $('#TrAttentionTo').show();

                    $('#divCompayName').show();
                }
                else {

                    $('#TRInternal').hide();
                    $('#TRAttentionTo').hide();
                    $('#TRTaxNumber').hide();
                    $('#TrAttentionTo').hide();

                    $('#divCompayName').hide();
                }
            });
        });

        function ValidateTaxNumber(Source, args) {
            var txtTaxNumber = document.getElementById('<%= txtTaxNumber.ClientID %>');
            if ($("input[name='<%=rblPayMethod.UniqueID %>']:checked").val() == "Institution") {
                if (txtTaxNumber.value == "")
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
        }

        function ValidatePaymentOption(Source, args) {

            if (!$("input[name='<%=rblPayMethod.UniqueID %>']").is(':checked')) {
                args.IsValid = false;
            }

            else
                args.IsValid = true;
        }
    
    </script>
    <style type="text/css">
        input.classname
        {
            -moz-box-shadow: inset 0px 1px 0px 0px #f5978e;
            -webkit-box-shadow: inset 0px 1px 0px 0px #f5978e;
            box-shadow: inset 0px 1px 0px 0px #f5978e;
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f24537), color-stop(1, #c62d1f) );
            background: -moz-linear-gradient( center top, #f24537 5%, #c62d1f 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537', endColorstr='#c62d1f');
            background-color: #f24537;
            -webkit-border-top-left-radius: 6px;
            -moz-border-radius-topleft: 6px;
            border-top-left-radius: 6px;
            -webkit-border-top-right-radius: 6px;
            -moz-border-radius-topright: 6px;
            border-top-right-radius: 6px;
            -webkit-border-bottom-right-radius: 6px;
            -moz-border-radius-bottomright: 6px;
            border-bottom-right-radius: 6px;
            -webkit-border-bottom-left-radius: 6px;
            -moz-border-radius-bottomleft: 6px;
            border-bottom-left-radius: 6px;
            text-indent: 0;
            border: 1px solid #d02718;
            display: inline-block;
            color: #ffffff;
            font-family: Arial;
            font-size: 15px;
            font-weight: bold;
            font-style: normal;
            height: 50px;
            line-height: 50px;
            width: 100px;
            text-decoration: none;
            text-align: center;
            text-shadow: 1px 1px 0px #810e05;
        }
        input.classname:hover
        {
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f24537) );
            background: -moz-linear-gradient( center top, #c62d1f 5%, #f24537 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24537');
            background-color: #c62d1f;
        }
        input.classname:active
        {
            position: relative;
            top: 1px;
        }
        .largewhite
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 24px;
            font-weight: bold;
            color: #FFF;
        }
        
        ul.Note li
        {
            background-color: #ddd !important;
            margin: 0px;
            padding-bottom: 15px;
        }
        ul.Note li:hover
        {
            background-color: #ddd !important;
            color: #666;
        }
        
        
        #NoteBody
        {
            background-color: #ddd;
            color: #666;
            width: 586px;
            padding: 12px;
            font-family: Candara,Arial;
        }
        #NoteHeader
        {
            width: 610px;
            background-color: #000;
            color: #fff;
            text-align: center;
            padding: 6px 0px;
            font-family: Candara,Arial;
        }
        #NoteFooter
        {
            background-color: #CCC;
            color: #666;
            line-height: 24px;
            padding-bottom: 50px;
            padding-left: 10px;
            width: 600px;
            font-family: Candara,Arial;
        }
        
        #title
        {
            text-decoration: underline;
            font-size: 20px;
            color: #000;
        }
        .distinct
        {
            color: #802830 !important;
        }
        ul.Note
        {
            list-style-type: circle;
            color: #666;
            padding-left: 20px;
        }
        img.textmiddle
        {
            vertical-align: middle;
        }
        div#PaymentOptions
        {
            margin-left: 40px;
        }
        div#rightcontent
        {
            background-color: #E6E6E6;
            font-family: Candara,Arial;
        }
        .maintext
        {
            font-family: Tahoma, Geneva, sans-serif;
            font-size: 11px;
            color: #000;
            font-weight: bold;
        }
        .clsTextBox
        {
            width: 90%;
            border: 2px solid #AAA;
            height: 24px;
        }
        .clsTextBox2
        {
            width: 90%;
            border: 2px solid #AAA;
        }
        
        .ErrorMsg
        {
            font-weight: bold;
            color: Red;
            font-size: 11px;
            font-family: Arial;
        }
        #rightbox
        {
        }
        img#acslogo
        {
            position: relative;
            left: 320px;
            display: inline;
            margin-top: 50px;
        }
        img#pageIcon
        {
            position: relative;
            height: 120px;
            width: 240px;
        }
        #graybox
        {
            background-color: #E6E6E6;
            padding-bottom: 59px;
        }
        
        
        #box
        {
            width: 700px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #EFEFEF;
            font-size: 13px;
        }
        
        #redboxsmall
        {
            background-color: #C33;
            width: 590px;
            padding: 10px;
            margin-bottom: 25px;
            margin-top: 0px;
            text-align: center;
        }
        #PageHeader
        {
        }
        .maintextsmall
        {
        }
        .style1
        {
            font-family: Tahoma, Geneva, sans-serif;
            font-size: 11px;
            color: #000;
            font-weight: bold;
            height: 46px;
        }
        .style2
        {
            height: 46px;
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
    </style>
    <div id="rightbox">
        <table width="100%" cellspacing="0" border="0">
            <tr>
                <td align="center" style="font-size: 25px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                    PAYEE FORM
                </td>
            </tr>
        </table>
        <br />
        <div style="padding-left: 10px">
            <a href="#">
                <img src="../images/home_flag.png" /></a></div>
        <br />
        <br />
        <table width="90%" border="0" align="center" cellpadding="10" bgcolor="#CCCCCC">
            <tr>
                <td bgcolor="#000000">
                    <span style="color: #FFF; font-size: 30px">INSTRUCTIONS</span>
                </td>
            </tr>
            <tr>
                <td>
                    <ul>
                        <li>The Payee Form is a <span style="color: #C00">mandatory</span> requirement </li>
                        <li>Please complete all the mandatory fields and click the "Submit" button</li>
                        <li>Mandatory fields are marked with an asterisk: <span style="color: #C00">*</span></li>
                        <li>Once the Payee Form is completed, the status in your dashboard will change to a
                            checkmark (<img src="../images/check.png" />)</li>
                </td>
            </tr>
        </table>
        <br />
        <asp:Panel runat="server" ID="pnlMain">
            <table width="80%" align="center" cellpadding="10" cellspacing="0" bordercolor="#CCCCCC">
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Please select one of the following two options:"
                            Font-Bold="true"></asp:Label>*</span></b>
                        <ul style="list-style-type: none;">
                            <li>
                                <asp:Label ID="Label17" runat="server" Text="I request the cheque(s) to be issued as following:"
                                    Font-Italic="true"></asp:Label></li>
                        </ul>
                        <div id="PaymentOptions">
                            <asp:RadioButtonList CssClass="maintextsmall" runat="server" ID="rblPayMethod" TabIndex="3"
                                AutoPostBack="False" Width="274px">
                                <asp:ListItem Value="Institution">To a  Company Name</asp:ListItem>
                                <asp:ListItem Value="Personal">To Me Personally</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Label Text="Please select an option" runat="server" CssClass="ErrorMsg" ID="lblRdo" />
                        </div>
                    </td>
                </tr>
            </table>
            <br />
            <table width="80%" align="center" cellpadding="10" cellspacing="0" bordercolor="#CCCCCC">
                <tbody>
                    <tr>
                        <td width="30%" align="right" class="blackmedium" valign="top">
                            Cheque Payable to:
                        </td>
                        <td colspan="2" align="left" valign="top">
                            <asp:TextBox ID="txtChequePayableTo" CssClass="clsTextBox" runat="server"></asp:TextBox>
                            <div style="font-size: 9px; text-align: center; padding-top: 0px;" id="divCompayName">
                                COMPANY NAME</div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="ErrorMsg" ControlToValidate="txtChequePayableTo"
                                runat="server" Display="Dynamic" ErrorMessage="Cheque Error"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr id="TRInternal">
                        <td align="right" class="blackmedium" valign="top">
                            Internal Reference Number:
                        </td>
                        <td colspan="2" align="left" valign="top">
                            <asp:TextBox ID="txtInternal" CssClass="clsTextBox" runat="server"></asp:TextBox>
                            <div style="font-size: 9px; text-align: center; padding-top: 2px;">
                                </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="blackmedium" valign="top">
                            Mailing Address 1:
                        </td>
                        <td colspan="2" align="left" valign="top">
                            <asp:TextBox ID="txtMailingAddr1" CssClass="clsTextBox" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="ErrorMsg" ControlToValidate="txtMailingAddr1"
                                runat="server" Display="Dynamic" ErrorMessage="Missing Mailing Address Line 1:"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="blackmedium" valign="top">
                            Mailing Address 2:
                        </td>
                        <td colspan="2" align="left" valign="top">
                            <asp:TextBox CssClass="clsTextBox" ID="txtMailingAddr2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr id="TrAttentionTo">
                        <td align="right" class="blackmedium" valign="top">
                            Attention to:
                        </td>
                        <td colspan="2" align="left" valign="top">
                            <asp:TextBox CssClass="clsTextBox" ID="txtAttentionTo" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="blackmedium" valign="top">
                            City:
                        </td>
                        <td colspan="2" align="left" valign="top">
                            <asp:TextBox ID="txtCity" CssClass="clsTextBox" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="ErrorMsg" ControlToValidate="txtCity"
                                runat="server" Display="Dynamic" ErrorMessage="Missing City"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="blackmedium" valign="top">
                            Province
                        </td>
                        <td colspan="2" align="left" valign="top">
                            <asp:DropDownList ID="DDListPro" runat="server">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="cmpdState" runat="server" ControlToValidate="DDListPro"
                                CssClass="ErrorMsg" ValueToCompare="---" ErrorMessage="Please select province"
                                Type="String" Operator="NotEqual" ForeColor="Red">
                 
                            </asp:CompareValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="blackmedium" valign="top">
                            Postal Code:
                        </td>
                        <td colspan="2" align="left" valign="top">
                            <asp:TextBox ID="txtPostalCode" CssClass="clsTextBox" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="ErrorMsg" ControlToValidate="txtPostalCode"
                                runat="server" Display="Dynamic" ErrorMessage="Missing Postal Code"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr id="TRTaxNumber">
                        <td align="right" class="blackmedium" valign="top">
                            Tax Number<br />
                            (HST / Other):
                        </td>
                        <td colspan="2" align="left" valign="top">
                            <asp:TextBox ID="txtTaxNumber" CssClass="clsTextBox" runat="server"></asp:TextBox>
                            <br />
                            <asp:CustomValidator ID="CustomValidator6" runat="server" ErrorMessage="Missing Tax Number (HST/Other):"
                                CssClass="ErrorMsg" ClientValidationFunction="ValidateTaxNumber" Display="Dynamic"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="blackmedium" valign="top">
                            Additional Instructions
                        </td>
                        <td colspan="2" align="left" valign="top">
                            <asp:TextBox ID="txtInstructions" CssClass="clsTextBox2" runat="server" TextMode="MultiLine"
                                Rows="5"></asp:TextBox>
                            <div style="font-size: 9px; text-align: center; padding-top: 2px;">
                                IF APPLICABLE</div>
                            <br />
                            <%--<asp:RequiredFieldValidator ID="reqtxtInstructions" CssClass="ErrorMsg" ControlToValidate="txtInstructions"
                        runat="server" Display="Dynamic" ErrorMessage="Missing Additional Instructions"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Label ID="lblSystemMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="35" align="right">
                            &nbsp;
                        </td>
                        <td width="400" height="35" align="right">
                            <asp:Button CssClass="CancelButton" ID="btncancel" runat="server" CausesValidation="false"
                                OnClick="btncancel_Click" />
                        </td>
                        <td width="150" align="left" valign="top">
                            <asp:Button ID="btnSubmit" CssClass="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel>
        <br />
        <br />
    </div>
</asp:Content>
