<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Transection._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
       
    </div>

    <div class="row">
        <div class="col-md-12">
        <div class="col-md-12">
            <div class="col-md-3">
                <h3>Office Transactions</h3>
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-3">
            </div>
            <div class="col-md-3">
                <a href="Transaction.aspx" class="btn btn-default"><i class="fa fa-plus"></i> Add New Transaction</a>
            </div>
        </div>
        <asp:GridView ID="gvTransaction" CssClass="table table-bordered" runat="server" AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
                <asp:BoundField DataField="TxnDate" HeaderText="Date" />
                <asp:BoundField DataField="txnDesc" HeaderText="Description" />
                <asp:BoundField DataField="Credit" HeaderText="Credit" />
                <asp:BoundField DataField="Debit" HeaderText="Debit" />
                <asp:BoundField DataField="Balance" HeaderText="Balance" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

            <RowStyle ForeColor="#000066"></RowStyle>

            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
        </asp:GridView>
    </div>


        
    </div>

</asp:Content>
