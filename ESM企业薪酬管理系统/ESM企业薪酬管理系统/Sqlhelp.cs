using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Drawing;

namespace ESM企业薪酬管理系统
{
    public class Sqlhelp
    {
        string strCon = "server=LAPTOP-EAIQCRK8;database=EMS;uid=jjww;pwd=jjww";
        public int execSql(string strSql, SqlParameter[] parameters)
{
    using (SqlConnection mCon = new SqlConnection(strCon))
    using (SqlCommand mCmd = new SqlCommand(strSql, mCon))
    {
        try
        {
            if (parameters != null)
            {
                mCmd.Parameters.AddRange(parameters);
            }
            mCon.Open();
            int result = mCmd.ExecuteNonQuery();
            System.Diagnostics.Debug.WriteLine($"执行成功: {strSql}, 影响行数: {result}");
            return result;
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"执行失败: {strSql}, 参数: {string.Join(",", parameters?.Select(p => $"{p.ParameterName}={p.Value}"))}, 错误: {ex.Message}");
            throw;
        }
    }
}

        // 新增方法：用于执行返回单个值的查询(如COUNT(*))
        public object ExecuteScalar(string strSql, SqlParameter[] parameters)
        {
            using (SqlConnection mCon = new SqlConnection(strCon))
            using (SqlCommand mCmd = new SqlCommand(strSql, mCon))
            {
                try
                {
                    if (parameters != null && parameters.Length > 0)
                    {
                        mCmd.Parameters.AddRange(parameters);
                    }
                    mCon.Open();
                    return mCmd.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"执行标量查询出错: {strSql}, 错误: {ex.Message}");
                    throw new Exception($"执行标量查询时出错: {ex.Message}", ex);
                }
            }
        }
        public DataSet getDs(string strSql, SqlParameter[] parameters)
        {
            SqlConnection mCom = new SqlConnection(strCon);
            SqlDataAdapter mDap = new SqlDataAdapter(strSql, mCom);
            if (parameters != null && parameters.Length > 0)
            {
                mDap.SelectCommand.Parameters.AddRange(parameters);
            }
            DataSet mDs = new DataSet();
            try
            {
                mCom.Open();
                mDap.Fill(mDs);
            }
            catch (Exception ex)
            {
                // 处理异常，例如记录日志
                throw new Exception($"执行查询时出错: {ex.Message}", ex);

            }
            finally
            {
                mCom.Close();
            }
            return mDs;
        }
    }
}