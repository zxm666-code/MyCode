using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESM企业薪酬管理系统
{
    public partial class GeRenJieGouChaXun : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {
            // 验证用户是否已登录
            if (Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                string userRole = Session["UserRole"].ToString();
                string userName = Session["UserName"].ToString();

                lblUserName.Text = userName;
                lblRole.Text = GetRoleName(userRole);

                // 设置员工姓名标签文本
                lblEmployeeName.Text = userName;

                // 绑定薪酬项目数据到GridView
                BindSalaryItems();

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
            // 清除会话
            Session.Abandon();
            // 重定向到登录页面
            Response.Redirect("Login.aspx");
        }

        private void BindSalaryItems()
        {
            // 假设登录后能获取到当前员工的empId，这里从Session中获取
            string empId = Session["empId"]?.ToString();

            string query = "SELECT salaryItem, " +
                  "CASE WHEN isAdd = 1 THEN '累加' ELSE '扣除' END AS OperationType, " +
                  "CASE WHEN isTax = 1 THEN '是' ELSE '否' END AS IsTaxable, " +
                  "calculationFormula ," +
                  "formulaPageUrl " +
                  "FROM SalaryTemplate WHERE empId = @empId";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@empId", SqlDbType.VarChar, 10) { Value = empId }
            };

            DataSet dataSet = sh.getDs(query, parameters);

            if (dataSet.Tables[0].Rows.Count > 0)
            {
                gvSalaryItems.DataSource = dataSet.Tables[0];
                gvSalaryItems.DataBind();
            }
        }
    }
}