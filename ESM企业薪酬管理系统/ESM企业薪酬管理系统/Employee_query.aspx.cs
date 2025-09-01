using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESM企业薪酬管理系统
{
    public partial class Employee_query : System.Web.UI.Page
    {
        Sqlhelp sh=new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                // 绑定员工数据
                BindEmployeeData();
                string userRole = Session["UserRole"].ToString();
                string userName = Session["UserName"].ToString();

                lblUsername.Text = userName;
                lblRole.Text = GetRoleName(userRole);

                ControlElementVisibility(userRole);
            }
        }

        private void ControlElementVisibility(string role)
        {
            lnkUser.Visible = (role == "3");
            CreateEmployee.Visible = (role == "3");
            lnkDeleteEmployee.Visible = (role == "3");
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
        private void BindEmployeeData()
        {
            try
            {
                // 获取查询条件
                string empId = txtEmployeeId.Text.Trim();
                string empName = txtEmployeeName.Text.Trim();
                string deptName = txtDepartment.Text.Trim();
                string Mail = txtEmail.Text.Trim();

                // 编写 SQL 查询语句
                string query = "SELECT empId,empName,deptName,Mail,Tel1 FROM Employee WHERE 1=1";

                // 添加员工号条件
                if (!string.IsNullOrEmpty(empId))
                {
                    query += " AND empId LIKE '%" + empId + "%'";
                }

                // 添加姓名条件
                if (!string.IsNullOrEmpty(empName))
                {
                    query += " AND empName LIKE '%" + empName + "%'";
                }

                // 添加部门条件
                if (!string.IsNullOrEmpty(deptName))
                {
                    query += " AND deptName LIKE '%" + deptName + "%'";
                }

                // 添加邮件账号条件
                if (!string.IsNullOrEmpty(Mail))
                {
                    query += " AND Mail LIKE '%" + Mail + "%'";
                }

                // 这里如果没有参数，传入空数组
                SqlParameter[] parameters = new SqlParameter[0];

                // 使用 Sqlhelp 类的 getDs 方法获取数据集
                DataSet dataSet = sh.getDs(query, parameters);

                // 绑定数据到 GridView
                gvEmployees.DataSource = dataSet.Tables[0];
                gvEmployees.RowDataBound += GvEmployees_RowDataBound; // 绑定 RowDataBound 事件
                gvEmployees.DataBind();

                // 根据当前页码禁用相应的按钮
                lnkFirst.Enabled = gvEmployees.PageIndex > 0;
                lnkPrev.Enabled = gvEmployees.PageIndex > 0;
                lnkNext.Enabled = gvEmployees.PageIndex < gvEmployees.PageCount - 1;
                lnkLast.Enabled = gvEmployees.PageIndex < gvEmployees.PageCount - 1;
            }
            catch (Exception ex)
            {
                // 处理异常
                Response.Write("Error: " + ex.Message);
            }
        }

        private void GvEmployees_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string userRole = Session["UserRole"]?.ToString();
                bool isSuperUser = userRole == "3";

                // 非超级用户隐藏删除按钮和编辑按钮
                if (!isSuperUser)
                {
                    ImageButton btnDelete = (ImageButton)e.Row.FindControl("btnDelete");
                    if (btnDelete != null)
                    {
                        btnDelete.Visible = false;
                    }

                    // 通过固定ID查找编辑按钮并隐藏
                    HyperLink editLink = (HyperLink)e.Row.FindControl("editLink");
                    if (editLink != null)
                    {
                        editLink.Visible = false;
                    }

                    // 隐藏复选框列的表头复选框（chkAll）

                        CheckBox chkAll = (CheckBox)gvEmployees.HeaderRow.FindControl("chkAll");
                        if (chkAll != null)
                        {
                            chkAll.Visible = false;
                        }
                    
                    // 非超级用户隐藏每行的复选框（chkSelect）
                    CheckBox chkSelect = (CheckBox)e.Row.FindControl("chkSelect");
                    if (chkSelect != null)
                    {
                        chkSelect.Visible = false;
                    }
                }
            }
        }
        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkAll = (CheckBox)gvEmployees.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in gvEmployees.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null)
                {
                    chkSelect.Checked = chkAll.Checked;
                }
            }
        }
        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            // 获取触发事件的ImageButton控件
            ImageButton btn = (ImageButton)sender;
            // 从CommandArgument获取postID
            string empId = btn.CommandArgument;
            string strSql = "DELETE FROM Employee WHERE empId = @empId";
            // 创建参数数组
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@empId", SqlDbType.NVarChar, 50) { Value = empId }
            };

            // 使用execSql方法（需要你在Sqlhelp类中添加带参数的重载）
            int i = sh.execSql(strSql, parameters);

            if (i > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('删除成功！');", true);
                BindEmployeeData();// 重新绑定数据
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('删除失败，可能记录已不存在！');", true);
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindEmployeeData();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.txtEmployeeId.Text = "";
            this.txtEmployeeName.Text = "";
            this.txtDepartment.Text = "";
            this.txtEmail.Text = "";
        }

        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            gvEmployees.PageIndex = 0;
            BindEmployeeData();
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            if (gvEmployees.PageIndex > 0)
            {
                gvEmployees.PageIndex--;
                BindEmployeeData();
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            if (gvEmployees.PageIndex < gvEmployees.PageCount - 1)
            {
                gvEmployees.PageIndex++;
                BindEmployeeData();
            }
        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
            gvEmployees.PageIndex = gvEmployees.PageCount - 1;
            BindEmployeeData();
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            List<string> selectedEmployeeIds = new List<string>();
            foreach (GridViewRow row in gvEmployees.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null && chkSelect.Checked)
                {
                    string empId = gvEmployees.DataKeys[row.RowIndex].Value.ToString();
                    selectedEmployeeIds.Add(empId);
                }
            }

            if (selectedEmployeeIds.Count > 0)
            {
                string deleteQuery = "DELETE FROM Employee WHERE empId IN ({0})";
                string parameterList = string.Join(",", selectedEmployeeIds.ConvertAll(id => "@EmpId" + selectedEmployeeIds.IndexOf(id)));
                deleteQuery = string.Format(deleteQuery, parameterList);

                SqlParameter[] parameters = new SqlParameter[selectedEmployeeIds.Count];
                for (int i = 0; i < selectedEmployeeIds.Count; i++)
                {
                    parameters[i] = new SqlParameter("@EmpId" + i, selectedEmployeeIds[i]);
                }

                try
                {
                    int rowsAffected = sh.execSql(deleteQuery, parameters);
                    if (rowsAffected > 0)
                    {
                        // 删除成功，重新绑定数据
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('删除成功！');", true);
                        BindEmployeeData();
                    }
                    else
                    {
                        // 删除失败，显示错误信息
                        Response.Write("删除失败，请稍后重试。");
                    }
                }
                catch (Exception ex)
                {
                    // 处理异常
                    Response.Write($"Error: {ex.Message}");
                }
            }
        }

        protected void tzym(object sender, EventArgs e)
        {
            Response.Redirect("Employee_add.aspx");
        }
    }
}