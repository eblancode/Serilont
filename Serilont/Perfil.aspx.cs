using System;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections.Generic;
using System.Web.UI;
using System.Linq;
using System.Text;
using System.Data;

public partial class Perfil : System.Web.UI.Page
{
    static serilontEntities sE = new serilontEntities();
    static Usuaris _usuari = null;
    static List<Series> series = null;
    static List<Usuaris> usuaris = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Assignació variable usuari
        _usuari = (Usuaris)Session["usuari"];

        //Mostrar dades d'usuari
        if (_usuari != null)
        {
            LabelUsernameProfile.Text = _usuari.username;
            LabelEmailProfile.Text = _usuari.email;

            if (_usuari.img_src != null) {
                profileImage.ImageUrl = _usuari.img_src;
            }
            if (_usuari.data_naixement != null)
            {
                LabelDataProfile.Text = DateTime.Parse(_usuari.data_naixement.ToString()).ToString("dd/MM/yyyy");
            }
            else
            {
                LabelDataProfile.Text = "";
            }

            //Si es admin visualitza altres opcions extra
            if (_usuari.id_usuari == 1)
            {
                GridViewSeries.Columns[3].Visible = true;
                GridViewSeries.Columns[4].Visible = true;

                PanelSeriesAdmin.Visible = true;
                LinkButtonDisplayUsers.Visible = true;
            }

            if (!IsPostBack)
            {
                CarregarGridSeries();
            }
        }

        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    //Funció per carregar la grid amb les series que segueix l'usuaris
    private void CarregarGridSeries()
    {
        series = _usuari.Series.ToList();

        GridViewSeries.DataSource = series;
        GridViewSeries.DataBind();
    }

    private void CarregarGridTotesSeries()
    {
        series = ORM.retornarSeriesSearch("");

        GridViewSeries.Columns[6].Visible = false;
        GridViewSeries.DataSource = series;
        GridViewSeries.DataBind();
    }

    private void CarregarGridSeriesVar()
    {
        if (!CheckBoxSeries.Checked)
        {
            CarregarGridSeries();
        }
        else
        {
            CarregarGridTotesSeries();
        }
    }

    //Funció carregar grid usuaris
    private void CarregarGridUsuaris()
    {
        usuaris = ORM.retornarUsuaris();
        
        GridViewUsers.DataSource = usuaris;
        GridViewUsers.DataBind();
    }

