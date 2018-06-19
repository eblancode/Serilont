using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public partial class Registre : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LabelError.Text = "";
    }

    //Funció per a registrar a un usuari.
    protected void ButtonRegistre_Click(object sender, EventArgs e)
    {
        String mensaje;
        String nomUsuari = TextBoxNomUsuari.Text;
        String pwd = TextBoxContrasenya.Text;
        String email = TextBoxEmail.Text;
        String date = TextBoxData.Text;

        //1.) at least 1 upper case character 2.) at least 1 lower case character 3.) at least 1 numerical character 
        //4.) at least 1 special character It also enforces a min and max length and works for .Net and script Regex implimentations.
        String regexPwd = "(?=^.{6,255}$)((?=.*\\d)(?=.*[A-Z])(?=.*[a-z])|(?=.*\\d)(?=.*[^A-Za-z0-9])(?=.*[a-z])|(?=.*[^A-Za-z0-9])(?=.*[A-Z])(?=.*[a-z])|(?=.*\\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9]))^.*";

        if (Regex.IsMatch(pwd, regexPwd) &&
            Regex.IsMatch(nomUsuari, "^[a-zA-Z]{4,9}$"))
        {
            List<Usuaris> _usuaris = ORM.buscarUsuariEmail(nomUsuari, email);

            if (_usuaris.Count > 0)
            {
                LabelError.ForeColor = System.Drawing.Color.Red;
                LabelError.Text = "Account already exists.";
            }
            else
            {
                mensaje = ORM.AltaUsuari(nomUsuari, pwd, email, date);

                if (mensaje == "")
                {
                    LabelError.ForeColor = System.Drawing.Color.Green;
                    LabelError.Text = "Account has been succesfully created.";
                }
                else
                {
                    LabelError.ForeColor = System.Drawing.Color.Red;
                    LabelError.Text = "Account could not be created. Check out the inputs.";
                }
            }

            LabelError.Visible = true;
            netejarDades();
        }
        else
        {
            LabelError.ForeColor = System.Drawing.Color.Red;
            LabelError.Text = "Account could not be created. Check out username and password input fields.";
        }
    }

    //Funció per a borrar text escrit per l'usuari
    private void netejarDades()
    {
        TextBoxEmail.Text = "";
        TextBoxNomUsuari.Text = "";
        TextBoxContrasenya.Text = "";
        TextBoxConfirmarContrasenya.Text = "";
    }

    //Funció que crida a pàgina login.
    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}