<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Page4.aspx.cs" Inherits="Cholestabetes.Web.Portal.Visit1.Page4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/CustomScripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

        //validators

        function custtxtTotalCholesterol_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txtTotalCholesterol.ClientID %>').val();

            if ((value) < 1 || (value) > 10)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;
        }

        function custtxtHDLC1_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txtHDLC1.ClientID %>').val();


            if (parseFloat(value) < 0.1 || parseFloat(value) > 5)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;


        }


        function custtxtTriglycerides1_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txtTriglycerides1.ClientID %>').val();


            if (parseFloat(value) < 0.1 || parseFloat(value) > 10)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;


        }

        function custtxtFastingPlasmaGlucose1_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txtFastingPlasmaGlucose1.ClientID %>').val();


            if (value < 3 || value > 12)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;


        }



        function custtxtLDL_C1_2_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txtLDL_C1.ClientID %>').val();


            if (value <= 2 || value > 10)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;


        }

        function custtxtAIC1_OnClientValidate(sender, args) {

            var isValid = false;
            var value = $('#<%=txtAIC1.ClientID %>').val();


            if (parseFloat(value) <= 7 || parseFloat(value) > 8.9)
                isValid = false;
            else
                isValid = true;

            args.IsValid = isValid;


        }


        //validators




        function custtxtLDL_C1_OnClientValidate(sender, args) {

            var isValid = false;
            var choles = $('#<%=txtTotalCholesterol.ClientID %>').val();

            var lclC = $('#<%=txtLDL_C1.ClientID %>').val();


            if (parseInt(lclC) < parseInt(choles))
                isValid = true;
            else
                isValid = false;


            args.IsValid = isValid;

        }


        function ClearAntihyperglycemic(clearNone) {

            if (clearNone) {

                $('#<%=chk_Antihyperglycemic_None.ClientID %>').prop('checked', false);

            }
            else {

                $('#<%=chk_Antihyperglycemic_Glucosidase.ClientID %>').prop('checked', false);
                $('#<%=chk_Antihyperglycemic_DPP4.ClientID %>').prop('checked', false);
                $('#<%=chk_Antihyperglycemic_GLP1.ClientID %>').prop('checked', false);

                $('#<%=chk_Antihyperglycemic_Insulin.ClientID %>').prop('checked', false);
                $('#<%=ddNumInjections.ClientID %>').hide();
                $('#spanInjections').hide();

                $('#<%=ddNumInjections.ClientID %>').val('---');

                //validators
                ValidatorEnable(document.getElementById('<%=cmpddNumInjections.ClientID %>'), false);


                $('#<%=chk_Antihyperglycemic_Meglitinide.ClientID %>').prop('checked', false);
                $('#<%=chk_Antihyperglycemic_SGLT2.ClientID %>').prop('checked', false);
                $('#<%=chk_Antihyperglycemic_Sulfonylurea.ClientID %>').prop('checked', false);
                $('#<%=chk_Antihyperglycemic_Thiazolidinedione.ClientID %>').prop('checked', false);

            }

        }


        function ClearLipidLowering(clearNone) {


            if (clearNone) {

                $('#<%=chkLipidNone.ClientID %>').prop('checked', false);

            }
            else {

                $('#<%=chkLipidBileAcidSequestrant.ClientID %>').prop('checked', false);
                $('#<%=ddBileAcidSequestrant.ClientID %>').hide();
                $('#spanBile').hide();

                $('#<%=ddBileAcidSequestrant.ClientID %>').val('---');

                //validators
                ValidatorEnable(document.getElementById('<%=compddBileAcidSequestrant.ClientID %>'), false);



                $('#<%=chkLipidEzetimibe.ClientID %>').prop('checked', false);
                $('#<%=chkLipidFibrate.ClientID %>').prop('checked', false);
                $('#<%=chkLipidNiacin.ClientID %>').prop('checked', false);
                $('#<%=chkLipidOmega.ClientID %>').prop('checked', false);


            }

        }


        function pageLoad() {

            $(document).ready(function () {


                $('#trA1C').hide();


                //A1C target > 7 box 


                $('#<%=chkLimitLife.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkNone.ClientID %>').prop('checked', false);

                    }

                });



                $('#<%=chkHighFunc.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkNone.ClientID %>').prop('checked', false);

                    }

                });



                $('#<%=chkIschemic.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkNone.ClientID %>').prop('checked', false);

                    }

                });



                $('#<%=chkMultiMorbid.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkNone.ClientID %>').prop('checked', false);

                    }

                });



                $('#<%=chkRecuGlycemia.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkNone.ClientID %>').prop('checked', false);

                    }

                });



                $('#<%=chkHypoglycemiaAwareness.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkNone.ClientID %>').prop('checked', false);

                    }

                });



                $('#<%=chkLongDia.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkNone.ClientID %>').prop('checked', false);

                    }

                });



                $('#<%=chkClinicalJudge.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {

                        $('#<%=chkNone.ClientID %>').prop('checked', false);

                    }

                });



                $('#<%=chkNone.ClientID %>').change(function () {


                    if ($(this).is(':checked')) {

                        $('#<%=chkLimitLife.ClientID %>').prop('checked', false);
                        $('#<%=chkHighFunc.ClientID %>').prop('checked', false);
                        $('#<%=chkIschemic.ClientID %>').prop('checked', false);
                        $('#<%=chkMultiMorbid.ClientID %>').prop('checked', false);
                        $('#<%=chkRecuGlycemia.ClientID %>').prop('checked', false);
                        $('#<%=chkHypoglycemiaAwareness.ClientID %>').prop('checked', false);
                        $('#<%=chkLongDia.ClientID %>').prop('checked', false);
                        $('#<%=chkClinicalJudge.ClientID %>').prop('checked', false);
                    }

                });

                //A!C Target > 7 box


                function HideShowA1C() {

                    var txt = $('#<%=ddACITarget.ClientID %> :selected').text();

                    if (txt == '<=7.5%' || txt == '<=8.0%' || txt == '<=8.5%' || txt == '<=9.0%') {

                        $('#trA1C').show();

                    }
                    else {

                        $('#trA1C').hide();

                        $('#<%=chkLimitLife.ClientID %>').prop('checked', false);
                        $('#<%=chkHighFunc.ClientID %>').prop('checked', false);
                        $('#<%=chkIschemic.ClientID %>').prop('checked', false);
                        $('#<%=chkMultiMorbid.ClientID %>').prop('checked', false);
                        $('#<%=chkRecuGlycemia.ClientID %>').prop('checked', false);
                        $('#<%=chkHypoglycemiaAwareness.ClientID %>').prop('checked', false);
                        $('#<%=chkLongDia.ClientID %>').prop('checked', false);
                        $('#<%=chkClinicalJudge.ClientID %>').prop('checked', false);
                        $('#<%=chkNone.ClientID %>').prop('checked', false);

                    }

                }

                $('#<%=ddACITarget.ClientID %>').change(function () {

                    HideShowA1C();

                });



                function HideAll() {

                    $('#<%=ddBileAcidSequestrant.ClientID %>').hide();

                    $('#<%=ddDailyDoseMetformin.ClientID %>').hide();

                    $('#<%=ddDailyFreqMetformin.ClientID %>').hide();

                    $('#<%=ddDailyDoseGlumetza.ClientID %>').hide();

                    $('#<%=ddDailyDoseLinagliptin.ClientID %>').hide();

                    $('#<%=ddDailyDoseSaxagliptin.ClientID %>').hide();

                    $('#<%=ddDailyDoseSitagliptinExt.ClientID %>').hide();

                    $('#<%=ddDailyDoseSitagliptin.ClientID %>').hide();

                    $('#<%=ddNumInjections.ClientID %>').hide();


                    $('#spanFreqMetaformin').hide();
                    $('#spanDosgaeMetaformin').hide();
                    $('#spanDosageGlumetza').hide();
                    $('#spanDosageLinagliptin').hide();
                    $('#spanDosageSaxagliptin').hide();
                    $('#spanDosageSitagliptin').hide();
                    $('#spanDosageSitagliptinExt').hide();

                    $('#spanBile').hide();
                    $('#spanInjections').hide();

                    //turn off dd validators
                    ValidatorEnable(document.getElementById('<%= compddDailyFreqMetformin.ClientID %>'), false);

                    ValidatorEnable(document.getElementById('<%= comddDailyDoseMetformin.ClientID %>'), false);

                    ValidatorEnable(document.getElementById('<%= cmpddDailyDoseGlumetza.ClientID %>'), false);

                    ValidatorEnable(document.getElementById('<%= cmpddDailyDoseLinagliptin.ClientID %>'), false);

                    ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSaxagliptin.ClientID %>'), false);

                    ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptin.ClientID %>'), false);

                    ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptinExt.ClientID %>'), false);

                    ValidatorEnable(document.getElementById('<%= compddBileAcidSequestrant.ClientID %>'), false);

                    ValidatorEnable(document.getElementById('<%= cmpddNumInjections.ClientID %>'), false);
                }

                function HideAllMetformin() {

                    $('#<%=ddDailyDoseSitagliptinExt.ClientID %>').hide();
                    ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptinExt.ClientID %>'), false);

                    $('#<%=ddDailyDoseSitagliptin.ClientID %>').hide();
                    ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptin.ClientID %>'), false);

                    $('#<%=ddDailyDoseSaxagliptin.ClientID %>').hide();
                    ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSaxagliptin.ClientID %>'), false);

                    $('#<%=ddDailyDoseLinagliptin.ClientID %>').hide();
                    ValidatorEnable(document.getElementById('<%= cmpddDailyDoseLinagliptin.ClientID %>'), false);

                    $('#<%=ddDailyDoseGlumetza.ClientID %>').hide();
                    ValidatorEnable(document.getElementById('<%= cmpddDailyDoseGlumetza.ClientID %>'), false);

                    $('#<%=ddDailyDoseMetformin.ClientID %>').hide();
                    ValidatorEnable(document.getElementById('<%= comddDailyDoseMetformin.ClientID %>'), false);

                    $('#<%=ddDailyFreqMetformin.ClientID %>').hide();
                    ValidatorEnable(document.getElementById('<%= compddDailyFreqMetformin.ClientID %>'), false);


                    $('#spanFreqMetaformin').hide();
                    $('#spanDosgaeMetaformin').hide();
                    $('#spanDosageGlumetza').hide();
                    $('#spanDosageLinagliptin').hide();
                    $('#spanDosageSaxagliptin').hide();
                    $('#spanDosageSitagliptin').hide();
                    $('#spanDosageSitagliptinExt').hide();

                    //                    $('#spanBile').hide();
                    //                    $('#spanInjections').hide();

                    SetVisibility();

                }


                function SetVisibility() {


                    if (!$('#<%=rdoMetformin_Metformin.ClientID  %>').is(':checked')) {
                        $('#<%=ddDailyDoseMetformin.ClientID %>').val('---');
                        $('#<%=ddDailyFreqMetformin.ClientID %>').val('---');

                        $('#spanFreqMetaformin').hide();
                        $('#spanDosgaeMetaformin').hide();

                    }


                    if (!$('#<%=rdoMetformin_Glumetza.ClientID %>').is(':checked')) {

                        $('#<%=ddDailyDoseGlumetza.ClientID %>').val('---');
                        $('#spanDosageGlumetza').hide();
                    }


                    if (!$('#<%=rdoMetformin_Linagliptin.ClientID %>').is(':checked')) {

                        $('#<%=ddDailyDoseLinagliptin.ClientID %>').val('---');
                        $('#spanDosageLinagliptin').hide();
                    }

                    if (!$('#<%=rdoMetformin_Saxagliptin.ClientID %>').is(':checked')) {

                        $('#<%=ddDailyDoseSaxagliptin.ClientID %>').val('---');
                        $('#spanDosageSaxagliptin').hide();
                    }

                    if (!$('#<%=rdoMetformin_Sitagliptin.ClientID %>').is(':checked')) {

                        $('#<%=ddDailyDoseSitagliptin.ClientID %>').val('---');
                        $('#spanDosageSitagliptin').hide();
                    }


                    if (!$('#<%=rdoMetformin_SitagliptinExt.ClientID %>').is(':checked')) {

                        $('#<%=ddDailyDoseSitagliptinExt.ClientID %>').val('---');
                        $('#spanDosageSitagliptinExt').hide();
                    }

                }

                function LoadData() {

                    HideShowA1C();

                    //update the controls according to data
                    if ($('#<%=chkLipidBileAcidSequestrant.ClientID %>').is(':checked')) {

                        $('#<%=ddBileAcidSequestrant.ClientID %>').show();
                        $('#spanBile').show();
                        //validators
                        ValidatorEnable(document.getElementById('<%= compddBileAcidSequestrant.ClientID %>'), true);

                    }
                    else {
                        $('#<%=ddBileAcidSequestrant.ClientID %>').hide();
                        $('#spanBile').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= compddBileAcidSequestrant.ClientID %>'), false);
                    }


                    if ($('#<%=rdoMetformin_SitagliptinExt.ClientID %>').is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseSitagliptinExt.ClientID %>').show();
                        $('#spanDosageSitagliptinExt').show();

                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptinExt.ClientID %>'), true);

                    }

                    else {
                        $('#<%=ddDailyDoseSitagliptinExt.ClientID %>').hide();
                        $('#spanDosageSitagliptinExt').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptinExt.ClientID %>'), false);
                    }



                    if ($('#<%=rdoMetformin_Sitagliptin.ClientID %>').is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseSitagliptin.ClientID %>').show();
                        $('#spanDosageSitagliptin').show();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptin.ClientID %>'), true);

                    }

                    else {
                        $('#<%=ddDailyDoseSitagliptin.ClientID %>').hide();
                        $('#spanDosageSitagliptin').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptin.ClientID %>'), false);
                    }


                    if ($('#<%=rdoMetformin_Saxagliptin.ClientID %>').is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseSaxagliptin.ClientID %>').show();
                        $('#spanDosageSaxagliptin').show();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSaxagliptin.ClientID %>'), true);
                    }

                    else {
                        $('#<%=ddDailyDoseSaxagliptin.ClientID %>').hide();
                        $('#spanDosageSaxagliptin').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSaxagliptin.ClientID %>'), false);
                    }

                    if ($('#<%=rdoMetformin_Linagliptin.ClientID %>').is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseLinagliptin.ClientID %>').show();
                        $('#spanDosageLinagliptin').show();

                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseLinagliptin.ClientID %>'), true);

                    }

                    else {
                        $('#<%=ddDailyDoseLinagliptin.ClientID %>').hide();
                        $('#spanDosageLinagliptin').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseLinagliptin.ClientID %>'), false);
                    }


                    if ($('#<%=rdoMetformin_Glumetza.ClientID %>').is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseGlumetza.ClientID %>').show();
                        $('#spanDosageGlumetza').show();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseGlumetza.ClientID %>'), true);
                    }

                    else {
                        $('#<%=ddDailyDoseGlumetza.ClientID %>').hide();
                        $('#spanDosageGlumetza').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseGlumetza.ClientID %>'), false);
                    }



                    if ($('#<%=chk_Antihyperglycemic_Insulin.ClientID %>').is(':checked')) {

                        $('#<%=ddNumInjections.ClientID %>').show();
                        $('#spanInjections').show();


                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddNumInjections.ClientID %>'), true);
                    }

                    else {
                        $('#<%=ddNumInjections.ClientID %>').hide();
                        $('#spanInjections').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddNumInjections.ClientID %>'), false);
                    }




                    if ($('#<%=rdoMetformin_Metformin.ClientID %>').is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseMetformin.ClientID %>').show();
                        $('#<%=ddDailyFreqMetformin.ClientID %>').show();


                        $('#spanFreqMetaformin').show();
                        $('#spanDosgaeMetaformin').show();

                        //validators
                        ValidatorEnable(document.getElementById('<%= compddDailyFreqMetformin.ClientID %>'), true);
                        ValidatorEnable(document.getElementById('<%= comddDailyDoseMetformin.ClientID %>'), true);
                    }

                    else {

                        $('#<%=ddDailyDoseMetformin.ClientID %>').hide();
                        $('#<%=ddDailyFreqMetformin.ClientID %>').hide();

                        $('#spanFreqMetaformin').hide();
                        $('#spanDosgaeMetaformin').hide();

                        //validators
                        ValidatorEnable(document.getElementById('<%= compddDailyFreqMetformin.ClientID %>'), false);
                        ValidatorEnable(document.getElementById('<%= comddDailyDoseMetformin.ClientID %>'), false);
                    }


                    if (

                        $('#<%=rdoMetformin_Linagliptin.ClientID %>').is(':checked') ||

                        $('#<%=rdoMetformin_Saxagliptin.ClientID %>').is(':checked') ||

                        $('#<%=rdoMetformin_Sitagliptin.ClientID %>').is(':checked') ||

                        $('#<%=rdoMetformin_SitagliptinExt.ClientID %>').is(':checked')
                    ) {

                        $('#<%=chk_Antihyperglycemic_DPP4.ClientID %>').prop('checked', false);
                    }


                    SetVisibility();

                }

                function CalculateLDLGap() {



                    var result = parseFloat($('#<%=txtLDL_C1.ClientID %>').val()).toFixed(2);

                    if (!isNaN(result)) {


                        $('#<%=txtLDLCareGap.ClientID %>').val((((result - 2) / 2) * 100).toFixed(2));

                        //                        if (parseFloat(result) > 4.5)
                        //                            $('#<%=txtLDLCareGap.ClientID %>').val((((4.5 - 2) / 2) * 100).toFixed(2) + '%');

                        //                        else
                        //                            $('#<%=txtLDLCareGap.ClientID %>').val((((result - 2) / 2) * 100).toFixed(2) + '%');

                    }
                    else
                        $('#<%=txtLDLCareGap.ClientID %>').val('');
                }


                function CalculateNONHDLC() {



                    var cholestoral = parseFloat($('#<%=txtTotalCholesterol.ClientID %>').val()).toFixed(2);
                    var hdlc = parseFloat($('#<%=txtHDLC1.ClientID %>').val()).toFixed(2);

                    var nonhdlc = 0;

                    if (!isNaN(cholestoral) && !isNaN(hdlc)) {

                        nonhdlc = (cholestoral - hdlc).toFixed(2);

                        $('#<%=txtNonHDLC1.ClientID %>').val(nonhdlc);

                        //                        $('#<%=txtNonHDLC1.ClientID %>').val(nonhdlc.split(".")[0]);



                    }
                    else {

                        $('#<%=txtNonHDLC1.ClientID %>').val('');

                    }

                }

                $('#<%=imgBtn.ClientID %>').datepicker({

                    altField: $('#<%=txtMostRecentLipidLabDate.ClientID %>'),

                    numberOfMonths: 1,
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    yearRange: "2000:2016"

                });


                $('#<%=txtMostRecentLipidLabDate.ClientID %>').datepicker({

                    altField: $('#<%=txtMostRecentLipidLabDate.ClientID %>'),

                    numberOfMonths: 1,
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    yearRange: "2000:2016"

                });

                $('#<%=imgBtn2.ClientID %>').datepicker({

                    altField: $('#<%=txtRecentA1CLabDate.ClientID %>'),

                    numberOfMonths: 1,
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    yearRange: "2000:2016"

                });


                $('#<%=txtRecentA1CLabDate.ClientID %>').datepicker({

                    altField: $('#<%=txtRecentA1CLabDate.ClientID %>'),

                    numberOfMonths: 1,
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    yearRange: "2000:2016"

                });


                //Additional Antihyperglycemic Therapy:

                $('#<%=chk_Antihyperglycemic_None.ClientID %>').change(function () {

                    ClearAntihyperglycemic(0);
                });


                $('#<%=chk_Antihyperglycemic_Glucosidase.ClientID %>').change(function () {

                    ClearAntihyperglycemic(1);
                });


                $('#<%=chk_Antihyperglycemic_DPP4.ClientID %>').change(function () {

                    ClearAntihyperglycemic(1);
                });


                $('#<%=chk_Antihyperglycemic_GLP1.ClientID %>').change(function () {

                    ClearAntihyperglycemic(1);
                });


                $('#<%=chk_Antihyperglycemic_Insulin.ClientID %>').change(function () {

                    ClearAntihyperglycemic(1);
                });


                $('#<%=chk_Antihyperglycemic_Meglitinide.ClientID %>').change(function () {

                    ClearAntihyperglycemic(1);
                });


                $('#<%=chk_Antihyperglycemic_SGLT2.ClientID %>').change(function () {

                    ClearAntihyperglycemic(1);
                });


                $('#<%=chk_Antihyperglycemic_Sulfonylurea.ClientID %>').change(function () {

                    ClearAntihyperglycemic(1);
                });


                $('#<%=chk_Antihyperglycemic_Thiazolidinedione.ClientID %>').change(function () {

                    ClearAntihyperglycemic(1);
                });




                //Additional Antihyperglycemic Therapy:



                $('#<%=chkLipidNone.ClientID %>').change(function () {

                    ClearLipidLowering(0);
                });

                $('#<%=chkLipidEzetimibe.ClientID %>').change(function () {

                    ClearLipidLowering(1);
                });

                $('#<%=chkLipidFibrate.ClientID %>').change(function () {

                    ClearLipidLowering(1);
                });

                $('#<%=chkLipidNiacin.ClientID %>').change(function () {

                    ClearLipidLowering(1);
                });

                $('#<%=chkLipidOmega.ClientID %>').change(function () {

                    ClearLipidLowering(1);
                });

                $('#<%=chkLipidBileAcidSequestrant.ClientID %>').change(function () {


                    ClearLipidLowering(1);

                    if ($(this).is(':checked')) {

                        $('#<%=ddBileAcidSequestrant.ClientID %>').show();
                        $('#spanBile').show();

                        $('#<%=ddBileAcidSequestrant.ClientID %>').val('---');


                        //validators
                        ValidatorEnable(document.getElementById('<%= compddBileAcidSequestrant.ClientID %>'), true);

                    }
                    else {
                        $('#<%=ddBileAcidSequestrant.ClientID %>').hide();
                        $('#spanBile').hide();

                        $('#<%=ddBileAcidSequestrant.ClientID %>').val('---');

                        //validators
                        ValidatorEnable(document.getElementById('<%= compddBileAcidSequestrant.ClientID %>'), false);
                    }



                });




                $('#<%=rdoMetformin_SitagliptinExt.ClientID %>').change(function () {


                    if ($(this).is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseSitagliptinExt.ClientID %>').show();

                        $('#spanDosageSitagliptinExt').show();

                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptinExt.ClientID %>'), true);

                    }

                    else {
                        $('#<%=ddDailyDoseSitagliptinExt.ClientID %>').hide();

                        $('#spanDosageSitagliptinExt').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptinExt.ClientID %>'), false);
                    }

                });


                $('#<%=rdoMetformin_Sitagliptin.ClientID %>').change(function () {


                    if ($(this).is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseSitagliptin.ClientID %>').show();
                        $('#spanDosageSitagliptin').show();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptin.ClientID %>'), true);

                    }

                    else {
                        $('#<%=ddDailyDoseSitagliptin.ClientID %>').hide();
                        $('#spanDosageSitagliptin').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSitagliptin.ClientID %>'), false);
                    }

                });


                $('#<%=rdoMetformin_Saxagliptin.ClientID %>').change(function () {


                    if ($(this).is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseSaxagliptin.ClientID %>').show();
                        $('#spanDosageSaxagliptin').show();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSaxagliptin.ClientID %>'), true);
                    }

                    else {
                        $('#<%=ddDailyDoseSaxagliptin.ClientID %>').hide();
                        $('#spanDosageSaxagliptin').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseSaxagliptin.ClientID %>'), false);
                    }

                });


                $('#<%=rdoMetformin_Linagliptin.ClientID %>').change(function () {


                    if ($(this).is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseLinagliptin.ClientID %>').show();
                        $('#spanDosageLinagliptin').show();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseLinagliptin.ClientID %>'), true);

                    }

                    else {
                        $('#<%=ddDailyDoseLinagliptin.ClientID %>').hide();
                        $('#spanDosageLinagliptin').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseLinagliptin.ClientID %>'), false);
                    }

                });


                $('#<%=rdoMetformin_Glumetza.ClientID %>').change(function () {


                    if ($(this).is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseGlumetza.ClientID %>').show();
                        $('#spanDosageGlumetza').show();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseGlumetza.ClientID %>'), true);
                    }

                    else {
                        $('#<%=ddDailyDoseGlumetza.ClientID %>').hide();
                        $('#spanDosageGlumetza').hide();
                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddDailyDoseGlumetza.ClientID %>'), false);
                    }

                });


                $('#<%=chk_Antihyperglycemic_Insulin.ClientID %>').change(function () {


                    if ($(this).is(':checked')) {

                        $('#<%=ddNumInjections.ClientID %>').show();
                        $('#spanInjections').show();

                        $('#<%=ddNumInjections.ClientID %>').val('---');

                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddNumInjections.ClientID %>'), true);
                    }

                    else {
                        $('#<%=ddNumInjections.ClientID %>').hide();
                        $('#spanInjections').hide();

                        $('#<%=ddNumInjections.ClientID %>').val('---');

                        //validators
                        ValidatorEnable(document.getElementById('<%= cmpddNumInjections.ClientID %>'), false);
                    }

                });


                $('#<%=rdoMetformin_Metformin.ClientID %>').change(function () {


                    if ($(this).is(':checked')) {
                        HideAllMetformin();
                        $('#<%=ddDailyDoseMetformin.ClientID %>').show();
                        $('#<%=ddDailyFreqMetformin.ClientID %>').show();

                        $('#spanFreqMetaformin').show();
                        $('#spanDosgaeMetaformin').show();

                        //validators
                        ValidatorEnable(document.getElementById('<%= compddDailyFreqMetformin.ClientID %>'), true);
                        ValidatorEnable(document.getElementById('<%= comddDailyDoseMetformin.ClientID %>'), true);
                    }

                    else {

                        $('#<%=ddDailyDoseMetformin.ClientID %>').hide();
                        $('#<%=ddDailyFreqMetformin.ClientID %>').hide();

                        $('#spanFreqMetaformin').hide();
                        $('#spanDosgaeMetaformin').hide();

                        //validators
                        ValidatorEnable(document.getElementById('<%= compddDailyFreqMetformin.ClientID %>'), false);
                        ValidatorEnable(document.getElementById('<%= comddDailyDoseMetformin.ClientID %>'), false);
                    }

                });



                $('#<%=chk_Antihyperglycemic_DPP4.ClientID %>').change(function (event) {

                    if (

                        $('#<%=rdoMetformin_Linagliptin.ClientID %>').is(':checked') ||

                        $('#<%=rdoMetformin_Saxagliptin.ClientID %>').is(':checked') ||

                        $('#<%=rdoMetformin_Sitagliptin.ClientID %>').is(':checked') ||

                        $('#<%=rdoMetformin_SitagliptinExt.ClientID %>').is(':checked')
                    ) {

                        $('#<%=chk_Antihyperglycemic_DPP4.ClientID %>').prop('checked', false);
                    }

                });


                $('#<%=txtLDL_C1.ClientID %>').blur(function () {
                    CalculateLDLGap();
                });



                $('#<%=txtHDLC1.ClientID %>').blur(function () {
                    CalculateNONHDLC();
                });



                $('#<%=txtTotalCholesterol.ClientID %>').blur(function () {
                    CalculateNONHDLC();
                });



                HideAll();
                LoadData();


                $('#<%=txtMostRecentLipidLabDate.ClientID %>').attr('readonly', true);
                $('#<%=txtRecentA1CLabDate.ClientID %>').attr('readonly', true);
                $('#<%=txtLDLCareGap.ClientID %>').attr('readonly', true);

                $('#<%=txtNonHDLC1.ClientID %>').attr('readonly', true);



                ScrollView(cntrlToFocus);

            });

        } 
    
    </script>
    <style type="text/css">
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
        
        .ddList
        {
            font-size: 11px;
            width: 100px;
        }
        .infoLbl
        {
            color: Red;
            font-size: 11px;
        }
        .missing
        {
            color: Red;
            font-size: 11px;
        }
        .lbl
        {
            font-size: 11px;
            color: Red;
        }
        .smallBox
        {
            width: 66px;
        }
        .dd
        {
            width: 150px;
        }
        .middleImg
        {
            vertical-align: middle;
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
                            4 - LIPID AND GLYCEMIC PROFILE AND MANAGEMENT
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
                <asp:Panel runat="server" ID="pnlMain">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5" style="font-family: Arial, Helvetica, sans-serif;
                        border: thin solid #333;">
                        <tr>
                            <td style="background-color: #093">
                                <span style="color: #FFF"><span style="font-size: 28px; font-weight: bold">Lipid Profile
                                    and Management </span></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="5">
                                    <tr>
                                        <td class="blackmedium" width="35%">
                                            &nbsp;
                                        </td>
                                        <td width="40%">
                                        </td>
                                        <td width="25%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            LDL-C target for this patient?<div style="font-size: 9px; color: #999; font-style: italic">
                                                Select from the dropdown menu</div>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" ID="ddLDLC" CssClass="dd">
                                                <asp:ListItem Text="---" Value="---" />
                                                <asp:ListItem Text="&lt;&#61;1.5" Value="67" />
                                                <asp:ListItem Text="&lt;&#61;1.8" Value="68" />
                                                <asp:ListItem Text="&lt;&#61;2.0" Value="69" />
                                                <asp:ListItem Text="&lt;&#61;2.5" Value="70" />
                                                <asp:ListItem Text="&lt;&#61;3.0" Value="71" />
                                                <asp:ListItem Text="&lt;&#61;3.5" Value="72" />
                                                <asp:ListItem Text="&lt;&#61;5.0" Value="73" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CompareValidator ID="cmpddLDLC" runat="server" ControlToValidate="ddLDLC" ValueToCompare="---"
                                                Display="Dynamic" ErrorMessage="error" Type="String" Operator="NotEqual" ValidationGroup="Validate">
                 <img src="../../images/imp_icon.png" />
                
                                            </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div class="note" style="padding-bottom: 10px;">
                                                Record values exactly as they appear in the lab report. Include decimal places where
                                                applicable.
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Most Recent Lipid Lab Date:<div style="font-size: 9px; color: #999; font-style: italic">
                                                Must be within 6 months of Visit 1 date</div>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMostRecentLipidLabDate" runat="server" CssClass="dd" />
                                            <asp:ImageButton ImageUrl="~/images/calendar.png" runat="server" ID="imgBtn" OnClientClick="return false;"
                                                Style="vertical-align: middle;" />
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="reqtxtMostRecentLipidLabDate" ErrorMessage="Date of Consent Required"
                                                ControlToValidate="txtMostRecentLipidLabDate" runat="server" ValidationGroup="Validate"
                                                Display="Dynamic">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgMostRecentLipidLabDate"
                                                Visible="false" />
                                            <asp:Label Text="The lab date MUST be within 6 months of Visit 1 date" runat="server"
                                                CssClass="infoLbl" ID="lblMostRecentLipidLabDate" Visible="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Total Cholesterol:
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtTotalCholesterol" />
                                            <span style="font-size: 12px; font-weight: bold">mmol/L</span>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="reqtxtTotalCholesterol" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                Display="Dynamic" ControlToValidate="txtTotalCholesterol" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator6" runat="server" Operator="DataTypeCheck"
                                                Type="Double" ControlToValidate="txtTotalCholesterol" ErrorMessage="Value must be a valid number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <asp:CustomValidator ID="custtxtTotalCholesterol" ErrorMessage="Range (1 to 10)"
                                                ControlToValidate="txtTotalCholesterol" CssClass="missing" ValidationGroup="Validate"
                                                runat="server" ClientValidationFunction="custtxtTotalCholesterol_OnClientValidate"
                                                Display="Dynamic">
                                            </asp:CustomValidator>
                                            <div>
                                                <asp:Label Text="Cholesterol Must be in range 1-10" runat="server" ForeColor="Red"
                                                    ID="lblCholest" CssClass="lbl" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            LDL-C:
                                        </td>
                                        <td width="27%" style="white-space: nowrap;">
                                            <asp:TextBox runat="server" ID="txtLDL_C1" />
                                            <span style="font-size: 12px; font-weight: bold">mmol/L</span>
                                        </td>
                                        <td width="13%" align="left" style="vertical-align: middle; text-align: left;">
                                            <asp:RequiredFieldValidator ID="reqtxtLDLC1" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                Display="Dynamic" ControlToValidate="txtLDL_C1" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgLDLC" Visible="false" />
                                            <asp:CompareValidator ID="CompareValidator3" runat="server" Operator="DataTypeCheck"
                                                Type="Double" ControlToValidate="txtLDL_C1" ErrorMessage="Value must be a valid number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <div>
                                                <asp:CustomValidator ID="custtxtLDL_C1_2" ErrorMessage="Range (2.1 to 10)" ControlToValidate="txtLDL_C1"
                                                    CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="custtxtLDL_C1_2_OnClientValidate"
                                                    Display="Dynamic">
                                                </asp:CustomValidator>
                                                <asp:CustomValidator ID="custtxtLDL_C1" ErrorMessage="LDL-C value must be less than TC value"
                                                    ControlToValidate="txtLDL_C1" CssClass="missing" ValidationGroup="Validate" runat="server"
                                                    ClientValidationFunction="custtxtLDL_C1_OnClientValidate" Display="Dynamic">
                                                            
                                                </asp:CustomValidator>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            LDL-C Care Gap:
                                        </td>
                                        <td colspan="2">
                                            <%-- <table border="0" cellpadding="2" cellspacing="0" width="50px">
                                                <tr>
                                                    <td>
                                                        <img src="../../images/redarrow.png" width="35" height="20" class="middleImg" />
                                                    </td>
                                                    <td style="background-color: #CC0000;">
                                                        <span style="font-size: 8px; color: #FFF; font-weight: bold; width: 50px;">LDL-C Care
                                                            Gap:</span>
                                                        <asp:TextBox runat="server" ID="txtLDLCareGap" Width="50px" />
                                                    </td>
                                                </tr>
                                            </table>--%>
                                            <asp:TextBox runat="server" ID="txtLDLCareGap" BackColor="#006E77" ForeColor="White" />
                                            <span style="font-size: 12px; font-weight: bold">%</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td colspan="2">
                                            <div>
                                                <asp:Label Text="LDL-C Must be in range 0.1-10" runat="server" ForeColor="Red" ID="lblDLC"
                                                    CssClass="lbl" />
                                                <asp:Label Text="Does not meet the eligibility criteria (LDL-C > 2.0 and LDL-C < 10.0 mmol/L)"
                                                    runat="server" CssClass="lbl" ID="lblLDLValue" Visible="false" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            HDL-C:
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtHDLC1" />
                                            <span style="font-size: 12px; font-weight: bold">mmol/L</span>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="reqtxtHDLC1" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                Display="Dynamic" ControlToValidate="txtHDLC1" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator4" runat="server" Operator="DataTypeCheck"
                                                Type="Double" ControlToValidate="txtHDLC1" ErrorMessage="Value must be a valid number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <asp:CustomValidator ID="custtxtHDLC1" ErrorMessage="Range (0.1 to 5)" ControlToValidate="txtHDLC1"
                                                CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="custtxtHDLC1_OnClientValidate"
                                                Display="Dynamic">
                                            </asp:CustomValidator>
                                            <div>
                                                <asp:Label Text="HDL-C Must be in range 0.1-5" runat="server" ForeColor="Red" ID="lblHLDC"
                                                    CssClass="lbl" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Non HDL-C:
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtNonHDLC1" BackColor="#006E77" ForeColor="White" />
                                            <%-- <span style="font-weight: bold;">.</span>
                                            <asp:TextBox runat="server" ID="txtNonHDLC2" CssClass="smallBox" BackColor="#006E77"
                                                ForeColor="White" Font-Bold="true" />--%>
                                            <span style="font-size: 12px; font-weight: bold">mmol/L</span>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Enabled="false" Display="Dynamic" ID="reqtxtNonHDLC1"
                                                CssClass="missing" ErrorMessage="Date of Consent Required" ControlToValidate="txtNonHDLC1"
                                                runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <%-- <asp:RequiredFieldValidator Display="Dynamic" ID="reqtxtNonHDLC2" CssClass="missing"
                                                Enabled="false" ErrorMessage="Date of Consent Required" ControlToValidate="txtNonHDLC2"
                                                runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>--%>
                                            <asp:CompareValidator Enabled="false" ID="CompareValidator7" runat="server" Operator="DataTypeCheck"
                                                Type="Double" ControlToValidate="txtNonHDLC1" ErrorMessage="Value must be a valid number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <%--  <asp:CompareValidator Enabled="false" ID="CompareValidator8" runat="server" Operator="DataTypeCheck"
                                                Type="Integer" ControlToValidate="txtNonHDLC2" ErrorMessage="Value must be a whole number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>--%>
                                            <div>
                                                <asp:Label Text="Non HDL-C Must be in range 1-10" runat="server" ForeColor="Red"
                                                    ID="lblNONHDLC" CssClass="lbl" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Triglycerides:
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtTriglycerides1" />
                                            <span style="font-size: 12px; font-weight: bold">mmol/L</span>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="reqtxtTriglycerides1" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                Display="Dynamic" ControlToValidate="txtTriglycerides1" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator9" runat="server" Operator="DataTypeCheck"
                                                Type="Double" ControlToValidate="txtTriglycerides1" ErrorMessage="Value must be a valid number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <asp:CustomValidator ID="custtxtTriglycerides1" ErrorMessage="Range (0.1 to 10)"
                                                ControlToValidate="txtTriglycerides1" CssClass="missing" ValidationGroup="Validate"
                                                runat="server" ClientValidationFunction="custtxtTriglycerides1_OnClientValidate"
                                                Display="Dynamic">
                                            </asp:CustomValidator>
                                            <div>
                                                <asp:Label Text="Triglycerides Must be in range 0.1-10" runat="server" ForeColor="Red"
                                                    ID="lblTrig" CssClass="lbl" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium" valign="top">
                                            Statin Therapy:
                                        </td>
                                        <td>
                                            <table width="100%" border="1" cellpadding="4" cellspacing="0" style="text-align: center;
                                                font-size: 10px; font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                <tr>
                                                    <td bgcolor="#999999" style="width: 80%;" align="left">
                                                        Select Only ONE
                                                        <asp:Image ImageUrl="~/images/imp_icon.png" Visible="false" runat="server" ID="imgStatin" />
                                                    </td>
                                                    <td bgcolor="#FF3300">
                                                        &#10003;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Atorvastatin 20 mg OD
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoStatinAtorvastatin20" runat="server" GroupName="statinTherapy"
                                                            ValidationGroup="Validate" AnswerID="80" TextStr="Atorvastatin 20 mg OD" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Atorvastatin 40 mg OD
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoStatinAtorvastatin40" runat="server" GroupName="statinTherapy"
                                                            ValidationGroup="Validate" AnswerID="81" TextStr="Atorvastatin 40 mg OD" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Atorvastatin 80 mg OD
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoStatinAtorvastatin80" runat="server" GroupName="statinTherapy"
                                                            ValidationGroup="Validate" AnswerID="82" TextStr="Atorvastatin 80 mg OD" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Simvastatin 40 mg OD
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoStatinSimvastatin40" runat="server" GroupName="statinTherapy"
                                                            ValidationGroup="Validate" AnswerID="83" TextStr="Simvastatin 40 mg OD" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Rosuvastatin 10 mg OD
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoStatinRosuvastatin10" runat="server" GroupName="statinTherapy"
                                                            ValidationGroup="Validate" AnswerID="84" TextStr="Rosuvastatin 10 mg OD" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Rosuvastatin 20 mg OD
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoStatinRosuvastatin20" runat="server" GroupName="statinTherapy"
                                                            ValidationGroup="Validate" AnswerID="85" TextStr="Rosuvastatin 20 mg OD" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table width="100%" cellpadding="4" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium" valign="top">
                                            Additional Lipid Lowering Therapy:<br />
                                            <div style="font-size: 9px; color: #999; font-style: italic">
                                            </div>
                                        </td>
                                        <td>
                                            <table width="100%" border="1" cellpadding="4" cellspacing="0" style="text-align: center;
                                                font-size: 10px; font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                <tr>
                                                    <td bgcolor="#999999" style="width: 80%;" align="left">
                                                        Check ALL That Apply or Select “None of the Above”
                                                        <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgLipidLoweringTherapy"
                                                            Visible="false" />
                                                    </td>
                                                    <td bgcolor="#FF3300">
                                                        &#10003;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Bile Acid Sequestrant
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox runat="server" ValidationGroup="Validate" ID="chkLipidBileAcidSequestrant" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Ezetimibe
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox runat="server" ValidationGroup="Validate" ID="chkLipidEzetimibe" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Fibrate
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox runat="server" ValidationGroup="Validate" ID="chkLipidFibrate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Niacin
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox runat="server" ValidationGroup="Validate" ID="chkLipidNiacin" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Omega-3 Fatty Acids
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox runat="server" ValidationGroup="Validate" ID="chkLipidOmega" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        None of the Above
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox runat="server" ValidationGroup="Validate" ID="chkLipidNone" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table width="100%" cellpadding="4" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: -10px;">
                                                            <span id="spanBile" style="font-size: 9px;">Medication</span>
                                                            <asp:DropDownList runat="server" ID="ddBileAcidSequestrant" CssClass="ddList">
                                                                <asp:ListItem Text="Select one" Value="---" />
                                                                <asp:ListItem Text="Cholestyramine (Questran®)" Value="Cholestyramine (Questran®)" />
                                                                <asp:ListItem Text="Colestipol (Colestid®)" Value="Colestipol (Colestid®)" />
                                                                <asp:ListItem Text="Colesevelam (LodalisTM)" Value="Colesevelam (LodalisTM)" />
                                                            </asp:DropDownList>
                                                            <asp:CompareValidator ID="compddBileAcidSequestrant" runat="server" ControlToValidate="ddBileAcidSequestrant"
                                                                Display="Dynamic" ValueToCompare="---" ErrorMessage="error" Type="String" Operator="NotEqual"
                                                                ValidationGroup="Validate" Enabled="false">
                 <img src="../../images/imp_icon.png" />
                
                                                            </asp:CompareValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color: #093">
                                <span style="color: #FFF"><span style="font-size: 28px; font-weight: bold">Glycemic
                                    Profile and Management </span></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="5">
                                    <tr>
                                        <td class="blackmedium" width="35%">
                                            Duration of Diabetes:<div style="font-size: 9px; color: #999; font-style: italic">
                                                Select from the dropdown menu</div>
                                        </td>
                                        <td width="40%">
                                            <asp:DropDownList runat="server" ID="ddDiabetesDuration" CssClass="dd">
                                                <asp:ListItem Text="---" Value="---" />
                                                <asp:ListItem Text="1" Value="1" />
                                                <asp:ListItem Text="2" Value="2" />
                                                <asp:ListItem Text="3" Value="3" />
                                                <asp:ListItem Text="4" Value="4" />
                                                <asp:ListItem Text="5" Value="5" />
                                                <asp:ListItem Text="6" Value="6" />
                                                <asp:ListItem Text="7" Value="7" />
                                                <asp:ListItem Text="8" Value="8" />
                                                <asp:ListItem Text="9" Value="9" />
                                                <asp:ListItem Text="10" Value="10" />
                                                <asp:ListItem Text="11" Value="11" />
                                                <asp:ListItem Text="12" Value="12" />
                                                <asp:ListItem Text="13" Value="13" />
                                                <asp:ListItem Text="14" Value="14" />
                                                <asp:ListItem Text="15" Value="15" />
                                                <asp:ListItem Text="16" Value="16" />
                                                <asp:ListItem Text="17" Value="17" />
                                                <asp:ListItem Text="18" Value="18" />
                                                <asp:ListItem Text="19" Value="19" />
                                                <asp:ListItem Text="20" Value="20" />
                                                <asp:ListItem Text="21" Value="21" />
                                                <asp:ListItem Text="22" Value="22" />
                                                <asp:ListItem Text="23" Value="23" />
                                                <asp:ListItem Text="24" Value="24" />
                                                <asp:ListItem Text="25" Value="25" />
                                                <asp:ListItem Text="26" Value="26" />
                                                <asp:ListItem Text="27" Value="27" />
                                                <asp:ListItem Text="28" Value="28" />
                                                <asp:ListItem Text="29" Value="29" />
                                                <asp:ListItem Text="30" Value="30" />
                                                <asp:ListItem Text=">30" Value="31" />
                                            </asp:DropDownList>
                                            <span style="font-size: 12px; font-weight: bold">years</span>
                                        </td>
                                        <td width="25%">
                                            <asp:CompareValidator ID="cmpddDiabetesDuration" runat="server" ControlToValidate="ddDiabetesDuration"
                                                Display="Dynamic" ValueToCompare="---" ErrorMessage="error" Type="String" Operator="NotEqual"
                                                ValidationGroup="Validate">
                 <img src="../../images/imp_icon.png" />
                
                                            </asp:CompareValidator>
                                            <asp:Label CssClass="infoLbl" ID="lblDiabetesDuration" Text="Duration of diabetes cannot be greater than patient's age"
                                                runat="server" Visible="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            A1C target for this patient?<div style="font-size: 9px; color: #999; font-style: italic">
                                                Select from the dropdown menu</div>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" ID="ddACITarget" CssClass="dd">
                                                <asp:ListItem Text="---" Value="---" />
                                                <asp:ListItem Text="&lt;&#61;6.0%" Value="95" />
                                                <asp:ListItem Text="&lt;&#61;6.5%" Value="96" />
                                                <asp:ListItem Text="&lt;&#61;7.0%" Value="97" />
                                                <asp:ListItem Text="&lt;&#61;7.5%" Value="98" />
                                                <asp:ListItem Text="&lt;&#61;8.0%" Value="99" />
                                                <asp:ListItem Text="&lt;&#61;8.5%" Value="100" />
                                                <asp:ListItem Text="&lt;&#61;9.0%" Value="101" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CompareValidator ID="cmpddACITarget" runat="server" ControlToValidate="ddACITarget"
                                                Display="Dynamic" ValueToCompare="---" ErrorMessage="error" Type="String" Operator="NotEqual"
                                                ValidationGroup="Validate">
                 <img src="../../images/imp_icon.png" />
                
                                            </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr id="trA1C">
                                        <td class="blackmedium" valign="top">
                                            Please select ALL applicable reason(s) for selecting an A1C target >7.0% for this
                                            patient
                                        </td>
                                        <td>
                                            <table width="100%" border="1" cellpadding="4" cellspacing="0" style="text-align: center;
                                                font-size: 10px; font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                <tr>
                                                    <td bgcolor="#999999" style="width: 80%;" align="left">
                                                        Check ALL That Apply or Select “None of the Above”
                                                    </td>
                                                    <td bgcolor="#FF3300">
                                                        &#10003;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Limited life expectancy
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="131" runat="server" ID="chkLimitLife" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        High level of functional dependency
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="132" runat="server" ID="chkHighFunc" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Extensive coronary artery disease at high risk of ischemic events
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="133" runat="server" ID="chkIschemic" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Multiple co-morbidities
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="134" runat="server" ID="chkMultiMorbid" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        History of recurrent severe hypoglycemia
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="135" runat="server" ID="chkRecuGlycemia" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Hypoglycemia unawareness
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="136" runat="server" ID="chkHypoglycemiaAwareness" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Longstanding diabetes for whom it is difficult to achieve an A1C <= 7%, despite
                                                        effective doses of multiple antihyperglycemic agents, including intensified basal-bolus
                                                        insulin therapy
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="137" runat="server" ID="chkLongDia" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Based on my clinical judgement
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="138" runat="server" ID="chkClinicalJudge" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        None of the above
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="139" runat="server" ID="chkNone" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div class="note" style="padding-top: 10px;">
                                                Record values exactly as they appear in the lab report. Include decimal places where
                                                applicable.
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Most Recent A1C Lab Date:<div style="font-size: 9px; color: #999; font-style: italic">
                                                Must be within 6 months of Visit 1 date</div>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRecentA1CLabDate" runat="server" CssClass="dd" />
                                            <asp:ImageButton ImageUrl="~/images/calendar.png" runat="server" ID="imgBtn2" OnClientClick="return false;"
                                                Style="vertical-align: middle;" />
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="reqtxtRecentA1CLabDate" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                Display="Dynamic" ControlToValidate="txtRecentA1CLabDate" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgA1CLabDate" Visible="false" />
                                            <asp:Label Text="The A1C date MUST be within 6 months of Visit 1 date" runat="server"
                                                CssClass="infoLbl" ID="lblA1C" Visible="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            A1C:
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtAIC1" />
                                            <span style="font-size: 12px; font-weight: bold">%</span>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="reqtxtAIC1" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                Display="Dynamic" ControlToValidate="txtAIC1" runat="server" ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator11" runat="server" Operator="DataTypeCheck"
                                                Type="Double" ControlToValidate="txtAIC1" ErrorMessage="Value must be a valid number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <asp:CustomValidator ID="custtxtAIC1" ErrorMessage="Range (7.1 to 8.9)" ControlToValidate="txtAIC1"
                                                CssClass="missing" ValidationGroup="Validate" runat="server" ClientValidationFunction="custtxtAIC1_OnClientValidate"
                                                Display="Dynamic">
                                            </asp:CustomValidator>
                                            <div style="text-align: left;">
                                                <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgAIC" Visible="false" />
                                                <asp:Label Text="This patient does not meet the eligibility criteria (A1C > 7.0% and < 9.0%)"
                                                    runat="server" CssClass="infoLbl" ID="lblAIC" Visible="false" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium">
                                            Fasting Plasma Glucose:
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtFastingPlasmaGlucose1" />
                                            <span style="font-size: 12px; font-weight: bold">mmol/L</span>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="reqtxtFastingPlasmaGlucose1" CssClass="missing" ErrorMessage="Date of Consent Required"
                                                Display="Dynamic" ControlToValidate="txtFastingPlasmaGlucose1" runat="server"
                                                ValidationGroup="Validate">
                                                            <img src="../../images/imp_icon.png" />
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator13" runat="server" Operator="DataTypeCheck"
                                                Type="Double" ControlToValidate="txtFastingPlasmaGlucose1" ErrorMessage="Value must be a valid number"
                                                ValidationGroup="Validate" CssClass="missing">
                                                <img src="../../images/imp_icon.png" />
                                            </asp:CompareValidator>
                                            <asp:CustomValidator ID="custtxtFastingPlasmaGlucose1" ErrorMessage="Range (3 to 12)"
                                                ControlToValidate="txtFastingPlasmaGlucose1" CssClass="missing" ValidationGroup="Validate"
                                                runat="server" ClientValidationFunction="custtxtFastingPlasmaGlucose1_OnClientValidate"
                                                Display="Dynamic">
                                            </asp:CustomValidator>
                                            <div style="text-align: left;">
                                                <asp:Label Text="Fasting Plasma Glucose Must be in range 3-12" runat="server" ForeColor="Red"
                                                    ID="lblFasting" CssClass="lbl" /></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium" valign="top">
                                            Metformin Therapy:
                                        </td>
                                        <td>
                                            <table width="100%" border="1" cellpadding="5" cellspacing="0" style="text-align: center;
                                                font-size: 10px; font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                <tr>
                                                    <td bgcolor="#999999" style="width: 80%;" align="left">
                                                        Select Only ONE
                                                        <asp:Image ImageUrl="~/images/imp_icon.png" Visible="false" runat="server" ID="imgMetaformin" />
                                                    </td>
                                                    <td bgcolor="#FF3300">
                                                        &#10003;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Metformin
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoMetformin_Metformin" runat="server" GroupName="MetforminTherapy"
                                                            ValidationGroup="Validate" AnswerID="105" TextStr="Metformin" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Glumetza&#174;
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoMetformin_Glumetza" runat="server" GroupName="MetforminTherapy"
                                                            ValidationGroup="Validate" AnswerID="106" TextStr="Glumetza" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Linagliptin / Metformin (Jentadueto&trade;)
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoMetformin_Linagliptin" runat="server" GroupName="MetforminTherapy"
                                                            ValidationGroup="Validate" AnswerID="107" TextStr="Linagliptin / Metformin (Jentadueto)" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Saxagliptin / Metformin (Komboglyze&trade;)
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoMetformin_Saxagliptin" runat="server" GroupName="MetforminTherapy"
                                                            ValidationGroup="Validate" AnswerID="108" TextStr="Saxagliptin / Metformin (Komboglyze)" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Sitagliptin / Metformin (Janumet&#174;)
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoMetformin_Sitagliptin" runat="server" GroupName="MetforminTherapy"
                                                            ValidationGroup="Validate" AnswerID="109" TextStr="Sitagliptin / Metformin (Janumet)" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Sitagliptin / Metformin extended-release (Janumet XR&#174;)
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:RadioButton ID="rdoMetformin_SitagliptinExt" runat="server" GroupName="MetforminTherapy"
                                                            ValidationGroup="Validate" AnswerID="110" TextStr="Sitagliptin / Metformin extended-release (Janumet XR)" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table width="100%" cellpadding="6" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td>
                                                                                <span style="font-size: 9px">&nbsp; <span id="spanDosgaeMetaformin">Dosage</span>
                                                                            </td>
                                                                            <td align="right">
                                                                                <asp:DropDownList runat="server" ID="ddDailyDoseMetformin" CssClass="ddList">
                                                                                    <asp:ListItem Text="Select Total Daily Dosage" Value="---" />
                                                                                    <asp:ListItem Text="1500 mg" Value="1500 mg" />
                                                                                    <asp:ListItem Text="1700 mg" Value="1700 mg" />
                                                                                    <asp:ListItem Text="2000 mg" Value="2000 mg" />
                                                                                    <asp:ListItem Text="2500 mg" Value="2500 mg" />
                                                                                    <asp:ListItem Text="2550 mg" Value="2550 mg" />
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td align="right">
                                                                                <asp:CompareValidator ID="comddDailyDoseMetformin" runat="server" ControlToValidate="ddDailyDoseMetformin"
                                                                                    Display="Dynamic" ValueToCompare="---" ErrorMessage="error" Type="String" Operator="NotEqual"
                                                                                    ValidationGroup="Validate" Enabled="false">
                 <img src="../../images/imp_icon.png" />
                
                                                                                </asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <span style="font-size: 9px">&nbsp; <span id="spanFreqMetaformin">Freq.</span>
                                                                            </td>
                                                                            <td align="right">
                                                                                <asp:DropDownList runat="server" ID="ddDailyFreqMetformin" CssClass="ddList">
                                                                                    <asp:ListItem Text="Select Daily Frequency" Value="---" />
                                                                                    <asp:ListItem Text="1" Value="1" />
                                                                                    <asp:ListItem Text="2" Value="2" />
                                                                                    <asp:ListItem Text="3" Value="3" />
                                                                                    <asp:ListItem Text="4" Value="4" />
                                                                                    <asp:ListItem Text="5" Value="5" />
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td align="right">
                                                                                <asp:CompareValidator ID="compddDailyFreqMetformin" runat="server" ControlToValidate="ddDailyFreqMetformin"
                                                                                    Display="Dynamic" ValueToCompare="---" ErrorMessage="error" Type="String" Operator="NotEqual"
                                                                                    ValidationGroup="Validate" Enabled="false">
                 <img src="../../images/imp_icon.png" />
                                                                                </asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: 9px">&nbsp; <span id="spanDosageGlumetza">Dosage</span>
                                                            <asp:DropDownList runat="server" ID="ddDailyDoseGlumetza" CssClass="ddList">
                                                                <asp:ListItem Text="Select Total Daily Dosage" Value="---" />
                                                                <asp:ListItem Text="1500 mg" Value="1500 mg" />
                                                                <asp:ListItem Text="2000 mg" Value="2000 mg" />
                                                                <asp:ListItem Text="2500 mg" Value="2500 mg" />
                                                            </asp:DropDownList>
                                                        </span>
                                                        <asp:CompareValidator ID="cmpddDailyDoseGlumetza" runat="server" ControlToValidate="ddDailyDoseGlumetza"
                                                            Display="Dynamic" ValueToCompare="---" ErrorMessage="error" Type="String" Operator="NotEqual"
                                                            ValidationGroup="Validate" Enabled="false">
                 <img src="../../images/imp_icon.png" />
                
                                                        </asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span style="font-size: 9px">&nbsp; <span id="spanDosageLinagliptin">Dosage</span>
                                                            <asp:DropDownList ID="ddDailyDoseLinagliptin" runat="server" CssClass="ddList">
                                                                <asp:ListItem Text="Select Total Daily Dosage" Value="---" />
                                                                <asp:ListItem Text="5 mg / 2000 mg" Value="5 mg / 2000 mg" />
                                                            </asp:DropDownList>
                                                        </span>
                                                        <asp:CompareValidator ID="cmpddDailyDoseLinagliptin" runat="server" ControlToValidate="ddDailyDoseLinagliptin"
                                                            Display="Dynamic" ErrorMessage="error" Operator="NotEqual" Type="String" ValidationGroup="Validate"
                                                            ValueToCompare="---" Enabled="false">
                 <img src="../../images/imp_icon.png" />
                
                                                        </asp:CompareValidator>
                                                    </td>
                                                    <tr>
                                                        <td>
                                                            <span style="font-size: 9px">&nbsp; <span id="spanDosageSaxagliptin">Dosage</span>
                                                                <asp:DropDownList ID="ddDailyDoseSaxagliptin" runat="server" CssClass="ddList">
                                                                    <asp:ListItem Text="Select Total Daily Dosage" Value="---" />
                                                                    <asp:ListItem Text="5 mg / 2000 mg" Value="5 mg / 2000 mg" />
                                                                </asp:DropDownList>
                                                            </span>
                                                            <asp:CompareValidator ID="cmpddDailyDoseSaxagliptin" runat="server" ControlToValidate="ddDailyDoseSaxagliptin"
                                                                Display="Dynamic" ErrorMessage="error" Operator="NotEqual" Type="String" ValidationGroup="Validate"
                                                                ValueToCompare="---" Enabled="false">
                 <img src="../../images/imp_icon.png" />
                
                                                            </asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <span style="font-size: 9px">&nbsp; <span id="spanDosageSitagliptin">Dosage</span>
                                                                <asp:DropDownList ID="ddDailyDoseSitagliptin" runat="server" CssClass="ddList">
                                                                    <asp:ListItem Text="Select Total Daily Dosage" Value="---" />
                                                                    <asp:ListItem Text="100 mg / 1700 mg" Value="100 mg / 1700 mg" />
                                                                    <asp:ListItem Text="100 mg / 2000 mg" Value="100 mg / 2000 mg" />
                                                                </asp:DropDownList>
                                                            </span>
                                                            <asp:CompareValidator ID="cmpddDailyDoseSitagliptin" runat="server" ControlToValidate="ddDailyDoseSitagliptin"
                                                                Display="Dynamic" ErrorMessage="error" Operator="NotEqual" Type="String" ValidationGroup="Validate"
                                                                ValueToCompare="---" Enabled="false">
                 <img src="../../images/imp_icon.png" />
                
                                                            </asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <span style="font-size: 9px">&nbsp; <span id="spanDosageSitagliptinExt">Dosage</span>
                                                                <asp:DropDownList ID="ddDailyDoseSitagliptinExt" runat="server" CssClass="ddList">
                                                                    <asp:ListItem Text="Select Total Daily Dosage" Value="---" />
                                                                    <asp:ListItem Text="100 mg / 2000 mg" Value="100 mg / 2000 mg" />
                                                                </asp:DropDownList>
                                                            </span>
                                                            <asp:CompareValidator ID="cmpddDailyDoseSitagliptinExt" runat="server" ControlToValidate="ddDailyDoseSitagliptinExt"
                                                                Display="Dynamic" ErrorMessage="error" Operator="NotEqual" Type="String" ValidationGroup="Validate"
                                                                ValueToCompare="---" Enabled="false">
                 <img src="../../images/imp_icon.png" />
                
                                                            </asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="blackmedium" valign="top">
                                            Additional Antihyperglycemic Therapy:<div style="font-size: 9px; color: #999; font-style: italic">
                                            </div>
                                        </td>
                                        <td>
                                            <table width="100%" border="1" cellpadding="4" cellspacing="0" style="text-align: center;
                                                font-size: 10px; font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                <tr>
                                                    <td bgcolor="#999999" style="width: 80%;" align="left">
                                                        Check ALL That Apply or Select “None of the Above”
                                                        <asp:Image ImageUrl="~/images/imp_icon.png" runat="server" ID="imgAdditionalAntihyperglycemicTherapy"
                                                            Visible="false" />
                                                    </td>
                                                    <td bgcolor="#FF3300">
                                                        &#10003;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        &alpha;-Glucosidase Inhibitor
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="111" runat="server" ID="chk_Antihyperglycemic_Glucosidase"
                                                            ValidationGroup="Validate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        DPP-4 Inhibitor
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="112" runat="server" ID="chk_Antihyperglycemic_DPP4" ValidationGroup="Validate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        GLP-1 Receptor Agonist
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="113" runat="server" ID="chk_Antihyperglycemic_GLP1" ValidationGroup="Validate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Insulin
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="114" runat="server" ID="chk_Antihyperglycemic_Insulin" ValidationGroup="Validate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Meglitinide
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="115" runat="server" ID="chk_Antihyperglycemic_Meglitinide"
                                                            ValidationGroup="Validate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        SGLT2 Inhibitor
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="116" runat="server" ID="chk_Antihyperglycemic_SGLT2" ValidationGroup="Validate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Sulfonylurea
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="117" runat="server" ID="chk_Antihyperglycemic_Sulfonylurea"
                                                            ValidationGroup="Validate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        Thiazolidinedione
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID="118" runat="server" ID="chk_Antihyperglycemic_Thiazolidinedione"
                                                            ValidationGroup="Validate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF" align="left">
                                                        None of the Above
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        <asp:CheckBox AnswerID=" " runat="server" ID="chk_Antihyperglycemic_None" ValidationGroup="Validate" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table width="100%" cellpadding="2" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: -10px;">
                                                            <span style="font-size: 9px"><span id="spanInjections" style="font-size: 9px">Injections</span>
                                                                <asp:DropDownList ID="ddNumInjections" runat="server" CssClass="ddList">
                                                                    <asp:ListItem Text="Number of Injections/Day" Value="---" />
                                                                    <asp:ListItem Text="1" Value="1" />
                                                                    <asp:ListItem Text="2" Value="2" />
                                                                    <asp:ListItem Text="3" Value="3" />
                                                                    <asp:ListItem Text="4" Value="4" />
                                                                    <asp:ListItem Text=">4" Value=">4" />
                                                                </asp:DropDownList>
                                                                <asp:CompareValidator ID="cmpddNumInjections" runat="server" ControlToValidate="ddNumInjections"
                                                                    Display="Dynamic" ErrorMessage="error" Operator="NotEqual" Type="String" ValidationGroup="Validate"
                                                                    ValueToCompare="---" Enabled="false">
                 <img src="../../images/imp_icon.png" />
                
                                                                </asp:CompareValidator>
                                                        </div>
                                                    </td>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                            </table>
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
