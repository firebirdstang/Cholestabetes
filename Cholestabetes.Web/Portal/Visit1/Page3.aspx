<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Page3.aspx.cs" Inherits="Cholestabetes.Web.Portal.Visit1.Page3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/CustomScripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        //validation

        function custtxtAST_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txtAST.ClientID %>').val();


            if (value < 1 || value > 500)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;


        }

        function custtxtALKPhotos_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txtALKPhotos.ClientID %>').val();


            if (value < 1 || value > 1000)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;

        }

        function custtxtCreatinine_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txtCreatinine.ClientID %>').val();


            if (value < 1 || value > 500)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;

        }

        function custtxteGFR_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txteGFR.ClientID %>').val();


            if (value < 10 || value > 150)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;

        }

        function custtxtACR_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txtACR.ClientID %>').val();


            if (value < 1 || value > 100)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;

        }


        function Initialize() {


            if ($('#<%=chkALT.ClientID %>').is(':checked')) {

                $('#<%=txtAST.ClientID %>').val('');
                $('#<%=txtAST.ClientID %>').attr('readonly', true);
                $('#<%=txtAST.ClientID %>').attr("class", "readonly");
                ValidatorEnable(document.getElementById('<%= reqtxtAST.ClientID %>'), false);

            }
            else {

                $('#<%=txtAST.ClientID %>').attr('readonly', false);
                $('#<%=txtAST.ClientID %>').attr("class", "Notreadonly");
                //ValidatorEnable(document.getElementById('<%= reqtxtAST.ClientID %>'), true);
            }



            if ($('#<%=chkALKPOS.ClientID %>').is(':checked')) {

                $('#<%=txtALKPhotos.ClientID %>').val('');
                $('#<%=txtALKPhotos.ClientID %>').attr('readonly', true);
                $('#<%=txtALKPhotos.ClientID %>').attr("class", "readonly");
                ValidatorEnable(document.getElementById('<%=reqtxtALKPhotos.ClientID %>'), false);

            }
            else {

                $('#<%=txtALKPhotos.ClientID %>').attr('readonly', false);
                $('#<%=txtALKPhotos.ClientID %>').attr("class", "Notreadonly");
                // ValidatorEnable(document.getElementById('<%=reqtxtALKPhotos.ClientID %>'), true);
            }



            if ($('#<%=chkCreatinine.ClientID %>').is(':checked')) {

                $('#<%=txtCreatinine.ClientID %>').val('');
                $('#<%=txtCreatinine.ClientID %>').attr('readonly', true);
                $('#<%=txtCreatinine.ClientID %>').attr("class", "readonly");
                ValidatorEnable(document.getElementById('<%=reqtxtCreatinine.ClientID %>'), false);

            }
            else {

                $('#<%=txtCreatinine.ClientID %>').attr('readonly', false);
                $('#<%=txtCreatinine.ClientID %>').attr("class", "Notreadonly");
                //ValidatorEnable(document.getElementById('<%=reqtxtCreatinine.ClientID %>'), true);
            }



            if ($('#<%=chkGFR.ClientID %>').is(':checked')) {

                $('#<%=txteGFR.ClientID %>').val('');
                $('#<%=txteGFR.ClientID %>').attr('readonly', true);
                $('#<%=txteGFR.ClientID %>').attr("class", "readonly");
                ValidatorEnable(document.getElementById('<%=reqtxteGFR.ClientID %>'), false);

            }
            else {

                $('#<%=txteGFR.ClientID %>').attr('readonly', false);
                $('#<%=txteGFR.ClientID %>').attr("class", "Notreadonly");
                //ValidatorEnable(document.getElementById('<%=reqtxteGFR.ClientID %>'), true);
            }



            if ($('#<%=chkACR.ClientID %>').is(':checked')) {

                $('#<%=txtACR.ClientID %>').val('');
                $('#<%=txtACR.ClientID %>').attr('readonly', true);
                $('#<%=txtACR.ClientID %>').attr("class", "readonly");
                ValidatorEnable(document.getElementById('<%=reqtxtACR.ClientID %>'), false);

            }
            else {

                $('#<%=txtACR.ClientID %>').attr('readonly', false);
                $('#<%=txtACR.ClientID %>').attr("class", "Notreadonly");
                //ValidatorEnable(document.getElementById('<%=reqtxtACR.ClientID %>'), true);
            }

        }

        //validation 

        function pageLoad() {

            $(document).ready(function () {

                Initialize();

                //checkboxes

                $('#<%=chkALT.ClientID %>').change(function () {


                    $('#<%=txtAST.ClientID %>').val('');

                    if ($(this).is(':checked')) {

                        $('#<%=txtAST.ClientID %>').attr('readonly', true);
                        $('#<%=txtAST.ClientID %>').attr("class", "readonly");
                        ValidatorEnable(document.getElementById('<%= reqtxtAST.ClientID %>'), false);

                    }
                    else {

                        $('#<%=txtAST.ClientID %>').attr('readonly', false);
                        $('#<%=txtAST.ClientID %>').attr("class", "Notreadonly");
                        ValidatorEnable(document.getElementById('<%= reqtxtAST.ClientID %>'), true);
                    }
                });


                $('#<%=chkALKPOS.ClientID %>').change(function () {


                    $('#<%=txtALKPhotos.ClientID %>').val('');

                    if ($(this).is(':checked')) {

                        $('#<%=txtALKPhotos.ClientID %>').attr('readonly', true);
                        $('#<%=txtALKPhotos.ClientID %>').attr("class", "readonly");
                        ValidatorEnable(document.getElementById('<%=reqtxtALKPhotos.ClientID %>'), false);

                    }
                    else {

                        $('#<%=txtALKPhotos.ClientID %>').attr('readonly', false);
                        $('#<%=txtALKPhotos.ClientID %>').attr("class", "Notreadonly");
                        ValidatorEnable(document.getElementById('<%=reqtxtALKPhotos.ClientID %>'), true);
                    }
                });

                $('#<%=chkCreatinine.ClientID %>').change(function () {


                    $('#<%=txtCreatinine.ClientID %>').val('');

                    if ($(this).is(':checked')) {

                        $('#<%=txtCreatinine.ClientID %>').attr('readonly', true);
                        $('#<%=txtCreatinine.ClientID %>').attr("class", "readonly");
                        ValidatorEnable(document.getElementById('<%=reqtxtCreatinine.ClientID %>'), false);

                    }
                    else {

                        $('#<%=txtCreatinine.ClientID %>').attr('readonly', false);
                        $('#<%=txtCreatinine.ClientID %>').attr("class", "Notreadonly");
                        ValidatorEnable(document.getElementById('<%=reqtxtCreatinine.ClientID %>'), true);
                    }
                });

                $('#<%=chkGFR.ClientID %>').change(function () {

                    $('#<%=txteGFR.ClientID %>').val('');

                    if ($(this).is(':checked')) {

                        $('#<%=txteGFR.ClientID %>').attr('readonly', true);
                        $('#<%=txteGFR.ClientID %>').attr("class", "readonly");
                        ValidatorEnable(document.getElementById('<%=reqtxteGFR.ClientID %>'), false);

                    }
                    else {

                        $('#<%=txteGFR.ClientID %>').attr('readonly', false);
                        $('#<%=txteGFR.ClientID %>').attr("class", "Notreadonly");
                        ValidatorEnable(document.getElementById('<%=reqtxteGFR.ClientID %>'), true);
                    }
                });

                $('#<%=chkACR.ClientID %>').change(function () {

                    $('#<%=txtACR.ClientID %>').val('');

                    if ($(this).is(':checked')) {

                        $('#<%=txtACR.ClientID %>').attr('readonly', true);
                        $('#<%=txtACR.ClientID %>').attr("class", "readonly");
                        ValidatorEnable(document.getElementById('<%=reqtxtACR.ClientID %>'), false);

                    }
                    else {

                        $('#<%=txtACR.ClientID %>').attr('readonly', false);
                        $('#<%=txtACR.ClientID %>').attr("class", "Notreadonly");
                        ValidatorEnable(document.getElementById('<%=reqtxtACR.ClientID %>'), true);
                    }
                });



                //checkboxes

                $('#<%=imgBtn.ClientID %>').datepicker({

                    altField: $('#<%=txtMostRecentLabDate.ClientID %>'),

                    numberOfMonths: 1,
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    yearRange: "2000:2016"

                });


                $('#<%=txtMostRecentLabDate.ClientID %>').datepicker({

                    altField: $('#<%=txtMostRecentLabDate.ClientID %>'),

                    numberOfMonths: 1,
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    yearRange: "2000:2016"

                });

                $('#<%=txtMostRecentLabDate.ClientID %>').attr('readonly', true);

            });
        }
    
    </script>
    <style type="text/css">
        .Notreadonly
        {
            background-color: white;
        }
        .readonly
        {
            background-color: Gray;
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
        .ui-datepicker
        {
            font-size: 11px;
        }
        .lbl
        {
            font-size: 11px;
        }
        .missing
        {
            color: Red;
            font-size: 11px;
            text-align: left;
        }
        .smallBox
        {
            width: 66px;
        }
        .chkBox
        {
            font-size: 11px;
        }
    </style>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="rightbox">
                <asp:Panel runat="server" ID="pnlMain">
                    <table width="100%" cellspacing="0" border="0">
                        <tr>
                            <td align="center" style="font-size: 25px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                                3 - LIVER AND KIDNEY LAB VALUES
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
                            Display="Dynamic" EnableClientScript="true" CssClass="missing" />
                    </asp:Panel>
                    <table width="100%" border="0" cellspacing="0" cellpadding="10" style="font-family: Arial, Helvetica, sans-serif;
                        border: thin solid #333;">
                        <tr>
                            <td>
                                <div class="note" style="padding-top: 10px;">
                                    Record values exactly as they appear in the lab report. Include decimal places where
                                    applicable.
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="3">
                                    <tr>
                                        <td class="blackmedium" style="width: 170px;">
                                            Most Recent Lab Date :
                                        </td>
                                        <td style="width: 250px;">
                                            <asp:TextBox runat="server" ID="txtMostRecentLabDate" size="20" />
                                            <asp:ImageButton ImageUrl="~/images/calendar.png" runat="server" ID="imgBtn" OnClientClick="return false;"
                                                Style="vertical-align: middle;" />
                                            
               

                                        </td>
                                        <td style="width: 50px;" align="left">
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="reqtxtMostRecentLabDate" CssClass="missing" ErrorMessage=""
                                                ControlToValidate="txtMostRecentLabDate" runat="server" ValidationGroup="Validate"
                                                Enabled="false">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:Label Text="Cannot be future date" runat="server" ForeColor="Red" ID="lblLabDate"
                                                CssClass="lbl" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            ALT :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtAST" />
                                            <span style="font-size: 12px; font-weight: bold">U/L</span>
                                        </td>
                                        <td>
                                            <asp:CheckBox Text="N/A" runat="server" ID="chkALT" TextAlign="Left" CssClass="chkBox" />
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="reqtxtAST" CssClass="missing" ErrorMessage="ree"
                                                ControlToValidate="txtAST" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="cmptxtAST" runat="server" Operator="DataTypeCheck" Type="Integer"
                                                ControlToValidate="txtAST" ErrorMessage="Value must be a whole number" ValidationGroup="Validate"
                                                CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <asp:CustomValidator ID="custtxtAST" ErrorMessage="Range (1 to 500)" ControlToValidate="txtAST"
                                                CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="custtxtAST_OnClientValidate"
                                                Display="Dynamic">
                                            </asp:CustomValidator>
                                            <asp:Label Text="Must be in range 1-500" runat="server" ForeColor="Red" ID="lblALT"
                                                CssClass="lbl" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            ALK PHOS :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtALKPhotos" />
                                            <span style="font-size: 12px; font-weight: bold">U/L</span>
                                        </td>
                                        <td align="left">
                                            <asp:CheckBox Text="N/A" runat="server" ID="chkALKPOS" TextAlign="Left" CssClass="chkBox" />
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="reqtxtALKPhotos" CssClass="missing" ErrorMessage=""
                                                ControlToValidate="txtALKPhotos" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" Operator="DataTypeCheck"
                                                Type="Integer" ControlToValidate="txtALKPhotos" ErrorMessage="Value must be a whole number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <asp:CustomValidator ID="custtxtALKPhotos" ErrorMessage="Range (1 to 1000)" ControlToValidate="txtALKPhotos"
                                                CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="custtxtALKPhotos_OnClientValidate"
                                                Display="Dynamic">
                                            </asp:CustomValidator>
                                            <asp:Label Text="Must be in range 1-1000" runat="server" ForeColor="Red" ID="lblphos"
                                                CssClass="lbl" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Creatinine :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCreatinine" runat="server" />
                                            <span style="font-size: 12px; font-weight: bold">μmol/L</span>
                                        </td>
                                        <td align="left">
                                            <asp:CheckBox Text="N/A" runat="server" ID="chkCreatinine" TextAlign="Left" CssClass="chkBox" />
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="reqtxtCreatinine" CssClass="missing" ErrorMessage=""
                                                ControlToValidate="txtCreatinine" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator2" runat="server" Operator="DataTypeCheck"
                                                Type="Integer" ControlToValidate="txtCreatinine" ErrorMessage="Value must be a whole number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <asp:CustomValidator ID="custtxtCreatinine" ErrorMessage="Range (1 to 500)" ControlToValidate="txtCreatinine"
                                                CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="custtxtCreatinine_OnClientValidate"
                                                Display="Dynamic">
                                            </asp:CustomValidator>
                                            <asp:Label Text="Must be in range 1-500" runat="server" ForeColor="Red" ID="lblCreatinine"
                                                CssClass="lbl" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            e-GFR :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txteGFR" />
                                            <span style="font-size: 12px; font-weight: bold">mL/min</span>
                                        </td>
                                        <td align="left">
                                            <asp:CheckBox Text="N/A" runat="server" ID="chkGFR" TextAlign="Left" CssClass="chkBox" />
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="reqtxteGFR" CssClass="missing" ErrorMessage="" ControlToValidate="txteGFR"
                                                runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator3" runat="server" Operator="DataTypeCheck"
                                                Type="Double" ControlToValidate="txteGFR" ErrorMessage="Value must be a valid number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <asp:CustomValidator ID="custtxteGFR" ErrorMessage="Range (10 to 150)" ControlToValidate="txteGFR"
                                                CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="custtxteGFR_OnClientValidate"
                                                Display="Dynamic">
                                            </asp:CustomValidator>
                                            <asp:Label Text="Must be in range 10-150" runat="server" ForeColor="Red" ID="lblGFR"
                                                CssClass="lbl" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            ACR :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtACR" />
                                            <span style="font-size: 12px; font-weight: bold">mg/mmol</span>
                                        </td>
                                        <td align="left">
                                            <asp:CheckBox Text="N/A" runat="server" ID="chkACR" TextAlign="Left" CssClass="chkBox" />
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="reqtxtACR" CssClass="missing" ErrorMessage="" ControlToValidate="txtACR"
                                                runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator5" runat="server" Operator="DataTypeCheck"
                                                Type="Double" ControlToValidate="txtACR" ErrorMessage="Value must be a valid number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <asp:CustomValidator ID="custtxtACR" ErrorMessage="Range (1 to 100)" ControlToValidate="txtACR"
                                                CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="custtxtACR_OnClientValidate"
                                                Display="Dynamic">
                                            </asp:CustomValidator>
                                            <asp:Label Text="Must be in range 1-100" runat="server" ForeColor="Red" ID="lblACR"
                                                CssClass="lbl" />
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