    //Funció per a mostrar la taula d'usuaris
    protected void LinkButtonDisplayUsers_Click(object sender, EventArgs e)
    {
        if (!GridViewUsers.Visible)
        {
            CarregarGridUsuaris();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "call", "changePasswordFields()", true);
            GridViewUsers.Visible = true;
        }
        else
        {
            GridViewUsers.Visible = false;
        }
    }

    //Funció que crida altre funció a la masterpage per a fer logout
    protected void LinkButtonLogOut_Click(object sender, EventArgs e)
    {
        //Cridar métode de MasterPage per desloguejar
        (this.Master as MasterPage).LogOut();
    }

    //Al apretar el botó de esborrar, el usuari deixa de seguir la serie i s'esborra de la grid
    protected void GridViewSeries_OnUnfollow(object sender, EventArgs e)
    {
        //Obtenir fila seleccionada i assignar nom de la serie
        GridViewRow gr = GridViewSeries.SelectedRow;
        String nom = GridViewSeries.Rows[gr.RowIndex].Cells[1].Text;

        //Eliminar serie i actualitzar bd
        ORM.afegirEliminarSerie(_usuari,nom);
        CarregarGridSeries();
        CheckBoxSeries.Checked = false;
    }

    //Al apretar el botó d'editar
    protected void GridViewSeries_OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewSeries.EditIndex = e.NewEditIndex;
        GridViewSeries.DataBind();

        if (!CheckBoxSeries.Checked) { 
            CarregarGridSeries();
        }
        else
        {
            CarregarGridTotesSeries();
        }
    }
    
    //Al apretar el botó de cancelar edició, recarrega la grid al seu estat original.
    protected void GridViewSeries_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewSeries.EditIndex = -1;
        Response.CacheControl = "no-cache";
        GridViewSeries.DataBind();
        if (!CheckBoxSeries.Checked)
        {
            CarregarGridSeries();
        }
        else
        {
            CarregarGridTotesSeries();
        }
    }

    //Al apretar el botó de actualitzar, actualitzar la bd segons les dades de la grid i recarrega aquesta.
    protected void GridViewSeries_OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //Update the values.
        GridViewRow row = GridViewSeries.Rows[e.RowIndex];

        int id          = int.Parse(((TextBox)(row.Cells[0].Controls[0])).Text);
        string name     = ((TextBox)(row.Cells[1].Controls[0])).Text;
        string plot     = ((TextBox)(row.Cells[2].Controls[0])).Text;
        decimal score   = Decimal.Parse(((TextBox)(row.Cells[3].Controls[0])).Text);

        string msg = ORM.actualitzarSerie(id, name, plot, score);

        if (msg != null)
        {
            CarregarGridSeriesVar();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "alert('Error on editing TV Serie.');", true);
        }
        else
        {
            //Reset the edit index.
            GridViewSeries.EditIndex = -1;

            //Bind data to the GridView control.
            GridViewSeries.DataBind();

            CarregarGridSeriesVar();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "alert('TV Serie has been edited.');", true);
        }
    }

    //Al apretar el botó de borrar, elimina aquesta de la BD.
    protected void GridViewSeries_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridViewSeries.Rows[e.RowIndex];

        int id = int.Parse(row.Cells[0].Text);

        string resultat = ORM.borrarSerie(id);
        if (resultat != null)
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "alert('Error! TV Serie has not been deleted.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "alert('TV Serie has been deleted.');", true);
        }

        GridViewSeries.DataBind();
        CarregarGridSeriesVar();
    }

    //Al apretar el botó de borrar, elimina aquesta de la BD.
    protected void GridViewUsers_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridViewUsers.Rows[e.RowIndex];
        
        string username = row.Cells[0].Text;

        string resultat = ORM.borrarUsuari(username);
        if (resultat != null)
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "alert('Error! user has not been deleted.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "alert('User has been deleted.');", true);
        }

        GridViewUsers.DataBind();
        CarregarGridUsuaris();
    }

    //Paginació de la grid
    protected void GridViewSeries_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        int tst = e.NewPageIndex;
        GridViewSeries.PageIndex = e.NewPageIndex;
        GridViewSeries.DataSource = series;
        GridViewSeries.DataBind();
    }

    //Paginació de la grid
    protected void GridViewUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        int tst = e.NewPageIndex;
        GridViewUsers.PageIndex = e.NewPageIndex;
        GridViewUsers.DataSource = usuaris;
        GridViewUsers.DataBind();
    }

    //Al clicar a canviar la imatge
    protected void changeImage_Click(object sender, EventArgs e)
    {
        //Accions canvi d'imatge
        TextBoxURL.Visible = true;
        ButtonURL.Visible = true;
    }

    //Funcio Canvi d'imatge
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string res = "";
        if (FileUpload.HasFile)
        {
            string fileName = Path.GetFileName(FileUpload.PostedFile.FileName);
            FileUpload.Width = 202;
            FileUpload.Height = 187;
            FileUpload.PostedFile.SaveAs(Server.MapPath("~/imatges/users/") + fileName);
            res = ORM.changeImage(_usuari, "~/imatges/users/"+fileName);
            if (res!="") { 
                LabelTxt.Text = res;
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
    
    //Mostrar series
    protected void CheckBoxSeries_CheckedChanged(object sender, EventArgs e)
    {
        if(CheckBoxSeries.Checked)
        {
            CarregarGridTotesSeries();
        }
        else
        {
            GridViewSeries.Columns[6].Visible = true;
            CarregarGridSeries();
        }
    }
}