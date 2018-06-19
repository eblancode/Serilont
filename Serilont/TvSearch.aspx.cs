using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TvSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillDdl();
        }
    }

    //Funció per a reomplir el dropdownlist de l'any
    protected void fillDdl()
    {
        DropDownListYear.DataSource = Enumerable.Range(1940, 79);
        DropDownListYear.DataBind();
    }

    //Funció per a mostrar/amagar el criteri de any
    protected void DropDownListSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListSearch.SelectedItem.Text != "TVShows" && DropDownListSearch.SelectedItem.Text != "Movies")
        {
            DropDownListYear.SelectedIndex = 0;
            DropDownListYear.Enabled = false;
            ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "$('#colFiltres').hide();", true);
        } 
        else
        {
            DropDownListYear.Enabled = true;
            ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "$('#colFiltres').show()", true);
        }
    }
}