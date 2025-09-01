<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InputData_info.aspx.cs" Inherits="ESM企业薪酬管理系统.InputData_info" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
    <title>Payroll Management System</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <table width="700" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>

        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="2" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>

               <div id="main_body">  
           <table width="970" border="0" cellpadding="0" cellspacing="0" id="main_table">
               <tr>
                   <td width="1" bgcolor="#C2C2C2"></td>
                   <td valign="top">
                       <div id="sub_body">
                           <div id="this_page_title">
                               <div id="item_line">
                                   <h1 id="sub_title" style="text-align:center"><asp:Label ID="lblSalaryTitle" runat="server" Text="XXX薪酬项目列表"></asp:Label></h1>
                               </div>
                           </div>
                           <div id="project_list">
                               <asp:GridView ID="gvSalaryItems" runat="server" AutoGenerateColumns="false" 
                                   Width="100%" CellPadding="4" CellSpacing="0">
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
                                       
                                       <asp:TemplateField HeaderText="值" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                       <ItemTemplate>
                                           <asp:Label ID="lblValue" runat="server" 
                                               Text='<%# FormatSalaryValue(Eval("salaryItem").ToString(), Eval("calculationFormula"), Eval("calculationCoefficient"), Eval("upperLimit")) %>'>
                                           </asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                       
                                       <asp:TemplateField HeaderText="说明" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                           <ItemTemplate>
                                               <asp:HyperLink ID="lnkDetail" runat="server" Text="详细说明"  Visible='<%# !string.IsNullOrEmpty(Eval("explainPageUrl ")?.ToString()) %>'
NavigateUrl='<%# "CheckPay_shuoming.aspx?item=" + Eval("salaryItem").ToString() %>'></asp:HyperLink>
                                           </ItemTemplate>
                                       </asp:TemplateField>
                                   </Columns>
                                   <HeaderStyle CssClass="table_header_td" />
                                   <RowStyle CssClass="table_dashedline_td" />
                                   <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                               </asp:GridView>
                           </div>
                       </div>
                   </td>
                    
   
               </tr>

           </table>
       </div>

         <div style="text-align: center; padding: 10px; font-weight: bold;">
         实发工资：<asp:Label ID="lblTotalSalary" runat="server" Text="0.00"></asp:Label> RMB
     </div>

        <table width="700" height="2" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="700" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>
