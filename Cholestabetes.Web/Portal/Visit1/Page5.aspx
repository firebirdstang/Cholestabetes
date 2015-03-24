<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Page5.aspx.cs" Inherits="Cholestabetes.Web.Portal.Visit1.Page5" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/CustomScripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

        function ShowControlsSec(list) {

            for (controlID in list) {

                var cntrlID = '#' + list[controlID];
                $(cntrlID).show();
            }
        }

        function ShowControls(list) {

            for (controlID in list) {

                var cntrlID = '#' + list[controlID];
                $(cntrlID).show();
            }
        }

        function ClearSubControls() {

            $('#<%=rdoColesevelamPatientRefusal.ClientID %>').prop('checked', false);
            $('#<%=rdoColesevelamPatientAfford.ClientID %>').prop('checked', false);
            $('#<%=rdoColesevelamDrugAdmin.ClientID %>').prop('checked', false);
            $('#<%=rdoColesevelamPatientRX.ClientID %>').prop('checked', false);

            // $('#<%=ddAddColesevelam.ClientID %>').is(':checked')

            $('#<%=ddAddColesevelam.ClientID %>').val("-1");

            //$('select[name="<%=ddAddColesevelam.ClientID %>"]').val(-1);

            $('#<%=rdoEzetimibePatientRefusal.ClientID %>').prop('checked', false);
            $('#<%=rdoEzetimibePatientAfford.ClientID %>').prop('checked', false);
            $('#<%=rdoEzetimibeDrugAdmin.ClientID %>').prop('checked', false);
            $('#<%=rdoEzetimibePatientRX.ClientID %>').prop('checked', false);

            $('#<%=rdoFibratePatientAppr.ClientID %>').prop('checked', false);
            $('#<%=rdoFibratePatientTG.ClientID %>').prop('checked', false);
            $('#<%=rdoFibrateDisagreeRecom.ClientID %>').prop('checked', false);
            $('#<%=rdoFibrateMedicalConstraints.ClientID %>').prop('checked', false);
            $('#<%=rdoFibrateCoverage.ClientID %>').prop('checked', false);

            $('#<%=rdoNiacinPatientAppr.ClientID %>').prop('checked', false);
            $('#<%=rdoNiacinPatientDisagree.ClientID %>').prop('checked', false);
            $('#<%=rdoNiacinMedical.ClientID %>').prop('checked', false);
            $('#<%=rdoNiacinReimbursement.ClientID %>').prop('checked', false);

            $('#<%=rdoNoChangePatientAchieved.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangeLifeStyle.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangeNeedTime.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangeStatin.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangeNewTherapy.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangePatientAppro.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangeRiskAssesment.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangeDisagreeRecom.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangePatientRefusal.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangeMedicalConstraints.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangePatientAge.ClientID %>').prop('checked', false);
            $('#<%=rdoNoChangeReimbursement.ClientID %>').prop('checked', false);

            $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
            $('#<%=txtBaselineLDLC.ClientID %>').val('');

        }

        function ShowHideSecDivs() {

            if ($('#<%=chkNoChangeMgmt.ClientID %>').is(':checked')) {

                $('#<%=divNoChangesManagement.ClientID %>').show();

                $('#<%=divAddThereapy.ClientID %>').hide();

                $('#<%=divAddThereapyNo.ClientID %>').hide();

            }
            else
                if (

                    $('#<%=chkGlucosidase.ClientID %>').is(':checked') ||

                     $('#<%=chkDPP4Inhibitor.ClientID %>').is(':checked') ||

                      $('#<%=chkReceptorAgonist.ClientID %>').is(':checked') ||

                       $('#<%=chkInsulin.ClientID %>').is(':checked') ||

                        $('#<%=chkMeglitinide.ClientID %>').is(':checked') ||

                         $('#<%=chkSGLT2Inhibitor.ClientID %>').is(':checked') ||

                          $('#<%=chkSulfonylurea.ClientID %>').is(':checked') ||

                           $('#<%=chkThiazolidinedione.ClientID %>').is(':checked')

                ) {


                    $('#<%=divNoChangesManagement.ClientID %>').hide();

                    $('#<%=divAddThereapy.ClientID %>').show();

                    if ($('#<%=rdoAddTherapyNo.ClientID %>').is(':checked'))

                        $('#<%=divAddThereapyNo.ClientID %>').show();

                }
        }

        function HideAll() {

            $('#<%=divColesevelam.ClientID %>').hide();

            $('#<%=divEzetimibe.ClientID %>').hide();

            $('#<%=divFibrate.ClientID %>').hide();

            $('#<%=divNiacin.ClientID %>').hide();

            $('#<%=divNoChange.ClientID %>').hide();

            //hiding labels
            $('#<%=lblColesevelamRdo.ClientID %>').hide();

            $('#<%=lblddAddColesevelam.ClientID %>').hide();

            $('#<%=lbldivrdoColesevelamNo.ClientID %>').hide();

            $('#<%=lblEzetimibeNo.ClientID %>').hide();

            $('#<%=lblFibrateRdoSelReq.ClientID %>').hide();

            $('#<%=lblFibrateRdoLst.ClientID %>').hide();

            $('#<%=lblNiacinRdo.ClientID %>').hide();

            $('#<%=lblNiacinRdoLst.ClientID %>').hide();

            $('#<%=lblNoChange.ClientID %>').hide();


            $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
            // $('#<%=txtBaselineLDLC.ClientID %>').val('');

        }

        function HideAllSecPage() {

            $('#<%=divAddThereapy.ClientID %>').hide();

            $('#<%=divAddThereapyNo.ClientID %>').hide();

            $('#<%=divNoChangesManagement.ClientID %>').hide();

        }

        function HideSubDivAll() {

            $('#<%=divrdoColesevelamYes.ClientID %>').hide();
            $('#<%=divrdoColesevelamNo.ClientID %>').hide();

            $('#<%=divrdoEzetimibeYes.ClientID %>').hide();
            $('#<%=divrdoEzetimibeNo.ClientID %>').hide();

            $('#<%=divrdoFibrateYes.ClientID %>').hide();
            $('#<%=divrdoFibrateNo.ClientID %>').hide();

            $('#<%=divrdoNiacinYes.ClientID %>').hide();
            $('#<%=divrdoNiacinNo.ClientID %>').hide();

        }

        function ShowHideDivs(index) {

            if (index == 0) {

                $('#<%=divColesevelam.ClientID %>').show();

                if ($('#<%=rdoColesevelamYes.ClientID %>').is(':checked')) {

                    $('#<%=divrdoColesevelamYes.ClientID %>').show();
                    $('#<%=divrdoColesevelamNo.ClientID %>').hide();

                }

                if ($('#<%=rdoColesevelamNo.ClientID %>').is(':checked')) {

                    $('#<%=divrdoColesevelamYes.ClientID %>').hide();
                    $('#<%=divrdoColesevelamNo.ClientID %>').show();

                }

            }

            if (index == 1) {

                $('#<%=divEzetimibe.ClientID %>').show();


                if ($('#<%=rdoEzetimibeYes.ClientID %>').is(':checked')) {

                    $('#<%=divrdoEzetimibeNo.ClientID %>').hide();

                }


                if ($('#<%=rdoEzetimibeNo.ClientID %>').is(':checked')) {

                    $('#<%=divrdoEzetimibeNo.ClientID %>').show();

                }

            }

            if (index == 2) {

                $('#<%=divFibrate.ClientID %>').show();


                if ($('#<%=rdoFibrateYes.ClientID %>').is(':checked')) {

                    $('#<%=divrdoFibrateNo.ClientID %>').show();

                }


                if ($('#<%=rdoFibrateNo.ClientID %>').is(':checked')) {

                    $('#<%=divrdoFibrateNo.ClientID %>').show();

                }
            }

            if (index == 3) {

                $('#<%=divNiacin.ClientID %>').show();

                if ($('#<%=rdoNiacinYes.ClientID %>').is(':checked')) {

                    $('#<%=divrdoNiacinNo.ClientID %>').show();

                }


                if ($('#<%=rdoNiacinNo.ClientID %>').is(':checked')) {

                    $('#<%=divrdoNiacinNo.ClientID %>').show();

                }

            }

            if (index == 4) {

                $('#<%=divNoChange.ClientID %>').show();


                if ($('#<%=rdoNoChangePatientAchieved.ClientID %>').is(':checked')) {

                    $('#<%=divNoChangePatientAchieved.ClientID %>').show();
                }
                else {

                    $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                }

            }
        }


        function pageLoad() {

            $(document).ready(function () {

                //---------------------Page 1----------------------------

                function UnCheckAll(exceptFor) {


                    if (exceptFor != 0)

                        $('#<%=chkColesevelam.ClientID %>').prop('checked', false);

                    if (exceptFor != 1)

                        $('#<%=chkEzetimibe.ClientID %>').prop('checked', false);

                    if (exceptFor != 2)

                        $('#<%=chkFibrate.ClientID %>').prop('checked', false);


                    if (exceptFor != 3)

                        $('#<%=chkNiacin.ClientID %>').prop('checked', false);


                    if (exceptFor != 4)

                        $('#<%=chkNoChange.ClientID %>').prop('checked', false);

                }

                //---------------------------------------------------------------------


                //-----------------------No change Box Part 1 -------------------------------------

                $('#<%=rdoNoChangeReimbursement.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });




                $('#<%=rdoNoChangeLifeStyle.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });



                $('#<%=rdoNoChangeNeedTime.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });



                $('#<%=rdoNoChangeStatin.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });



                $('#<%=rdoNoChangeNewTherapy.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });



                $('#<%=rdoNoChangePatientAppro.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });



                $('#<%=rdoNoChangeRiskAssesment.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });



                $('#<%=rdoNoChangeDisagreeRecom.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });



                $('#<%=rdoNoChangePatientRefusal.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });



                $('#<%= rdoNoChangeMedicalConstraints.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });



                $('#<%=rdoNoChangePatientAge.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');
                    }

                });


                $('#<%=rdoNoChangePatientAchieved.ClientID %>').change(function () {

                    if ($(this).is(':checked')) {


                        $('#<%=divNoChangePatientAchieved.ClientID %>').show();
                    }
                    else {

                        $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                        $('#<%=txtBaselineLDLC.ClientID %>').val('');

                    }

                });


                //-----------------------No change Box Part 1 -------------------------------------


                $('#<%=chkColesevelam.ClientID %>').change(function () {

                    ClearSubControls();

                    $('#<%=rdoColesevelamNo.ClientID %>').prop('checked', false);
                    $('#<%=rdoColesevelamYes.ClientID %>').prop('checked', false);

                    if ($(this).is(':checked')) {

                        UnCheckAll(0);
                        HideAll();
                        HideSubDivAll();

                        $('#<%=divColesevelam.ClientID %>').show();

                    }
                    else {

                        $('#<%=divColesevelam.ClientID %>').hide();
                    }

                });


                $('#<%=rdoColesevelamYes.ClientID %>').change(function () {

                    ClearSubControls();
                    HideSubDivAll();

                    if ($(this).is(':checked')) {

                        $('#<%=divrdoColesevelamYes.ClientID %>').show();
                        $('#<%=divrdoColesevelamNo.ClientID %>').hide();
                    }
                    else {

                        $('#<%=divrdoColesevelamYes.ClientID %>').hide();
                        $('#<%=divrdoColesevelamNo.ClientID %>').show();

                    }

                });

                $('#<%=rdoColesevelamNo.ClientID %>').change(function () {

                    ClearSubControls();
                    HideSubDivAll();

                    if ($(this).is(':checked')) {

                        $('#<%=divrdoColesevelamYes.ClientID %>').hide();
                        $('#<%=divrdoColesevelamNo.ClientID %>').show();
                    }
                    else {

                        $('#<%=divrdoColesevelamYes.ClientID %>').show();
                        $('#<%=divrdoColesevelamNo.ClientID %>').hide();

                    }

                });

                //---------------------------------------------------------------------

                $('#<%=chkEzetimibe.ClientID %>').change(function () {

                    ClearSubControls();

                    $('#<%=rdoEzetimibeYes.ClientID %>').prop('checked', false);
                    $('#<%=rdoEzetimibeNo.ClientID %>').prop('checked', false);


                    if ($(this).is(':checked')) {

                        UnCheckAll(1);
                        HideAll();
                        HideSubDivAll();

                        $('#<%=divEzetimibe.ClientID %>').show();

                    }
                    else {

                        $('#<%=divEzetimibe.ClientID %>').hide();
                    }

                });


                $('#<%=rdoEzetimibeYes.ClientID %>').change(function () {

                    ClearSubControls();
                    HideSubDivAll();

                    if ($(this).is(':checked')) {

                        $('#<%=divrdoEzetimibeYes.ClientID %>').show();
                        $('#<%=divrdoEzetimibeNo.ClientID %>').hide();
                    }
                    else {

                        $('#<%=divrdoEzetimibeYes.ClientID %>').hide();
                        $('#<%=divrdoEzetimibeNo.ClientID %>').show();

                    }

                });

                $('#<%=rdoEzetimibeNo.ClientID %>').change(function () {

                    ClearSubControls();
                    HideSubDivAll();

                    if ($(this).is(':checked')) {

                        $('#<%=divrdoEzetimibeYes.ClientID %>').hide();
                        $('#<%=divrdoEzetimibeNo.ClientID %>').show();
                    }
                    else {

                        $('#<%=divrdoEzetimibeYes.ClientID %>').show();
                        $('#<%=divrdoEzetimibeNo.ClientID %>').hide();

                    }

                });

                //---------------------------------------------------------------------

                $('#<%=chkFibrate.ClientID %>').change(function () {

                    ClearSubControls();

                    $('#<%=rdoFibrateYes.ClientID %>').prop('checked', false);
                    $('#<%=rdoFibrateNo.ClientID %>').prop('checked', false);

                    if ($(this).is(':checked')) {

                        UnCheckAll(2);
                        HideAll();
                        HideSubDivAll();

                        $('#<%=divFibrate.ClientID %>').show();

                    }
                    else {

                        $('#<%=divFibrate.ClientID %>').hide();
                    }

                });


                $('#<%=rdoFibrateYes.ClientID %>').change(function () {

                    ClearSubControls();
                    HideSubDivAll();

                    if ($(this).is(':checked')) {

                        $('#<%=divrdoFibrateNo.ClientID %>').show();

                        //                        $('#<%=divrdoFibrateYes.ClientID %>').show();
                        //                        $('#<%=divrdoFibrateNo.ClientID %>').hide();
                    }
                    else {

                        $('#<%=divrdoFibrateNo.ClientID %>').hide();

                        //                        $('#<%=divrdoFibrateYes.ClientID %>').hide();
                        //                        $('#<%=divrdoFibrateNo.ClientID %>').show();

                    }

                });

                $('#<%=rdoFibrateNo.ClientID %>').change(function () {

                    ClearSubControls();
                    HideSubDivAll();

                    if ($(this).is(':checked')) {

                        $('#<%=divrdoFibrateNo.ClientID %>').show();

                        //                        $('#<%=divrdoFibrateYes.ClientID %>').hide();
                        //                        $('#<%=divrdoFibrateNo.ClientID %>').show();
                    }
                    else {

                        $('#<%=divrdoFibrateNo.ClientID %>').hide();

                        //                        $('#<%=divrdoFibrateYes.ClientID %>').show();
                        //                        $('#<%=divrdoFibrateNo.ClientID %>').hide();

                    }

                });


                //---------------------------------------------------------------------

                $('#<%=chkNiacin.ClientID %>').change(function () {

                    ClearSubControls();

                    $('#<%=rdoNiacinYes.ClientID %>').prop('checked', false);
                    $('#<%=rdoNiacinNo.ClientID %>').prop('checked', false);

                    if ($(this).is(':checked')) {

                        UnCheckAll(3);
                        HideAll();
                        HideSubDivAll();

                        $('#<%=divNiacin.ClientID %>').show();

                    }
                    else {

                        $('#<%=divNiacin.ClientID %>').hide();
                    }

                });


                $('#<%=rdoNiacinYes.ClientID %>').change(function () {

                    ClearSubControls();
                    HideSubDivAll();

                    if ($(this).is(':checked')) {

                        //  $('#<%=divrdoNiacinYes.ClientID %>').show();
                        $('#<%=divrdoNiacinNo.ClientID %>').show();
                    }
                    else {

                        //    $('#<%=divrdoNiacinYes.ClientID %>').hide();
                        $('#<%=divrdoNiacinNo.ClientID %>').hide();

                    }

                });

                $('#<%=rdoNiacinNo.ClientID %>').change(function () {

                    ClearSubControls();
                    HideSubDivAll();

                    if ($(this).is(':checked')) {

                        //  $('#<%=divrdoNiacinYes.ClientID %>').hide();
                        $('#<%=divrdoNiacinNo.ClientID %>').show();
                    }
                    else {

                        //   $('#<%=divrdoNiacinYes.ClientID %>').show();
                        $('#<%=divrdoNiacinNo.ClientID %>').hide();

                    }

                });


                //---------------------------------------------------------------------

                $('#<%=chkNoChange.ClientID %>').change(function () {

                    ClearSubControls();
                    if ($(this).is(':checked')) {

                        UnCheckAll(4);
                        HideAll();
                        HideSubDivAll();

                        $('#<%=divNoChange.ClientID %>').show();

                    }
                    else {
                        $('#<%=divNoChange.ClientID %>').hide();
                    }

                });

                //------------------------------Page 1 ----------------------------------

                //-------------------------------Page 2 --------------------------------

                function UnCheckAllSecPageSub() {

                    $('#<%=rdoAddSecPatientRefusal.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddSecInsurance.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddSecAdmin.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddSecRX.ClientID %>').prop('checked', false);

                    $('#<%=rdoAddTherapySecNoReinforce.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoEvaluate.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoTitrated.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoColesevelam.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoNewTherapy.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoCurrMed.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoRiskAsses.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoRecommend.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoRefusal.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoConstraints.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoAge.ClientID %>').prop('checked', false);
                    $('#<%=rdoAddTherapySecNoDiff.ClientID %>').prop('checked', false);

                }

                function UnCheckAllSecPage(exceptFor) {

                    UnCheckAllSecPageSub();

                    $('#<%=lblAddTherapyRdo.ClientID %>').hide();


                    if (exceptFor != 0)

                        $('#<%=chkGlucosidase.ClientID %>').prop('checked', false);

                    if (exceptFor != 1)

                        $('#<%=chkDPP4Inhibitor.ClientID %>').prop('checked', false);

                    if (exceptFor != 2)

                        $('#<%=chkReceptorAgonist.ClientID %>').prop('checked', false);


                    if (exceptFor != 3)

                        $('#<%=chkInsulin.ClientID %>').prop('checked', false);


                    if (exceptFor != 4)

                        $('#<%=chkMeglitinide.ClientID %>').prop('checked', false);

                    if (exceptFor != 5)

                        $('#<%=chkSGLT2Inhibitor.ClientID %>').prop('checked', false);

                    if (exceptFor != 6)

                        $('#<%=chkSulfonylurea.ClientID %>').prop('checked', false);

                    if (exceptFor != 7)

                        $('#<%=chkThiazolidinedione.ClientID %>').prop('checked', false);

                    if (exceptFor != 8)

                        $('#<%=chkNoChangeMgmt.ClientID %>').prop('checked', false);


                    $('#<%=rdoAddTherapyYes.ClientID %>').prop('checked', false);

                    $('#<%=rdoAddTherapyNo.ClientID %>').prop('checked', false);

                    $('#<%=divNoChangesManagement.ClientID %>').hide();

                    $('#<%=divNoChangePatientAchieved.ClientID %>').hide();
                    $('#<%=txtBaselineLDLC.ClientID %>').val('');
                }

                $('#<%=rdoAddTherapyYes.ClientID %>').change(function () {

                    UnCheckAllSecPageSub();

                    if ($(this).is(':checked')) {


                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                });


                $('#<%=rdoAddTherapyNo.ClientID %>').change(function () {


                    UnCheckAllSecPageSub();

                    if ($(this).is(':checked')) {


                        $('#<%=divAddThereapyNo.ClientID %>').show();

                    }
                    else {


                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                });

                $('#<%=chkGlucosidase.ClientID %>').change(function () {

                    UnCheckAllSecPage(0);

                    if ($(this).is(':checked')) {

                        $('#<%=divAddThereapy.ClientID %>').show();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                    else {

                        $('#<%=divAddThereapy.ClientID %>').hide();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                });


                $('#<%=chkDPP4Inhibitor.ClientID %>').change(function () {

                    UnCheckAllSecPage(1);

                    if ($(this).is(':checked')) {

                        $('#<%=divAddThereapy.ClientID %>').show();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                    else {

                        $('#<%=divAddThereapy.ClientID %>').hide();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                });


                $('#<%=chkReceptorAgonist.ClientID %>').change(function () {

                    UnCheckAllSecPage(2);

                    if ($(this).is(':checked')) {

                        $('#<%=divAddThereapy.ClientID %>').show();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                    else {

                        $('#<%=divAddThereapy.ClientID %>').hide();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                });

                $('#<%=chkInsulin.ClientID %>').change(function () {

                    UnCheckAllSecPage(3);

                    if ($(this).is(':checked')) {

                        $('#<%=divAddThereapy.ClientID %>').show();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                    else {

                        $('#<%=divAddThereapy.ClientID %>').hide();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                });

                $('#<%=chkMeglitinide.ClientID %>').change(function () {

                    UnCheckAllSecPage(4);

                    if ($(this).is(':checked')) {

                        $('#<%=divAddThereapy.ClientID %>').show();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                    else {

                        $('#<%=divAddThereapy.ClientID %>').hide();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                });

                $('#<%=chkSGLT2Inhibitor.ClientID %>').change(function () {

                    UnCheckAllSecPage(5);

                    if ($(this).is(':checked')) {

                        $('#<%=divAddThereapy.ClientID %>').show();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                    else {

                        $('#<%=divAddThereapy.ClientID %>').hide();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                });

                $('#<%=chkSulfonylurea.ClientID %>').change(function () {

                    UnCheckAllSecPage(6);

                    if ($(this).is(':checked')) {

                        $('#<%=divAddThereapy.ClientID %>').show();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                    else {

                        $('#<%=divAddThereapy.ClientID %>').hide();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                });

                $('#<%=chkThiazolidinedione.ClientID %>').change(function () {

                    UnCheckAllSecPage(7);

                    if ($(this).is(':checked')) {

                        $('#<%=divAddThereapy.ClientID %>').show();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                    else {

                        $('#<%=divAddThereapy.ClientID %>').hide();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();

                    }
                });


                $('#<%=chkNoChangeMgmt.ClientID %>').change(function () {

                    UnCheckAllSecPage(8);

                    if ($(this).is(':checked')) {

                        $('#<%=divNoChangesManagement.ClientID %>').show();
                        $('#<%=divAddThereapy.ClientID %>').hide();
                        $('#<%=divAddThereapyNo.ClientID %>').hide();
                    }
                    else {

                        $('#<%=divNoChangesManagement.ClientID %>').hide();
                        $('#<%=divAddThereapy.ClientID %>').hide();

                    }
                });

                //-------------------------------Page 2 --------------------------------

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
        label
        {
            /* display: block;*/
            padding-left: 15px;
            text-indent: -15px;
        }
        
        .specialRed
        {
            color: #900;
            font-size: 13px;
            font-weight: bold;
        }
    </style>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="rightbox">
                <div style="margin-top: -10px;">
                    <table width="100%" cellspacing="0" border="0">
                        <tr>
                            <td align="center" style="font-size: 25px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                                <asp:Label Text="5 - Clinical Rationale and Next Steps in Management: Dyslipidemia"
                                    runat="server" ID="lblHeading" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="padding-left: 10px">
                    <a href="../Patients.aspx">
                        <img src="../../images/home_flag.png" /></a></div>
                <asp:Panel runat="server" ID="pnlCustVal" CssClass="errorMssg" Width="100%" HorizontalAlign="Center">
                </asp:Panel>
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
                <asp:Wizard runat="server" ID="wiz" FinishPreviousButtonType="Image" StartNextButtonStyle-Height="43px"
                    StepNextButtonStyle-Height="43px" FinishCompleteButtonStyle-Height="43px" StepPreviousButtonStyle-Height="43px"
                    StartNextButtonStyle-Width="136px" StepNextButtonStyle-Width="136px" FinishCompleteButtonStyle-Width="136px"
                    StepPreviousButtonStyle-Width="136px" StartNextButtonType="Image" StepNextButtonType="Image"
                    FinishCompleteButtonType="Image" StepPreviousButtonType="Image" StartNextButtonImageUrl="~/images/next_button.png"
                    StepNextButtonImageUrl="~/images/next_button.png" FinishCompleteButtonImageUrl="~/images/submit.png"
                    StepPreviousButtonImageUrl="~/images/arrow_back.png">
                    <WizardSteps>
                        <asp:WizardStep StepType="Step" runat="server">
                            <strong>
                                <div style="padding: 20px;">
                                    <div style="background-image: url(../../images/imagebox.png); background-repeat: no-repeat;
                                        background-size: 100%; padding: 0; font-weight: bold; height: 284px; width: 100%;">
                                        <div style="padding: 30px 35px 20px 29px;">
                                            <table width="97%" border="0" align="center">
                                                <tr>
                                                    <td align="right">
                                                        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image20','','../../images/downloadbutton-rollover.png',1)">
                                                            <img src="../../images/downloadbutton.png" name="Image19" width="157" height="41"
                                                                border="0" id="Img1" /></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <span style="font-size: 14px; color: #666">CDA Recommendations</span>
                                                    </td>
                                                </tr>
                                            </table>
                                            <ul>
                                                <li style="color: #000; padding-bottom: 10px">Achieving the LDL-C target (50% reduction
                                                    or < 2 mmol/L) has been identified as the most significant step in lowering cardiovascular
                                                    risk. </li>
                                                <li style="color: #000">This patient's LDL-C is not at target despite maximal tolerated
                                                    statin treatment; therefore, please consider 2nd line therapy as summarized in the
                                                    Canadian Diabetes Association's Clinical Practice Guidelines.</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <table width="100%" border="0" align="center" style="font-size: 12px; font-weight: bold"
                                        cellpadding="10">
                                        <tr>
                                            <td colspan="3" style="text-align: center; background-image: url(../../images/cda.gif);
                                                background-repeat: no-repeat">
                                                <span style="color: #900; font-size: 24px">Summary of Second Line Agents</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="37%" style="background-color: #000; text-align: center">
                                                <span style="color: #FFF">Drug Class<br />
                                                    Generic Name (Trade Name)</span>
                                            </td>
                                            <td width="26%" style="background-color: #000; text-align: center">
                                                <span style="color: #FFF">Principle Effects</span>
                                            </td>
                                            <td width="37%" style="background-color: #000; text-align: center">
                                                <span style="color: #FFF">Other Considerations</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: #797979">
                                                Bile Acid Sequestrant<ul style="padding-left: 10px">
                                                    <li>Cholestyramine resin (Questran)</li><li>Colestipol (Colestid)</li><li>Colesevalam
                                                        (Lodalis)</li></ul>
                                            </td>
                                            <td style="background-color: #797979" align="center">
                                                Lowers LDL-C
                                            </td>
                                            <td style="background-color: #797979">
                                                <ul style="padding-left: 10px">
                                                    <li>Gastrointestinal intolerability</li><li>TG elevation</li><li>Colesevalam: A1C lowering
                                                        effect</li></ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: #999">
                                                Cholesterol Absorption Inhibitor<ul style="padding-left: 10px">
                                                    <li>Ezetimibe (Ezetrol)</li></ul>
                                            </td>
                                            <td style="background-color: #999" align="center">
                                                Lowers LDL-C
                                            </td>
                                            <td style="background-color: #999">
                                                <ul style="padding-left: 10px">
                                                    <li>Effective in combination with statin</li></ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: #CCC">
                                                Fibrate<ul style="padding-left: 10px">
                                                    <li>Bezafibrate (Bezalip SR)</li><li>Fenofibrate (Lipidil)</li><li>Gemfibrozil (Lopid)</li></ul>
                                            </td>
                                            <td style="background-color: #CCC" align="center">
                                                Lowers TG<br />
                                                Variable LDL-C effect<br />
                                                Variable HDL-C effect
                                            </td>
                                            <td style="background-color: #CCC">
                                                <ul style="padding-left: 10px">
                                                    <li>May &#8593; creatinine homocysteine (but long term fenofibrate use has favorable
                                                        renal effects)</li><li>Do not combine gemfibrozil + statin</li><li>May increase creatinine
                                                            AND homocysteine</li></ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: #E1E1E1">
                                                Nicotinic Acid<ul style="padding-left: 10px">
                                                    <li>ER Niacin (Niaspan, Niaspan FCT)</li><li>IR Niacin (non-prescription)</li><li>LA
                                                        ("no-flush") Niacin - not recommended</li></ul>
                                            </td>
                                            <td style="background-color: #E1E1E1" align="center">
                                                Lower TG + LDL-C<br />
                                                Raise HDL-C
                                            </td>
                                            <td style="background-color: #E1E1E1">
                                                <ul style="padding-left: 10px">
                                                    <li>Dose related deterioration in glycemia</li><li>ER Niacin more tolerable than IR</li><li>
                                                        Long-acting niacin should NOT be used</li></ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="text-align: center">
                                                ER = extended release; IR = immediate release; LA=long acting;
                                                <br />
                                                TG=triglycerides; FCT=film coated tablet; SR=sustained release
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="text-align: center">
                                                <span style="font-size: 10px; color: #666; font-weight: normal">Canadian Diabetes Association
                                                    Clinical Practice Guidelines Expert Committee. Can J Diabetes 2013;37:S1-S212.</span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </strong>
                        </asp:WizardStep>
                        <asp:WizardStep StepType="Step" runat="server">
                            <div style="background-image: url(../../images/imagebox2.png); background-repeat: no-repeat;
                                background-size: 100%; padding: 0; font-weight: bold; height: 170px; width: 100%;">
                                <div style="padding: 30px 35px 20px 29px;">
                                    <ul>
                                        <li style="color: #000;">To lower LDL-C, a Bile Acid Sequestrant or a Cholesterol Absorption
                                            Inhibitor may be considered as part of this program based on the following clinical
                                            rationale.</li>
                                    </ul>
                                </div>
                            </div>
                            <div style="margin-left: 50px;">
                                <div style="background-image: url(../../images/points1.png); background-repeat: no-repeat;
                                    padding: 50px 50px 50px 130px">
                                    <strong>Colesevelam and Ezetimibe both lower LDL-C by about<br />
                                        15% when added to statin therapy;
                                        <br />
                                        Colesevelam additionally lowers A1C</strong>
                                </div>
                                <div style="background-image: url(../../images/points2.png); background-repeat: no-repeat;
                                    padding: 50px 50px 50px 130px; font-size: 18px; font-weight: bold">
                                    Nicotinic Acid:<span style="font-style: italic; font-size: 12px">
                                        <ul style="padding-left: 15px; margin: 0">
                                            <li>Not well tolerated; may cause infection and bleeding (<span style="color: black;">HPS2-THRIVE</span>)</li>
                                            <li>No evidence of CV benefit on top of statin </li>
                                            <li>May worsen glycemia</li>
                                        </ul>
                                    </span>
                                </div>
                                <div style="background-image: url(../../images/points2.png); background-repeat: no-repeat;
                                    padding: 50px 50px 50px 130px; font-size: 18px; font-weight: bold">
                                    Fibrate:<span style="font-style: italic; font-size: 12px">
                                        <ul style="padding-left: 15px; margin: 0">
                                            <li>Does not lower LDL (primary target)</li>
                                            <li>No evidence of benefit in recent large studies (<span style="color: black">FIELD,
                                                ACCORD LIPID</span>)</li>
                                        </ul>
                                    </span>
                                </div>
                            </div>
                            <br />
                        </asp:WizardStep>
                        <asp:WizardStep StepType="Step" runat="server">
                            <asp:Panel runat="server" ID="pnlMain">
                                <div style="padding: 20px;">
                                    <div style="background-image: url(../../images/imagebox3.png); background-repeat: no-repeat;
                                        background-size: 100%; padding: 0; font-weight: bold; width: 100%;">
                                        <div style="padding: 30px 35px 20px 29px;">
                                            <ul>
                                                <li style="color: black; padding-bottom: 0px">Patient's with Type 2 Diabetes Mellitus
                                                    may benefit from lowering of both, LDL-C and A1C</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <table width="80%" border="3" cellpadding="5" bordercolor="#000000" cellspacing="0"
                                        align="center">
                                        <tr>
                                            <td style="background-color: #000">
                                                <span style="color: #FFF; font-size: 22px">Agent</span>
                                            </td>
                                            <td align="center" style="background-color: #000">
                                                <span style="color: #FFF; font-size: 22px">LDL-C Lowering</span>
                                            </td>
                                            <td align="center" style="background-color: #000">
                                                <span style="color: #FFF; font-size: 22px">A1C Lowering</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Colesevelam
                                            </td>
                                            <td align="center">
                                                <img src="../../images/checkmark.png" />
                                            </td>
                                            <td align="center">
                                                <img src="../../images/checkmark.png" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Ezetimibe
                                            </td>
                                            <td align="center">
                                                <img src="../../images/checkmark.png" />
                                            </td>
                                            <td align="center">
                                                <img src="../../images/x_symbol.png" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Fibrate
                                            </td>
                                            <td align="center">
                                                <img src="../../images/x_symbol.png" />
                                            </td>
                                            <td align="center">
                                                <img src="../../images/x_symbol.png" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Niacin
                                            </td>
                                            <td align="center">
                                                <img src="../../images/checkmark.png" />
                                            </td>
                                            <td align="center">
                                                <img src="../../images/x_symbol.png" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                    <div style="width: 100%; margin: 0 auto;">
                                        <div style="background-image: url(../../images/header_larger.png); background-repeat: no-repeat;
                                            font-size: 24px; color: #fff; padding: 20px;">
                                            <span class="nextSteps">Next Steps in Management</span><br />
                                            <br />
                                            <br />
                                        </div>
                                    </div>
                                    <br />
                                    <div style="padding-left: 5px; padding-right: 5px; padding-top: 5px;">
                                        <span style="color: #900; font-size: 18px; font-weight: bold">Based on the Guideline
                                            Recommendations, the Clinical Rationale (reviewed in previous pages) and your clinical
                                            judgment, what is your next management step to achieve the guideline recommended
                                            LDL-C target in this patient? </span>
                                        <br />
                                        <br />
                                        <span style="color: #666; font-size: 18px; font-weight: bold">Please Select ONE of the
                                            following:</span>
                                        <br />
                                        <br />
                                        <div style="font-size: 16px; font-weight: bold;">
                                            <p>
                                                <asp:CheckBox ID="chkColesevelam" Text="Add <span style='color:#900;'>Colesevelam</span>"
                                                    runat="server" ValidationGroup="selectMedication" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkEzetimibe" Text="Add <span style='color:#900;'>Ezetimibe</span>"
                                                    runat="server" ValidationGroup="selectMedication" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkFibrate" Text="Add <span style='color:#900;'>Fibrate</span>"
                                                    runat="server" ValidationGroup="selectMedication" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkNiacin" Text="Add <span style='color:#900;'>Niacin</span>" runat="server"
                                                    ValidationGroup="selectMedication" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkNoChange" Text="No change to current pharmacological management at this time"
                                                    ValidationGroup="selectMedication" runat="server" />
                                            </p>
                                            <p>
                                                <asp:Label Text="Selection Required" runat="server" CssClass="specialRed" ID="lblMainSelRequired"
                                                    Visible="false" />
                                            </p>
                                        </div>
                                        <div id="divColesevelam" runat="server">
                                            <div style="margin-top: 0px; background-color: #0C6; font-size: 18px; font-weight: bold;
                                                padding: 10px; text-align: center">
                                                Colesevelam lowers LDL-C by about 15% when added to statin therapy; Colesevelam
                                                additionally lowers A1C</div>
                                            <br />
                                            <br />
                                            <table width="100%" border="0" cellpadding="5">
                                                <tr>
                                                    <td colspan="2" style="font-size: 14px">
                                                        <strong>Have you provided this patient with an actual prescription for Colesevelam?
                                                        </strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="15%">
                                                        <asp:RadioButton ID="rdoColesevelamYes" Text="Yes" runat="server" GroupName="Colesevelam" />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdoColesevelamNo" Text="No" runat="server" GroupName="Colesevelam" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label Text="Selection Required" runat="server" ID="lblColesevelamRdo" CssClass="specialRed"
                                                            Visible="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- if YES-->
                                            <div id="divrdoColesevelamYes" runat="server">
                                                <br />
                                                <br />
                                                <span style="font-size: 14px; font-weight: bold">Please specify total Colesevelam daily
                                                    dose? </span><span style="font-size: 10px; color: #999; font-style: italic">Select one
                                                        from the drop down menu</span>
                                                <asp:DropDownList runat="server" ID="ddAddColesevelam">
                                                    <asp:ListItem Text="---" Value="-1" />
                                                    <asp:ListItem Text="1875 mg (3 tablets)" Value="0" />
                                                    <asp:ListItem Text="2500 mg (4 tablets)" Value="1" />
                                                    <asp:ListItem Text="3125 mg (5 tablets)" Value="2" />
                                                    <asp:ListItem Text="3750 mg (6 tablets)" Value="3" />
                                                    <asp:ListItem Text="4375 mg (7 tablets)" Value="4" />
                                                </asp:DropDownList>
                                                <br />
                                                <br />
                                                <asp:Label Text="Selection Required" runat="server" ID="lblddAddColesevelam" CssClass="specialRed"
                                                    Visible="false" />
                                            </div>
                                            <!-- if NO-->
                                            <div id="divrdoColesevelamNo" runat="server">
                                                <br />
                                                <br />
                                                <span style="font-size: 14px; font-weight: bold">Please select the most applicable reason
                                                    for not providing the Colesevelam prescription to this patient at this visit:</span>
                                                <br />
                                                <br />
                                                <table width="100%" border="1" cellpadding="4" cellspacing="0" style="font-size: 12px;
                                                    font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                    <tr>
                                                        <td bgcolor="#000000">
                                                            <span style="color: #FFF">Select Only ONE:</span>
                                                        </td>
                                                        <td bgcolor="#FF3300" align="center">
                                                            &#10003;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Patient refusal
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoColesevelamPatientRefusal" GroupName="AddColesevelam" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Patient cannot afford / insurance coverage
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoColesevelamPatientAfford" GroupName="AddColesevelam" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Waiting to see if drug can be administered (reasons other than insurance)
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoColesevelamDrugAdmin" GroupName="AddColesevelam" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Patient will return for Rx / Will provide Rx at next patient visit
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoColesevelamPatientRX" GroupName="AddColesevelam" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <asp:Label Text="Selection Required" runat="server" ID="lbldivrdoColesevelamNo" CssClass="specialRed"
                                                    Visible="false" />
                                            </div>
                                            <!-- IF COLESEVELAM IS SELECTED-->
                                        </div>
                                        <div id="divEzetimibe" runat="server">
                                            <br />
                                            <br />
                                            <table width="100%" border="0" cellpadding="5">
                                                <tr>
                                                    <td colspan="2" style="font-size: 14px">
                                                        <strong>Have you provided this patient with an actual prescription for Ezetimibe?
                                                        </strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="15%">
                                                        <asp:RadioButton ID="rdoEzetimibeYes" Text="Yes" runat="server" GroupName="Ezetimibe" />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdoEzetimibeNo" Text="No" runat="server" GroupName="Ezetimibe" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label Text="Selection Required" runat="server" ID="lblrdoEzetimibe" CssClass="specialRed"
                                                            Visible="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- if YES-->
                                            <div id="divrdoEzetimibeYes" runat="server">
                                            </div>
                                            <!-- if NO-->
                                            <div id="divrdoEzetimibeNo" runat="server">
                                                <br />
                                                <br />
                                                <span style="font-size: 14px; font-weight: bold">Please select the most applicable reason
                                                    for not providing the Ezetimibe prescription to this patient at this visit:</span>
                                                <br />
                                                <br />
                                                <table width="100%" border="1" cellpadding="4" cellspacing="0" style="font-size: 12px;
                                                    font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                    <tr>
                                                        <td bgcolor="#000000">
                                                            <span style="color: #FFF">Select Only ONE:</span>
                                                        </td>
                                                        <td bgcolor="#FF3300" align="center">
                                                            &#10003;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Patient refusal
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoEzetimibePatientRefusal" GroupName="AddEzetimibe" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Patient cannot afford / insurance coverage
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoEzetimibePatientAfford" GroupName="AddEzetimibe" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Waiting to see if drug can be administered (reasons other than insurance)
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoEzetimibeDrugAdmin" GroupName="AddEzetimibe" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Patient will return for Rx / Will provide Rx at next patient visit
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoEzetimibePatientRX" GroupName="AddEzetimibe" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <asp:Label Text="Selection Required" runat="server" ID="lblEzetimibeNo" CssClass="specialRed"
                                                    Visible="true" />
                                            </div>
                                        </div>
                                        <div id="divFibrate" runat="server">
                                            <!-- if FIBRATE   SELECTED-->
                                            <br />
                                            <br />
                                            <table width="100%" border="0" cellpadding="5">
                                                <tr>
                                                    <td colspan="2" style="font-size: 14px">
                                                        <strong>Have you provided this patient with an actual prescription for Fibrate?
                                                        </strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="15%">
                                                        <asp:RadioButton ID="rdoFibrateYes" Text="Yes" runat="server" GroupName="Fibrate" />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdoFibrateNo" Text="No" runat="server" GroupName="Fibrate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label Text="Selection Required" runat="server" ID="lblFibrateRdoSelReq" CssClass="specialRed"
                                                            Visible="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- if FIBRATE IS SELECTED-->
                                            <div id="divrdoFibrateYes" runat="server">
                                            </div>
                                            <div id="divrdoFibrateNo" runat="server">
                                                <div class="clinicalRation">
                                                    Clinical Rationale
                                                </div>
                                                <div style="margin: 0 40px;">
                                                    <div style="background-image: url(../../images/points2.png); background-repeat: no-repeat;
                                                        padding: 50px 50px 50px 130px; font-size: 18px; font-weight: bold">
                                                        Fibrate:<span style="font-style: italic; font-size: 12px">
                                                            <ul style="padding-left: 15px; margin: 0">
                                                                <li>Does not lower LDL (primary target)</li>
                                                                <li>No evidence of benefit in recent large studies (<span style="color: black">FIELD,
                                                                    ACCORD LIPID</span>)</li>
                                                            </ul>
                                                        </span>
                                                    </div>
                                                    <div style="background-image: url(../../images/points1.png); background-repeat: no-repeat;
                                                        padding: 50px 50px 50px 130px">
                                                        <strong>Colesevelam and Ezetimibe both lower LDL-C by about 15% when added to statin
                                                            therapy; Colesevelam additionally lowers A1C</strong>
                                                    </div>
                                                </div>
                                                <br />
                                                <br />
                                                <span style="font-size: 14px; font-weight: bold">Please select the most applicable reason
                                                    for not following the recommendations based on the clinical rationale:</span>
                                                <br />
                                                <br />
                                                <table width="100%" border="1" cellpadding="4" cellspacing="0" style="font-size: 12px;
                                                    font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                    <tr>
                                                        <td bgcolor="#000000">
                                                            <span style="color: #FFF">Select Only ONE:</span>
                                                        </td>
                                                        <td bgcolor="#FF3300" align="center">
                                                            &#10003;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            I believe that the current management is appropriate for this patient
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoFibratePatientAppr" GroupName="AddFibrate" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Patient's TG >10.0 mmol/L
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoFibratePatientTG" GroupName="AddFibrate" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            I disagree with the recommendations
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoFibrateDisagreeRecom" GroupName="AddFibrate" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Medical constraints (e.g. co-morbid conditions, contraindications)
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoFibrateMedicalConstraints" GroupName="AddFibrate" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Coverage / Reimbursement difficulties
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoFibrateCoverage" GroupName="AddFibrate" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <asp:Label Text="Selection Required" runat="server" ID="lblFibrateRdoLst" CssClass="specialRed"
                                                    Visible="false" />
                                            </div>
                                        </div>
                                        <div id="divNiacin" runat="server">
                                            <br />
                                            <br />
                                            <table width="100%" border="0" cellpadding="5">
                                                <tr>
                                                    <td colspan="2" style="font-size: 14px">
                                                        <strong>Have you provided this patient with an actual prescription for Niacin? </strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="15%">
                                                        <asp:RadioButton ID="rdoNiacinYes" Text="Yes" runat="server" GroupName="Niacin" />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdoNiacinNo" Text="No" runat="server" GroupName="Niacin" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label Text="Selection Required" runat="server" ID="lblNiacinRdo" CssClass="specialRed"
                                                            Visible="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <div id="divrdoNiacinNo" runat="server">
                                                <div class="clinicalRation">
                                                    Clinical Rationale
                                                </div>
                                                <div style="margin: 0 40px;">
                                                    <div style="background-image: url(../../images/points2.png); background-repeat: no-repeat;
                                                        padding: 40px 50px 50px 130px; font-size: 18px; font-weight: bold">
                                                        Nicotinic Acid:<span style="font-style: italic; font-size: 12px">
                                                            <ul style="padding-left: 15px; margin: 0">
                                                                <li>Not well tolerated; may cause infection and bleeding (<span style="color: black;">HPS2-THRIVE</span>)</li>
                                                                <li>No evidence of CV benefit on top of statin </li>
                                                                <li>May worsen glycemia</li>
                                                            </ul>
                                                        </span>
                                                    </div>
                                                    <div style="background-image: url(../../images/points1.png); background-repeat: no-repeat;
                                                        padding: 50px 50px 50px 130px">
                                                        <strong>Colesevelam and Ezetimibe both lower LDL-C by about 15% when added to statin
                                                            therapy; Colesevelam additionally lowers A1C </strong>
                                                    </div>
                                                </div>
                                                <span style="font-size: 14px; font-weight: bold">Please select the most applicable reason
                                                    for not following the recommendations based on the clinical rationale:</span>
                                                <br />
                                                <br />
                                                <table width="100%" border="1" cellpadding="4" cellspacing="0" style="font-size: 12px;
                                                    font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                    <tr>
                                                        <td bgcolor="#000000">
                                                            <span style="color: #FFF">Select Only ONE:</span>
                                                        </td>
                                                        <td bgcolor="#FF3300" align="center">
                                                            &#10003;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            I believe that the current management is appropriate for this patient
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoNiacinPatientAppr" GroupName="AddNiacin" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            I disagree with the recommendations
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoNiacinPatientDisagree" GroupName="AddNiacin" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Medical constraints (e.g. co-morbid conditions, contraindications)
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoNiacinMedical" GroupName="AddNiacin" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF">
                                                            Coverage / Reimbursement difficulties
                                                        </td>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                            <asp:RadioButton Text="" runat="server" ID="rdoNiacinReimbursement" GroupName="AddNiacin" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <asp:Label Text="Selection Required" runat="server" ID="lblNiacinRdoLst" CssClass="specialRed"
                                                    Visible="false" />
                                            </div>
                                            <div id="divrdoNiacinYes" runat="server">
                                            </div>
                                        </div>
                                        <div id="divNoChange" runat="server">
                                            <span style="font-size: 14px; font-weight: bold">Please select the most applicable reason
                                                for not following the recommendations based on the clinical rationale:</span>
                                            <br />
                                            <br />
                                            <table width="100%" border="1" cellpadding="4" cellspacing="0" style="font-size: 12px;
                                                font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                <tr>
                                                    <td bgcolor="#000000">
                                                        <span style="color: #FFF">Select Only ONE:</span>
                                                    </td>
                                                    <td bgcolor="#FF3300" align="center">
                                                        &#10003;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Patient has already achieved at least a 50% LDL-C reduction from baseline
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangePatientAchieved" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        I am reinforcing lifestyle advice
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangeLifeStyle" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Need more time to evaluate efficacy of current treatment
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangeNeedTime" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Recently titrated statin dose
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangeStatin" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        I do not initiate new therapy
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangeNewTherapy" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        I believe that the current management is appropriate for this patient
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangePatientAppro" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        I do not believe additional therapy is indicated based on the risk assessment of
                                                        this patient
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangeRiskAssesment" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        I disagree with the recommendations
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangeDisagreeRecom" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Patient refusal
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangePatientRefusal" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Medical constraints (e.g. co-morbid conditions, contraindications)
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangeMedicalConstraints" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Patient's age
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangePatientAge" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Coverage / Reimbursement difficulties
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton Text="" runat="server" ID="rdoNoChangeReimbursement" GroupName="NoChange" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:Label Text="Selection Required" runat="server" ID="lblNoChange" CssClass="specialRed"
                                                Visible="false" />
                                            <div id="divNoChangePatientAchieved" runat="server">
                                                <table border="0" cellpadding="5" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <span class="question">What was this patient’s baseline LDL-C?</span>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox CssClass="question" runat="server" ID="txtBaselineLDLC" />
                                                            <span style="font-size: 12px; font-weight: bold">mmol/L</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Label Text="Selection Required" runat="server" ID="lblBaseLineLDLC" CssClass="specialRed"
                                                                Visible="false" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </asp:WizardStep>
                        <asp:WizardStep StepType="Step" runat="server">
                            <div style="padding: 20px;">
                                <div style="background-image: url(../../images/imagebox4.png); background-repeat: no-repeat;
                                    background-size: 100%; padding: 0; font-weight: bold; width: 100%; margin: 0 auto;
                                    height: 450px; width: 100%;">
                                    <div style="padding: 30px 35px 20px 29px;">
                                        <table width="97%" border="0" align="center">
                                            <tr>
                                                <td align="right">
                                                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image20','','../../images/downloadbutton-rollover.png',1)">
                                                        <img src="../../images/downloadbutton.png" name="Image19" width="157" height="41"
                                                            border="0" id="Img2" /></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span style="font-size: 14px; color: #666">CDA Recommendations</span>
                                                </td>
                                            </tr>
                                        </table>
                                        <ul>
                                            <li style="color: black; padding-bottom: 10px">The Canadian Diabetes Association's Clinical
                                                Practice Guidelines recommend that patients with Type 2 Diabetes Mellitus achieve
                                                the target A1C (A1C < 7.0 % for most patients) within 3-6 months of diagnosis and
                                                that Metformin should be the initial drug used. </li>
                                            <li style="color: black; padding-bottom: 10px">Other classes of antihyperglycemic agents,
                                                including insulin, should be added to metformin, or used in combination with each
                                                other, if glycemic targets are not met taking into account the patient characteristics
                                                and properties of treatment and that these adjustments to and/or additions of antihyperglycemic
                                                agents should be made in order to attain target A1C within 3-6 months. </li>
                                            <li style="color: black; padding-bottom: 10px">This patient's A1C is >7.0% despite maximal
                                                tolerated metformin treatment; therefore, please consider adding an antihyperglycemic
                                                agent as summarized in the Canadian Diabetes Association's Clinical Practice Guidelines.
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <%--  <div style="background-color: #900; padding: 5px 20px 20px 20px; font-weight: bold;">
                                    <div style="text-align: right">
                                        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','../../images/downloadbutton-rollover.png',1)">
                                            <img src="../../images/downloadbutton.png" name="Image19" width="157" height="41"
                                                border="0" id="Image21" /></a></div>
                                    <ul>
                                        <li style="color: #FFF; padding-bottom: 10px">The Canadian Diabetes Association's Clinical
                                            Practice Guidelines recommend that patients with Type 2 Diabetes Mellitus achieve
                                            the target A1C (A1C < 7.0 % for most patients) within 3-6 months of diagnosis and
                                            that Metformin should be the initial drug used. </li>
                                        <li style="color: #FFF; padding-bottom: 10px">Other classes of antihyperglycemic agents,
                                            including insulin, should be added to metformin, or used in combination with each
                                            other, if glycemic targets are not met taking into account the patient characteristics
                                            and properties of treatment and that these adjustments to and/or additions of antihyperglycemic
                                            agents should be made in order to attain target A1C within 3-6 months. </li>
                                        <li style="color: #FFF">This patient's A1C is >7.0% despite maximal tolerated metformin
                                            treatment; therefore, please consider adding an antihyperglycemic agent as summarized
                                            in the Canadian Diabetes Association's Clinical Practice Guidelines.</li>
                                    </ul>
                                </div>--%>
                                <br />
                                <br />
                                <span style="color: #666; font-size: 20px; font-weight: bold">Choice of pharmacological
                                    agents should be individualized taking into consideration the patient characteristics
                                    and properties of treatment:</span>
                                <br />
                                <br />
                                <table width="100%" border="0" cellspacing="5" cellpadding="10">
                                    <tr>
                                        <td valign="top" width="40%" style="border-style: dashed; border-color: #666; border-width: thin;
                                            background-color: #FC3">
                                            <strong>Patient Characteristics</strong>
                                            <ul style="font-size: 14px; color: #333; padding-left: 15px">
                                                <li>Degree of hyperglycemia</li>
                                                <li>Presence of co-morbidities</li>
                                                <li>Patient preference</li>
                                                <li>Ability to access treatments</li>
                                            </ul>
                                        </td>
                                        <td valign="top" width="60%" style="border-style: dashed; border-color: #666; border-width: thin;
                                            background-color: #FC3">
                                            <strong>Properties of the Treatment</strong>
                                            <ul style="font-size: 14px; color: #333; padding-left: 15px">
                                                <li>Effectiveness and durability of lowering BG</li>
                                                <li>Risk of hypoglycemia</li>
                                                <li>Effectiveness in reducing complications</li>
                                                <li>Effect on body weight</li>
                                                <li>Side effects</li>
                                                <li>Contraindications</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <br />
                                <table width="100%" border="0" cellpadding="5" cellspacing="0" style="font-size: 12px;
                                    text-align: center">
                                    <tr>
                                        <td colspan="7" align="center" bgcolor="#000000">
                                            <span style="font-size: 12px; color: #FFF; font-weight: bold; font-style: italic">Consider
                                                adding an agent best suited to the individual (agents listed in alphabetical order)</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" bgcolor="#CC0000">
                                            <span style="font-size: 12px; color: #FFF">Class</span>
                                        </td>
                                        <td align="center" bgcolor="#CC0000">
                                            <span style="font-size: 12px; color: #FFF">Relative A1C lowering</span>
                                        </td>
                                        <td align="center" bgcolor="#CC0000">
                                            <span style="font-size: 12px; color: #FFF">Hypoglycemia</span>
                                        </td>
                                        <td align="center" bgcolor="#CC0000">
                                            <span style="font-size: 12px; color: #FFF">Weight</span>
                                        </td>
                                        <td align="center" bgcolor="#CC0000">
                                            <span style="font-size: 12px; color: #FFF">Cost</span>
                                        </td>
                                        <td align="center" bgcolor="#CC0000">
                                            <span style="font-size: 12px; color: #FFF">Injection</span>
                                        </td>
                                        <td align="center" bgcolor="#CC0000">
                                            <span style="font-size: 12px; color: #FFF">Other therapeutic considerations</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Alpha-glucosidase inhibitor (acarbose)
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Rare
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            neutral to ↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            $$
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            No
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Improved postptandial control, GI side-effects
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Incretin agent: DPP-4 Inhibitors
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↓↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Rare
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            neutral to ↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            $$$
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            No
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Incretin agent: GLP-1 receptor agonists
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↓↓ to ↓↓↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Rare
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↓↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            $$$$
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Yes
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            GI side-effects
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Insulin
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↓↓↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Yes
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↑↑
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            $-$$$$
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Yes
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            No dose ceiling, flexible regiments
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Insulin secretagogue: Meglitinide
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↓↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Yes
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↑
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            $$
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            No
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Less hypoglycemia in context of missed meals but usually requires TID to QID dosing
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Insulin secretagogue: Sulfonylurea
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↓↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Yes
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↑
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            $
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            No
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Gliclazide and glimepiride associated with less hypoglycemia than glyburide
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            TZD
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↓↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Rare
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↑↑
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            $$
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            No
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            CHF, edema, fractures, rare bladder cancer (pioglitazone), cardiovascular controversy
                                            (rosiglitazone), 6-12 weeks required for maximal effect
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            Weight loss agent (orlistat)
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            None
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            ↓
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            $$$
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            No
                                        </td>
                                        <td bgcolor="#DFDFDF" style="border: 1px #000 solid">
                                            GI side-effects
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#999999" style="border: 1px #000 solid">
                                            SGLT2 Inhibitors<span style="color: #C00">*</span>
                                        </td>
                                        <td bgcolor="#999999" style="border: 1px #000 solid">
                                            ↓↓
                                        </td>
                                        <td bgcolor="#999999" style="border: 1px #000 solid">
                                            Rare
                                        </td>
                                        <td bgcolor="#999999" style="border: 1px #000 solid">
                                            ↓↓
                                        </td>
                                        <td bgcolor="#999999" style="border: 1px #000 solid">
                                            $$$
                                        </td>
                                        <td bgcolor="#999999" style="border: 1px #000 solid">
                                            No
                                        </td>
                                        <td bgcolor="#999999" style="border: 1px #000 solid">
                                            Genital and possibly urinary tract infections
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="7" align="left">
                                            <span style="color: #C00">*</span> <span style="font-size: 9px; font-style: italic">
                                                Not included in 2013 CDA CPGs</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            <img src="../../images/CDA_Logo_small_transparent.png" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            <span style="font-size: 11px">Canadian Diabetes Association Clinical Practice Guidelines
                                                Expert Committee. Can J Diabetes 2013;37:S1-S212.</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:WizardStep>
                        <asp:WizardStep StepType="Step" runat="server">
                            <asp:Panel runat="server" ID="pnlSec">
                                <div style="padding: 20px;">
                                    <div style="margin: 0 auto;">
                                        <div style="background-image: url(../../images/header_larger.png); background-repeat: no-repeat;
                                            font-size: 24px; color: #fff; padding: 20px;">
                                            <span class="nextSteps">Next Steps in Management</span>
                                            <br />
                                            <br />
                                            <br />
                                        </div>
                                    </div>
                                    <br />
                                    <div style="padding: 5px;">
                                        <span style="color: #900; font-size: 18px; font-weight: bold">Based on the Guideline
                                            Recommendations, Patient Characteristics and Properties of Treatment, what is your
                                            next management step to achieve the guideline recommended A1C target in this patient?
                                        </span>
                                        <br />
                                        <br />
                                        <span style="color: #666; font-size: 18px; font-weight: bold">Please Select ONE of the
                                            following:</span>
                                        <br />
                                        <br />
                                        <div style="font-size: 16px; font-weight: bold">
                                            <p>
                                                <asp:CheckBox ID="chkGlucosidase" Text="Add <span style='color: #900'> &alpha;-Glucosidase Inhibitor</span>"
                                                    runat="server" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkDPP4Inhibitor" Text="Add  <span style='color: #900'> DPP-4 Inhibitor</span>"
                                                    runat="server" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkReceptorAgonist" Text="Add  <span style='color: #900'> GLP-1 Receptor Agonist</span>"
                                                    runat="server" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkInsulin" Text="Add <span style='color: #900'> Insulin</span>"
                                                    runat="server" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkMeglitinide" Text="Add <span style='color: #900'> Meglitinide</span>"
                                                    runat="server" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkSGLT2Inhibitor" Text="Add <span style='color: #900'> SGLT2 Inhibitor</span>"
                                                    runat="server" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkSulfonylurea" Text="Add <span style='color: #900'> Sulfonylurea</span>"
                                                    runat="server" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkThiazolidinedione" Text="Add <span style='color: #900'> Thiazolidinedione</span>"
                                                    runat="server" />
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="chkNoChangeMgmt" Text="No change to current pharmacological management at this time"
                                                    runat="server" />
                                            </p>
                                            <p>
                                                <asp:Label Text="Selection Required" runat="server" CssClass="specialRed" ID="lblSecPageSelRequired"
                                                    Visible="false" />
                                            </p>
                                        </div>
                                        <div id="divAddThereapy" runat="server">
                                            <!-- IF ADD THERAPY* IS SELECTED-->
                                            <br />
                                            <br />
                                            <table width="100%" border="0" cellpadding="5">
                                                <tr>
                                                    <td colspan="2" style="font-size: 14px">
                                                        <strong>Have you provided this patient with an actual prescription? </strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="15%">
                                                        <asp:RadioButton ID="rdoAddTherapyYes" Text="Yes" runat="server" GroupName="AddTherapy" />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdoAddTherapyNo" Text="No" runat="server" GroupName="AddTherapy" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label Text="Selection Required" runat="server" CssClass="specialRed" ID="lblAddTherapyRdo"
                                                            Visible="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <!-- if  YES SELECTED - THE E-CRF  is complete and may be reviewed/ submitted-->
                                        <!-- if no is selected-->
                                        <div id="divAddThereapyYes" runat="server">
                                        </div>
                                        <div id="divAddThereapyNo" runat="server">
                                            <br />
                                            <br />
                                            <span style="font-size: 14px; font-weight: bold">Please select the most applicable reason
                                                for not providing the prescription to this patient at this visit: </span>
                                            <br />
                                            <br />
                                            <table width="100%" border="1" cellpadding="4" cellspacing="0" style="font-size: 12px;
                                                font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                <tr>
                                                    <td bgcolor="#000000">
                                                        <span style="color: #FFF">Select Only ONE:</span>
                                                    </td>
                                                    <td bgcolor="#FF3300" align="center">
                                                        &#10003;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Patient refusal
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddSecPatientRefusal" Text="" runat="server" GroupName="AddTherapySec" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Patient cannot afford / insurance coverage
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddSecInsurance" Text="" runat="server" GroupName="AddTherapySec" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Waiting to see if drug can be administered (reasons other than insurance)
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddSecAdmin" Text="" runat="server" GroupName="AddTherapySec" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Patient will return for Rx / Will provide Rx at next patient visit
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddSecRX" Text="" runat="server" GroupName="AddTherapySec" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <div>
                                                <asp:Label Text="Selection Required" runat="server" CssClass="specialRed" ID="lblrdoAddSec"
                                                    Visible="false" />
                                            </div>
                                        </div>
                                        <div id="divNoChangesManagement" runat="server">
                                            <!-- if no changes to management is selected-->
                                            <br />
                                            <br />
                                            <span style="font-size: 14px; font-weight: bold">Please select the most applicable reason
                                                for not following the recommendations:</span>
                                            <br />
                                            <br />
                                            <table width="100%" border="1" cellpadding="4" cellspacing="0" style="font-size: 12px;
                                                font-weight: bold; border: #000; border-width: thin; border-style: solid">
                                                <tr>
                                                    <td bgcolor="#000000">
                                                        <span style="color: #FFF">Select Only ONE:</span>
                                                    </td>
                                                    <td bgcolor="#FF3300" align="center">
                                                        &#10003;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        I am reinforcing lifestyle advice
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoReinforce" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Need more time to evaluate efficacy of current treatment
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoEvaluate" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Recently titrated metformin dose
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoTitrated" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Awaiting potential benefit of Colesevelam on glycemia
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoColesevelam" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        i do not initiate new therapy
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoNewTherapy" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        I believe that the curret management is appropriate for this patient
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoCurrMed" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        I do not believe additional therapy is indicated based on the risk assessment of
                                                        this patient
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoRiskAsses" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        I disagree with the recommendations
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoRecommend" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Patient refusal
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoRefusal" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Medical constraints (e.g. co-morbid conditions, contraindications)
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoConstraints" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Patient's age
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoAge" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#FFFFFF">
                                                        Coverage / Reimbursement difficulties
                                                    </td>
                                                    <td bgcolor="#FFFFFF" align="center">
                                                        <asp:RadioButton ID="rdoAddTherapySecNoDiff" Text="" runat="server" GroupName="AddTherapySecNo" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <br />
                                            <asp:Label Text="Selection Required" runat="server" CssClass="specialRed" ID="lblNoChangesManagement"
                                                Visible="false" />
                                        </div>
                                        <%--<table width="100%" border="0" align="center">
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
                                            <td colspan="3">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>--%>
                                    </div>
                                </div>
                                <asp:Panel runat="server" ID="pnlPatientAdherence">
                                    <div style="padding: 20px;">
                                        <div style="padding: 20px; background-color: #3C6; border-color: #063; border-width: medium;
                                            border-style: solid; font-weight: bold">
                                            <span style="text-decoration: underline">Patient Adherence:</span><br />
                                            Consider switching to a once daily metformin containing product e.g. Glumetza® or
                                            Janumet XR®
                                        </div>
                                    </div>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:WizardStep>
                    </WizardSteps>
                    <StepNavigationTemplate>
                        &nbsp;
                        <div style="padding: 20px;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="imgPrevStep" OnClick="imgPrevStep_clicked" ImageUrl="~/images/back_button.png"
                                            Height="43px" Width="136px" runat="server" />
                                    </td>
                                    <td align="right">
                                        <asp:ImageButton ID="imgNextStep" OnClick="imgNextStep_clicked" ImageUrl="~/images/next_button.png"
                                            Height="43px" Width="136px" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </StepNavigationTemplate>
                </asp:Wizard>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
