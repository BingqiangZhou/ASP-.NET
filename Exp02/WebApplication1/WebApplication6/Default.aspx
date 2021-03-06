﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exp0206</title>
    <style>
        body{margin:auto;margin-top:100px;max-width:1000px;text-align:center;}
        /*a{color:gray;}*/
    </style>
    <script src="JS/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="JS/script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top:20px;">
            <Label for="GridView1">INFO LIST
                <asp:LinkButton ID="LinkButtonNewItem" OnClick="LinkButtonNewItem_Click" runat="server">New</asp:LinkButton>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4"  
                    OnRowUpdating="GridView1_RowUpdating"
                AutoGenerateColumns="false" AutoGenerateEditButton="true" ShowFooter="false"
                DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" AutoGenerateDeleteButton="True">
                    <AlternatingRowStyle BackColor="White"/>
                <Columns>
                    <asp:TemplateField SortExpression="ID" HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="LabelID" Text='<%# Bind("ID")%>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="LabelID" Text='<%# "D"+DateTime.Now.ToFileTimeUtc().ToString()%>'></asp:Label>
                        </FooterTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField SortExpression="Name" HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="LabelName" Text='<%# Bind("Name")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxName" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ControlToValidate="TextBoxName"
                                ErrorMessage="Name can't be empty."></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBoxName" runat="server" Text="Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ControlToValidate="TextBoxName"
                                ErrorMessage="Name can't be empty."></asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="TypeID" HeaderText="TypeID">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="LabelTypeID" Text='<%# Bind("TypeID")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" DataSourceID="SqlDataSource2" DataTextField="TypeID" DataValueField="TypeID" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="DropDownList1" DataSourceID="SqlDataSource2" DataTextField="TypeID" DataValueField="TypeID" runat="server"></asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Number" HeaderText="Number">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="LabelNumber" Text='<%# Bind("Number")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxNumber" runat="server" TextMode="Number" Text='<%# Bind("Number")%>'></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" ForeColor="Red" ControlToValidate="TextBoxNumber"
                                runat="server" MinimumValue="0" Type="Integer" Display="None" MaximumValue="99999999" 
                                ErrorMessage="Number is illegal.(0-9999999)"></asp:RangeValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBoxNumber" runat="server" TextMode="Number" Text='100'></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" ForeColor="Red" ControlToValidate="TextBoxNumber"
                                runat="server" MinimumValue="0" Type="Integer" Display="None" MaximumValue="99999999" 
                                ErrorMessage="Number is illegal.(0-9999999)"></asp:RangeValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Price" HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="LabelPrice" Text='<%# Bind("Price")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxPrice" runat="server" TextMode="Number" Text='<%# Bind("Price")%>'></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator2" Type="Integer" Display="None" ForeColor="Red" 
                                ControlToValidate="TextBoxPrice" runat="server" MinimumValue="0" MaximumValue="99999999" 
                                ErrorMessage="Price is illegal.(0-9999999)"></asp:RangeValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBoxPrice" runat="server" TextMode="Number" Text='1000'></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator2" Type="Integer" Display="None" ForeColor="Red" 
                                ControlToValidate="TextBoxPrice" runat="server" MinimumValue="0" MaximumValue="99999999" 
                                ErrorMessage="Price is illegal.(0-9999999)"></asp:RangeValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="ImgPath" HeaderText="ImgPath">
                        <ItemTemplate>
                            <asp:FileUpload ID="FileUpload1" runat="server" Visible="false"/>
                            <asp:Label runat="server" ID="LabelImgPath" Text='<%# Bind("ImgPath")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="LabelImgPath" runat="server" Text='<%# Bind("ImgPath")%>' Visible="true"></asp:Label>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <%--<asp:Label ID="LabelImgPath" runat="server" Text='<%# Bind("ImgPath")%>' Visible="true"></asp:Label>--%>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:LinkButton ID="LinkButtonConfirm" OnClick="LinkButtonConfirm_Click" ForeColor="White" runat="server">Confirm</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancel" OnClick="LinkButtonCancel_Click" ForeColor="White" runat="server">Cancel</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TestRemoteConnectionString %>" SelectCommand="SELECT [TypeID] FROM [Type]"></asp:SqlDataSource>
                <asp:ValidationSummary ForeColor="Red" runat="server"></asp:ValidationSummary>
            </Label>
            &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TestRemoteConnectionString %>" DeleteCommand="DELETE FROM [Details] WHERE [ID] = @original_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([TypeID] = @original_TypeID) OR ([TypeID] IS NULL AND @original_TypeID IS NULL)) AND (([Number] = @original_Number) OR ([Number] IS NULL AND @original_Number IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([ImgPath] = @original_ImgPath) OR ([ImgPath] IS NULL AND @original_ImgPath IS NULL))" InsertCommand="INSERT INTO [Details] ([ID], [Name], [TypeID], [Number], [Price], [ImgPath]) VALUES (@ID, @Name, @TypeID, @Number, @Price, @ImgPath)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Details]" UpdateCommand="UPDATE [Details] SET [Name] = @Name, [TypeID] = @TypeID, [Number] = @Number, [Price] = @Price, [ImgPath] = @ImgPath WHERE [ID] = @original_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([TypeID] = @original_TypeID) OR ([TypeID] IS NULL AND @original_TypeID IS NULL)) AND (([Number] = @original_Number) OR ([Number] IS NULL AND @original_Number IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([ImgPath] = @original_ImgPath) OR ([ImgPath] IS NULL AND @original_ImgPath IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_TypeID" Type="String" />
                    <asp:Parameter Name="original_Number" Type="Int32" />
                    <asp:Parameter Name="original_Price" Type="Double" />
                    <asp:Parameter Name="original_ImgPath" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="TypeID" Type="String" />
                    <asp:Parameter Name="Number" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Double" />
                    <asp:Parameter Name="ImgPath" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="TypeID" Type="String" />
                    <asp:Parameter Name="Number" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Double" />
                    <asp:Parameter Name="ImgPath" Type="String" />
                    <asp:Parameter Name="original_ID" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_TypeID" Type="String" />
                    <asp:Parameter Name="original_Number" Type="Int32" />
                    <asp:Parameter Name="original_Price" Type="Double" />
                    <asp:Parameter Name="original_ImgPath" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
