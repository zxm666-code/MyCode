using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace ESM企业薪酬管理系统
{
    public partial class InputData_sub1 : System.Web.UI.Page
    {
        Sqlhelp sh = new Sqlhelp();
        private string empId; // 从URL获取的员工ID

        protected void Page_Load(object sender, EventArgs e)
        {
            // 从URL获取员工ID（假设通过empId参数传递）
            empId = Request.QueryString["empId"];
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(empId))
                {
                    BindEmployeeName(); // 加载员工姓名
                    BindSalaryItems(); // 加载薪酬项目
                }
                else
                {
                    Response.Redirect("InputPay.aspx"); // 无员工ID时跳转
                }
            }
        }


        private void BindEmployeeName()
        {
            string sql = "SELECT empName FROM Employee WHERE empId = @empId";
            SqlParameter[] parameters = { new SqlParameter("@empId", empId) };
            DataSet ds = sh.getDs(sql, parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblEmployeeName.Text = ds.Tables[0].Rows[0]["empName"].ToString();
            }
        }

        private void BindSalaryItems()
        {
            string sql = @"SELECT templateId, salaryItem, isAdd, isTax, calculationFormula, formulaPageUrl
                           FROM SalaryTemplate
                           WHERE empId = @empId";
            SqlParameter[] parameters = { new SqlParameter("@empId", empId) };
            DataSet ds = sh.getDs(sql, parameters);
            gvSalaryItems.DataSource = ds.Tables[0];
            gvSalaryItems.DataBind();
        }


        // 关键修改：添加 protected 修饰符
        protected bool IsEditableItem(string itemName)
        {
            string[] editableItems = { "加班费", "请假扣款", "业绩奖", "报销", "补贴" };
            return editableItems.Contains(itemName);
        }

        protected bool IsFormulaItem(string itemName)
        {
            string[] formulaItems = { "养老保险", "医疗保险", "失业保险", "住房公积金" };
            return formulaItems.Contains(itemName);
        }

        protected bool IsDetailItem(string itemName)
        {
            return IsEditableItem(itemName);
        }

        protected string GetFormulaUrl(string pageUrl)
        {
            if (string.IsNullOrEmpty(pageUrl))
                return "#";
            return $"{pageUrl}?empId={empId}";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UpdateEmployeeState("已提交");
            SaveInputValues();
            Response.Redirect($"InputPay.aspx?empId={empId}"); // 提交后返回列表页
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            UpdateEmployeeState("已保存");
            SaveInputValues();
            Response.Redirect($"InputPay.aspx?empId={empId}"); // 保存后返回列表页
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect($"InputPay.aspx?empId={empId}"); // 取消后返回列表页
        }

        // 详细说明按钮事件（示例：弹出模态框或跳转页面）
        protected void btnInputDesc_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string templateId = btn.CommandArgument;
            Response.Redirect("CheckPay_shuoming.aspx");
        }

        private void UpdateEmployeeState(string state)
        {
            string sql = "UPDATE Employee SET state = @state WHERE empId = @empId";
            SqlParameter[] parameters = {
                new SqlParameter("@state", state),
                new SqlParameter("@empId", empId)
            };
            sh.execSql(sql, parameters);
        }

        private void SaveInputValues()
        {
            foreach (GridViewRow row in gvSalaryItems.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    string templateId = gvSalaryItems.DataKeys[row.RowIndex]["templateId"].ToString();
                    string itemName = ((Label)row.FindControl("lblItemName")).Text;

                    if (IsEditableItem(itemName))
                    {
                        TextBox txtValue = (TextBox)row.FindControl("txtInputValue");
                        string newValue = txtValue.Text.Trim();

                        // 保存到数据库（示例：更新calculationFormula字段）
                        string sql = "UPDATE SalaryTemplate SET calculationFormula = @value WHERE templateId = @templateId";
                        SqlParameter[] parameters = {
                            new SqlParameter("@value", newValue),
                            new SqlParameter("@templateId", templateId)
                        };
                        sh.execSql(sql, parameters);
                    }
                }
            }
        }

        
    }
}