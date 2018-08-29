using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SiteTCC
{
    public partial class index : System.Web.UI.Page
    {
        Conexao con = new Conexao();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindListView();
            }
        }

        protected void btnMarcas_Click(object sender, EventArgs e)
        {

        }

        private void BindListView()
        {
            con = new Conexao();
            dt = new DataTable();
            dt = con.executa_sql("select * from produto");
            lstProdutos.DataSource = dt;
            lstProdutos.DataBind();
        }

        protected void lstProdutos_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindListView();    
        }
    }
}