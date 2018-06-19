using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data.Entity.Validation;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Text;

public static class ORM
{
    static serilontEntities contexto = new serilontEntities();
    static String searchOpt = "";
    static String searchPat = "";
    static int scoreSel = 0;

    //Funció donar alta a usuari.
    public static String AltaUsuari(String username, String contrasenya, String email, String data)
    {
        string msg = "";

        Usuaris usu = new Usuaris();
        
        usu.username = username;
        usu.password = GetSHA1(contrasenya);
        usu.email = email;
        if (data != null && data != "")
        {
            usu.data_naixement = Convert.ToDateTime(data);
        }
        usu.img_src = "~/imatges/users/userimage.png";

        try
        {
            contexto.Usuaris.Add(usu);
            contexto.SaveChanges();
        }

        catch (InvalidOperationException ex)
        {
            msg = ex.InnerException.ToString();
        }
        catch (DbUpdateException ex)
        {
            SqlException sqlEx = (SqlException)ex.InnerException.InnerException;
            msg = throwSqlException(sqlEx);
            contexto.Usuaris.Remove(usu);
        }
        catch (DbEntityValidationException ex)
        {
            foreach (var eve in ex.EntityValidationErrors)
            {
                foreach (var ve in eve.ValidationErrors)
                {
                    Console.WriteLine("- Property: \"{0}\", Value: \"{1}\", Error: \"{2}\"",
                    ve.PropertyName,
                    eve.Entry.CurrentValues.GetValue<object>(ve.PropertyName),
                    ve.ErrorMessage);
                }
            }
            throw;
        }

        return msg;
    }

    //Convertir password a sha1
    public static string GetSHA1(string str)
    {
        SHA1 sha1 = SHA1Managed.Create();
        ASCIIEncoding encoding = new ASCIIEncoding();
        byte[] stream = null;
        StringBuilder sb = new StringBuilder();
        stream = sha1.ComputeHash(encoding.GetBytes(str));
        for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
        return sb.ToString();
    }

    //Buscar un usuari per nom i email
    public static List<Usuaris> buscarUsuariEmail(String nom, String email)
    {
        List<Usuaris> usu = null;
        try
        {
            usu =
                (from u in contexto.Usuaris
                 where u.username == nom || u.email == email
                 select u).ToList();
        }
        catch (SqlException) { }

        return usu;
    }

    //Buscar un usuari per nom i contrasenya
    public static Usuaris buscarUsuariContrasenya(String nom, String password)
    {
        Usuaris usu = null;
        var pwd = GetSHA1(password);

        try
        {
            usu =
                (from u in contexto.Usuaris
                 where u.username == nom && u.password == pwd
                 select u).FirstOrDefault();
        }
        catch (SqlException) { }

        return usu;
    }

    //Buscar un usuari per nom i contrasenya
    public static Usuaris buscarUsuariNom(String nom)
    {
        Usuaris usu = null;

        try
        {
            usu =
                (from u in contexto.Usuaris
                 where u.username == nom
                 select u).FirstOrDefault();
        }
        catch (SqlException) { }

        return usu;
    }

    //Buscar una serie pel nom
    public static Series buscarSerie(String nom)
    {
        Series se = null;
        try
        {
            se =
            (from s in contexto.Series
             where s.name == nom
             select s).FirstOrDefault();
        }
        catch (SqlException) { }

        return se;
    }

    //Buscar una serie per la id ("uuid")
    public static Series buscarSeriePerId(int id)
    {
        Series se = null;
        try
        {
            se =
            (from s in contexto.Series
             where s.id == id
             select s).FirstOrDefault();
        }
        catch (SqlException) { }

        return se;
    }

    //Buscar una serie pel camp nId
    public static Series buscarSeriePernId(int id)
    {
        Series se = null;
        try
        {
            se =
            (from s in contexto.Series
             where s.id == id
             select s).FirstOrDefault();
        }
        catch (SqlException) { }

        return se;
    }

    //Afegir/Eliminar una serie seguida per usuari
    public static String afegirEliminarSerie(Usuaris u, String nomSerie)
    {
        string msg = "";
        Series s = buscarSerie(nomSerie);

        if (s != null)
        {
            if (!u.Series.Contains(s))
            {
                try
                {
                    u.Series.Add(s);

                    contexto.SaveChanges();
                }
                catch (SqlException ex)
                {
                    msg = ex.ToString();
                    u.Series.Remove(s);
                    contexto.SaveChanges();
                }
            }
            else
            {
                u.Series.Remove(s);
                contexto.SaveChanges();
            }
        }

        return msg;
    }

    public static String actualitzarSerie(int id, string name, string plot, decimal score)
    {
        String msg = "";

        Series s = buscarSeriePerId(id);

        try
        {
            s.name = name;
            s.plot = plot;
            s.score = score;

            contexto.SaveChanges();
        }
        catch (SqlException ex)
        {
            Console.WriteLine(ex.ToString());
        }

        return msg;
    }

    public static String borrarSerie(int id)
    {
        String msg = "";
        Series s = buscarSeriePerId(id);

        try
        {
            contexto.Series.Remove(s);

            contexto.SaveChanges();
        }
        catch (SqlException ex)
        {
            msg = ex.ToString();
        }

        return msg;
    }

