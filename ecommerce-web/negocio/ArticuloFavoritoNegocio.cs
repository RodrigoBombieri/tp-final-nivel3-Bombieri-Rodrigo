using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class ArticuloFavoritoNegocio
    {
        public List<int> listarFavoritos(int idUser)
        {
            AccesoDatos datos = new AccesoDatos();
            List<int> lista = new List<int>();

            try
            {
                datos.setearConsulta("Select IdArticulo from FAVORITOS where IdUser = @idUser");
                datos.setearParametro("idUser", idUser);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    int aux = (int)datos.Lector["idArticulo"];
                    lista.Add(aux);
                }

                datos.cerrarConexion();
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void insertarFavorito(ArticuloFavorito nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select count(*) FROM FAVORITOS Where IdUser = @idUser AND IdArticulo = @idArticulo");
                datos.setearParametro("idUser", nuevo.IdUser);
                datos.setearParametro("idArticulo", nuevo.IdArticulo);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    int cantidad = Convert.ToInt32(datos.Lector[0]);
                    if (cantidad > 0)
                    {
                        datos.cerrarConexion();
                        return;
                    }
                }

                datos.cerrarConexion();
                datos = new AccesoDatos();
                datos.setearConsulta("Insert into FAVORITOS (IdUser, IdArticulo) VALUES (@idUser, @idArticulo)");
                datos.setearParametro("@idUser", nuevo.IdUser);
                datos.setearParametro("idArticulo", nuevo.IdArticulo);
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void eliminarFavorito(int idArticulo, int idUser)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("Delete from FAVORITOS Where IdArticulo = @idArticulo AND IdUser = @idUser");
                datos.setearParametro("idArticulo", idArticulo);
                datos.setearParametro("idUser", idUser);
                datos.ejecutarLectura();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void eliminarFavorito(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearConsulta("delete from FAVORITOS Where IdArticulo = @idArticulo");
            datos.setearParametro("@idArticulo", id);
            datos.ejecutarAccion();
        }
    }
}
