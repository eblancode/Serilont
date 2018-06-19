using System;

public partial class Toprated : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            fillDdl();
        }
    }

    private void fillDdl()
    {
        DropDownListYear.DataSource = System.Linq.Enumerable.Range(1940, 79);
        DropDownListYear.DataBind();
    }
}