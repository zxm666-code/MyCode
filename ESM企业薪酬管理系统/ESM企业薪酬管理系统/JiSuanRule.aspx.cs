using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;

namespace ESM企业薪酬管理系统
{
    public partial class JiSuanRule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 获取传递的参数
            string item = Request.QueryString["item"];

            // 控制元素可见性（先执行，确保无论是否有item参数都能正确设置）
            ControlElementVisibility();

            if (!string.IsNullOrEmpty(item))
            {
                // 根据参数值更新标签文本
                switch (item)
                {
                    case "医疗保险":
                        lblFormulaTitle.Text = "医疗保险计算:";
                        lblCondition1.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果 工资 <= 医疗保险缴纳基数上限";
                        lblResult1.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;医疗保险 = 工资 * 系数";
                        lblCondition2.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否则";
                        lblResult2.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;医疗保险 = 医疗保险缴纳基数上限 * 系数";
                        break;
                    case "住房公积金":
                        lblFormulaTitle.Text = "住房公积金计算:";
                        lblCondition1.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果 基本工资 <= 三险一金缴纳基数上限";
                        lblResult1.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;住房公积金 = 基本工资 * 系数";
                        lblCondition2.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否则";
                        lblResult2.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;住房公积金 = 三险一金缴纳基数上限 * 系数";
                        break;
                    case "养老保险":
                        lblFormulaTitle.Text = "养老保险计算:";
                        lblCondition1.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果 基本工资 <= 三险一金缴纳基数上限";
                        lblResult1.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;养老保险 = 基本工资 * 系数";
                        lblCondition2.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否则";
                        lblResult2.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;养老保险 = 三险一金缴纳基数上限 * 系数";
                        break;
                    case "失业保险":
                        lblFormulaTitle.Text = "失业保险计算:";
                        lblCondition1.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果 基本工资 <= 三险一金缴纳基数上限";
                        lblResult1.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;失业保险 = 基本工资 * 系数";
                        lblCondition2.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否则";
                        lblResult2.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;失业保险 = 三险一金缴纳基数上限 * 系数";
                        break;
                    // 添加更多情况
                    default:
                        lblFormulaTitle.Text = "计算公式查看";
                        break;
                }
            }
        }

        private void ControlElementVisibility()
        {
            // 获取用户角色
            string userRole = Session["UserRole"]?.ToString();

            // 检查用户是否已登录
            if (string.IsNullOrEmpty(userRole))
            {
                Response.Redirect("Login.aspx"); // 未登录则重定向
                return;
            }

            // 只允许角色2（薪酬管理员）和角色3（超级用户）查看和编辑系数
            bool isAdmin = userRole == "2" || userRole == "3";

            // 隐藏/显示系数输入区域
            lblRate.Visible = isAdmin;
            txtRate.Visible = isAdmin;
            btnSave.Visible = isAdmin;
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            // 关闭窗口的逻辑
            Response.Redirect("GeRenJieGouChaXun.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // 获取输入的系数值
            string rate = txtRate.Text.Trim();

            // 获取传递的参数
            string item = Request.QueryString["item"];

            // 这里假设你有一个数据库操作类 Sqlhelp，并且有一个 execSql 方法用于执行 SQL 语句
            Sqlhelp sh = new Sqlhelp();

            // 构建更新数据库的 SQL 语句，这里需要根据你的数据库表结构和实际需求进行调整
            string sql = "";
            if (!string.IsNullOrEmpty(item))
            {
                // 假设你的数据库表名为 SalaryTemplate，并且有一个字段名为 calculationFormula 存储计算公式系数
                sql = @"UPDATE SalaryTemplate 
                        SET calculationCoefficient = @rate 
                        WHERE salaryItem = @item";

                SqlParameter[] parameters = {
                    new SqlParameter("@rate", rate),
                    new SqlParameter("@item", item)
                };

                int rowsAffected = sh.execSql(sql, parameters);
                if (rowsAffected > 0)
                {
                    // 更新成功，你可以添加提示信息或进行其他操作
                    string script = "alert('计算系数保存成功！');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "successAlert", script, true);
                }
                else
                {
                    // 更新失败，你可以添加提示信息
                    string script = "alert('计算系数保存失败，请重试。');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "errorAlert", script, true);
                }
            }
        }
    }
}