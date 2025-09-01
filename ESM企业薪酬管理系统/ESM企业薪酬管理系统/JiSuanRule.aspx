<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JiSuanRule.aspx.cs" Inherits="ESM企业薪酬管理系统.JiSuanRule" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>计算公式查看</title>
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
                                <h1 id="sub_title">计算公式</h1>
                            </div>
                        </div>

                        <div id="edit">
                            <fieldset class="pmsform">
                                <legend class="pmsform">计算公式</legend>
                                
                                <!-- 计算公式展示 -->
                                <div class="formula-section">
                                    <asp:Label ID="lblFormulaTitle" runat="server" CssClass="pmsform" Text="住房公积金计算:"></asp:Label>
                                </div>
                                
                                <div class="formula-section">
                                    <asp:Label ID="lblCondition1" runat="server" CssClass="pmsform" 
                                        Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果 基本工资 <= 三险一金缴纳基数上限"></asp:Label>
                                </div>
                                
                                <div class="formula-section">
                                    <asp:Label ID="lblResult1" runat="server" CssClass="pmsform" 
                                        Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;住房公积金 = 基本工资 * 系数"></asp:Label>
                                </div>
                                
                                <div class="formula-section">
                                    <asp:Label ID="lblCondition2" runat="server" CssClass="pmsform" 
                                        Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否则"></asp:Label>
                                </div>
                                
                                <div class="formula-section">
                                    <asp:Label ID="lblResult2" runat="server" CssClass="pmsform" 
                                        Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;住房公积金 = 三险一金缴纳基数上限 * 系数"></asp:Label>
                                </div>
                                
                                <div class="spacer">&nbsp;

                                </div>
                                 <div align="center">
                                     <asp:Label ID="lblRate" runat="server" CssClass="pmsform" Text="住房公积金系数："></asp:Label>
                                     <asp:TextBox ID="txtRate" runat="server" Width="120px"></asp:TextBox>
                                 </div> 
                                <div>&nbsp;</div>
                                <!-- 按钮 -->
                                <div align="center">
                                     <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="blue_btn" OnClick="btnSave_Click" />

                                    <asp:Button ID="btnClose" runat="server" Text="关闭" CssClass="blue_btn" OnClick="btnClose_Click" />
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
