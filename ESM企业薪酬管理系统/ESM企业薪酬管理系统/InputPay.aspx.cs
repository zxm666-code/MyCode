using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESM企业薪酬管理系统
{
    public partial class InputPay : System.Web.UI.Page
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
                string userRole = Session["UserRole"].ToString();
                string userName = Session["UserName"].ToString();

                lblUserName.Text = userName;
                lblRole.Text = GetRoleName(userRole);
                ControlElementVisibility(userRole);

                // 初始化加载数据
                BindPendingList();
                BindSavedList();
                BindSubmittedList();
            }
        }

        private void BindPendingList()
        {
            string sql = "SELECT empId, empName, deptName, postName, level, Mail, Tel1 " +
                         "FROM Employee WHERE state = @state";

            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@state", "待处理")
            };

            DataSet ds = sh.getDs(sql, parameters);
            gvPendingList.DataSource = ds.Tables[0];
            gvPendingList.DataBind();

            // 根据当前页码禁用相应的按钮
            lnkFirst.Enabled = gvPendingList.PageIndex > 0;
            lnkPrev.Enabled = gvPendingList.PageIndex > 0;
            lnkNext.Enabled = gvPendingList.PageIndex < gvPendingList.PageCount - 1;
            lnkLast.Enabled = gvPendingList.PageIndex < gvPendingList.PageCount - 1;
        }

        private void BindSavedList()
        {
            string sql = "SELECT empId, empName, deptName, postName, level, Mail, Tel1 " +
                         "FROM Employee WHERE state = @state";

            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@state", "已保存")
            };

            DataSet ds = sh.getDs(sql, parameters);
            gvSavedList.DataSource = ds.Tables[0];
            gvSavedList.DataBind();

            // 根据当前页码禁用相应的按钮
            LinkButton1.Enabled = gvSavedList.PageIndex > 0;
            LinkButton2.Enabled = gvSavedList.PageIndex > 0;
            LinkButton3.Enabled = gvSavedList.PageIndex < gvSavedList.PageCount - 1;
            LinkButton4.Enabled = gvSavedList.PageIndex < gvSavedList.PageCount - 1;
        }

        private void BindSubmittedList()
        {
            string sql = "SELECT empId, empName, deptName, postName, level, Mail, Tel1 " +
                         "FROM Employee WHERE state = @state";

            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@state", "已提交")
            };

            DataSet ds = sh.getDs(sql, parameters);
            gvSubmittedList.DataSource = ds.Tables[0];
            gvSubmittedList.DataBind();

            // 根据当前页码禁用相应的按钮
            LinkButton5.Enabled = gvSubmittedList.PageIndex > 0;
            LinkButton6.Enabled = gvSubmittedList.PageIndex > 0;
            LinkButton7.Enabled = gvSubmittedList.PageIndex < gvSubmittedList.PageCount - 1;
            LinkButton8.Enabled = gvSubmittedList.PageIndex < gvSubmittedList.PageCount - 1;
        }

        protected void LnkFirst_Click(object sender, EventArgs e)
        {
            gvPendingList.PageIndex = 0;
            BindPendingList();
        }

        protected void LnkPrev_Click(object sender, EventArgs e)
        {
            if (gvPendingList.PageIndex > 0)
            {
                gvPendingList.PageIndex--;
            }
            BindPendingList();
        }

        protected void LnkNext_Click(object sender, EventArgs e)
        {
            if (gvPendingList.PageIndex < gvPendingList.PageCount - 1)
            {
                gvPendingList.PageIndex++;
            }
            BindPendingList();
        }

        protected void LnkLast_Click(object sender, EventArgs e)
        {
            gvPendingList.PageIndex = gvPendingList.PageCount - 1;
            BindPendingList();
        }


        protected void LnkFirst_Click1(object sender, EventArgs e)
        {
            gvSavedList.PageIndex = 0;
            BindSavedList();
        }

        protected void LnkPrev_Click1(object sender, EventArgs e)
        {
            if (gvSavedList.PageIndex > 0)
            {
                gvSavedList.PageIndex--;
            }
            BindSavedList();
        }

        protected void LnkNext_Click1(object sender, EventArgs e)
        {
            if (gvSavedList.PageIndex < gvSavedList.PageCount - 1)
            {
                gvSavedList.PageIndex++;
            }
            BindSavedList();
        }

        protected void LnkLast_Click1(object sender, EventArgs e)
        {
            gvSavedList.PageIndex = gvSavedList.PageCount - 1;
            BindSavedList();
        }


        protected void LnkFirst_Click2(object sender, EventArgs e)
        {
            gvSubmittedList.PageIndex = 0;
            BindSubmittedList();
        }

        protected void LnkPrev_Click2(object sender, EventArgs e)
        {
            if (gvSubmittedList.PageIndex > 0)
            {
                gvSubmittedList.PageIndex--;
            }
            BindSubmittedList();
        }

        protected void LnkNext_Click2(object sender, EventArgs e)
        {
            if (gvSubmittedList.PageIndex < gvSubmittedList.PageCount - 1)
            {
                gvSubmittedList.PageIndex++;
            }
            BindSubmittedList();
        }

        protected void LnkLast_Click2(object sender, EventArgs e)
        {
            gvSubmittedList.PageIndex = gvSubmittedList.PageCount - 1;
            BindSubmittedList();
        }


        private void ControlElementVisibility(string role)
        {
            hlUserManagement.Visible = (role == "3");
            liinputdata.Visible = (role == "2" || role == "3");
            h1inputdata.Visible = (role == "2" || role == "3");
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
    }
}