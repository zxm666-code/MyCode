using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ESM企业薪酬管理系统
{
    public partial class Report_income_outline : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();

        protected void Page_Load(object sender, EventArgs e)
        {
            // 检查用户是否已登录
            if (Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                string userRole = Session["UserRole"].ToString();
                string userName = Session["UserName"].ToString();

                lblUserName.Text = userName;
                lblRole.Text = GetRoleName(userRole);
                ControlElementVisibility(userRole);

                // 初始化年份下拉框，显示最近5年
                int currentYear = DateTime.Now.Year;
                for (int i = currentYear; i >= currentYear - 5; i--)
                {
                    ddlYear.Items.Add(new ListItem(i + "年", i.ToString()));
                }

                // 默认选中当前年份
                ddlYear.SelectedValue = currentYear.ToString();
            }
        }

        private void ControlElementVisibility(string role)
        {
            hlUserManagement.Visible = (role == "3");
            liIncomeEmp.Visible = (role == "2" || role == "3");
            hlIncomeEmp.Visible = (role == "2" || role == "3");
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

        protected void btnView_Click(object sender, EventArgs e)
        {
            // 检查用户是否已登录
            if (Session["empId"] == null || Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            // 从Session中获取正确的用户ID键名：empId
            int userId = Convert.ToInt32(Session["empId"]);
            int year = Convert.ToInt32(ddlYear.SelectedValue);

            // 查询该用户指定年度的每月收入明细
            DataTable incomeDetails = GetMonthlyIncomeDetails(userId, year);

            if (incomeDetails != null && incomeDetails.Rows.Count > 0)
            {
                gvIncomeDetails.DataSource = incomeDetails;
                gvIncomeDetails.DataBind();

                // 计算年度总收入
                decimal totalIncome = CalculateTotalIncome(incomeDetails);
                lblTotalIncome.Text = $"人民币 {totalIncome:N2}";

                // 显示结果区域
                show_my_income_summary.Style["display"] = "block";
            }
            else
            {
                show_my_income_summary.Style["display"] = "none";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('没有找到该年度的收入记录。');", true);
            }
        }

        private DataTable GetMonthlyIncomeDetails(int userId, int year)
        {
            string sql = @"
                SELECT 
                    CONVERT(varchar(7), PayDate, 120) AS Time,
                    BaseSalary,
                    HousingFund,
                    Pension,
                    MedicalInsurance,
                    UnemploymentInsurance,
                    OvertimePay,
                    Subsidy,
                    Reimbursement,
                    PerformanceBonus,
                    LeaveDeduction,
                    MonthlyIncome
                FROM EmployeeIncome
                WHERE EmployeeID = @EmployeeID 
                  AND YEAR(PayDate) = @Year
                ORDER BY PayDate";

            SqlParameter[] parameters = {
                new SqlParameter("@EmployeeID", userId),
                new SqlParameter("@Year", year)
            };

            DataSet ds = sh.getDs(sql, parameters);
            return ds.Tables.Count > 0 ? ds.Tables[0] : null;
        }

        private decimal CalculateTotalIncome(DataTable incomeDetails)
        {
            decimal total = 0;
            foreach (DataRow row in incomeDetails.Rows)
            {
                if (row["MonthlyIncome"] != DBNull.Value)
                {
                    total += Convert.ToDecimal(row["MonthlyIncome"]);
                }
            }
            return total;
        }
    }
}