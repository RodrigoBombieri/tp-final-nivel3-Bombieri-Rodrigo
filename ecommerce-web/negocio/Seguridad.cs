using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public static class Seguridad
    {
        public static bool sesionActiva(Object obj)
        {
            Usuario usuario = obj != null ? (Usuario)obj : null;
            if (usuario != null && usuario.Id != 0)
                return true;
            else
                return false;
        }

        public static bool esAdmin(Object obj)
        {
            Usuario usuario = obj != null ? (Usuario)obj : null;
            return usuario != null ? usuario.Admin : false;
        }
    }
}
