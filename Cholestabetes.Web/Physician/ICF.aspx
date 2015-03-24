<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ICF.aspx.cs" Inherits="Cholestabetes.Web.Physician.ICF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<%@ MasterType VirtualPath="~/Site.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        #MOU
        {
            width: 550px;
            margin: 0 auto;
            height: 500px;
            overflow: auto;
            padding: 5px;
            font-family: Arial;
            background-color: #fff;
            font-size: 15px;
        }
        #MOUTable
        {
            margin: 30px auto;
        }
        
        #MOUTerms
        {
            font-size: 14px;
        }
        
        .acceptMOUInactive
        {
            font-size: 14px;
            color: #555555;
            font-style: oblique;
        }
        .acceptMOUActive
        {
            font-weight: bolder;
            font-size: 13px;
            font-style: italic;
            color: #000;
        }
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
        
        #redboxsmall
        {
            background-color: #C33;
            width: 590px;
            padding: 10px;
            margin-bottom: 25px;
            margin-top: 10px;
            text-align: center;
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
            background-color: #CCC !important;
            margin: 0px;
            padding-bottom: 15px;
        }
        ul.Note li:hover
        {
            background-color: #CCC !important;
            color: #666;
        }
        
        
        #NoteBody
        {
            background-color: #CCC;
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
            text-align: center;
            background-color: #CCC;
            color: #666;
            line-height: 24px;
            padding-bottom: 50px;
            width: 610px;
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
            /* color:#802830 !important;*/
            color: #C33;
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
        #documentcenter
        {
            background-color: #C33;
            color: #fff;
            width: 590px;
            padding: 10px;
            margin-bottom: 25px;
            margin-top: 0px;
            font-family: Candara,Arial;
            font-weight: bold;
        }
        #documentcenterheader
        {
            text-align: center;
            font-size: 20px;
        }
        #documentcenterbody
        {
            text-align: left;
            font-size: 16px;
        }
        #documentcenterfooter
        {
            text-align: center;
            font-size: 16px;
        }
        img#acslogo
        {
            position: relative;
            left: 120px;
            margin-top: 10px;
        }
        img#MOUlogo
        {
            float: left;
            margin-top: 10px;
        }
        .ErrorMsg
        {
            font-weight: bold;
            color: Red;
            font-size: 11px;
            font-family: Arial;
        }
        .rightcontent
        {
            width: 610px;
            background-color: #E6E6E6;
            padding-right: 10px;
            padding-bottom: 10px;
            padding-left: 10px;
        }
        #content
        {
            background-color: #E6E6E6;
            font-size: 16px;
        }
        
        
        
        .myButton
        {
            -moz-box-shadow: inset 0px 1px 0px 0px #f5978e;
            -webkit-box-shadow: inset 0px 1px 0px 0px #f5978e;
            box-shadow: inset 0px 1px 0px 0px #f5978e;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f24537), color-stop(1, #c62d1f));
            background: -moz-linear-gradient(top, #f24537 5%, #c62d1f 100%);
            background: -webkit-linear-gradient(top, #f24537 5%, #c62d1f 100%);
            background: -o-linear-gradient(top, #f24537 5%, #c62d1f 100%);
            background: -ms-linear-gradient(top, #f24537 5%, #c62d1f 100%);
            background: linear-gradient(to bottom, #f24537 5%, #c62d1f 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537', endColorstr='#c62d1f',GradientType=0);
            background-color: #f24537;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            border: 1px solid #d02718;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 12px;
            font-weight: bold;
            padding: 9px 30px;
            text-decoration: none;
            text-align: center;
            white-space: nowrap;
        }
        .myButton:hover
        {
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f24537));
            background: -moz-linear-gradient(top, #c62d1f 5%, #f24537 100%);
            background: -webkit-linear-gradient(top, #c62d1f 5%, #f24537 100%);
            background: -o-linear-gradient(top, #c62d1f 5%, #f24537 100%);
            background: -ms-linear-gradient(top, #c62d1f 5%, #f24537 100%);
            background: linear-gradient(to bottom, #c62d1f 5%, #f24537 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24537',GradientType=0);
            background-color: #c62d1f;
        }
        .myButton:active
        {
            position: relative;
            top: 1px;
        }
        .myButton2
        {
            -moz-box-shadow: inset 0px 1px 0px 0px #ababab;
            -webkit-box-shadow: inset 0px 1px 0px 0px #ababab;
            box-shadow: inset 0px 1px 0px 0px #ababab;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #8f8f8f), color-stop(1, #333333));
            background: -moz-linear-gradient(top, #8f8f8f 5%, #333333 100%);
            background: -webkit-linear-gradient(top, #8f8f8f 5%, #333333 100%);
            background: -o-linear-gradient(top, #8f8f8f 5%, #333333 100%);
            background: -ms-linear-gradient(top, #8f8f8f 5%, #333333 100%);
            background: linear-gradient(to bottom, #8f8f8f 5%, #333333 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#8f8f8f', endColorstr='#333333',GradientType=0);
            background-color: #8f8f8f;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            border: 1px solid #363636;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 12px;
            font-weight: bold;
            padding: 9px 30px;
            text-decoration: none;
            text-align: center;
            white-space: nowrap;
        }
        .myButton2:hover
        {
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #333333), color-stop(1, #8f8f8f));
            background: -moz-linear-gradient(top, #333333 5%, #8f8f8f 100%);
            background: -webkit-linear-gradient(top, #333333 5%, #8f8f8f 100%);
            background: -o-linear-gradient(top, #333333 5%, #8f8f8f 100%);
            background: -ms-linear-gradient(top, #333333 5%, #8f8f8f 100%);
            background: linear-gradient(to bottom, #333333 5%, #8f8f8f 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#333333', endColorstr='#8f8f8f',GradientType=0);
            background-color: #333333;
        }
        .myButton2:active
        {
            position: relative;
            top: 1px;
        }
    </style>
    <div id="rightbox">
        <table width="100%" cellspacing="0" border="0">
            <tr>
                <td align="center" style="font-size: 25px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                    INFORMED CONSENT FORM (ICF)
                </td>
            </tr>
        </table>
        <br />
        <div style="padding-left: 10px">
            <a href="../Default.aspx">
                <img src="../images/home_flag.png" /></a></div>
        <br>
        <br>
        <br>
        <table width="90%" border="0" align="center" cellpadding="10" bgcolor="#CCCCCC">
            <tbody>
                <tr>
                    <td bgcolor="#000000">
                        <span style="color: #FFF; font-size: 30px">INSTRUCTIONS</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <ul>
                            <li>A signed Informed Consent Form is a mandatory requirement for each patient enrolled
                                in the CHOLESTABETES QuERI. The approved ICF template can be downloaded below.</li><br>
                            <li>The ICF document contains four (4) pages and provides a detailed description of
                                the CHOLESTABETES QuERI. </li>
                            <br>
                            <li><span style="color: #C00; text-decoration: underline; font-weight: bold">Please
                                note the following:</span>
                                <ul>
                                    <li>The patient must initial the designated space on each page of the ICF (pages 1 –
                                        4)</li>
                                    <li>The name and the office contact number of the participating physician must be printed
                                        in the designated space on page 3 of the ICF by the individual conducting the informed
                                        consent discussion </li>
                                    <li>The patient must print his or her First Name and Last Name, sign and date the designated
                                        spaces on page 4 of the ICF</li>
                                    <li>The individual conducting the informed consent discussion must print the name of
                                        the patient, print his or her name, his or her position, sign and date the designated
                                        spaces on page 4 of the ICF</li>
                                </ul>
                            </li>
                            <br>
                            <li>Please provide a copy of the completed ICF to the patient and retain the original
                                in your files. <span style="color: #C00; font-weight: bold">Do NOT provide a copy of
                                    the ICF to the Canadian Heart Research Centre.</span></li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <table width="550px" border="0" id="MOUTable">
            <tr>
                <td>
                    <table width="87%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td>
                                    <asp:HyperLink Target="_blank" NavigateUrl="~/PDF/Cholestabetes QuERI_Informed Consent Form Final Approved.pdf"
                                        runat="server" ImageUrl="~/images/icf_template_button.png" />
                                </td>
                                <td>
                                    <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl="~/PDF/ICF REFERENCE DOCUMENT.pdf"
                                        runat="server" ImageUrl="~/images/reference_button.png" />
                                </td>
                                <td>
                                    <asp:HyperLink ID="HyperLink2" Target="_blank" NavigateUrl="~/PDF/CERB_Approval Letter.pdf"
                                        runat="server" ImageUrl="~/images/stamped_approval_button.png" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <br>
        <br>
        <br>
        <br>
    </div>
</asp:Content>
