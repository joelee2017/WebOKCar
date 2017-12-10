<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebOKCar.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 342px;
        }
        .auto-style2 {
            height: 62px;
        }
        .auto-style3 {
            height: 62px;
            width: 89px;
        }
        .auto-style5 {
            width: 659px;
            height: 401px;
        }
    </style>
</head>
<body id="BtnHome">
    <form id="form1" runat="server">
        <div style="vertical-align: top; text-align: center">
            <asp:Image ID="Image1" runat="server" Height="206px" Width="1138px" ImageUrl="~/image1/title.jpg" />
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3" style="vertical-align: top; text-align: center">
                            <asp:Button ID="BtnHome" runat="server" Text="首頁" Width="120px" OnClick="BtnHome_Click" />
                            <br />
                            <br />
                            <asp:Button ID="BtnEmployee" runat="server" OnClick="BtnEmployee_Click" Text="登錄員工" Width="120px" />
                            <br />
                            <br />
                            <asp:Button ID="BtnGoods" runat="server" Text="登錄貨物資料" style="height: 21px" Width="120px" OnClick="BtnGoods_Click" />
                            <br />
                            <br />
                            <asp:Button ID="BtnBusiness" runat="server" Text="登錄銷售資料" Width="120px" OnClick="BtnBusiness_Click" />
                            <br />
                            <br />
                            <asp:Button ID="BtnTable" runat="server" Text="銷售清單" Width="120px" OnClick="BtnTable_Click" />
                            <br />
                            <br />
                            <asp:Button ID="BtnInquire" runat="server" Text="個人業績查詢" Width="120px" OnClick="BtnInquire_Click" />
                        </td>
                        <td class="auto-style2">
                            <asp:MultiView ID="MultiView1" runat="server">
                                <asp:View ID="ViewHome" runat="server">
                                    <img class="auto-style5" src="image1/HomePage.jpg" alt="" />
                                </asp:View>
                                <asp:View ID="ViewEmployee" runat="server">
                                    <asp:Label ID="Label1" runat="server" Font-Names="標楷體" Font-Size="Larger" ForeColor="#0000CC" Text="編輯、刪除「員工」資料"></asp:Label>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [員工] WHERE [姓名] = @姓名" InsertCommand="INSERT INTO [員工] ([姓名], [職稱], [性別], [底薪]) VALUES (@姓名, @職稱, @性別, @底薪)" SelectCommand="SELECT * FROM [員工]" UpdateCommand="UPDATE [員工] SET [職稱] = @職稱, [性別] = @性別, [底薪] = @底薪 WHERE [姓名] = @姓名">
                                        <DeleteParameters>
                                            <asp:Parameter Name="姓名" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="姓名" Type="String" />
                                            <asp:Parameter Name="職稱" Type="String" />
                                            <asp:Parameter Name="性別" Type="String" />
                                            <asp:Parameter Name="底薪" Type="Double" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="職稱" Type="String" />
                                            <asp:Parameter Name="性別" Type="String" />
                                            <asp:Parameter Name="底薪" Type="Double" />
                                            <asp:Parameter Name="姓名" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="姓名" DataSourceID="SqlDataSource1" HorizontalAlign="Center" PageSize="5">
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                                            <asp:BoundField DataField="姓名" HeaderText="姓名" ReadOnly="True" SortExpression="姓名" />
                                            <asp:TemplateField HeaderText="職稱" SortExpression="職稱">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("職稱") %>'>
                                                        <asp:ListItem>推銷員</asp:ListItem>
                                                        <asp:ListItem>會計</asp:ListItem>
                                                        <asp:ListItem>組長</asp:ListItem>
                                                        <asp:ListItem>主任</asp:ListItem>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("職稱") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="性別" SortExpression="性別">
                                                <EditItemTemplate>
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" SelectedValue='<%# Bind("性別") %>'>
                                                        <asp:ListItem>男</asp:ListItem>
                                                        <asp:ListItem>女</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("性別") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="底薪" HeaderText="底薪" SortExpression="底薪" />
                                        </Columns>
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                                    </asp:GridView>
                                    <br />
                                    新增「員工」資料<br /> 姓名：<asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                                    <br />
                                    職稱：<asp:DropDownList ID="DdlPT" runat="server">
                                        <asp:ListItem>推銷員</asp:ListItem>
                                        <asp:ListItem>會計</asp:ListItem>
                                        <asp:ListItem>組長</asp:ListItem>
                                        <asp:ListItem>主任</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    性別：<asp:RadioButtonList ID="RblSex" runat="server" Height="21px" RepeatDirection="Horizontal" RepeatLayout="Flow" Width="87px">
                                        <asp:ListItem>男</asp:ListItem>
                                        <asp:ListItem>女</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <br />
                                    底薪：<asp:TextBox ID="TxtSalary" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="新增" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="BtnCls" runat="server" Text="清除" />
                                </asp:View>
                                <asp:View ID="ViewGoods" runat="server">
                                    <asp:Label ID="Label3" runat="server" Font-Names="標楷體" Font-Size="Larger" ForeColor="#0000CC" Text="編輯、刪除、新增「貨物」資料"></asp:Label>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [貨物] WHERE [品名] = @品名" InsertCommand="INSERT INTO [貨物] ([品名], [定價], [抽成]) VALUES (@品名, @定價, @抽成)" SelectCommand="SELECT * FROM [貨物]" UpdateCommand="UPDATE [貨物] SET [定價] = @定價, [抽成] = @抽成 WHERE [品名] = @品名">
                                        <DeleteParameters>
                                            <asp:Parameter Name="品名" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="品名" Type="String" />
                                            <asp:Parameter Name="定價" Type="Double" />
                                            <asp:Parameter Name="抽成" Type="Double" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="定價" Type="Double" />
                                            <asp:Parameter Name="抽成" Type="Double" />
                                            <asp:Parameter Name="品名" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="品名" DataSourceID="SqlDataSource2" Height="50px" HorizontalAlign="Center">
                                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <Fields>
                                            <asp:BoundField DataField="品名" HeaderText="品名" ReadOnly="True" SortExpression="品名" />
                                            <asp:BoundField DataField="定價" HeaderText="定價" SortExpression="定價" />
                                            <asp:BoundField DataField="抽成" HeaderText="抽成" SortExpression="抽成" />
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                                        </Fields>
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                    </asp:DetailsView>
                                    <br />
                                </asp:View>
                                <asp:View ID="ViewBusiness" runat="server">
                                    <asp:Label ID="Label4" runat="server" Font-Names="標楷體" Font-Size="Larger" ForeColor="#0000CC" Text="編輯、刪除、新增「銷貨」資料"></asp:Label>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [銷售] WHERE [交易編號] = @交易編號" InsertCommand="INSERT INTO [銷售] ([交易編號], [交易日期], [品名], [姓名]) VALUES (@交易編號, @交易日期, @品名, @姓名)" SelectCommand="SELECT * FROM [銷售]" UpdateCommand="UPDATE [銷售] SET [交易日期] = @交易日期, [品名] = @品名, [姓名] = @姓名 WHERE [交易編號] = @交易編號">
                                        <DeleteParameters>
                                            <asp:Parameter Name="交易編號" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="交易編號" Type="String" />
                                            <asp:Parameter DbType="Date" Name="交易日期" />
                                            <asp:Parameter Name="品名" Type="String" />
                                            <asp:Parameter Name="姓名" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter DbType="Date" Name="交易日期" />
                                            <asp:Parameter Name="品名" Type="String" />
                                            <asp:Parameter Name="姓名" Type="String" />
                                            <asp:Parameter Name="交易編號" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="交易編號" DataSourceID="SqlDataSource3" Height="50px" HorizontalAlign="Center">
                                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <Fields>
                                            <asp:BoundField DataField="交易編號" HeaderText="交易編號" ReadOnly="True" SortExpression="交易編號" />
                                            <asp:TemplateField HeaderText="交易日期" SortExpression="交易日期">
                                                <EditItemTemplate>
                                                    <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("交易日期") %>'></asp:Calendar>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:Calendar ID="Calendar2" runat="server" SelectedDate='<%# Bind("交易日期") %>'></asp:Calendar>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("交易日期", "{0:t}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="品名" SortExpression="品名">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="品名" DataValueField="品名" SelectedValue='<%# Bind("品名") %>'>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="品名" DataValueField="品名" SelectedValue='<%# Bind("品名") %>'>
                                                    </asp:DropDownList>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("品名") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="姓名" SortExpression="姓名">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="姓名" DataValueField="姓名" SelectedValue='<%# Bind("姓名") %>'>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource1" DataTextField="姓名" DataValueField="姓名" SelectedValue='<%# Bind("姓名") %>'>
                                                    </asp:DropDownList>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("姓名") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                                        </Fields>
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                    </asp:DetailsView>
                                    <br />
                                </asp:View>
                                <asp:View ID="ViewTable" runat="server">
                                    <asp:Label ID="Label5" runat="server" Font-Names="標楷體" Font-Size="Larger" ForeColor="#0000CC" Text="交易總表"></asp:Label>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 銷售.交易日期, 銷售.姓名, 員工.職稱, 銷售.品名, 貨物.定價, 貨物.抽成 FROM 員工 INNER JOIN 銷售 ON 員工.姓名 = 銷售.姓名 INNER JOIN 貨物 ON 銷售.品名 = 貨物.品名"></asp:SqlDataSource>
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource4" HorizontalAlign="Center" OnRowDataBound="GridView2_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="交易日期" SortExpression="交易日期">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("交易日期") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("交易日期", "{0:t}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                                            <asp:BoundField DataField="職稱" HeaderText="職稱" SortExpression="職稱" />
                                            <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
                                            <asp:BoundField DataField="定價" HeaderText="定價" SortExpression="定價" />
                                            <asp:BoundField DataField="抽成" HeaderText="抽成" SortExpression="抽成" />
                                            <asp:TemplateField HeaderText="佣金"></asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                                    </asp:GridView>
                                </asp:View>
                                <asp:View ID="ViewInquire" runat="server">
                                    <asp:Label ID="Label6" runat="server" Text="選擇姓名" Font-Names="標楷體" Font-Size="Larger" ForeColor="#0000CC"></asp:Label>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [姓名], [底薪] FROM [員工]"></asp:SqlDataSource>
                                    <asp:DetailsView ID="DetailsView3" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="姓名" DataSourceID="SqlDataSource5" Height="50px" HorizontalAlign="Center">
                                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <Fields>
                                            <asp:BoundField DataField="姓名" HeaderText="姓名" ReadOnly="True" SortExpression="姓名" />
                                            <asp:BoundField DataField="底薪" HeaderText="底薪" SortExpression="底薪" />
                                        </Fields>
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                    </asp:DetailsView>
                                    <br />
                                    <asp:Label ID="Label7" runat="server" Font-Names="標楷體" Font-Size="Larger" ForeColor="#0000CC" Text="顯示相關查詢資料"></asp:Label>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 銷售.交易日期, 銷售.品名, 貨物.定價, 貨物.抽成 FROM 貨物 INNER JOIN 銷售 ON 貨物.品名 = 銷售.品名 WHERE (銷售.姓名 = @姓名)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DetailsView3" Name="姓名" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource6" HorizontalAlign="Center" OnRowDataBound="GridView3_RowDataBound" PageSize="5">
                                        <Columns>
                                            <asp:TemplateField HeaderText="交易日期" SortExpression="交易日期">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("交易日期", "{0:t}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("交易日期") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
                                            <asp:BoundField DataField="定價" HeaderText="定價" SortExpression="定價" />
                                            <asp:BoundField DataField="抽成" HeaderText="抽成" SortExpression="抽成" />
                                            <asp:TemplateField HeaderText="佣金"></asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                                    </asp:GridView>
                                </asp:View>
                            </asp:MultiView>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3" style="vertical-align: top; text-align: center">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
