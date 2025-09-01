<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldYearFundEdit.aspx.cs" Inherits="ESM企业薪酬管理系统.OldYearFundEdit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>养老保险公式设定</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">
        <!-- 页面边框 开始 -->
        <table width="500" height="8" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <!-- 页面边框 结束 -->

        <!-- 主内容区 开始 -->
        <table width="500" border="0" cellpadding="0" cellspacing="5" id="main_table" align="center">
            <tr>
                <td valign="top" align="left">
                    <div id="sub_body">
                        <div id="this_page_title">
                            <div id="item_line">
                                <h1 id="sub_title">养老保险公式设定</h1>
                            </div>
                        </div>

                        <div id="edit">
                            <fieldset class="pmsform">
                                <legend class="pmsform">养老保险公式设定</legend>
                                
                                <!-- 公式说明 -->
                                <div class="formula-section">
                                    <asp:Label ID="lblFormulaTitle" runat="server" CssClass="pmsform" Text="养老保险公式设定:"></asp:Label>
                                </div>
                                
                                <div class="formula-section">
                                    <asp:Label ID="lblCondition1" runat="server" CssClass="pmsform" 
                                        Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果 基本工资 <= 三险一金缴纳基数上限"></asp:Label>
                                </div>
                                
                                <div class="formula-section">
                                    <asp:Label ID="lblResult1" runat="server" CssClass="pmsform" 
                                        Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;养老保险金 = 基本工资 * 系数"></asp:Label>
                                </div>
                                
                                <div class="formula-section">
                                    <asp:Label ID="lblCondition2" runat="server" CssClass="pmsform" 
                                        Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否则"></asp:Label>
                                </div>
                                
                                <div class="formula-section">
                                    <asp:Label ID="lblResult2" runat="server" CssClass="pmsform" 
                                        Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;养老保险金 = 三险一金缴纳基数上限 * 系数"></asp:Label>
                                </div>
                                
                                <div class="spacer">&nbsp;</div>
                                
                                <!-- 系数输入 -->
                                <div align="center">
                                    <asp:Label ID="lblRate" runat="server" CssClass="pmsform" Text="养老保险金系数："></asp:Label>
                                    <asp:TextBox ID="txtRate" runat="server" Width="120px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvRate" runat="server" 
                                        ControlToValidate="txtRate"
                                        ErrorMessage="请输入系数"
                                        Display="Dynamic"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                   
                                </div>
                                
                                <div class="spacer">&nbsp;</div>
                                
                                <!-- 操作按钮 -->
                                <div align="center">
                                    <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="blue_btn" OnClick="btnSave_Click" />
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- 主内容区 结束 -->

        <!-- 页面边框 开始 -->
        <table width="500" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <!-- 页面边框 结束 -->
    </form>
</body>
</html>
