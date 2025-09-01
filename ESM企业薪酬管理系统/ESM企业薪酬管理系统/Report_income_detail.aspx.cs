using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESM企业薪酬管理系统
{
    public partial class Report_income_detail : System.Web.UI.Page
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

                // 初始化年份下拉框，显示最近5年
                int currentYear = DateTime.Now.Year;
                for (int i = currentYear; i >= currentYear - 5; i--)
                {
                    ddlYear.Items.Add(new ListItem(i + "年", i.ToString()));
                }

                // 默认选中当前年份
                ddlYear.SelectedValue = currentYear.ToString();

                // 优先从查询字符串获取empId
                string empId = Request.QueryString["empId"];
                if (!string.IsNullOrEmpty(empId))
                {
                    // 将查询字符串中的empId存入Session
                    Session["ViewEmpId"] = empId;
                }

                // 获取实际员工姓名显示在标题中
                string actualUserName = GetEmployeeName(empId);
                lblSalaryTitle.Text = $"{actualUserName}的薪酬项目列表";
            }
        }
        private string GetEmployeeName(string empId)
        {
            string sql = "SELECT empName FROM Employee WHERE empId = @empId";
            SqlParameter[] parameters = { new SqlParameter("@empId", empId) };

            object result = sh.ExecuteScalar(sql, parameters);
            return result?.ToString() ?? "未知员工";
        }
        protected void btnView_Click(object sender, EventArgs e)
        {
            // 检查用户是否已登录
            if (Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            // 从Session中获取要查看的员工ID
            if (Session["ViewEmpId"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('无法确定要查看的员工。');", true);
                return;
            }

            int userId = Convert.ToInt32(Session["ViewEmpId"]);
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Report_income_emp.aspx");
        }
    }
}