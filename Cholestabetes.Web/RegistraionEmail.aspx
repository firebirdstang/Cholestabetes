<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="RegistraionEmail.aspx.cs" Inherits="Cholestabetes.Web.RegistraionEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .redLabel
        {
            color: Red;
            
        }
        .bolded
        {
            font-weight: bold;
        }
        .unbolded
        {
            font-weight: normal;
        }
        .emailBodyWrapper
        {
            padding: 5px;
        }
        li
        {
          padding-top:28px;   
        }
    </style>
    <div class='emailBodyWrapper'>
        <p>
            Dear Dr. {LastName},
        </p>
        <p>
            On behalf of the Canadian Heart Research Centre, we thank you for your interest
            in the <b>CHOLESTABETES QuERI</b> and for taking the time to register online.</p>
        <p>
            <b>Please take note of your username and password which you will be required to enter
                each time you access your personal online portal at <a href="http://www.CHOLESTABETES.ca"
                    target="_blank">www.CHOLESTABETES.ca</a> <i>- Please keep this information confidential
                        and do not share or forward your username and password. </i></b>
            <ul style="list-style: none;">
                <li>Your Username: {email}</li>
              
                <li>Your Password: {password} </li>
            </ul>
        </p>
        <p>
            <b>Next Step:</b> Please sign-in with your username and password at <a href="http://www.CHOLESTABETES.ca"
                target="_blank">www.CHOLESTABETES.ca</a> to review the protocol and complete
            the required documents.</p>
        <p>
            Should you have any questions, please do not hesitate to contact us at <a href="mailto:info@cholestabetes.ca">
                info@cholestabetes.ca </a>
        </p>
        <p>
            We look forward to working with you.
        </p>
        <p>
            With best regards,
        </p>
        <p>
            The CHRC
        </p>
    </div>
</asp:Content>
