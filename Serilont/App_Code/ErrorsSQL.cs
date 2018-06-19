using System;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de ErrorsSQL
/// </summary>
public static class ErrorsSQL
{
    //Funció que retorna un missatge o un altre depenent del tipus de exepció
    public static String MensajeSQL(SqlException sqlEx)
    {
        String mensaje = "";

        switch (sqlEx.Number)
        {
            case 547:
                mensaje = "Can not be deleted as have some related registers.";
                break;
            case 2627:
                mensaje = "This register already exsists.";
                //contexto.usuaris.Remove(usuari);
                break;
            case 2601:
                mensaje = "It could not be registers as it would be repeated.";
                break;
            default:
                mensaje = sqlEx.Number + " - " + sqlEx.Message;
                break;
        }
        return mensaje;
    }
}