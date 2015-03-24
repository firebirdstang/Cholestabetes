<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MOU_Agreement.aspx.cs" Inherits="Cholestabetes.Web.Physician.MOU_Agreement" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        #box
        {
            width: 700px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #EFEFEF;
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
        .info
        {
            color: Green;
            font-size: 11px;
        }
    </style>
    <style>
        /*
        input[type="checkbox"]
        {
            display: none;
        }
        input[type="checkbox"] + label
        {
            cursor: pointer;
            text-indent: 22px;
            display: block;
            height: 22px;
            position: relative;
        }
        input[type="checkbox"] + label:after
        {
             background: url('http://www.dailycoding.com/Uploads/2008/12/CheckBox.png') no-repeat -21px 0px; 
            <%--background: url('../../images/check.png') no-repeat -21px 0px;--%>
            display: block;
            width: 21px;
            content: "";
            position: absolute;
            top: -8px;  
            left: 0px;
            height: 21px;
        }
        input[type="checkbox"]:checked + label:after
        {
            background-position: 0px 0px;
        }
        */
    </style>
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {

            //$('#thing1').attr("checked", $('#<%=chkMOUTerms.ClientID %>').is(':checked'));
            // $('#<%=btnSubmit.ClientID %>').attr("disabled", !$('#<%=chkMOUTerms.ClientID %>').is(':checked'));

            //            $('#<%=chkMOUTerms.ClientID %>').click(function () {
            //                $('#<%=btnSubmit.ClientID %>').attr("disabled", !$('#<%=chkMOUTerms.ClientID %>').is(':checked'));
            //            });
        });
    </script>
    <div id="rightbox">
        <table width="100%" cellspacing="0" border="0">
            <tr>
                <td align="center" style="font-size: 25px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                    MEMORANDUM OF UNDERSTANDING (MOU)
                </td>
            </tr>
        </table>
        <br />
        <div style="padding-left: 10px">
            <a href="../Default.aspx">
                <img src="../images/home_flag.png" /></a></div>
        <div style="background-image: url(images/watermark.png); padding: 20px; background-repeat: no-repeat;
            font-family: Arial, Helvetica, sans-serif; font-size: 14px">
            <table width="100%" border="0" bgcolor="#CC0000" cellpadding="10">
            </table>
            <table width="90%" border="0" align="center" cellpadding="10" bgcolor="#CCCCCC">
                <tr>
                    <td bgcolor="#000000">
                        <span style="color: #FFF; font-size: 30px">INSTRUCTIONS</span>
                    </td>
                </tr>
                <tr>
                    <td height="166">
                        <ul>
                            <li>Acknowledging that you have reviewed and agree to the terms of the MOU is a mandatory
                                requirement</li>
                            <li>Please review the MOU in its entirety by scrolling to the end of the form.</li>
                            <li>Once you have reviewed the MOU, check the "Agree to Terms" box and click the "Submit"
                                button</li>
                            <li>Once the MOU is completed, the status in your dashboard will change to a checkmark
                                (<img src="../images/check.png" />)</li>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table width="90%" border="1" bordercolor="#000000" bgcolor="#FFFFFF" cellpadding="15"
                align="center" style="font-size: 12px;">
                <tr>
                    <td>
                        Thank you for agreeing to participate in the <strong>CHOLEST</strong>erol lowering
                        in type 2 di<strong>ABETES</strong> <strong>Q</strong>uality<strong> E</strong>nhancement
                        <strong>R</strong>esearch <strong>I</strong>nitiative <strong>(CHOLESTABETES QuERI)</strong>
                        Program. The CHOLESTABETES QuERI is coordinated by the Canadian Heart Research Centre
                        ("CHRC"), and supported through an Investigator initiated grant from Valeant Canada
                        Inc. ("Sponsor").<br />
                        <br />
                        Please review the following information and make yourself familiar with the CHOLESTABETES
                        QuERI program as well as your expected role as a program participant and the CHRC
                        as the coordinating centre.<br />
                        <br />
                        <span style="text-decoration: underline; font-weight: bold">CHOLESTABETES QuERI:</span><br />
                        <br />
                        The CHOLESTABETES QuERI is an observational quality enhancement research initiative
                        which provides guideline‐based management strategies and feedback to physicians
                        caring for patients with Type 2 Diabetes Mellitus (T2DM) who have not yet achieved
                        guideline‐ recommended LDL-C and A1C targets. The decision to follow recommendations
                        and all treatment decisions are left to the participating physician's discretion.<br />
                        <br />
                        <strong>Participating physicians will have the following responsibilities:</strong><br />
                        <br />
                        <ul style="list-style-image: url(../images/check.png)">
                            <li>Read and understand this MOU and the CHOLESTABETES QuERI program materials, timelines
                                and ensure that all person(s) in your practice who may be associated with the CHOLESTABETES
                                QuERI program also understand these materials;</li>
                            <li>Maintain chart notes that were used for the CHOLESTABETES QuERI submitted data until
                                you are notified by the CHRC that the program is completed;</li>
                            <li>Complete the e-CRFs and feedback forms on patients that meet the program eligibility
                                criteria in adherence with the program timelines;</li>
                            <li>Obtain and retain a copy of an Informed Consent Form for each eligible patient included
                                in the program;</li>
                            <li>To provide a copy of a current curriculum vitae and medical license if requested
                                from the CHRC;</li>
                            <li>Exercise reasonable and diligent efforts and professional expertise in the conduct
                                and completion of the program documents in an efficient and timely manner and in
                                compliance with the program instructions:<br />
                                <br />
                                <span style="text-decoration: underline; font-weight: bold">Program Components:</span></li><br />
                            <ul style="list-style: circle;">
                                <li>Needs Assessment Survey</li>
                                <li>Visit 1 (Baseline Visit) </li>
                                <li>Visit 2 (14±6 weeks) </li>
                                <li>Visit 3 (24±6 weeks)</li>
                            </ul>
                            <br />
                            <br />
                            <li>Be available to answer data queries.</li>
                        </ul>
                        <strong>The CHRC will have the following responsibilities:</strong>
                        <br />
                        <ul style="list-style-image: url(../images/check.png)">
                            <li>Provide all the necessary program materials to the participating physician;</li>
                            <li>Be available to answer questions in relation to the CHOLESTABETES program documents,
                                instructions and/or the completion of the e-CRF/Feedback Forms;</li>
                            <li>Provide physicians with remuneration for properly completed forms as following:
                                <br />
                                <br />
                                <ul style="list-style: circle;">
                                    <li>Visit 1 (Baseline Visit) - $125.00 per interactive e-CRF (up to $625.00 for 5 interactive
                                        e-CRFs)</li>
                                    <li>Visit 2 (14±6 weeks) - $ 75.00 per interactive e-CRF (up to $375.00 for 5 interactive
                                        e-CRFs) </li>
                                    <li>Visit 3 (24±6 weeks) - $ 50.00 per interactive e-CRF (up to $250.00 for 5 interactive
                                        e-CRFs)</li>
                                </ul>
                            </li>
                        </ul>
                        <strong>General:</strong>
                        <ul style="list-style-image: url(../images/check.png)">
                            <li>By participating in the CHOLESTABETES QuERI the relationship of the physician to
                                the CHRC is that of an independent contractor. Physician shall have no authority
                                to make agreements with third parties that are binding on the CHRC.</li>
                        </ul>
                    </td>
                </tr>
            </table>
            <div style="text-align: center; font-size: 11px; padding: 10px">
                To view/print this document, please click <a href="../PDF/CHOLESTABETES QuERI Memorandum of Understanding Final.pdf"
                    target="_blank">here</a>.
            </div>
        </div>
        <asp:Panel runat="server" ID="pnlMain">
            <table width="90%" cellpadding="15" align="center" style="font-size: 12px; border: 2px solid #CC0000;"
                bordercolor="#CC0000">
                <tr>
                    <td>
                        <strong>Agree to Terms:</strong>
                        <br />
                        <br />
                        <table width="100%" border="0">
                            <tr>
                                <td valign="top">
                                    <%--<input type='checkbox' clientidmode="Static" name='thing1' value='valuable' id="thing1"
                                    onclick="$('#<%=chkMOUTerms.ClientID %>').attr('checked' , $(this).is(':checked') )" /><label
                                        for="thing1">
                                        I have read and agree to the terms of the Memorandum of Understanding and certify
                                        that I hold a valid license to practice medicine in Canada.</label>--%>
                                    <asp:CheckBox ID="chkMOUTerms" runat="server" Visible="True" />
                                </td>
                                <td>
                                    I have read and agree to the terms of the Memorandum of Understanding and certify
                                    that I hold a valid license to practice medicine in Canada.
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table width="90%" border="0" align="center" style="padding-bottom: 10px;">
                <tr>
                    <td align="center">
                        <asp:Label runat="server" ID="lblMssg" CssClass="info" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btnSubmit" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
