using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ESM企业薪酬管理系统
{
    public partial class Post_query1 : System.Web.UI.Page
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
            hlPostMaintenance.Visible = (role == "3");
            liPostMaintenance.Visible = (role == "3");
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
            try
            {

                string jobName = this.txtJobName.Text.Trim();
                string department = this.txtDepartment.Text.Trim();
                // 编写 SQL 查询语句
                string query = "SELECT postName, deptName, postDes FROM Position where 1=1";
               
                // 添加岗位名称条件
                if (!string.IsNullOrEmpty(jobName))
                {
                    query += " AND postName LIKE '%" + jobName + "%'";

                }

                // 添加部门名称条件
                if (!string.IsNullOrEmpty(department))
                {
                    query += " AND deptName LIKE '%" + department + "%'";

                }

                // 这里如果没有参数，传入空数组
                SqlParameter[] parameters = new SqlParameter[0];

                // 使用 Sqlhelp 类的 getDs 方法获取数据集
                DataSet dataSet = sh.getDs(query, parameters);

                // 绑定数据到 GridView
                gvPosts.DataSource = dataSet.Tables[0];
                gvPosts.DataBind();

                // 根据当前页码禁用相应的按钮
                lnkFirst.Enabled = gvPosts.PageIndex > 0;
                lnkPrev.Enabled = gvPosts.PageIndex > 0;
                lnkNext.Enabled = gvPosts.PageIndex < gvPosts.PageCount - 1;
                lnkLast.Enabled = gvPosts.PageIndex < gvPosts.PageCount - 1;
            }
            catch (Exception ex)
            {
                // 处理异常
                Response.Write("Error: " + ex.Message);
            }
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            this.txtJobName.Text = "";
            this.txtDepartment.Text = "";
        }
        protected void LnkFirst_Click(object sender, EventArgs e)
        {
            gvPosts.PageIndex = 0;
            BindGridView();
        }

        protected void LnkPrev_Click(object sender, EventArgs e)
        {
            if (gvPosts.PageIndex > 0)
            {
                gvPosts.PageIndex--;
            }
            BindGridView();
        }

        protected void LnkNext_Click(object sender, EventArgs e)
        {
            if (gvPosts.PageIndex < gvPosts.PageCount - 1)
            {
                gvPosts.PageIndex++;
            }
            BindGridView();
        }

        protected void LnkLast_Click(object sender, EventArgs e)
        {
            gvPosts.PageIndex = gvPosts.PageCount - 1;
            BindGridView();
        }

    }
}