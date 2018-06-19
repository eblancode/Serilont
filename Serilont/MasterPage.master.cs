using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class MasterPage : System.Web.UI.MasterPage
{
    static Usuaris _usuari = null;
    static String searchOpt = "";
    static String searchPat = "";
    static int scoreSel = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Loguejar();
        string path = this.Page.Request.FilePath;

        if (path == "/index.aspx")
        {
            //ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "script", "$('footer .btnSound').css('visibility', 'visible');", false);
        }

        if (_usuari == null && (path != "/Login.aspx" && path != "/Register.aspx"))
        {
            Response.Redirect("Login.aspx");
        }
        else if (!IsPostBack)
        {
            profileImageMiniature.ImageUrl = _usuari.img_src;
        }
    }

    public void Loguejar()
    {
        _usuari = (Usuaris)Session["usuari"];
    }

    public void LogOut()
    {
        _usuari = (Usuaris)Session["usuari"];
        Session.Abandon();
        Session.Clear();
        Session.Remove("usuari");
        _usuari = null;
        Response.Redirect("Login.aspx");
    }

    // Es crida des de Series, tipus de búsqueda per Puntuació.
    public void setSeriesByScore(int score, String rbType) {
        searchOpt = rbType;
        scoreSel = score;

        searchPat = "";
    }

    // Es crida des de Series, tipus de búsqueda per Patró (String).
    public void setSeriesBySearch(String search)
    {
        searchPat = search;

        scoreSel = 0;
        searchOpt = "";
    }

    // Es crida des de Llistat, segons tipus de búsqueda retorna un llistat o un altre.
    public List<Series> getSeries()
    {
        List<Series> series = null;

        if (searchPat == "" && scoreSel != 0)
        {
            series = ORM.retornarSeriesScore(scoreSel, searchOpt);
        }
        else if (searchPat != "" && scoreSel == 0 && searchOpt == "")
        {
            series = ORM.retornarSeriesSearch(searchPat);
        }

        return series;
    }

}
