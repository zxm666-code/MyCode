<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XinChouJieGou_sub1.aspx.cs" 
    Inherits="ESM企业薪酬管理系统.XinChouJieGou_sub1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>薪酬项目配置</title>
    <link href="css/cfi_global.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <table width="600" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr><td></td></tr>
        </table>

        <table width="600" border="0" cellpadding="0" cellspacing="0" id="main_table" align="center">
            <tr>
                <td valign="top">
                    <div id="sub_body">
                        <div id="project_list">
                            <h1>选择并配置薪酬项目</h1>
                            
                            <asp:GridView ID="gvSalaryItems" runat="server" AutoGenerateColumns="false"
                                Width="100%" CellPadding="4" CellSpacing="0" 
                                OnRowDataBound="gvSalaryItems_RowDataBound" EnableViewState="true">
                                <Columns>
                                    <asp:TemplateField HeaderText="薪酬项目" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("salaryItem") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="累加/扣除" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblType" runat="server" Text='<%# Eval("isAdd") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="是否记税" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTaxable" runat="server" Text='<%# Eval("isTax") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="如何计算">
                                        <ItemTemplate>
                                            <asp:PlaceHolder ID="phCalculation" runat="server"></asp:PlaceHolder>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="table_header_td" />
                                <RowStyle CssClass="table_dashedline_td" />
                                <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                            </asp:GridView>

                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="blue_btn" OnClick="btnSubmit_Click" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="blue_btn" OnClick="btnCancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>