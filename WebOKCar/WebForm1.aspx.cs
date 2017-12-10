using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebOKCar
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void BtnHome_Click(object sender, EventArgs e)
        {
            //首頁
            MultiView1.ActiveViewIndex = 0;
        }

        protected void BtnEmployee_Click(object sender, EventArgs e)
        {
            //登錄員工資料
            MultiView1.ActiveViewIndex = 1;
        }

        protected void BtnGoods_Click(object sender, EventArgs e)
        {
            //登錄貨品資料
            MultiView1.ActiveViewIndex = 2;
        }

        protected void BtnBusiness_Click(object sender, EventArgs e)
        {
            //登錄銷售資料
            MultiView1.ActiveViewIndex = 3;
        }

        protected void BtnTable_Click(object sender, EventArgs e)
        {
            //銷售清單
            MultiView1.ActiveViewIndex = 4;
        }

        protected void BtnInquire_Click(object sender, EventArgs e)
        {
            //個人業績查詢
            MultiView1.ActiveViewIndex = 5;
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["姓名"].DefaultValue = TxtName.Text;
            SqlDataSource1.InsertParameters["職稱"].DefaultValue =
                                                       DdlPT.SelectedItem.Value;
            SqlDataSource1.InsertParameters["性別"].DefaultValue =
                                                       RblSex.SelectedItem.Value;
            SqlDataSource1.InsertParameters["底薪"].DefaultValue = TxtSalary.Text;
            SqlDataSource1.Insert();
            BtnCls_Click(sender, e);
        }

        private void BtnCls_Click(object sender, EventArgs e)
        {
            TxtName.Text = "";
            TxtSalary.Text = "";
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType==DataControlRowType.DataRow)
            {
                float gain = 0;
                gain = Convert.ToSingle(e.Row.Cells[4].Text) *
                            Convert.ToSingle(e.Row.Cells[5].Text);
                e.Row.Cells[6].Text = "NT$" + gain.ToString("#,#");
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType==DataControlRowType.DataRow)
            {
                float gain1 = 0;
                gain1 = Convert.ToSingle(e.Row.Cells[2].Text) *
                                    Convert.ToSingle(e.Row.Cells[3].Text);
                e.Row.Cells[4].Text = gain1.ToString("#,#");
            }
            if(e.Row.RowType==DataControlRowType.Footer)
            {
                float gain2 = 0;
                if(GridView3.Rows.Count>0)
                {
                    for(int i=0; i<GridView3.Rows.Count;i++)
                    {
                        gain2 += Convert.ToSingle(GridView3.Rows[i].Cells[4].Text);
                    }
                    e.Row.Cells[3].Text = "佣金小計";
                    e.Row.Cells[4].Text = "NT$" + gain2.ToString("#,#");
                }
            }
        }
    }
}