    public static String borrarUsuari(String username)
    {
        String msg = "";
        Usuaris u = buscarUsuariNom(username);

        try
        {
            contexto.Usuaris.Remove(u);

            contexto.SaveChanges();
        }
        catch (SqlException ex)
        {
            msg = ex.ToString();
        }

        return msg;
    }

    //Comprobar Serie donat un usuari
    public static bool comprobarSerie(Usuaris u, String nomSerie)
    {
        bool trobat = false;
        Series s = buscarSerie(nomSerie);

        if (s != null)
        {
            if (u.Series.Contains(s))
            {
                trobat = true;
            }
        }

        return trobat;
    }

    //Retornar una serie a partir d'un string
    public static String retornarSerie(String search)
    {
        Series serie = null;
        IQueryable<Series> series = from s in contexto.Series select s;
        
        series = series.Where(s => s.name.Contains(search));
        
        if (series.Count()>0) { 
            serie = series.FirstOrDefault();
        }

        return serie.name;
    }

    //Canviar imatge del perfil d'un usuari
    public static string changeImage(Usuaris u, String path)
    {
        String msg = "";
        
        u.img_src = path;

        try {
            contexto.SaveChanges();
        }
        catch (SqlException ex)
        {
            msg = ex.ToString();
        }

        return msg;
    }

    //Retornar llistat d'usuaris
    public static List<Usuaris> retornarUsuaris()
    {
        List<Usuaris> usuaris = null;

        try
        {
            usuaris = (from u in contexto.Usuaris select u).ToList();
        }
        catch (SqlException ex)
        {
            Console.Write(ex);
        }

        return usuaris;
    }

    //Retornar llistat de series a partir d'un string i una puntuació
    public static List<Series> retornarSeriesScore(int scr, String rbType)
    {
        List<Series> series = null;
            

        if (rbType == "Equal than")
        {
            series = (from s in contexto.Series where (s.score == scr) select s).ToList();
        }
        else if (rbType == "More than")
        {
            series = (from s in contexto.Series where (s.score > scr) select s).ToList();
        }
        else if (rbType == "Less than")
        {
            series = (from s in contexto.Series where (s.score < scr) select s).ToList();
        }

        return series;
    }

    //Retornar llistat de series a partir d'un string
    public static List<Series> retornarSeriesSearch(String search)
    {
        List<Series> series = new List<Series>();
        series = (from s in contexto.Series where s.name.Contains(search) select s).ToList();

        return series;
    }

    //Retorna la imatge de la serie
    public static String retornarImatgeUrl(Series serie)
    {
        if (!NetworkInterface.GetIsNetworkAvailable() || serie.img_src==null)
        {
            // Network is not available.
            return "~/imatges/series/default.png";
        }
        String url = "http://image.tmdb.org/t/p/w200/";
        url += serie.img_src;

        return url;
    }

    //Puntuar una serie
    public static String puntuarSerie(Usuaris usuari, Series serie, int userRating)
    {
        String msg = null;

        bool puntuada = comprobarPuntuacio(usuari,serie);

        if (!puntuada)
        {
            try
            {
                //Puntuació per a la serie
                if (serie.times_rated == null)
                {
                    serie.times_rated = 0;
                    if (serie.score > 0)
                    {
                        serie.times_rated += 1;
                    }
                }
                serie.total_score += userRating;
                serie.times_rated += 1;

                serie.score = serie.total_score / serie.times_rated;

                //Puntuacio d'usuari a serie
                msg = afegirPuntuacio(usuari,serie,userRating);

                if(msg==null)
                {
                    contexto.SaveChanges();
                    msg = "Your rating: " + userRating;
                }
                else
                {
                    return msg;
                }
            }
            catch (SqlException ex)
            {
                msg = ex.ToString();
            }
        }
        else
        {
            msg = "You have already rated this tv serie.";
        }

        return msg;
    }

    public static bool comprobarPuntuacio(Usuaris u, Series s)
    {
        Boolean resultat = false;
        List<Puntuacions> puntuacions = contexto.Puntuacions.ToList();

        foreach (Puntuacions puntuacio in puntuacions)
        {
            if(puntuacio.id_usuari == u.id_usuari && puntuacio.id_serie == s.id)
            {
                resultat = true;
            }
        }

        return resultat;
    }

    public static String afegirPuntuacio(Usuaris u, Series s, int userRating)
    {
        string msg = null;
        Puntuacions p = new Puntuacions();

        try
        {
            p.id_usuari = u.id_usuari;
            p.id_serie = s.id;
            p.score = userRating;

            contexto.Puntuacions.Add(p);
            contexto.SaveChanges();
        }
        catch (SqlException ex)
        {
            msg = ex.ToString();
        }

        return msg;
    }

    // Es crida des de Series, tipus de búsqueda per Puntuació.
    public static void setSeriesByScore(int score, String rbType)
    {
        searchOpt = rbType;
        scoreSel = score;

        searchPat = "";
    }

    // Es crida des de Series, tipus de búsqueda per Patró (String).
    public static void setSeriesBySearch(String search)
    {
        searchPat = search;

        scoreSel = 0;
        searchOpt = "";
    }

    // Es crida des de Llistat, segons tipus de búsqueda retorna un llistat o un altre.
    public static List<Series> getSeries()
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

    // Retorna missatge cridant a la classe ErrorsSQL.
    public static String throwSqlException(SqlException sqlEx)
    {
        return ErrorsSQL.MensajeSQL(sqlEx);
    }
}