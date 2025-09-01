<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XinChouTemplateList.aspx.cs" Inherits="ESM��ҵн�����ϵͳ.XinChouTemplateList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>н�����ϵͳ</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- ҳ�涥�� ��ʼ -->
        <table width="970" border="0" cellpadding="3" cellspacing="0" class="top_heading" align="center">
            <tr>
                <td valign="bottom">ZPark CRL - н�����ϵͳ</td>
                <td>
                    <div align="right"><img src="image/ibm_logo.jpg" alt="IBM Logo" width="101" height="30" /></div>
                </td>
            </tr>
        </table>
        <!-- ҳ�涥�� ���� -->

        <!-- ҳ��logo ����½��Ϣ ��ʼ -->
        <table width="970" height="50" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td valign="bottom"><div align="left"><img src="image/cfi_logo.png" width="350" height="30" /></div></td>
                <td valign="bottom" class="account">
                    ��ӭ<asp:Label ID="lblUserName" runat="server" Text="XXX"></asp:Label>, ���Ѿ���<asp:Label ID="lblRole" runat="server" Text="XXX"></asp:Label>��ݵ�¼��
                    <asp:LinkButton ID="lnkLogout" runat="server" CssClass="navigation_links" OnClick="lnkLogout_Click">��ȫע��</asp:LinkButton>
                </td>
                <td valign="bottom">&nbsp;</td>
            </tr>
        </table>
        <!-- ҳ��logo ����½��Ϣ ���� -->

        <!-- ���˵����� ��ʼ -->
        <table width="970" height="32" background="image/navigation_bg.gif" id="navigation" align="center">
            <tr>
                <td>
                    <div id="menu_block" align="left">
                        <div align="left">
                            <asp:HyperLink ID="hlOrgStructure" runat="server" CssClass="navigation_toplevel" NavigateUrl="Post_query1.aspx">��֯�ṹ</asp:HyperLink>
                            <asp:HyperLink ID="hlEmployeeInfo" runat="server" CssClass="navigation_toplevel" NavigateUrl="Employee_query.aspx">Ա����Ϣ</asp:HyperLink>
                            <asp:HyperLink ID="hlSalaryStructure" runat="server" CssClass="navigation_toplevel" NavigateUrl="GeRenJieGouChaXun.aspx">н��ṹ����</asp:HyperLink>
                            <asp:HyperLink ID="hlSalaryCalc" runat="server" CssClass="navigation_toplevel" NavigateUrl="Self_View.aspx">н�����</asp:HyperLink>
                            <asp:HyperLink ID="hlReports" runat="server" CssClass="navigation_toplevel" NavigateUrl="Report_income_outline.aspx">����</asp:HyperLink>
                            <asp:HyperLink ID="hlUserManagement" runat="server" CssClass="navigation_toplevel" NavigateUrl="User_list.aspx">�û�����</asp:HyperLink>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- ���˵����� ���� -->

        <!-- ҳ������ ��ʼ -->
        <div id="main_body">
            <div id="page_location">
                <asp:SiteMapPath ID="SiteMapPath1" runat="server">
                    <PathSeparatorTemplate>&nbsp;&gt;&nbsp;</PathSeparatorTemplate>
                </asp:SiteMapPath>
            </div>

            <!-- ��ʾ��Ϣ��ʾ���� -->
            <div id="messageDiv" style="display: none; text-align: center; padding: 10px;"></div>

            <table width="970" border="0" cellpadding="0" cellspacing="0" id="main_table">
                <tr>
                    <!-- ����Ӳ˵� -->
                    <td width="240" valign="top">
                        <div id="sub_navigation">
                            <h2>н��ṹ����</h2>
                            <p>�ṩн��ṹά������</p>
                            <ul class="sub_navigation_links">
                                 <li><asp:HyperLink ID="hlPersonalSalary" runat="server" NavigateUrl="GeRenJieGouChaXun.aspx">����н��ṹ���</asp:HyperLink></li>
                                 <li id="liTemplate" runat="server"><asp:HyperLink ID="hlTemplate" runat="server" NavigateUrl="XinChouTemplateList.aspx">����н��ģ��</asp:HyperLink></li>
                                 <li id="liSalaryMaintain" runat="server"><asp:HyperLink ID="hlSalaryMaintain" runat="server" NavigateUrl="XinChouJieGou.aspx">Ա��н��ṹά��</asp:HyperLink></li>
                            </ul>
                        </div>
                    </td>

                    <td width="1" bgcolor="#C2C2C2"></td>

                    <!-- �������� -->
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <div id="item_line">
                                    <h1 id="sub_title">н����Ŀ�б�</h1>
                                </div>
                            </div>

                            <!-- н����Ŀ��� -->
                            <div id="project_list">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="0" CellSpacing="0">
                                    <Columns>
                                        <asp:BoundField DataField="salaryItem" HeaderText="������Ŀ" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        <asp:BoundField DataField="isAdd" HeaderText="�ۼ�/�۳�" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                        <asp:BoundField DataField="isTax" HeaderText="�Ƿ��˰" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                         <asp:TemplateField HeaderText="��μ���"  HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td">
                                             <ItemTemplate>
                                                   <asp:Label ID="lblCalculation" runat="server" Text='<%# Eval("calculationFormula") %>' />
                                                  <asp:HyperLink ID="hlViewFormula" runat="server" 
                                                      Visible='<%# !string.IsNullOrEmpty(Eval("formulaPageUrl")?.ToString()) %>'
                                                      NavigateUrl='<%# "JiSuanRule.aspx?item=" + Eval("salaryItem").ToString() %>'>
                                                      ���ù�ʽ
                                                  </asp:HyperLink>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                        <%--<asp:BoundField DataField="calculationFormula" HeaderText="��μ���" />--%>
                                        <asp:BoundField DataField="isRequired" HeaderText="�Ƿ��ѡ" HeaderStyle-CssClass="table_header_td" ItemStyle-CssClass="table_dashedline_td" />
                                    </Columns>
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                </asp:GridView>
                            </div>

                             <!-- ��ѯ�� -->
                             <div id="queryForm">
                                 <h2>��ѯԱ��н����Ŀ</h2>
                                 <table>
                                     <tr>
                                         <td>Ա��ID��</td>
                                         <td><asp:TextBox ID="txtQueryEmpId" runat="server"></asp:TextBox></td>
                                         <td><asp:Button ID="btnQuery" runat="server" Text="��ѯ" OnClick="btnQuery_Click"></asp:Button></td>
                                     </tr>
                                 </table>
                             </div>

                            <!-- ��ӹ�����Ŀ�� -->
                            <div id="addSalaryItemForm">
                                <h2>��ӹ�����Ŀ</h2>
                                <table>
                                    <tr>
                                        <td>Ա��ID��</td>
                                        <td><asp:TextBox ID="txtEmpId" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>������Ŀ��</td>
                                        <td><asp:TextBox ID="txtSalaryItem" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>�ۼ�/�۳���</td>
                                        <td>
                                            <asp:DropDownList ID="ddlType" runat="server">
                                                <asp:ListItem Value="1">�ۼ�</asp:ListItem>
                                                <asp:ListItem Value="0">�۳�</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>�Ƿ��˰��</td>
                                        <td>
                                            <asp:DropDownList ID="ddlIsTaxable" runat="server">
                                                <asp:ListItem Value="1">��</asp:ListItem>
                                                <asp:ListItem Value="0">��</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>��μ��㣺</td>
                                        <td><asp:TextBox ID="txtCalculationMethod" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>�Ƿ��ѡ��</td>
                                        <td>
                                            <asp:DropDownList ID="ddlIsRequired" runat="server">
                                                <asp:ListItem Value="1">��</asp:ListItem>
                                                <asp:ListItem Value="0">��</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><asp:Button ID="btnAdd" runat="server" Text="���" OnClick="btnAdd_Click" /></td>
                                    </tr>
                                </table>
                            </div>
                           
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- ҳ������ ���� -->

        <!-- ҳ���Ȩ��Ϣ -->
        <table width="970" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td>
                    <div id="legal">
                        &copy; Copyright ZPark Corporation 1994-<%= DateTime.Now.Year %>. ��Ȩ���С�
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>