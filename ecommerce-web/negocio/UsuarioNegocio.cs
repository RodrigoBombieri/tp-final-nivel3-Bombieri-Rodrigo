using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class UsuarioNegocio
    {
        public int insertarNuevo(Usuario nuevo)
        {
			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.setearProcedimiento("storedInsertarNuevo");
				datos.setearParametro("@email", nuevo.Email);
				datos.setearParametro("@pass", nuevo.Pass);

				return datos.ejecutarAccionScalar();
			}
			catch (Exception ex)
			{

				 throw ex;
			}
        }

		public void actualizar(Usuario user)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.setearConsulta("Update USERS set nombre = @nombre, apellido = @apellido, urlImagenPerfil = @imagen Where id = @id");
				datos.setearParametro("@nombre", user.Nombre);
				datos.setearParametro("@apellido", user.Apellido);
				datos.setearParametro("@imagen", (object)user.ImagenPerfil ?? DBNull.Value);
				datos.setearParametro("@id", user.Id);

				datos.ejecutarAccion();
			}
			catch (Exception ex)
			{

				throw ex;
			}
			finally
			{
				datos.cerrarConexion();
			}
		}
		public bool login(Usuario usuario)
		{

			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.setearConsulta("Select id, email, pass, admin, nombre, apellido, urlImagenPerfil from USERS Where email = @email And pass = @pass");
				datos.setearParametro("@email", usuario.Email);
				datos.setearParametro("@pass", usuario.Pass);
				datos.ejecutarLectura();

				if (datos.Lector.Read())
				{
					usuario.Id = (int)datos.Lector["id"];
					usuario.Admin = (bool)datos.Lector["admin"];
					if (!(datos.Lector["nombre"] is DBNull))
						usuario.Nombre = (string)datos.Lector["nombre"];
                    if (!(datos.Lector["apellido"] is DBNull))
                        usuario.Apellido = (string)datos.Lector["apellido"];
                    if (!(datos.Lector["urlImagenPerfil"] is DBNull))
                        usuario.ImagenPerfil = (string)datos.Lector["urlImagenPerfil"];
					//if (!(datos.Lector["fechaNacimiento"] is DBNull))
					//	usuario.FechaNacimiento = DateTime.Parse(datos.Lector["fechaNacimiento"].ToString());
					return true;
				}
				return false;
			}
			catch (Exception ex)
			{

				throw ex;
			}
			finally
			{
				datos.cerrarConexion();
			}
		}
    }
}
