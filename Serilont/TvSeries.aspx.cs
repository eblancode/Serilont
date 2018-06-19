using System;
using System.Reflection.Emit;
using System.Web.UI;

public partial class TvSeries : System.Web.UI.Page
{
    Usuaris _usuari;
    Series serie;
    static String plot = "";
    static bool justRated = false;
    static bool displayed = false;
    static int userRating = -1;
    public static String resultat = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        _usuari = (Usuaris)Session["usuari"];
        displayHideSerie(IsPostBack);
    }

    //Funció per cridar altres funcions segons criteris
    protected void displayHideSerie(bool postBack)
    {
        if (!postBack)
        {
            hideSerie();
            initialize();
        }
        else if (DropDownListSeries.SelectedItem != null && DropDownListSeries.SelectedIndex != 0 || !displayed)
        {
            displaySerie();
        }
    }

    //Funció per carregar la Serie seleccionada al lloc web
    protected void loadSerie(String nomSerie)
    {
        serie = ORM.buscarSerie(nomSerie);
        int id = serie.id;

        LabelNomSerie.Text = nomSerie;

        comprobarSeguimentSerie(_usuari, nomSerie);

        plot = serie.plot;
        if (plot != "")
        {
            LabelPlot.Text = plot;
        }
        else
        {
            plot = "Default text.";
            LabelPlot.Text = plot;
        }

        try
        {
            ImageSerie.ImageUrl = ORM.retornarImatgeUrl(serie);
        }
        catch
        {
            ImageSerie.ImageUrl = "imatges/series/default.png";
        }

        Decimal d = (Decimal)serie.score;
        String scoreString = d.ToString("#.##");

        rating.CurrentRating = (int)serie.score;
        rating.DataBind();

        rating.ToolTip = scoreString;
        LabelRating.Text = scoreString;
        
        initialize();
    }

    protected void DropDownListSeries_Changed(object sender, EventArgs e)
    {
        if (DropDownListSeries.SelectedItem != null && DropDownListSeries.SelectedIndex != 0)
        {
            loadSerie(DropDownListSeries.SelectedItem.Text);
            initialize();
        }
    }

    //Funció per buscar serie/series segons criteris de cerca
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        if (TextBoxSeries.Text != "")
        {
            if (RadioButtonListSearch.SelectedItem.Text == "Single")
            {
                //Single
                DropDownListSeries.SelectedIndex = 0;
                String nSerie = ORM.retornarSerie(TextBoxSeries.Text);
                if (nSerie != "")
                {
                    loadSerie(nSerie);
                    displaySerie();
                }
                else
                {
                    hideSerie();
                }
            }
            else
            {
                //Multiple
                DropDownListSeries.SelectedIndex = 0;
                var nSerie = ORM.retornarSerie(TextBoxSeries.Text);
                if (nSerie != "" && nSerie != null)
                {
                    ORM.setSeriesBySearch(TextBoxSeries.Text);
                    Response.Redirect("Llistat.aspx");
                }
                else
                {
                    refresh();
                }
            }
        }

        initialize();
    }

    //Funció per cercar serie per puntuació
    protected void ButtonScore_Click(object sender, EventArgs e)
    {
        if (DropDownListScore.SelectedValue != "")
        {
            ORM.setSeriesByScore(DropDownListScore.SelectedIndex, RadioButtonListScore.SelectedItem.Text);
            Response.Redirect("Llistat.aspx");
        }
        else
        {
            refresh();
        }
    }

    //Sembla ser que no funciona correctament
    public void rating_Changed(object sender, AjaxControlToolkit.RatingEventArgs ev)
    {
        String nomSerie = LabelNomSerie.Text;

        if (!justRated)
        {
            //Obtindre num de ".filled" per tal de saber el rating del usuari
            userRating = int.Parse(ev.Value.ToString());
            serie = ORM.buscarSerie(nomSerie);

            rating.CurrentRating = userRating;
            rating.DataBind();

            justRated = true;
        }
    }

    //Funció per seguir/deixar de seguir serie
    protected void FollowButton_Click(object sender, EventArgs e)
    {
        //Si l'usuari segueix serie seleccionada el botó cambia a default/primary amb text = unfollow
        String nomSerie = LabelNomSerie.Text;

        //Series serie = ORM.buscarSerie(nomSerie);
        ORM.afegirEliminarSerie(_usuari, nomSerie);
        comprobarSeguimentSerie(_usuari, nomSerie);

        initialize();
    }

    //Funció per comprobar si el ususari segueix o no la serie
    public void comprobarSeguimentSerie(Usuaris u, String str)
    {
        bool trobat = ORM.comprobarSerie(u, str);

        if (trobat)
        {
            FollowButton.CssClass = "btn btn-success";
            FollowButton.Text = "Unfollow";
        }
        else
        {
            FollowButton.CssClass = "btn btn-primary";
            FollowButton.Text = "Follow";
        }
    }

    //Amagar serie
    protected void hideSerie()
    {
        ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "document.getElementById('displaySerie').style.display = 'none'; document.getElementById('separator').style.marginBottom = '30%';", true);
        DropDownListSeries.SelectedIndex = 0;
        DropDownListSeries.SelectedItem.Selected = true;
        displayed = false;
    }

    //Mostrar serie
    protected void displaySerie()
    {
        ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "document.getElementById('displaySerie').style.display = 'inline'; document.getElementById('displaySerie').style.marginBottom = '15%'; document.getElementById('separator').style.marginBottom = '0%';", true);
        UpdatePanel.Visible = true;
        displayed = true;
    }

    //Inicialitzar serie
    public void initialize()
    {
        justRated = false;
        userRating = -1;
        TextBoxSeries.Text = "";
    }

    //Refrescar pàgina
    public void refresh()
    {
        Response.Redirect("TVSeries.aspx");
    }

    protected void btn_rating_click(object sender, EventArgs e)
    {
        serie = ORM.buscarSerie(LabelNomSerie.Text);

        resultat = ORM.puntuarSerie(_usuari, serie, userRating);

        rating.CurrentRating = (int)serie.score;
        rating.DataBind();
        
        Decimal d = (Decimal)serie.score;
        String scoreString = d.ToString("#.##");
        LabelRating.Text = scoreString;

        LabelRatingUser.Text = resultat;
        resultat = "";
    }
}