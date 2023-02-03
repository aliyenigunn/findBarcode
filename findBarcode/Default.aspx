<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="findBarcode.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Find Barcode</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div class="card p-2">
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
            <asp:Image ID="ImageBarcode" Width="400px" Height="150px" runat="server" Visible="false" />
        </div>
        <div>
            <asp:TextBox ID="txtFind" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" class="btn btn-outline-secondary" OnClick="btnSearch_Click" Text="ARA" />
            <asp:Button ID="btnClear" runat="server" class="btn btn-outline-secondary" OnClick="btnClear_Click" Text="SİL" />

        </div>
        <div class="card">
            <div class="card-header">
                <h3 id="txtSonuc" runat="server"></h3>
            </div>
            <div class="card-body">
                <table class="table table-responsive-lg table-hover table-stripped table-bordered">
                    <thead>
                        <tr>
                            <th>Amcası</th>
                            <th>Barkodu</th>
                            <th>Adı</th>
                            <th>Kodu</th>
                            <th>Birimi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder ID="mainHolder" runat="server"></asp:PlaceHolder>
                    </tbody>
                </table>
            </div>
        </div>
        <%--<div>
            <asp:GridView ID="GridView1" runat="server"
                CssClass="table table-responsive-lg table-stripped  table-hover"
                AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                OnRowCommand="GridView1_RowCommand" AllowSorting="True"
                BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2">
                <Columns>
                    <asp:ButtonField ButtonType="Button" Text="GÖSTER" />
                    <asp:BoundField DataField="BARCODE" HeaderText="BARKOD" SortExpression="BARCODE" />
                    <asp:BoundField DataField="NAME" HeaderText="ÜRÜN ADI" SortExpression="NAME" />
                    <asp:BoundField DataField="CODE" HeaderText="ÜRÜN KODU" SortExpression="CODE" />
                    <asp:BoundField DataField="BIRIM" HeaderText="BİRİM" SortExpression="BIRIM" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LKSDBConnectionString %>" SelectCommand="SELECT  [BARCODE], [NAME], [CODE], [BIRIM] FROM [PAZ_DEPOBAZLISTOKFIYAT]" FilterExpression="[NAME] LIKE '%{0}%'">
                <FilterParameters>
                    <asp:ControlParameter Name="NAME"
                        ControlID="txtFind" PropertyName="Text" />
                </FilterParameters>
            </asp:SqlDataSource>
        </div>--%>
    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
