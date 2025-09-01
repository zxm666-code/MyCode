using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace ESM企业薪酬管理系统
{
    public partial class XinChouTemplateList : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                BindGridView();
                string userRole = Session["UserRole"].ToString();
                string userName = Session["UserName"].ToString();

                lblUserName.Text = userName;
                lblRole.Text = GetRoleName(userRole);

                ControlElementVisibility(userRole);
            }
        }

        private void ControlElementVisibility(string role)
        {
            hlUserManagement.Visible = (role == "3");
            hlTemplate.Visible = (role == "2" || role == "3");
            hlSalaryMaintain.Visible = (role == "2" || role == "3");
            liTemplate.Visible = (role == "2" || role == "3");
            liSalaryMaintain.Visible = (role == "2" || role == "3");
        }

        private string GetRoleName(string role)
        {
            switch (role)
            {
                case "1": return "普通用户";
                case "2": return "薪酬管理员";
                case "3": return "超级用户";
                default: return "未知角色";
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            // 清除会话中的用户信息
            Session.Abandon();
            // 重定向到登录页面
            Response.Redirect("Login.aspx");
        }

        private void BindGridView()
        {
            // 从Session获取当前登录用户的empId
            string empId = Session["empId"]?.ToString();

            if (string.IsNullOrEmpty(empId))
            {
                // 处理empId为空的情况（例如用户未登录）
                Response.Redirect("Login.aspx"); // 或显示错误信息
                return;
            }

            string sql = @"SELECT 
        templateId, 
        empId, 
        salaryItem, 
        calculationFormula,
        formulaPageUrl,
        CASE isAdd 
            WHEN 1 THEN '累加' 
            WHEN 0 THEN '扣除' 
            ELSE '未知' 
        END AS isAdd, 
        CASE isTax 
            WHEN 1 THEN '是' 
            WHEN 0 THEN '否' 
            ELSE '未知' 
        END AS isTax, 
        CASE isRequired 
            WHEN 1 THEN '是' 
            WHEN 0 THEN '否' 
            ELSE '未知' 
        END AS isRequired 
      FROM SalaryTemplate 
      WHERE empId = @empId"; // 添加WHERE子句过滤当前用户的数据

            SqlParameter[] parameters = {
        new SqlParameter("@empId", empId) // 添加SQL参数
    };

            DataSet ds = sh.getDs(sql, parameters); // 传递参数到数据访问方法
            if (ds != null && ds.Tables.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            }
        }

        // 自定义方法生成指定长度的随机字符串
        private string GenerateRandomId(int length)
        {
            const string validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder result = new StringBuilder();
            Random random = new Random();
            for (int i = 0; i < length; i++)
            {
                result.Append(validChars[random.Next(validChars.Length)]);
            }
            return result.ToString();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string empId = txtEmpId.Text.Trim();
            string salaryItem = txtSalaryItem.Text.Trim();
            string calculationFormula = txtCalculationMethod.Text.Trim();
            int isAdd = Convert.ToInt32(ddlType.SelectedValue);
            int isTax = Convert.ToInt32(ddlIsTaxable.SelectedValue);
            int isRequired = Convert.ToInt32(ddlIsRequired.SelectedValue);

            // 假设这里的 templateId 使用 Guid 生成唯一值，empId 为当前登录用户的 ID
            string templateId = GenerateRandomId(5);

            string sql = @"INSERT INTO SalaryTemplate (templateId, empId, salaryItem, calculationFormula, isAdd, isTax, isRequired)
                           VALUES (@templateId, @empId, @salaryItem, @calculationFormula, @isAdd, @isTax, @isRequired)";

            SqlParameter[] parameters = {
                new SqlParameter("@templateId", templateId),
                new SqlParameter("@empId", empId),
                new SqlParameter("@salaryItem", salaryItem),
                new SqlParameter("@calculationFormula", calculationFormula),
                new SqlParameter("@isAdd", isAdd),
                new SqlParameter("@isTax", isTax),
                new SqlParameter("@isRequired", isRequired)
            };

            int rowsAffected = sh.execSql(sql, parameters);
            if (rowsAffected > 0)
            {
                // 添加成功，重新绑定数据以显示更新后的列表
                BindGridView();
                // 使用 Page.ClientScript.RegisterStartupScript 弹出提示框
                string script = "alert('工资项目添加成功！');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "successAlert", script, true);
            }
            else
            {
                // 添加失败，弹出错误提示框
                string script = "alert('工资项目添加失败，请重试。');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "errorAlert", script, true);
            }
        }

        // 查询按钮点击事件处理程序
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            string queryEmpId = txtQueryEmpId.Text.Trim();

            if (string.IsNullOrEmpty(queryEmpId))
            {
                // 如果查询的 empId 为空，显示当前用户的数据
                BindGridView();
                return;
            }

            try
            {
                string sql = @"SELECT 
                            templateId, 
                            empId, 
                            salaryItem, 
                            calculationFormula,
                            formulaPageUrl,
                            CASE isAdd 
                                WHEN 1 THEN '累加' 
                                WHEN 0 THEN '扣除' 
                                ELSE '未知' 
                            END AS isAdd, 
                            CASE isTax 
                                WHEN 1 THEN '是' 
                                WHEN 0 THEN '否' 
                                ELSE '未知' 
                            END AS isTax, 
                            CASE isRequired 
                                WHEN 1 THEN '是' 
                                WHEN 0 THEN '否' 
                                ELSE '未知' 
                            END AS isRequired 
                          FROM SalaryTemplate 
                          WHERE empId = @empId";

                SqlParameter[] parameters = {
                    new SqlParameter("@empId", queryEmpId)
                };

                DataSet ds = sh.getDs(sql, parameters);

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
                }
                else
                {
                    // 清空 GridView
                    GridView1.DataSource = null;
                    GridView1.DataBind();

                    // 显示没有找到记录的消息
                    string script = "alert('未找到该员工的薪酬项目记录。');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "queryEmpty", script, true);
                }
            }
            catch (Exception ex)
            {
                // 处理异常
                string script = "alert('查询过程中发生错误：" + ex.Message + "');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "queryError", script, true);
            }
        }
    }
}