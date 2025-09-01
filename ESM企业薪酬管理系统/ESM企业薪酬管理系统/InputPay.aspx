<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InputPay.aspx.cs" Inherits="ESM��ҵн�����ϵͳ.InputPay" %>


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
                <td><div align="right"><img src="image/ibm_logo.jpg" alt="IBM Logo" width="101" height="30" /></div></td>
            </tr>
        </table>
        <!-- ҳ�涥�� ���� -->

        <!-- ҳ��logo����¼ע������ ��ʼ -->
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
        <!-- ҳ��logo����¼ע������ ���� -->

        <!-- �˵����� ��ʼ -->
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
        <table width="970" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#CDCDCD" align="center">
            <tr><td></td></tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td></td></tr>
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
                            <h2>н�����</h2>
                            <p>�ṩн����㹦��</p>
                            <ul class="sub_navigation_links">
                                <li><asp:HyperLink NavigateUrl="Self_View.aspx" runat="server">���˹��ʵ����</asp:HyperLink></li>
                        <li id="liinputdata" runat="server"><asp:HyperLink NavigateUrl="InputPay.aspx" runat="server" ID="h1inputdata">����н������</asp:HyperLink></li> 
                            </ul>
                        </div>
                    </td>
                    <td width="1" bgcolor="#C2C2C2"></td>
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <div id="item_line">
                                    <h1 id="sub_title">�����н����</h1>
                                </div>
                            </div>

                            <div id="edit">
                                <!-- �������б� -->
                                <fieldset class="pmsform">
                                    <legend class="pmsform">�������б�</legend>
                                    <asp:GridView ID="gvPendingList" runat="server" AutoGenerateColumns="false" 
                                        Width="100%" CellPadding="4" CellSpacing="0" 
                                        PageSize="10" AllowPaging="True">
                                        <PagerTemplate>
                                             <%-- ���գ������Ƴ���ҳ�� --%>
                                          </PagerTemplate>
                                        <Columns>
                                            <asp:BoundField DataField="empId" HeaderText="Ա����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="empName" HeaderText="����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="deptName" HeaderText="����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="postName" HeaderText="��λ" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Level" HeaderText="����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Mail" HeaderText="�ʼ�" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Tel1" HeaderText="�绰" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                            <asp:TemplateField HeaderText="н��ṹ" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <a href="<%# "InputData_info.aspx?empId=" + Eval("empId").ToString() %>" ><img src="image/icon_view.png" border="0" alt="�鿴" /></a>
                                                    <a href="<%# "InputData_sub1.aspx?empId=" + Eval("empId").ToString() %>"><img src="image/icon_edit.png" border="0" /></a>  
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="table_header_td" />
                                        <RowStyle CssClass="table_dashedline_td" />
                                    </asp:GridView>
                                    
                                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                        <tr>
                                            <td class="page_navigation_1_2_3">
                                                <div align="right">
                                                    <asp:LinkButton ID="lnkFirst" runat="server" OnClick="LnkFirst_Click">��ҳ</asp:LinkButton>
                                                    &nbsp;|&nbsp;
                                                    <asp:LinkButton ID="lnkPrev" runat="server" OnClick="LnkPrev_Click">ǰһҳ</asp:LinkButton>
                                                    &nbsp;|&nbsp;
                                                    <asp:LinkButton ID="lnkNext" runat="server" OnClick="LnkNext_Click">��һҳ</asp:LinkButton>
                                                    &nbsp;|&nbsp;
                                                    <asp:LinkButton ID="lnkLast" runat="server" OnClick="LnkLast_Click">βҳ</asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>

                                <!-- �ѱ����б� -->
                                <fieldset class="pmsform">
                                    <legend class="pmsform">�ѱ����б�</legend>
                                    <asp:GridView ID="gvSavedList" runat="server" AutoGenerateColumns="false" 
                                        Width="100%" CellPadding="4" CellSpacing="0"  PageSize="10" AllowPaging="True"
                                        >
                                        <PagerTemplate>
                                         <%-- ���գ������Ƴ���ҳ�� --%>
                                      </PagerTemplate>
                                        <Columns>
                                             <asp:BoundField DataField="empId" HeaderText="Ա����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="empName" HeaderText="����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="deptName" HeaderText="����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="postName" HeaderText="��λ" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="Level" HeaderText="����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="Mail" HeaderText="�ʼ�" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="Tel1" HeaderText="�绰" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                            <asp:TemplateField HeaderText="н��ṹ" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                     <a href="<%# "InputData_info.aspx?empId=" + Eval("empId").ToString() %>" ><img src="image/icon_view.png" border="0" alt="�鿴" /></a>
                                                    <a href="<%# "InputData_sub1.aspx?empId=" + Eval("empId").ToString() %>"><img src="image/icon_edit.png" border="0" /></a>  
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="table_header_td" />
                                        <RowStyle CssClass="table_dashedline_td" />
                                    </asp:GridView>
                                    
                                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                        <tr>
                                            <td class="page_navigation_1_2_3">
                                                <div align="right">
                                                      <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LnkFirst_Click1">��ҳ</asp:LinkButton>
                                                      &nbsp;|&nbsp;
                                                      <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LnkPrev_Click1">ǰһҳ</asp:LinkButton>
                                                      &nbsp;|&nbsp;
                                                      <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LnkNext_Click1">��һҳ</asp:LinkButton>
                                                      &nbsp;|&nbsp;
                                                      <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LnkLast_Click1">βҳ</asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>

                                <!-- ���ύ�б� -->
                                <fieldset class="pmsform">
                                    <legend class="pmsform">���ύ�б�</legend>
                                    <asp:GridView ID="gvSubmittedList" runat="server" AutoGenerateColumns="false" 
                                        Width="100%" CellPadding="4" CellSpacing="0"  PageSize="10" AllowPaging="True"
                                        >
                                        <PagerTemplate>
                                         <%-- ���գ������Ƴ���ҳ�� --%>
                                      </PagerTemplate>
                                        <Columns>
                                             <asp:BoundField DataField="empId" HeaderText="Ա����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="empName" HeaderText="����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="deptName" HeaderText="����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="postName" HeaderText="��λ" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="Level" HeaderText="����" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="Mail" HeaderText="�ʼ�" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                             <asp:BoundField DataField="Tel1" HeaderText="�绰" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center" />
                                            <asp:TemplateField HeaderText="н��ṹ" ItemStyle-CssClass="table_header_td" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                     <a href="<%# "InputData_info.aspx?empId=" + Eval("empId").ToString() %>" ><img src="image/icon_view.png" border="0" alt="�鿴" /></a>
                                                    <a href="<%# "InputData_sub1.aspx?empId=" + Eval("empId").ToString() %>"><img src="image/icon_edit.png" border="0" /></a>  
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="table_header_td" />
                                        <RowStyle CssClass="table_dashedline_td" />
                                    </asp:GridView>
                                    
                                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                        <tr>
                                            <td class="page_navigation_1_2_3">
                                                <div align="right">
                                                      <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LnkFirst_Click2">��ҳ</asp:LinkButton>
                                                      &nbsp;|&nbsp;
                                                      <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LnkPrev_Click2">ǰһҳ</asp:LinkButton>
                                                      &nbsp;|&nbsp;
                                                      <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LnkNext_Click2">��һҳ</asp:LinkButton>
                                                      &nbsp;|&nbsp;
                                                      <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LnkLast_Click2">βҳ</asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- ҳ������ ���� -->

        <!-- ҳ���Ȩ���� ��ʼ -->
        <table width="970" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="970" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr><td></td></tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td></td></tr>
        </table>
        <table width="970" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td>
                    <div id="legal">ʹ�ñ���վ����ʾ���������ǵ�<asp:HyperLink NavigateUrl="#" runat="server">�û�Э��</asp:HyperLink>��
                    ���Ķ����ǵ�<asp:HyperLink NavigateUrl="#" runat="server">��˽����</asp:HyperLink></div>
                </td>
            </tr>
        </table>
        <table width="970" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td><p align="left">&copy; Copyright ZPark Corporation 1994-<%= DateTime.Now.Year %>. ��Ȩ���С�</p></td>
            </tr>
        </table>
        <!-- ҳ���Ȩ���� ���� -->
    </form>
</body>
</html>
        

