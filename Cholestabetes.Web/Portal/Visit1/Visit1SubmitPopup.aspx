<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Visit1SubmitPopup.aspx.cs"
    Inherits="Cholestabetes.Web.Portal.Visit1.Visit1SubmitPopup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #box
        {
            width: 700px;
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
    </style>
</head>
<body style="overflow: hidden;">
    <form id="form1" runat="server">
    <div id="box">
        <table width="100%" border="0" cellspacing="0" cellpadding="10" style="font-family: Arial, Helvetica, sans-serif;">
            <tr>
                <td>
                    <div style="background-image: url(../../images/imagebox.png); background-repeat: no-repeat;
                        padding: 45px 35px 20px 45px; font-weight: bold; text-align: center">
                        <div style="font-size: 20px">
                            You have successfully submitted the Visit 1 e-CRF for patient
                            <br />
                            
                            <asp:Label Text="NO Name" runat="server" ID="lblName" />.
                            <br />
                            <br />
                            You may access the Visit 2 e-CRF between<br />
                            <asp:Label Text="From XXX to XXX" runat="server" ID="lblDates" />
                            </div>
                        <br />
                        <br />
                        <br />
                        <span style="color: #C00; font-style: italic">Importantly, please ensure that updated
                            cholesterol and glycemic lab values are available at or before Visit 2. </span>
                        <br />
                        <br />
                        <br />
                        <div style="text-align: right">
                            <asp:ImageButton ImageUrl="~/images/ok_button.png" runat="server" ID="imgOK" OnClick="imgOK_clicked" />
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
