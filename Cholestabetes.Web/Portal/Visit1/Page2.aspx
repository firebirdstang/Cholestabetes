<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Page2.aspx.cs" Inherits="Cholestabetes.Web.Portal.Visit1.Page2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/CustomScripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">


        function custtxtWeight_OnClientValidate(sender, args) {

            var isValid = false;


            $('#spanWeight').html('');

            var weight = $('#<%=txtWeight.ClientID %>').val();
            var isKg = $('#<%=rdoWeightType.ClientID %> input:checked').val();


            if (isNaN(weight)) {
                isValid = false;
                $('#spanWeight').html('Must be Numeric');

            }
            else
                if (isKg == null)
                    isValid = false;
                else
                    if (!weight)
                        isValid = false;
                    else {
                        if (isKg == 'kg') {
                            if (weight < 30 || weight > 300) {
                                isValid = false;
                                $('#spanWeight').html('Range (30-300) kg');

                            }
                            else
                                isValid = true;
                        }
                        else {
                            if (weight < 66 || weight > 660) {
                                isValid = false;
                                $('#spanWeight').html('Range (66-660) lb');

                            }
                            else
                                isValid = true;
                        }

                    }

            args.IsValid = isValid;

        }


        function custtxtHeight_OnClientValidate(sender, args) {

            var isValid = false;

            $('#spanHeight').html('');

            var height = $('#<%=txtHeight.ClientID %>').val();
            var isCM = $('#<%=rdoHeightType.ClientID %> input:checked').val();


            if (isNaN(height)) {
                isValid = false;
                $('#spanHeight').html('Must be Numeric');

            }
            else
                if (isCM == null)
                    isValid = false;
                else
                    if (!height)
                        isValid = false;
                    else {
                        if (isCM == 'cm') {
                            if (height < 100 || height > 230) {
                                isValid = false;
                                $('#spanHeight').html('Range (100-230) cm');

                            }
                            else
                                isValid = true;
                        }
                        else {
                            if (height < 39 || height > 90) {
                                isValid = false;
                                $('#spanHeight').html('Range (39-90) in');

                            }
                            else
                                isValid = true;
                        }

                    }

            args.IsValid = isValid;

        }




        function ClearValidationMssgs() {

            $('#spanWeight').html('');
            $('#spanHeight').html('');

        }

        function pageLoad() {

            $(document).ready(function () {

                ClearValidationMssgs();


                //diabetes complications

                $('#<%=chkDepressionYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkDiabetesComplicationsNone.ClientID %>').prop('checked', false);

                    }

                });

                $('#<%=chkErectleYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkDiabetesComplicationsNone.ClientID %>').prop('checked', false);
                    }

                });

                $('#<%=chkHypoglycemiaYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkDiabetesComplicationsNone.ClientID %>').prop('checked', false);
                    }

                });

                $('#<%=chkMacroalbuminuriaYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkDiabetesComplicationsNone.ClientID %>').prop('checked', false);
                    }

                });

                $('#<%=chkMicroalbuminuriaYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkDiabetesComplicationsNone.ClientID %>').prop('checked', false);
                    }

                });


                $('#<%=chkRetinopathyYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkDiabetesComplicationsNone.ClientID %>').prop('checked', false);
                    }
                });


                $('#<%=chkDiabetesComplicationsNone.ClientID %>').change(function () {


                    if ($(this).is(':checked')) {

                        $('#<%=chkDepressionYes.ClientID %>').prop('checked', false);
                        $('#<%=chkErectleYes.ClientID %>').prop('checked', false);
                        $('#<%=chkHypoglycemiaYes.ClientID %>').prop('checked', false);
                        $('#<%=chkMacroalbuminuriaYes.ClientID %>').prop('checked', false);
                        $('#<%=chkMicroalbuminuriaYes.ClientID %>').prop('checked', false);
                        $('#<%=chkRetinopathyYes.ClientID %>').prop('checked', false);
                    }

                });

                //diabetes complications

                //current medications complications

                $('#<%=chkCurrentMedicationNone.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkASAYes.ClientID %>').prop('checked', false);
                        $('#<%=chkOtherAntiplateletAgentYes.ClientID %>').prop('checked', false);
                        $('#<%=chkACEInhibitorYes.ClientID %>').prop('checked', false);
                        $('#<%=chkARBYes.ClientID %>').prop('checked', false);
                        $('#<%=chkBetaBlockerYes.ClientID %>').prop('checked', false);
                        $('#<%=chkCalciumChannelBlockerYes.ClientID %>').prop('checked', false);
                        $('#<%=chkDiureticYes.ClientID %>').prop('checked', false);
                    }

                });

                $('#<%=chkASAYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkCurrentMedicationNone.ClientID %>').prop('checked', false);
                    }

                });

                $('#<%=chkOtherAntiplateletAgentYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkCurrentMedicationNone.ClientID %>').prop('checked', false);
                    }

                });

                $('#<%=chkACEInhibitorYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkCurrentMedicationNone.ClientID %>').prop('checked', false);
                    }

                });

                $('#<%=chkARBYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkCurrentMedicationNone.ClientID %>').prop('checked', false);
                    }

                });


                $('#<%=chkBetaBlockerYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkCurrentMedicationNone.ClientID %>').prop('checked', false);
                    }
                });


                $('#<%=chkCalciumChannelBlockerYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkCurrentMedicationNone.ClientID %>').prop('checked', false);
                    }


                });



                $('#<%=chkDiureticYes.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkCurrentMedicationNone.ClientID %>').prop('checked', false);
                    }
                });


                //current medication complications


                //medication adherence

                $('#<%=chkPatientCaregiver.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkDidNotEvaluate.ClientID %>').prop('checked', false);

                    }

                });

                $('#<%=chkPhramacyRenewal.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkDidNotEvaluate.ClientID %>').prop('checked', false);
                    }

                });

                $('#<%=chkMedicationCount.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkDidNotEvaluate.ClientID %>').prop('checked', false);
                    }

                });

                $('#<%=chkGuessedEstimated.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkDidNotEvaluate.ClientID %>').prop('checked', false);
                    }

                });

                //                $('#<%=chkDidNotEvaluate.ClientID %>').change(function () {

                //                    if ($(this).is(':checked')) {

                //                        $('#<%=chkDidNotEvaluate.ClientID %>').prop('checked', false);
                //                    }

                //                });


                $('#<%=chkDidNotEvaluate.ClientID %>').change(function () {


                    if ($(this).is(':checked')) {

                        $('#<%=chkPatientCaregiver.ClientID %>').prop('checked', false);
                        $('#<%=chkPhramacyRenewal.ClientID %>').prop('checked', false);
                        $('#<%=chkMedicationCount.ClientID %>').prop('checked', false);
                        $('#<%=chkGuessedEstimated.ClientID %>').prop('checked', false);
                        //$('#<%=chkDidNotEvaluate.ClientID %>').prop('checked', false);

                    }

                });

                //medication adherence



                $('#<%=imgBtn.ClientID %>').datepicker({

                    altField: $('#<%=txtVisit1Date.ClientID %>'),

                    numberOfMonths: 1,
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    yearRange: "2000:2016"

                });


                $('#<%=txtVisit1Date.ClientID %>').datepicker({

                    altField: $('#<%=txtVisit1Date.ClientID %>'),

                    numberOfMonths: 1,
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    yearRange: "2000:2016"

                });

                $('#<%=txtVisit1Date.ClientID %>').attr('readonly', true);


                ScrollView(cntrlToFocus);

            });
        }
 
  
    </script>
    <style type="text/css">
        .ui-datepicker
        {
            font-size: 11px;
        }
        #box
        {
            width: 600px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #EFEFEF;
            padding: 20px;
        }
        .blackmedium
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            font-weight: bold;
        }
        .missing
        {
            color: Red;
            font-size: 11px;
        }
        .lbl
        {
            font-size: 11px;
        }
        .dd
        {
            width: 200px;
        }
        .verticalAligned
        {
            vertical-align: middle;
        }
        
        .smalldd
        {
            width: 50px;
        }
    </style>
    <asp:ToolkitScriptManager runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="rightbox">
                <table width="100%" cellspacing="0" border="0">
                    <tr>
                        <td align="center" style="font-size: 25px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                            2 - HISTORY, ASSESSMENT AND MEDICATIONS
                        </td>
                    </tr>
                </table>
                <div style="padding-left: 10px">
                    <a href="../Patients.aspx">
                        <img src="../../images/home_flag.png" /></a></div>
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
                <asp:Panel runat="server" ID="pnlMain">
                    <table width="100%" border="0" cellspacing="0" cellpadding="10" style="font-family: Arial, Helvetica, sans-serif;
                        border: thin solid #333;">
                        <tr>
                            <td style="width: 190px;">
                            </td>
                            <td colspan="3">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <table width="100%" border="0" cellpadding="3">
                                    <tr>
                                        <td class="blackmedium" width="30%">
                                            Visit 1 Date:
                                        </td>
                                        <td width="280px">
                                            <asp:TextBox ID="txtVisit1Date" runat="server" CssClass="dd" />
                                            <asp:ImageButton ImageUrl="~/images/calendar.png" runat="server" ID="imgBtn" OnClientClick="return false;"
                                                Style="vertical-align: middle;" />
                                            <asp:RequiredFieldValidator ID="reqtxtVisit1Date" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                ControlToValidate="txtVisit1Date" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:Image ImageUrl="~/images/imp_icon.png" Visible="false" runat="server" ID="imgVisit1Date" />
                                            <div>
                                                <asp:Label Text="Must be ≥ date of consent and < future date" runat="server" ForeColor="Red"
                                                    ID="lblDateOfConsent" CssClass="lbl" />
                                            </div>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Patient's Age:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPatientAge" runat="server" ReadOnly="true" CssClass="dd" BackColor="#006E77"
                                                ForeColor="White" />
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Gender:
                                        </td>
                                        <td>
                                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="chkGender" Style="font-size: 12px;">
                                                <asp:ListItem Text="Male" Value="16" />
                                                <asp:ListItem Text="Female" Value="17" />
                                            </asp:RadioButtonList>
                                        </td>
                                        <td align="left">
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgPatientGender"
                                                Visible="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Ethnicity:<div style="font-size: 9px; color: #999; font-style: italic">
                                                Select from the dropdown menu</div>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" ID="ddEthinicity" CssClass="dd">
                                                <asp:ListItem Text="---" />
                                                <asp:ListItem Text="Aboriginal Canadian (First Nations / Métis / Inuit)" Value="18" />
                                                <asp:ListItem Text="Arabic / North African" Value="19" />
                                                <asp:ListItem Text="Black" Value="20" />
                                                <asp:ListItem Text="Caucasian / White" Value="21" />
                                                <asp:ListItem Text="Hispanic" Value="22" />
                                                <asp:ListItem Text="East / South-East Asian" Value="23" />
                                                <asp:ListItem Text="Multi-Racial" Value="24" />
                                                <asp:ListItem Text="South Asian" Value="25" />
                                                <asp:ListItem Text="Other" Value="26" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CompareValidator ID="cmpddEthinicity" runat="server" ControlToValidate="ddEthinicity"
                                                ValueToCompare="---" ErrorMessage="error" Type="String" Operator="NotEqual" ValidationGroup="Validate">
                 <img src="../../images/imp_icon.png" />
                
                                            </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Medication Coverage:<div style="font-size: 9px; color: #999; font-style: italic">
                                                Select from the dropdown menu</div>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" ID="ddMedCoverage" CssClass="dd">
                                                <asp:ListItem Text="---" />
                                                <asp:ListItem Text="None" Value="27" />
                                                <asp:ListItem Text="Provincial / Federal " Value="28" />
                                                <asp:ListItem Text="Private" Value="29" />
                                                <asp:ListItem Text="Both Provincial/Federal and Private" Value="30" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddMedCoverage"
                                                ValueToCompare="---" ErrorMessage="error" Type="String" Operator="NotEqual" ValidationGroup="Validate">
                 <img src="../../images/imp_icon.png" />
                
                                            </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Blood Pressure:
                                        </td>
                                        <td>
                                            <table width="100%" border="0">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtSystolic" runat="server" CssClass="smalldd" />
                                                        <span style="font-size: 12px; font-weight: bold">mmHg</span> <span style="font-size: 12px;
                                                            font-weight: bold">(Systolic)</span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="reqtxtSystolic" CssClass="missing" ErrorMessage="Systolic Required"
                                                ControlToValidate="txtSystolic" runat="server" ValidationGroup="Validate" Display="Dynamic">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangeValidator1" ErrorMessage="Systolic pressure must be in 60-250 range"
                                                ControlToValidate="txtSystolic" CssClass="missing" MinimumValue="60" MaximumValue="250"
                                                ValidationGroup="Validate" Display="Dynamic" runat="server" Type="Integer">
                                                  <span id="span2" class="errorDyn">Range (60-250)</span>
                                            </asp:RangeValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                        </td>
                                        <td>
                                            <table width="100%" border="0">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtDiastolic" runat="server" CssClass="smalldd" />
                                                        <span style="font-size: 12px; font-weight: bold">mmHg</span> <span style="font-size: 12px;
                                                            font-weight: bold">(Diastolic)</span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="left" style="white-space: nowrap;">
                                            <asp:RequiredFieldValidator ID="reqtxtDiastolic" CssClass="missing" ErrorMessage="Diastolic Required"
                                                ControlToValidate="txtDiastolic" runat="server" ValidationGroup="Validate" Display="Dynamic">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="rngtxtDiastolic" ErrorMessage="Diastolic pressure must be in 30-150 range"
                                                ControlToValidate="txtDiastolic" CssClass="missing" MinimumValue="30" MaximumValue="150"
                                                Display="Dynamic" ValidationGroup="Validate" runat="server" Type="Integer">
                                                 <span id="span1" class="errorDyn">Range(30-150)</span>
                                            </asp:RangeValidator>
                                            <asp:Label Text="Diastolic cannot be greater than Systolic" runat="server" ForeColor="Red"
                                                ID="lblBPLarge" CssClass="lbl" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium" align="left">
                                            Weight:
                                        </td>
                                        <td>
                                            <table width="100%" border="0">
                                                <tr>
                                                    <td style="width: 100%;" style="white-space: nowrap;">
                                                        <table border="0" cellpadding="6" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButtonList runat="server" Style="font-size: 9px" ID="rdoWeightType" RepeatDirection="Horizontal"
                                                                        Width="80px">
                                                                        <asp:ListItem Text="kg" />
                                                                        <asp:ListItem Text="lbs" />
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtWeight" runat="server" CssClass="smalldd" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="left" style="white-space: nowrap;">
                                                        <asp:RequiredFieldValidator ID="reqtxtWeight" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                            ControlToValidate="txtWeight" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                                        </asp:RequiredFieldValidator>
                                                        <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgWeight" Visible="false" />
                                                        <asp:CustomValidator ID="custtxtWeight" ErrorMessage="" ControlToValidate="txtWeight"
                                                            CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="custtxtWeight_OnClientValidate"
                                                            Display="Dynamic">
                                                            
                                                        </asp:CustomValidator>
                                                    </td>
                                                    <td style="white-space: nowrap;">
                                                        <asp:Label runat="server" ForeColor="Red" ID="lblWeight" CssClass="lbl" />
                                                        <span id="spanWeight" class="errorDyn"></span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Height:
                                        </td>
                                        <td>
                                            <table width="100%" border="0">
                                                <tr>
                                                    <td style="width: 100%;" style="white-space: nowrap;">
                                                        <table border="0" cellpadding="6" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButtonList runat="server" Style="font-size: 9px" ID="rdoHeightType" RepeatDirection="Horizontal"
                                                                        Width="80px">
                                                                        <asp:ListItem Text="cm" />
                                                                        <asp:ListItem Text="in" />
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td style="white-space: nowrap;">
                                                                    <asp:TextBox ID="txtHeight" runat="server" CssClass="smalldd" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="left" style="white-space: nowrap;">
                                                        <asp:RequiredFieldValidator ID="reqtxtHeight" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                            ControlToValidate="txtHeight" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                                        </asp:RequiredFieldValidator>
                                                        <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgHeight" Visible="false" />
                                                        <asp:CustomValidator ID="custtxtHeight" ErrorMessage="" ControlToValidate="txtHeight"
                                                            CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="custtxtHeight_OnClientValidate"
                                                            Display="Dynamic">
                                                            
                                                        </asp:CustomValidator>
                                                        <span id="spanHeight" class="errorDyn"></span>
                                                    </td>
                                                    <td style="white-space: nowrap;">
                                                        <asp:Label runat="server" ForeColor="Red" ID="lblHeight" CssClass="lbl" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="blackmedium" valign="top" align="left">
                                Smoking History:
                            </td>
                            <td colspan="3">
                                <table width="100%" border="1" cellpadding="4" cellspacing="0" style="text-align: center;
                                    font-size: 10px; font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                    <tr>
                                        <td bgcolor="#999999" align="left">
                                            Please Select Only One
                                        </td>
                                        <td bgcolor="#33CC66">
                                            Never Smoked
                                        </td>
                                        <td bgcolor="#FF9900">
                                            Past Smoker
                                        </td>
                                        <td bgcolor="#FF3300">
                                            Current Smoker
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Smoking History
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgSmokingHistory"
                                                Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:RadioButton Text="" runat="server" AnswerID="37" ID="chkNeverSmoked" GroupName="rdoSmoked" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:RadioButton Text="" runat="server" AnswerID="38" ID="chkPastSmoker" GroupName="rdoSmoked" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:RadioButton Text="" runat="server" AnswerID="39" ID="chkCurrentSmoker" GroupName="rdoSmoked" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="blackmedium" valign="top">
                                Diabetes Complications:
                            </td>
                            <td colspan="3">
                                <table width="100%" border="1" cellpadding="4" cellspacing="0" style="text-align: center;
                                    font-size: 10px; font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                    <tr>
                                        <td bgcolor="#999999" align="left">
                                            Check All That Apply or Select “None of the Above”
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgDiab" Visible="false" />
                                        </td>
                                        <td bgcolor="#FF3300" style="width: 100px;">
                                            &#10003;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Depression
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgDepression" Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkDepressionYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Erectile Dysfunction
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgErectile" Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkErectleYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Hypoglycemia
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgHypoglycemia" Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkHypoglycemiaYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Macroalbuminuria
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgMacroalbuminuria"
                                                Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkMacroalbuminuriaYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Microalbuminuria
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgMicroalbuminuria"
                                                Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkMicroalbuminuriaYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Retinopathy
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgRetinopathy" Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkRetinopathyYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            None of the Above
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkDiabetesComplicationsNone" Text="" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="blackmedium" valign="top">
                                Current Medication:
                            </td>
                            <td colspan="3">
                                <table width="100%" border="1" cellpadding="4" cellspacing="0" style="text-align: center;
                                    font-size: 10px; font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                    <tr>
                                        <td bgcolor="#999999" align="left">
                                            Check All That Apply or Select “None of the Above”
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgCurrMed" Visible="false" />
                                        </td>
                                        <td bgcolor="#FF3300" style="width: 100px;">
                                            &#10003;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            ASA
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgASA" Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkASAYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Other Antiplatelet Agent
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgAntiplatelet" Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkOtherAntiplateletAgentYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            ACE-Inhibitor
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgACEInhibito" Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkACEInhibitorYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Angiotensin Receptor Blocker (ARB)
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgARB" Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkARBYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Beta-Blocker
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgBetaBlocker" Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkBetaBlockerYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Calcium Channel Blocker
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgCalciumChannelBlocker"
                                                Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkCalciumChannelBlockerYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            Diuretic
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgDiuretic" Visible="false" />
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkDiureticYes" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            None of the Above
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkCurrentMedicationNone" Text="" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="blackmedium">
                                In your opinion, on average how adherent is this patient with his/her current medications?
                                <div style="font-size: 9px; color: #999; font-style: italic">
                                    Select from the dropdown menu</div>
                            </td>
                            <td style="vertical-align: top;">
                                <asp:DropDownList runat="server" ID="ddPatientAdherence" CssClass="dd verticalAligned">
                                    <asp:ListItem Text="---" Value="---" />
                                    <asp:ListItem Text="<50% of the time" Value="53" />
                                    <asp:ListItem Text="50-70% of the time" Value="54" />
                                    <asp:ListItem Text=">70% of the time" Value="55" />
                                </asp:DropDownList>
                            </td>
                            <td align="left" style="vertical-align: top;">
                                <asp:CompareValidator ID="compddPatientAdherence" runat="server" ControlToValidate="ddPatientAdherence"
                                    ValueToCompare="---" ErrorMessage="error" Type="String" Operator="NotEqual" ValidationGroup="Validate">
                 <img src="../../images/imp_icon.png" />
                
                                </asp:CompareValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="blackmedium" valign="top">
                                How did you estimate medication adherence for this patient?
                            </td>
                            <td colspan="3">
                                <table width="100%" border="1" cellpadding="4" cellspacing="0" style="text-align: center;
                                    font-size: 10px; font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                    <tr>
                                        <td bgcolor="#999999" align="left">
                                            Check All That Apply
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgEstMedAdhere" Visible="false" />
                                        </td>
                                        <td bgcolor="#FF3300" style="width: 100px;">
                                            &#10003;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            I asked the patient / caregiver
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkPatientCaregiver" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            I obtained pharmacy renewal records
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkPhramacyRenewal" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            I did a medication count
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkMedicationCount" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            I estimated / guessed
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkGuessedEstimated" Text="" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" align="left">
                                            I did not evaluate adherence in this patient
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <asp:CheckBox ID="chkDidNotEvaluate" Text="" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
                <table width="100%" border="0" align="center">
                    <tr>
                        <td width="33%" align="left">
                            <a href="#">
                                <asp:Button runat="server" OnClick="imgBack_clicked" ID="imgBack" align="absmiddle"
                                    CssClass="BackBtn" />
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
