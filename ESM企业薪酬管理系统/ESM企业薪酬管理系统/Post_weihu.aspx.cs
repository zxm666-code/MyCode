using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ESM企业薪酬管理系统
{
    public partial class Post_weihu : System.Web.UI.Page
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
                string query = "SELECT postId,postName, deptName, postDes FROM Position where 1=1";

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

        // 批量删除
        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            List<string> selectedPostIDs = GetSelectedPostIDs();

            if (selectedPostIDs.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('请至少选择一条要删除的记录！');", true);
                return;
            }

            try
            {
                int deletedCount = DeleteSelectedPosts(selectedPostIDs);

                string message = deletedCount > 0
                    ? $"成功删除 {deletedCount} 条记录！"
                    : "删除失败，可能记录已不存在！";

                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);

                if (deletedCount > 0)
                {
                    BindGridView(); // 重新绑定数据
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    $"alert('删除出错: {HttpUtility.JavaScriptStringEncode(ex.Message)}');", true);
            }
        }

        private List<string> GetSelectedPostIDs()
        {
            List<string> selectedIDs = new List<string>();

            foreach (GridViewRow row in gvPosts.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                HiddenField hfPostID = (HiddenField)row.FindControl("hfPostID");

                if (chkSelect != null && hfPostID != null && chkSelect.Checked)
                {
                    selectedIDs.Add(hfPostID.Value);
                }
            }

            return selectedIDs;
        }

        private int DeleteSelectedPosts(List<string> postIDs)
        {
            if (postIDs == null || postIDs.Count == 0)
                return 0;

            string strSql = "DELETE FROM Position WHERE postID IN ({0})";
            string paramNames = string.Join(",", postIDs.Select((id, index) => "@postID" + index));

            SqlParameter[] parameters = postIDs
                .Select((id, index) => new SqlParameter("@postID" + index, SqlDbType.VarChar)
                {
                    Value = id
                })
                .ToArray();

            
            return sh.execSql(string.Format(strSql, paramNames), parameters);
        }
        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkAll = (CheckBox)gvPosts.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in gvPosts.Rows)
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
            string postID = btn.CommandArgument;
            string strSql = "DELETE FROM Position WHERE postID = @postID";
            // 创建参数数组
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@postID", SqlDbType.NVarChar, 50) { Value = postID }
            };

            // 使用execSql方法（需要你在Sqlhelp类中添加带参数的重载）
            int i = sh.execSql(strSql, parameters);

            if (i > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('删除成功！');", true);
                BindGridView();// 重新绑定数据
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('删除失败，可能记录已不存在！');", true);
            }
        }
       
        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            gvPosts.PageIndex = 0;
            BindGridView();
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            if (gvPosts.PageIndex > 0)
            {
                gvPosts.PageIndex--;
            }
            BindGridView();
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            if (gvPosts.PageIndex < gvPosts.PageCount - 1)
            {
                gvPosts.PageIndex++;
            }
            BindGridView();
        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
            gvPosts.PageIndex = gvPosts.PageCount - 1;
            BindGridView();
        }
    }
}