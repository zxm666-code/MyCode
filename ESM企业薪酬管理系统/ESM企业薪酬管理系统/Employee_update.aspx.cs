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
    public partial class Employee_update : System.Web.UI.Page
    {
        Sqlhelp sh=new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 获取要更新的员工号
                string empId = Request.QueryString["empId"];
                if (!string.IsNullOrEmpty(empId))
                {
                    // 从数据库中获取员工信息
                    string query = "SELECT * FROM Employee WHERE empId = @EmpId";
                    SqlParameter[] parameters = { new SqlParameter("@EmpId", empId) };
                    DataSet ds = sh.getDs(query, parameters);
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow row = ds.Tables[0].Rows[0];
                        txtEmpId.Text = row["empId"].ToString();
                        txtName.Text = row["empName"].ToString();
                        txtBirthday.Text = row["birthday"].ToString();
                        txtIdCard.Text = row["IDCard"].ToString();

                        // 设置部门下拉框
                        BindDepartmentDropdown(row["deptName"].ToString());
                        // 设置岗位下拉框
                        BindPositionDropdown(row["postName"].ToString());
                        // 设置级别下拉框
                        BindLevelDropdown();

                        txtEmail.Text = row["Mail"].ToString();
                        txtPhone1.Text = row["Tel1"].ToString();
                        txtPhone2.Text = row["Tel2"].ToString();
                        txtAddress.Text = row["address"].ToString();
                    }
                }
            }
        }

        private void BindDepartmentDropdown(string currentDeptName)
        {
            string deptQuery = "SELECT DISTINCT deptName FROM Position";
            DataSet deptDs = sh.getDs(deptQuery, null);
            if (deptDs.Tables.Count > 0 && deptDs.Tables[0].Rows.Count > 0)
            {
                ddlDepartment.DataSource = deptDs.Tables[0];
                ddlDepartment.DataTextField = "deptName";
                ddlDepartment.DataValueField = "deptName";
                ddlDepartment.DataBind();

                // 选中当前员工的部门
                foreach (ListItem item in ddlDepartment.Items)
                {
                    if (item.Text == currentDeptName)
                    {
                        item.Selected = true;
                        break;
                    }
                }
            }
        }

        private void BindPositionDropdown(string currentPostName)
        {
            string positionQuery = "SELECT DISTINCT postName FROM Position";
            DataSet positionDs = sh.getDs(positionQuery, null);
            if (positionDs.Tables.Count > 0 && positionDs.Tables[0].Rows.Count > 0)
            {
                ddlPosition.DataSource = positionDs.Tables[0];
                ddlPosition.DataTextField = "postName";
                ddlPosition.DataValueField = "postName";
                ddlPosition.DataBind();

                // 选中当前员工的岗位
                foreach (ListItem item in ddlPosition.Items)
                {
                    if (item.Text == currentPostName)
                    {
                        item.Selected = true;
                        break;
                    }
                }
            }
        }

        private void BindLevelDropdown()
        {
            for (int i = 1; i <= 10; i++)
            {
                ListItem item = new ListItem(i.ToString(), i.ToString());
                ddlLevel.Items.Add(item);
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string empId = txtEmpId.Text.Trim();
            string empName = txtName.Text.Trim();
            string birthday = txtBirthday.Text.Trim();
            string idCard = txtIdCard.Text.Trim();
            string deptName = ddlDepartment.SelectedItem.Text;
            string postName = ddlPosition.SelectedItem.Text;
            int level;
            if (!int.TryParse(ddlLevel.SelectedValue, out level))
            {
                Response.Write("<script>alert('级别输入不是有效的整数，请重新输入！');</script>");
                return;
            }
            string email = txtEmail.Text.Trim();
            string phone1 = txtPhone1.Text.Trim();
            string phone2 = txtPhone2.Text.Trim();
            string address = txtAddress.Text.Trim();

            // 检查必填项
            if (string.IsNullOrEmpty(empName) || string.IsNullOrEmpty(birthday) ||
                string.IsNullOrEmpty(idCard) || string.IsNullOrEmpty(deptName) || string.IsNullOrEmpty(postName) ||
                string.IsNullOrEmpty(email) || string.IsNullOrEmpty(phone1))
            {
                Response.Write("<script>alert('姓名、出生年月、身份证号、部门、岗位、邮件账号、联系电话1为必选项，请填写完整！');</script>");
                return;
            }


            // 检查身份证号是否唯一（除当前员工）
            string checkIdCardQuery = "SELECT COUNT(*) FROM Employee WHERE IDCard = @IDCard AND empId <> @EmpId";
            SqlParameter[] checkIdCardParams = {
                new SqlParameter("@IDCard", idCard),
                new SqlParameter("@EmpId", empId)
            };
            int idCardCount = sh.execSql(checkIdCardQuery, checkIdCardParams);
            if (idCardCount > 0)
            {
                Response.Write("<script>alert('该身份证号已被其他员工使用，请重新输入！');</script>");
                return;
            }

            // 检查部门和岗位组合是否有效
            string checkPositionQuery = "SELECT COUNT(*) FROM Position WHERE postName = @PostName AND deptName = @DeptName";
            SqlParameter[] positionParams = {
                new SqlParameter("@PostName", postName),
                new SqlParameter("@DeptName", deptName)
            };
            int positionCount = sh.execSql(checkPositionQuery, positionParams);
            if (positionCount == 0)
            {
                Response.Write("<script>alert('所选的部门和岗位组合无效，请重新选择！');</script>");
                return;
            }

            string updateQuery = @"UPDATE Employee 
                                   SET empName = @EmpName, 
                                       birthday = @Birthday, 
                                       IDCard = @IDCard, 
                                       deptName = @DeptName, 
                                       postName = @PostName, 
                                       [level] = @Level, 
                                       Mail = @Mail, 
                                       Tel1 = @Tel1, 
                                       Tel2 = @Tel2, 
                                       address = @Address 
                                   WHERE empId = @EmpId";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@EmpName", empName),
                new SqlParameter("@Birthday", birthday),
                new SqlParameter("@IDCard", idCard),
                new SqlParameter("@DeptName", deptName),
                new SqlParameter("@PostName", postName),
                new SqlParameter("@Level", level),
                new SqlParameter("@Mail", email),
                new SqlParameter("@Tel1", phone1),
                new SqlParameter("@Tel2", phone2),
                new SqlParameter("@Address", address),
                new SqlParameter("@EmpId", empId)
            };

            try
            {
                int rowsAffected = sh.execSql(updateQuery, parameters);
                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('员工信息更新成功！');window.location.href='Employee_query.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('员工信息更新失败，请重试！');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('发生错误：{ex.Message}');</script>");
            }

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // 清空除员工号之外的所有输入框和下拉框
            txtName.Text = "";
            txtBirthday.Text = "";
            txtIdCard.Text = "";
            ddlDepartment.SelectedIndex = 0;
            ddlPosition.SelectedIndex = 0;
            ddlLevel.SelectedIndex = 0;
            txtEmail.Text = "";
            txtPhone1.Text = "";
            txtPhone2.Text = "";
            txtAddress.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee_query.aspx");
        }
    }
}