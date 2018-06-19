using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Random r = new Random();
        int[] randomId = new int[] {};
        randomId = new int[3] {
            r.Next(1, 500),
            r.Next(1, 500),
            r.Next(1, 500)
        };

        loadSeries(randomId);

        // Una vegada carregades les series, aquest script estableix l'altura dels elements.
        ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "script", "var elms = $('.col-md-4 .thumbnail .plot'); var maxHeight = 0; $.each(elms, function (i, elm) {" +
        "var elem = elm.getBoundingClientRect(); if (elem.height > maxHeight) { maxHeight = elem.height; } });  $('.col-md-4 .thumbnail .plot').filter(function () { return $(this); }).height(maxHeight);", true);
    }

    //Carregar series donats uns números aleatoris que fan referencia a la id
    protected void loadSeries(int[] rId)
    {
        List<Series> s = new List<Series>();
        s.Add(ORM.buscarSeriePerId(rId[0]));
        s.Add(ORM.buscarSeriePerId(rId[1]));
        s.Add(ORM.buscarSeriePerId(rId[2]));

        LabelTitle.Text = s[0].name;
        LabelPlot.Text = s[0].plot;

        LabelTitle1.Text = s[1].name;
        LabelPlot1.Text = s[1].plot;

        LabelTitle2.Text = s[2].name;
        LabelPlot2.Text = s[2].plot;

        ImageSerie.ImageUrl = ORM.retornarImatgeUrl(s[0]);
        ImageSerie1.ImageUrl = ORM.retornarImatgeUrl(s[1]);
        ImageSerie2.ImageUrl = ORM.retornarImatgeUrl(s[2]);

        rating.CurrentRating = (int)s[0].score;
        rating1.CurrentRating = (int)s[1].score;
        rating2.CurrentRating = (int)s[2].score;
    }
}
