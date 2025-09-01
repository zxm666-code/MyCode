<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report_income_emp.aspx.cs" Inherits="ESM��ҵн�����ϵͳ.Report_income_emp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>н�����ϵͳ - Ա����Ϣ��ѯ</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
   
</head>
<body>
    <form id="form1" runat="server">
        <!-- ҳ�涥�� ��ʼ -->
        <table width="970" border="0" cellpadding="3" cellspacing="0" class="top_heading" align="center">
            <tr>
                <td valign="bottom">ZPark CRL - Payroll Management System</td>
                <td>
                    <div align="right"><img src="image/ibm_logo.jpg" alt="IBM Logo" width="101" height="30" /></div>
                </td>
            </tr>
        </table>
        <!-- ҳ�涥�� ���� -->

        <!-- ҳ��logo ����½ע������ ��ʼ -->
        <table width="970" height="50" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td valign="bottom">
                    <div align="left"><img src="image/cfi_logo.png" width="350" height="30" /></div>
                </td>
                <td valign="bottom" class="account">
                    ��ӭ<asp:Label ID="lblUsername" runat="server" Text="XXX"></asp:Label>, ���Ѿ���<asp:Label ID="lblRole" runat="server" Text="XXX"></asp:Label>��ݵ�½��
                    <asp:LinkButton ID="lnkLogout" runat="server" CssClass="navigation_links" OnClick="lnkLogout_Click">��ȫע��</asp:LinkButton>
                </td>
                <td valign="bottom">&nbsp;</td>
            </tr>
        </table>
        <!-- ҳ��logo ����½ע������ ���� -->

        <!-- ��� -->
        <table width="970" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
        <!-- ��� -->

        <!-- �˵����� ��ʼ -->
        <table width="970" height="32" background="image/navigation_bg.gif" id="navigation" align="center">
            <tbody>
                <tr>
                    <td>
                        <div id="menu_block" align="left">
                            <div align="left">
                                <asp:HyperLink ID="lnkOrg" runat="server" NavigateUrl="Post_query1.aspx" CssClass="navigation_toplevel">��֯�ṹ</asp:HyperLink>
                                <asp:HyperLink ID="lnkEmployee" runat="server" NavigateUrl="Employee_query.aspx" CssClass="navigation_toplevel">Ա����Ϣ</asp:HyperLink>
                                <asp:HyperLink ID="lnkSalary" runat="server" NavigateUrl="GeRenJieGouChaXun.aspx" CssClass="navigation_toplevel">н��ṹ����</asp:HyperLink>
                                <asp:HyperLink ID="lnkCalc" runat="server" NavigateUrl="Self_View.aspx" CssClass="navigation_toplevel">н�����</asp:HyperLink>
                                <asp:HyperLink ID="lnkReport" runat="server" NavigateUrl="Report_income_outline.aspx" CssClass="navigation_toplevel">����</asp:HyperLink>
                                <asp:HyperLink ID="lnkUser" runat="server" NavigateUrl="User_list.aspx" CssClass="navigation_toplevel">�û�����</asp:HyperLink>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <table width="970" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#CDCDCD" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <!-- �˵����� ���� -->

        <!-- ҳ������ ��ʼ -->
        <div id="main_body">
            <div id="page_location">
                <asp:SiteMapPath ID="SiteMapPath1" runat="server">
                    <PathSeparatorTemplate>&nbsp;&gt;&nbsp;</PathSeparatorTemplate>
                </asp:SiteMapPath>
            </div>
            <table width="970" border="0" cellpadding="0" cellspacing="0" id="main_table">
                <tr>
                    <td width="240" valign="top">
                        <div id="sub_navigation">
                             <h2>����</h2>
              <p>�ṩ��ѯн�걨��</p>
              <ul class="sub_navigation_links">
      <li><asp:HyperLink ID="hlIncomeOutline" runat="server" NavigateUrl="report_income_outline.aspx">�����������ϸĿ</asp:HyperLink></li>
      <li id="liIncomeEmp" runat="server"><asp:HyperLink ID="hlIncomeEmp" runat="server" NavigateUrl="report_income_emp.aspx">Ա���������ϸĿ</asp:HyperLink></li>
                        </div>
                    </td>
                    <td width="1" bgcolor="#C2C2C2"></td>
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <fieldset class="pmsform">
                                    <h1 id="sub_title">Ա����Ϣ��ѯ>></h1>

                                    <div>
                                        <label class="pmsform">Ա����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtEmployeeId" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtEmployeeName" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtDepartment" runat="server" size="50"></asp:TextBox>
                                        </label>

                                        <label class="pmsform">�ʼ��ʺ�&nbsp;&nbsp;
                                            <asp:TextBox ID="txtEmail" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <br clear="all" />
                                        
                                        <div id="form_buttons">
                                            <asp:Button ID="btnSearch" runat="server" Text="��ѯ" CssClass="blue_btn" OnClick="btnSearch_Click" />
                                            <asp:Button ID="btnReset" runat="server" Text="����" CssClass="blue_btn" OnClick="btnReset_Click" />
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            
                            <div id="function_button">
                                <div id="item_noline" class="blue_btn">
                                   
                                    <h1>Ա����Ϣ�б�</h1>
                                   
                                    
                                </div>

                            </div>
                            
                            <div id="user_list">
                                <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False"
                                    Width="100%" BorderWidth="0" CellPadding="0" CellSpacing="0" PageSize="10" AllowPaging="True" DataKeyNames="empId"
                                    >
                                            <PagerTemplate>
                                                     <%-- ���գ������Ƴ���ҳ�� --%>
                                         </PagerTemplate>
                                    <Columns>
                                       
                                        
                                        <asp:TemplateField HeaderText="Ա����" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td">
                                            <ItemTemplate>
                                                <a href="<%# "Employee_moreinfo.aspx?empId=" + Eval("empId").ToString() %>" ><%# Eval("empId") %></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:BoundField DataField="empName" HeaderText="����" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        <asp:BoundField DataField="deptName" HeaderText="����" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        <asp:BoundField DataField="Mail" HeaderText="�ʼ��˺�" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        <asp:BoundField DataField="Tel1" HeaderText="�绰" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        
                                        <asp:TemplateField HeaderText="н��ṹ" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" ItemStyle-Width="60">
                                            <ItemTemplate>
                                                <a href="<%# "Report_income_detail.aspx?empId=" + Eval("empId").ToString() %>" ><img src="image/icon_view.png" border="0" alt="�鿴" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                </asp:GridView>
                                
                                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                    <tr>
                                        <td class="page_navigation_1_2_3">
                                            <div align="right">
                                                <asp:LinkButton ID="lnkFirst" runat="server" OnClick="lnkFirst_Click">ʼҳ</asp:LinkButton>
                                                &nbsp;|&nbsp;
                                                <asp:LinkButton ID="lnkPrev" runat="server" OnClick="lnkPrev_Click">ǰһҳ</asp:LinkButton>
                                                &nbsp;|&nbsp;
                                                <asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">��һҳ</asp:LinkButton>
                                                &nbsp;|&nbsp;
                                                <asp:LinkButton ID="lnkLast" runat="server" OnClick="lnkLast_Click">βҳ</asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- ҳ������ ���� -->

        <!-- ҳ���Ȩ���� ��ʼ -->
        <table width="970" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="970" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="970" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td>
                    <div id="legal">
                        Use of, registration on, this site constitutes acceptance of our 
                        <asp:HyperLink ID="lnkAgreement" runat="server" NavigateUrl="#">User Agreement</asp:HyperLink>. 
                        Please read our <asp:HyperLink ID="lnkPrivacy" runat="server" NavigateUrl="#">Privacy Policy</asp:HyperLink>
                    </div>
                </td>
            </tr>
        </table>
        <table width="970" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td>
                    <p align="left">&copy; Copyright ZPark Corporation 1994, <asp:Label ID="lblCurrentYear" runat="server"></asp:Label>. All rights reserved.</p>
                </td>
            </tr>
        </table>
        <!-- ҳ���Ȩ���� ���� -->
    </form>
</body>
</html>

