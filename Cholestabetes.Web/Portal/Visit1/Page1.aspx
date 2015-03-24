<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Page1.aspx.cs" Inherits="Cholestabetes.Web.Portal.Visit1.Page1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/jquery.mask.js" type="text/javascript"></script>
    <script src="../../Scripts/CustomScripts.js" type="text/javascript"></script>
    <style type="text/css">
        .InfoFooter
        {
            font-size: 11px;
        }
        .Infoheading
        {
            font-size: 15px;
        }
        .InfoBody
        {
            color: White;
            font-family: Candara;
            background-color: brown;
            padding: 5px;
            padding-left: 8px;
            padding-right: 8px;
            width: 400px;
        }
        
        .InfoLst
        {
            font-size: 14px;
        }
        
        
        .ui-datepicker
        {
            font-size: 11px;
        }
        
        #box
        {
            width: 700px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #EFEFEF;
        }
        .smallwhite
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            color: #FFF;
        }
        .mediumgray
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 16px;
            color: #666;
        }
        .blackmedium
        {
            font-size: 12px;
        }
        .well
        {
            min-height: 20px;
            padding: 0px;
            margin-bottom: 20px;
            background-color: #f5f5f5;
            border: 1px solid #e3e3e3;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
            width: 700px;
        }
        .well blockquote
        {
            border-color: #ddd;
            border-color: rgba(0,0,0,.15);
        }
        .well-lg
        {
            padding: 24px;
            border-radius: 6px;
        }
        .well-sm
        {
            padding: 9px;
            border-radius: 3px;
        }
        .close
        {
            float: right;
            font-size: 21px;
            font-weight: 700;
            line-height: 1;
            color: #000;
            text-shadow: 0 1px 0 #fff;
            filter: alpha(opacity=20);
            opacity: .2;
        }
        .close:hover, .close:focus
        {
            color: #000;
            text-decoration: none;
            cursor: pointer;
            filter: alpha(opacity=50);
            opacity: .5;
        }
        button.close
        {
            -webkit-appearance: none;
            padding: 0;
            cursor: pointer;
            background: 0 0;
            border: 0;
        }
        .line
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #333;
            border: thin solid #999;
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
        .missing
        {
            color: Red;
            font-size: 11px;
        }
        .chkLst
        {
            font-style: italic;
            font-size: 14px;
        }
        .tblInfo img
        {
            /*float:right; */
        }
        .hover
        {
            cursor: pointer;
        }
        .lbl
        {
            font-size: 11px;
        }
        .fixedWidth
        {
            width: 180px;
        }
    </style>
    <script type="text/javascript" language="javascript">

        function txtLastName_OnClientValidate(sender, args) {

            var isValidLN = false;
            var lastName = $('#<%=txtLastName.ClientID %>').val();
            if (!lastName)
                isValidLN = false;
            else
                if (lastName.match(/\d+/g))
                    isValidLN = false;
                else
                    isValidLN = true;

            if (isValidLN)
                args.IsValid = true;
            else
                args.IsValid = false;

        }

        function txtFirstName_OnClientValidate(sender, args) {

            var isValidFN = false;
            var firstName = $('#<%=txtFirstName.ClientID %>').val();
            if (!firstName)
                isValidFN = false;
            else
                if (firstName.match(/\d+/g))
                    isValidFN = false;
                else
                    isValidFN = true;

            if (isValidFN)
                args.IsValid = true;
            else
                args.IsValid = false;

        }


        function pageLoad() {


            $(document).ready(function () {

                $('#<%=imgBtn.ClientID %>').datepicker({

                    altField: $('#<%=txtDateConsent.ClientID %>'),

                    numberOfMonths: 1,
                    changeMonth: true,
                    changeYear: true,
                    //                dateFormat: "yy/mm/dd",
                    dateFormat: "dd/mm/yy",
                    yearRange: "2000:2016"

                });


                $('#<%=txtDateConsent.ClientID %>').datepicker({

                    altField: $('#<%=txtDateConsent.ClientID %>'),

                    numberOfMonths: 1,
                    changeMonth: true,
                    changeYear: true,
                    //                dateFormat: "yy/mm/dd",
                    dateFormat: "dd/mm/yy",
                    yearRange: "2000:2016"

                });

                $("#SAEPopUp").dialog({
                    width: 800,
                    autoOpen: false,
                    modal: true

                });


                $('#<%=txtPhone.ClientID %>').mask("999-999-9999");


                $('#<%=txtDateConsent.ClientID %>').attr('readonly', true);


                ScrollView(cntrlToFocus);

            });

        }
    
    </script>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:HoverMenuExtender ID="hovMenu" runat="server" TargetControlID="imgHover" PopupControlID="pnlPopup"
                PopupPosition="Left">
            </asp:HoverMenuExtender>
            <asp:Panel runat="server" ID="pnlPopup">
                <div class="InfoBody">
                    <p class="Infoheading">
                        Diabetes should be diagnosed by any of the following criteria:</p>
                    <ul class="InfoLst">
                        <li>FPG ≥7.0 mmol/L </li>
                        <li>A1C ≥6.5% (for use in adults in the absence of factors that affect the accuracy
                            of A1C and not for use in those with suspected type 1 diabetes) </li>
                        <li>2hPG in a 75 g OGTT ≥11.1 mmol/L </li>
                        <li>Random PG ≥11.1 mmol/L </li>
                    </ul>
                    <p class="InfoFooter">
                        Ref: Canadian Diabetes Association Clinical Practice Guidelines Expert Committee.
                        Canadian Diabetes Association 2013 Clinical Practice Guidelines for the Prevention
                        and Management of Diabetes in Canada. Can J Diabetes 2013;37(suppl 1):S1-S212.</p>
                </div>
            </asp:Panel>
            <asp:HoverMenuExtender ID="hovPhone" runat="server" TargetControlID="imgPhone" PopupControlID="pnlPhoneInfo"
                PopupPosition="Left">
            </asp:HoverMenuExtender>
            <asp:Panel runat="server" ID="pnlPhoneInfo">
                <div class="InfoBody">
                    <p class="Infoheading">
                        Please enter phone in format xxx-xxx-xxxx:</p>
                </div>
            </asp:Panel>
            <div id="rightbox">
                <asp:Panel runat="server" ID="pnlMain">
                    <table width="100%" cellspacing="0" border="0">
                        <tr>
                            <td align="center" style="font-size: 25px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                                E-CRF PORTAL
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div style="padding-left: 10px">
                        <a href="../Patients.aspx">
                            <img src="../../images/home_flag.png" /></a></div>
                    <div id="visit1">
                        <table width="100%" border="0" cellpadding="10" align="center" bgcolor="#333333"
                            style="font-family: Arial, Helvetica, sans-serif">
                            <tr>
                                <td align="center">
                                    <span style="color: #FFF; font-size: 30px">1 - PATIENT ELIGIBILITY AND CONSENT</span>
                                </td>
                            </tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="100%" border="0">
                                        <tr>
                                            <td>
                                                <span class="patientIDLabel">Patient Number:</span>
                                            </td>
                                            <td align="left">
                                                <asp:Label runat="server" ID="lblPatientNum" CssClass="patientNum"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel runat="server" ID="pnlCustVal" CssClass="errorMssg" Width="100%" HorizontalAlign="Center">
                            <asp:CustomValidator ErrorMessage="Please review the form and complete the required fields"
                                ID="customVal" OnServerValidate="customVal_OnServerValidate" runat="server" ValidationGroup="Validate"
                                Display="Dynamic" EnableClientScript="true" />
                        </asp:Panel>
                        <table width="100%" border="0" cellspacing="0" cellpadding="10" style="font-family: Arial, Helvetica, sans-serif;
                            border: thin solid #333;">
                            <tr>
                                <td style="background-color: #093">
                                    <span style="color: #FFF"><span style="font-size: 28px; font-weight: bold">Inclusion
                                        Criteria:</span> <em>ALL of the criteria must be present</em></span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol class="list">
                                        <li>Male and female patients older than 18 years of age</li>
                                        <li>Diagnosis of hypercholesterolemia and type 2 diabetes mellitus (CDA definition)
                                            <asp:Image ID="imgHover" ImageUrl="~/images/info_icon.png" runat="server" CssClass="hover middleAlign" />
                                        </li>
                                        <li>High-risk for cardiovascular disease defined as one of:
                                            <table width="100%" border="0" align="center" style="font-style: italic; font-size: 14px">
                                                <tr>
                                                    <td>
                                                        <span style="padding-top: 0px; color: Gray; font-size: 14px; font-style: italic;">Check
                                                            ALL that apply (at least ONE must be present)</span>
                                                        <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgChkLst" Visible="false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox Text="10-year risk of cardiovascular event ≥20% based on the Framingham Risk Score"
                                                            runat="server" ID="chkQ1A1" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox Text="Prior diagnosis of CAD <span style='font-size: 10px'>(PCI, CABG, MI, Stenosis > 50%  on angiogram)</span>"
                                                            runat="server" ID="chkQ1A2" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox Text="Prior diagnosis of CeVD <span style='font-size: 10px'>(TIA, CVA, Carotid disease on ultrasound > 50%)</span>"
                                                            runat="server" ID="chkQ1A3" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox Text="Prior history of Abdominal Aortic Aneurysm surgery" runat="server"
                                                            ID="chkQ1A4" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox Text="Prior history of PAD <span style='font-size: 10px'>(AFB, Stent, or ABI < 0.7 with symptoms of intermittent claudication)</span>"
                                                            runat="server" ID="chkQ1A5" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                        <li>LDL-C > 2.0 mmol/L despite on optimal statin therapy (e.g. Atorvastatin ≥ 20 mg,
                                            Rosuvastatin ≥ 10 mg, Simvastatin ≥ 40 mg)</li>
                                        <li>A1C > 7.0% and < 9.0% on optimal metformin therapy (e.g. ≥ 1500 mg / day)</li>
                                    </ol>
                                    <table class="tblInfo" width="90%" border="0" cellpadding="10" align="center" style="border: medium solid #333;">
                                        <tr>
                                            <td>
                                                <strong>Patient's Consent to Participate: </strong>
                                                <br />
                                                <span class="note">Please ensure that you retain a signed copy of the Informed Consent
                                                    Form in your files</span>
                                                <br />
                                                <br />
                                                <table width="100%" align="center" cellpadding="6" cellspacing="0">
                                                    <tr>
                                                        <td width="30%" align="left" class="blackmedium" valign="middle">
                                                            <strong>Date of Consent:</strong>
                                                        </td>
                                                        <td align="left" valign="middle" style="width: 100%;">
                                                            <asp:TextBox runat="server" ID="txtDateConsent" ValidationGroup="Validate" CssClass="fixedWidth" />
                                                            <asp:ImageButton ImageUrl="~/images/calendar.png" runat="server" ID="imgBtn" OnClientClick="return false;"
                                                                Style="vertical-align: middle;" />
                                                            <asp:Image ImageUrl="~/images/imp_icon.png" Visible="false" runat="server" ID="imgDateConsent" />
                                                            <br />
                                                            <asp:Label ForeColor="Red" Text="Cannot be future date" runat="server" ID="lblDateOfConsent"
                                                                CssClass="lbl" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                                ControlToValidate="txtDateConsent" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="blackmedium" valign="top">
                                                            <strong>Patient's Last Name:</strong>
                                                        </td>
                                                        <td align="left" valign="top">
                                                            <asp:TextBox runat="server" ID="txtLastName" ValidationGroup="Validate" CssClass="fixedWidth"
                                                                MaxLength="25" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:RequiredFieldValidator ID="reqtxtLastName" CssClass="missing" ErrorMessage="Last Name Required"
                                                                ControlToValidate="txtLastName" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="30%">
                                                        </td>
                                                        <td colspan="2">
                                                            <asp:CustomValidator ErrorMessage="Entry may not be numeric" ControlToValidate="txtLastName"
                                                                CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="txtLastName_OnClientValidate"
                                                                Display="Dynamic">
                                                            
                                                            </asp:CustomValidator>
                                                            <asp:Label Text="Entry may not be numeric" runat="server" ForeColor="Red" Visible="false"
                                                                ID="lblLastNameNoDigits" CssClass="missing" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="blackmedium" valign="top">
                                                            <strong>Patient's First Name:</strong>
                                                        </td>
                                                        <td align="left" valign="top">
                                                            <asp:TextBox runat="server" ID="txtFirstName" ValidationGroup="Validate" CssClass="fixedWidth"
                                                                MaxLength="25" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:RequiredFieldValidator ID="reqtxtFirstName" CssClass="missing" ErrorMessage="First Name Required"
                                                                ControlToValidate="txtFirstName" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="30%">
                                                        </td>
                                                        <td colspan="2">
                                                            <asp:CustomValidator ErrorMessage="Entry may not be numeric" ControlToValidate="txtFirstName"
                                                                CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="txtFirstName_OnClientValidate"
                                                                Display="Dynamic">
                                                            
                                                            </asp:CustomValidator>
                                                            <asp:Label Text="Entry may not be numeric" runat="server" ForeColor="Red" Visible="false"
                                                                ID="lblFirstNameNoDigits" CssClass="missing" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="blackmedium" valign="top">
                                                            <strong>Patient's Date of Birth:</strong>
                                                            <div style="font-size: 9px; text-align: left">
                                                                Select from the Dropdown menu</div>
                                                        </td>
                                                        <td align="left" valign="top">
                                                            <table border="0" cellpadding="2" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList runat="server" ID="ddDay" Width="40px">
                                                                        </asp:DropDownList>
                                                                        <div class="smallInfo">
                                                                            Day</div>
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList runat="server" ID="ddMonth" Width="80px">
                                                                            <asp:ListItem Text="---" Value="---"></asp:ListItem>
                                                                            <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="February" Value="2"></asp:ListItem>
                                                                            <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                                                            <asp:ListItem Text="April" Value="4"></asp:ListItem>
                                                                            <asp:ListItem Text="May" Value="5"></asp:ListItem>
                                                                            <asp:ListItem Text="June" Value="6"></asp:ListItem>
                                                                            <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                                                            <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                                                            <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                                                            <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                                                            <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                                                            <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <div class="smallInfo">
                                                                            Month</div>
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList runat="server" ID="ddYear" Width="55px">
                                                                        </asp:DropDownList>
                                                                        <div class="smallInfo">
                                                                            Year</div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgDOB" Visible="false" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="blackmedium" valign="top">
                                                            <strong>Patient's Phone #:</strong>
                                                        </td>
                                                        <td width="14%" align="left" valign="top">
                                                            <asp:TextBox runat="server" ID="txtPhone" ValidationGroup="Validate" CssClass="fixedWidth" />
                                                            <asp:Image ID="imgPhone" ImageUrl="~/images/info_icon.png" runat="server" CssClass="hover middleAlign" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:RequiredFieldValidator ID="reqtxtPhone" CssClass="missing" ErrorMessage="Phone Required"
                                                                ControlToValidate="txtPhone" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                    <table width="100%" border="0" cellspacing="0" cellpadding="10" style="font-family: Arial, Helvetica, sans-serif;
                                        border: medium solid #333;">
                                        <tr>
                                            <td style="background-color: #093">
                                                <asp:CheckBox Text="This patient <b><u>satisfies</u></b>  all the Inclusion Criteria"
                                                    runat="server" ID="chkIncl" ForeColor="White" />
                                            </td>
                                            <td style="background-color: #093" align="right">
                                                <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgInclusion" Visible="false" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <table width="100%" border="0" cellspacing="0" cellpadding="10" style="font-family: Arial, Helvetica, sans-serif;
                            border: thin solid #333;">
                            <tr>
                                <td style="background-color: #C00">
                                    <span style="color: #FFF"><span style="font-size: 28px; font-weight: bold">Exclusion
                                        Criteria:</span> <em>None of the criteria present</em> </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol>
                                        <li>Patients with clinically significant concomitant illness or co-morbid condition
                                            (e.g. cancer)</li>
                                        <li>Liver, muscle or kidney abnormalities (e.g. compromises patient management according
                                            to physician)</li>
                                        <li>Secondary causes of hypercholesterolemia (e.g. hypothyroidism, nephrotic syndrome)</li>
                                        <li>Contraindications or intolerance to combination therapy</li>
                                    </ol>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="10" style="font-family: Arial, Helvetica, sans-serif;
                                        border: medium solid #333;">
                                        <tr>
                                            <td style="background-color: #C00">
                                                <asp:CheckBox Text="This patient does <b><u>NOT</u></b>  have any of the above
                                        Exclusion Criteria" runat="server" ID="chkExclusion" ForeColor="White" />
                                            </td>
                                            <td style="background-color: #C00" align="right">
                                                <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgExclusion" Visible="false" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div style="text-align: center;">
                        </div>
                    </div>
                </asp:Panel>
                <br />
                <table width="100%" border="0" align="center">
                    <tr>
                        <td width="33%" align="left">
                            <a href="#">
                                <asp:Button runat="server" OnClick="imgBack_clicked" ID="imgBack" align="absmiddle"
                                    CssClass="BackBtn" Visible="false" />
                        </td>
                        <td width="33%" align="center">
                            <asp:Button runat="server" OnClick="imgSave_clicked" ID="imgSave" align="absmiddle"
                                ValidationGroup="Validate" CssClass="saveBtn" />
                        </td>
                        <td width="33%" align="right">
                            <asp:Button runat="server" OnClick="imgNext_clicked" ID="imgNext" align="absmiddle"
                                ValidationGroup="Validate" CssClass="nextBtn" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Label runat="server" ID="lblResult" ForeColor="Green" />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
