using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Llistat : System.Web.UI.Page
{
    static Usuaris _usuari = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        MasterPage m = new MasterPage();
        _usuari = (Usuaris)Session["usuari"];

        try
        {
            List<Series> s = new List<Series>();

            s = ORM.getSeries();
            int indexID = 0;

            foreach (var i in s)
            {
                loadSerie(i, indexID);
                indexID += 1;

                //Set limit
                if(indexID == 6)
                {
                    break;
                }
            }
        }
        catch
        { return; }

        String[] btnIDs = new String[5];
        String[] nomSeries = new String[5];
        for (int i = 0; i < 5; i++)
        {
            nomSeries[i] = "LabelTitle" + i.ToString();
            btnIDs[i] = "FollowButton" + i.ToString();

            System.Web.UI.WebControls.Label lbl;
            lbl = (System.Web.UI.WebControls.Label)PanelContent.FindControl(nomSeries[i]);

            comprobarSeguimentSerie(lbl.Text, btnIDs[i]);
        }
    }

    protected void loadSerie(Series serie, int indexID)
    {
        //Load elements with index as reference
        s1.Visible = true;  s2.Visible = true; s3.Visible = true; s4.Visible = true; s5.Visible = true; s6.Visible = true;

        System.Web.UI.WebControls.Label lblTitle, lblPlot;
        lblTitle = (System.Web.UI.WebControls.Label)PanelContent.FindControl("LabelTitle" + indexID);
        lblPlot = (System.Web.UI.WebControls.Label)PanelContent.FindControl("LabelPlot" + indexID);

        System.Web.UI.WebControls.Image img;
        img = (System.Web.UI.WebControls.Image)PanelContent.FindControl("ImageSerie" + indexID);

        AjaxControlToolkit.Rating r = new AjaxControlToolkit.Rating();
        r = (AjaxControlToolkit.Rating)PanelContent.FindControl("rating" + indexID);
        //Load data form Series
        try
        {
            lblTitle.Text = serie.name;
            lblPlot.Text = serie.plot;
            img.ImageUrl = ORM.retornarImatgeUrl(serie);
            r.CurrentRating = (int)serie.score;
        }
        catch { return; }
    }

    protected void FollowButton_Click(object sender, EventArgs e)
    {
        LinkButton l = (LinkButton) sender;
        String id = l.ID;
        char idx = id[id.Length - 1];

        System.Web.UI.WebControls.Label lB;
        lB = (System.Web.UI.WebControls.Label)PanelContent.FindControl("LabelTitle"+idx);

        //Si l'usuari segueix serie seleccionada el botó cambia a default/primary amb text = unfollow
        String nomSerie = lB.Text;

        //Series serie = ORM.buscarSerie(nomSerie);
        ORM.afegirEliminarSerie(_usuari, nomSerie);
        comprobarSeguimentSerie(nomSerie, id);
    }

    public void comprobarSeguimentSerie(String nomSerie, String btnID)
    {
        bool trobat = ORM.comprobarSerie(_usuari, nomSerie);
        System.Web.UI.WebControls.LinkButton lB;
        lB = (System.Web.UI.WebControls.LinkButton)PanelContent.FindControl(btnID);

        if (lB != null)
        {
            if (trobat)
            {
                lB.ToolTip = "Unfollow";
                lB.Text = "<span aria-hidden='true' class='glyphicon glyphicon-eye-close'></span>";
            }
            else
            {
                lB.ToolTip = "Follow";
                lB.Text = "<span aria-hidden='true' class='glyphicon glyphicon-eye-open'></span>";
            }
        }
    }
}