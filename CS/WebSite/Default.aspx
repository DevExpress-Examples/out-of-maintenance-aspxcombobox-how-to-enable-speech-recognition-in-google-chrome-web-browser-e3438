<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv='Content-Language' content='en-US' />
    <title></title>

    <script type="text/javascript">
        function OnComboBoxInit(s) {
            var input = s.GetInputElement();
            input.setAttribute("x-webkit-speech", "x-webkit-speech");
            input.onwebkitspeechchange = function (evt) {
                if(s.filterStrategy && s.filterStrategy.FilterStartTimer)
                    s.filterStrategy.FilterStartTimer();
                else
                    aspxETextChanged(s.name);
            };
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" IncrementalFilteringMode="Contains"
        DropDownStyle="DropDown" DataSourceID="AccessDataSource1" TextField="Country"
        ValueField="Country">
        <ClientSideEvents Init="OnComboBoxInit" />
    </dx:ASPxComboBox>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/WorldCities.mdb"
        SelectCommand="SELECT * FROM [Countries] ORDER BY [Country]" />
    </form>
</body>
</html>