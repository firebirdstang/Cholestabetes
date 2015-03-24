<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PhysicianSpeceficRequirements.ascx.cs"
    Inherits="Cholestabetes.Web.Controls.PhysicianSpeceficRequirements" %>
<tr>
    <td style="background-color: #FFF;">
        <asp:HyperLink NavigateUrl="~/Physician/MOU_Agreement.aspx" class="actionItem" runat="server"
            Text="Memorandum of Understanding (MOU)" />
    </td>
    <td style="background-color: #FFF;">
        <asp:ImageButton ImageUrl="~/images/icon_unchecked.png" runat="server" OnClick="imgnBtnMOU_clicked"
            ID="imgMOU" CausesValidation="false" />
    </td>
</tr>
<tr>
    <td style="background-color: #FFF">
        <%-- <asp:HyperLink NavigateUrl="~/Physician/AssesSurvey.aspx?screenID=1" class="actionItem"
            runat="server" Text="Needs Assessment
            Survey" />--%>
        <asp:LinkButton Text="Needs Assessment
            Survey" runat="server" class="actionItem" OnClick="imgSurvey_clicked" />
    </td>
    <td style="background-color: #FFF">
        <asp:ImageButton ImageUrl="~/images/icon_unchecked.png" runat="server" OnClick="imgSurvey_clicked"
            ID="imgSurvey" CausesValidation="false" />
    </td>
</tr>
<tr>
    <td style="background-color: #FFF">
        <asp:HyperLink NavigateUrl="~/Physician/PayeeForm.aspx" class="actionItem" runat="server"
            Text="Payee Information Form" />
    </td>
    <td style="background-color: #FFF">
        <asp:ImageButton ImageUrl="~/images/icon_unchecked.png" runat="server" OnClick="imgPayee_clicked"
            ID="imgPayeeInfo" CausesValidation="false" />
    </td>
</tr>
