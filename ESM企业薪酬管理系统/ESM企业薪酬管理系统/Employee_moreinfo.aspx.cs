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
    public partial class Employee_moreinfo : System.Web.UI.Page
    {
        public string EmpId { get; set; }
        public string EmpName { get; set; }
        public string Dept { get; set; }
        public string BirthDate { get; set; }
        public string IdCard { get; set; }
        public string Position { get; set; }
        public string Level { get; set; }
        public string Email { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public string Address { get; set; }
        Sqlhelp sh=new Sqlhelp();
        protected void Page_Load(object sender, EventArgs e)
        {
            EmpId = Request.QueryString["empId"];
            // 检查 EmpId 是否为空
            if (string.IsNullOrEmpty(EmpId))
            {
                // 处理 EmpId 为空的情况，例如显示错误信息
                Response.Write("错误：未提供有效的员工 ID。");
                return;
            }

            // 连接数据库并查询员工信息
            string query = "SELECT empName, deptName, birthday, IDCard, postName, [level], Mail, Tel1, Tel2, address FROM Employee WHERE empId = @EmpId";
            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@EmpId", EmpId)
            };
            try
            {
                DataSet ds = sh.getDs(query, parameters);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    EmpName = row["empName"].ToString();
                    Dept = row["deptName"].ToString();
                    BirthDate = row["birthday"].ToString();
                    IdCard = row["IDCard"].ToString();
                    Position = row["postName"].ToString();
                    Level = row["level"].ToString();
                    Email = row["Mail"].ToString();
                    Phone1 = row["Tel1"].ToString();
                    Phone2 = row["Tel2"].ToString();
                    Address = row["address"].ToString();
                }
            }
            catch (Exception ex)
            {
                // 处理异常
                Response.Write($"Error: {ex.Message}");
            }
        }
        }
    }
