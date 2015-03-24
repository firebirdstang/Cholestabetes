<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Cholestabetes.Web._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        #box
        {
            width: 620px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #EFEFEF;
            font-size: 14px;
            padding-right: 40px;
            padding-left: 40px;
            margin: 0px !important;
        }
        
        #content
        {
            padding: 0px;
            margin-left: 20px;
        }
    </style>
    <div id="rightbox">
        <table width="100%" cellspacing="0" border="0">
            <tr>
                <td align="center" style="font-size: 34px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                    Welcome
                </td>
            </tr>
        </table>
        <br />
        <div style="padding-left: 10px">
            <a href="#">
                <img src="images/home_flag.png" /></a></div>
        <div style="background-image: url(images/watermark.png); padding: 20px; background-repeat: no-repeat;
            font-family: Arial, Helvetica, sans-serif; font-size: 14px">
            Dear Colleague,<br />
            <br />
            On behalf of the Canadian Heart Research Centre, welcome to your personal online
            portal and thank you for taking part in this initiative.<br />
            <br />
            The CHOLESTABETES QuERI is an observational, prospective quality enhancement research
            initiative of high-risk patients with diabetes who have not yet achieved guideline
            recommended LDL-C and A1C targets. Additionally, this program incorporates knowledge
            translation through clinical decision making support but the decision to follow
            the recommendations is left to the participating physician's discretion. The CHOLESTABETES
            QuERI has been reviewed and approved by OPTIMUM Clinical Research Inc., an independent,
            central Ethics Review Board.
            <br />
            <br />
            The online portal has been created to provide you with timely access to the program
            materials, a convenient way to manage the program documents and complete the Electronic
            Case Report Forms (e-CRFs). Please keep your username and password confidential.
            <br />
            <br />
            In order to download documents, you will need to enable cookies in your browser.
            Please follow the link for additional information: <span style="text-decoration: underline;
                color: #C00"><strong>Enabling Cookies</strong></span>
            <br />
            <br />
            Please take a few minutes to familiarize yourself with the program requirements
            and the site functionalities. Download: <strong><a style="text-decoration: underline;
                color: #C00" href="PDF/CHOLESTABETES QuERI_PROGRAM OVERVIEW.pdf" target="_blank">
                CHOLESTABETES QuERI Program Overview</a> </strong>
            <br />
            <br />
            <strong>Your online portal consists of the following:</strong><br />
            <br />
            <span style="text-decoration: underline; color: #666"><strong>Resource Centre:</strong></span>
            <ul>
                <li><strong><em>Instructions</em></strong></li>
                <ul>
                    <li>A manual outlining the web-portal functionalities </li>
                </ul>
                <li><strong><em>Physician Specific Requirements</em></strong> – <span style="color: #666;
                    font-size: 12px"><em>MUST BE COMPLETED TO GAIN ACCESS TO THE e-CRF PORTAL</em></span></li>
                <ul>
                    <li>Required documents that you must review and complete prior to proceeding with patient
                        enrollment</li>
                    <ul>
                        <li><strong>Memorandum of Understanding (MOU):</strong> <em>Outlines your responsibilities,
                            as the participating physician, and CHRC's as the coordinating centre</em></li>
                        <li><strong>A brief Needs Assessment Survey:</strong> <em>Multiple choice questionnaire</em></li>
                        <li><strong>Payee Form: </strong></li>
                    </ul>
                </ul>
                <li><strong><em>CHOLESTABETES QuERI Documents and Forms</em></strong></li>
                <ul>
                    <li>CHOLESTABETES QuERI Program Overview, Protocol, Central Ethics Approval Forms and
                        the Informed Consent Form</li></ul>
                <li><strong><em>Supporting Functions and General Documents and Materials</em></strong></li></ul>
            <br />
            <br />
            <span style="text-decoration: underline; color: #666"><strong>The e-CRF Portal</strong></span>
            <strong>(The e-CRF portal will become accessible once you complete the documents in
                the "Physician Specific Requirements" section of the Resource Centre)</strong><br />
            <br />
            <ul>
                <li>A simple and streamlined e-CRF tool for eligible patient enrollment
                    <ul>
                        <li>View: <span style="text-decoration: underline; color: #C00"><strong>Eligibility
                            Criteria</strong></span></li></ul>
            </ul>
            The CHOLESTABETES QuERI team is happy to assist you with any questions. Please do
            not hesitate to contact us at any time: <span style="text-decoration: underline;
                color: #C00"><strong>Contact Us</strong></span><br />
            <br />
            We look forward to collaborating with you.<br />
            <br />
            With best regards,<br />
            <br />
            Anatoly Langer MD, M.Sc., FRCP (C), FACC<br />
            <strong>CHOLESTABETES QuERI – Steering Committee Chair</strong><br />
            Chair, Canadian Heart Research Centre<br />
            Professor of Medicine, University of Toronto<br />
            Chair, Foundation for Medical Education and Research
        </div>
    </div>
</asp:Content>
