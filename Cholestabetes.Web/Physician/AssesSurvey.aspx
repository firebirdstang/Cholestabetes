<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AssesSurvey.aspx.cs" Inherits="Cholestabetes.Web.Physician.AssesSurvey" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .missing
        {
            color: Red;
            font-size: 12px;
        }
        
        
        #box
        {
            width: 700px;
            font-family: Arial, Helvetica, sans-serif;
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
        .repeaterContainer
        {
            padding-left: 20px;
            padding-top: 15px;
            padding-bottom: 5px;
        }
        #content
        {
            background-color: transparent;
        }
    </style>
    <div id="rightbox">
        <table width="100%" cellspacing="0" border="0">
            <tr>
                <td align="center" style="font-size: 25px; font-weight: bold; color: #900; font-family: Arial, Helvetica, sans-serif">
                    NEEDS ASSESSMENT SURVEY
                </td>
            </tr>
        </table>
        <br />
        <div style="padding-left: 10px">
            <a href="../Default.aspx">
                <img src="../images/home_flag.png" /></a></div>
        <table width="90%" border="0" align="center" cellpadding="5" bgcolor="#CCCCCC">
            <tr>
                <td>
                    <ul>
                        <li>The Needs Assessment Survey is a <span style="color: #C00">mandatory</span> requirement
                        </li>
                        <li>Once the Needs Assessment Survey is completed, the status in your dashboard will
                            change to a checkmark (<img src="../images/check.png" />)</li>
                </td>
            </tr>
        </table>
        <asp:Panel runat="server" ID="pnlMain">
            <div id="box" style="padding-bottom: 0px;">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" cellpadding="10" style="background-color: White;">
                    <tr>
                        <td>
                            <div>
                                <div class="repeaterContainer">
                                    <asp:Repeater runat="server" ID="repSurvey" OnItemDataBound="repSurvey_ItemDataBound">
                                        <ItemTemplate>
                                            <asp:Panel runat="server" ID="pnlQuestion" QuestionID='<%#DataBinder.Eval(Container.DataItem, "ID")%>'>
                                                <div>
                                                    <asp:Label CssClass="assesQuestion" runat="server" ID="lblQues" Text='<%# DataBinder.Eval(Container.DataItem, "Text")%>' />
                                                </div>
                                                <br />
                                                <asp:Panel runat="server" ID="pnlAnswer" QuestionID='<%#DataBinder.Eval(Container.DataItem, "ID")%>'
                                                    QuestionFormat='<%#DataBinder.Eval(Container.DataItem, "LeftToRight")%>' QuestionType='<%#DataBinder.Eval(Container.DataItem, "Type")%>'>
                                                    <asp:CheckBoxList RepeatDirection="Horizontal" runat="server" ID="chkLstAnswer" CssClass="assesAnswer">
                                                    </asp:CheckBoxList>
                                                    <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" runat="server" ID="rdoLstAnswer"
                                                        CssClass="assesAnswer" Visible="false">
                                                    </asp:RadioButtonList>
                                                    <asp:Repeater runat="server" ID="rep" Visible="false">
                                                        <HeaderTemplate>
                                                            <span class="assesAnswer" style="color: Blue;"><i>(1 = not comfortable at all 5 = very
                                                                comfortable)</i></span>
                                                            <br />
                                                            <br />
                                                            <table class="assesAnswer">
                                                                <tr>
                                                                    <th align="left" style="width: 200px;">
                                                                        Medication
                                                                    </th>
                                                                    <th>
                                                                        Rating
                                                                    </th>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <%#DataBinder.Eval(Container.DataItem, "Text")%>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList runat="server" ID="ddRating" AID='<%#DataBinder.Eval(Container.DataItem, "ID")%>'>
                                                                        <asp:ListItem Text="--" Value="--" />
                                                                        <asp:ListItem Text="1" Value="1" />
                                                                        <asp:ListItem Text="2" Value="2" />
                                                                        <asp:ListItem Text="3" Value="3" />
                                                                        <asp:ListItem Text="4" Value="4" />
                                                                        <asp:ListItem Text="5" Value="5" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                    <br />
                                                    <asp:CustomValidator ErrorMessage="Missing Value" ID="customVal" OnServerValidate="customVal_OnServerValidate"
                                                        runat="server" ValidationGroup="Survey" Display="Dynamic" EnableClientScript="true"
                                                        CssClass="missing" />
                                                    <%--        <asp:Label ForeColor="Red" runat="server" ID="lblError" />--%>
                                                </asp:Panel>
                                                <br />
                                                <br />
                                            </asp:Panel>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <div id="box" style="padding-bottom: 20px;">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" cellpadding="10" style="background-color: White;">
                <tr>
                    <td align="center">
                        <p class="submitButton" style="background-color: White; padding-right: 20px; text-align: center;
                            margin: 0 auto;">
                            <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                <tr>
                                    <td align="left" style="width: 33%;">
                                        <asp:Button CssClass="PrevScreen" ID="btnPrevScreen" runat="server" OnClick="btnPrevScreen_clicked"
                                            Visible="false" />
                                    </td>
                                    <td align="center" style="width: 33%;">
                                        <asp:Button CssClass="saveBtn" ID="btnSave" runat="server" OnClick="btnSave_clicked" />
                                    </td>
                                    <td align="right" style="width: 33%;">
                                        <asp:Button CssClass="nextScreen" ID="btnNext" runat="server" ValidationGroup="Survey"
                                            OnClick="btnNext_clicked" />
                                    </td>
                                </tr>
                            </table>
                            <asp:Button CssClass="nextScreen" ID="btnNextScreen" runat="server" OnClick="btnNextScreen_clicked"
                                Visible="false" />
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
