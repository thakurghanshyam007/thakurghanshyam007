<%@ Page Title="Transaction" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="Transection.Transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12">
        <asp:HiddenField ID="hfBalance" runat="server" />
        <div class="col-md-3">
        </div>
        <div class="col-md-6">
            <h3>Add New Transaction</h3>

            <div class="col-md-4">
                Transaction Type 
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select Type</asp:ListItem>
                        <asp:ListItem Value="Cr">Credit</asp:ListItem>
                        <asp:ListItem Value="Dr">Debit</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select transaction type." ValidationGroup="txn" ControlToValidate="ddlType" Display="None"></asp:RequiredFieldValidator>
                </div>
            </div>



            <div class="col-md-4">
                Amount
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" MaxLength="7" Text="0">
                    </asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter only numeric value for amount." ValidationGroup="txn" ValidationExpression="^[0-9]*" ControlToValidate="txtAmount" Display="None"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter amount." Display="None" ValidationGroup="txn" ControlToValidate="txtAmount"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-md-4">
                Description
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" TextMode="MultiLine" Height="50px">               
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter description." ValidationGroup="txn" ControlToValidate="txtDesc" Display="None"></asp:RequiredFieldValidator>
                </div>
        </div>
        <div class="form-group">
            <div class="col-md-12" style="text-align: right;">
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" OnClick="btnSave_Click" Text="Save" ValidationGroup="txn" />
                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" Text="Cancel" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="txn" />
            </div>
        </div>
    </div>
    <div class="col-md-3">
    </div>
    </div>
</asp:Content>
