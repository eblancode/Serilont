using System;
using System.Web.UI;
using System.Text.RegularExpressions;

public partial class Login : System.Web.UI.Page
{
    static Usuaris _usuari;

    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, typeof(Page), "UpdateMsg",
            "$('#pnlModal').modal('show');", true);
    }

    //Funció per a loguejar
    protected void ButtonEntrar_Click(object sender, EventArgs e)
    {
        _usuari = null;
        string nomUsuari = TextBoxNomUsuari.Text;
        string pwd = TextBoxContrasenya.Text;
        String regexPwd = "(?=^.{6,255}$)((?=.*\\d)(?=.*[A-Z])(?=.*[a-z])|(?=.*\\d)(?=.*[^A-Za-z0-9])(?=.*[a-z])|(?=.*[^A-Za-z0-9])(?=.*[A-Z])(?=.*[a-z])|(?=.*\\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9]))^.*";

        if (Regex.IsMatch(pwd, regexPwd))
        {
            if (Regex.IsMatch(nomUsuari, "^[a-zA-Z]{4,9}$"))
            {
                _usuari = ORM.buscarUsuariContrasenya(nomUsuari, pwd);

                if (_usuari != null)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "document.getElementById('alertError').style.display = 'none';", true);

                    Session["usuari"] = _usuari;
                    _usuari = (Usuaris)Session["usuari"];

                    Response.Redirect("index.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "document.getElementById('alertError').style.display = 'inline-block';", true);
                    LabelError.Text = "Wrong user or password. Please check out again your credentials.";
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "document.getElementById('alertError').style.display = 'inline-block';", true);
                LabelError.Text = "Invalid username.";
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "document.getElementById('alertError').style.display = 'inline-block';", true);
            LabelError.Text = "Invalid password." + "<br/>" + "- Must not contain username." + "<br/>" + "- It must be between 6 and 10 characters, contain at least one digit and one alphabetic character, and must not contain special characters.";
        }

        try
        {
            _usuari = ORM.buscarUsuariContrasenya(nomUsuari, pwd);
        }
        catch {}

        if (_usuari != null)
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "script", "document.getElementById('alertError').style.display = 'none';", true);

            Session["usuari"] = _usuari;
            _usuari = (Usuaris)Session["usuari"];

            Response.Redirect("index.aspx");
        }

        netejarDades();
    }

    //Funció que crida a pàgina registre
    protected void ButtonRegistre_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registre.aspx");
    }

    //Funció per a netejar text escrit per l'usuari
    private void netejarDades()
    {
        TextBoxNomUsuari.Text = "";
        TextBoxContrasenya.Text = "";
    }
}