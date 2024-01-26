using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_web
{
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Articulo> listaProductos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario user = (Usuario)Session["usuario"];
            string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";

            if (!string.IsNullOrEmpty(id) && int.TryParse(id, out int idArticulo))
            {
                ArticuloFavoritoNegocio negocio = new ArticuloFavoritoNegocio();
                ArticuloFavorito nuevo = new ArticuloFavorito();

                nuevo.IdUser = user.Id;
                nuevo.IdArticulo = int.Parse(id);

                negocio.insertarFavorito(nuevo);
            }

            listaProductos = new List<Articulo>();

            if (user != null)
            {
                ArticuloFavoritoNegocio negocioArticulo = new ArticuloFavoritoNegocio();
                List<int> idArticulosFav = negocioArticulo.listarFavoritos(user.Id);

                if (idArticulosFav.Count > 0)
                {
                    ArticuloNegocio favorito = new ArticuloNegocio();
                    listaProductos = favorito.listarArticuloConID(idArticulosFav);
                    repRepeater.DataSource = listaProductos;
                    repRepeater.DataBind();
                }
            }
            else
            {
                Session.Add("error", "Error al cargar articulos favoritos");
                Response.Redirect("Error.aspx");
            }

            }
        }

        protected void btnEliminarFav_Click(object sender, EventArgs e)
        {
            Usuario user = (Usuario)Session["usuario"];
            ArticuloFavoritoNegocio negocio = new ArticuloFavoritoNegocio();


            int idArticulo = int.Parse(((Button)sender).CommandArgument);
            int idUser = user.Id;

            negocio.eliminarFavorito(idArticulo, idUser);

            Response.Redirect("Favoritos.aspx", false);


        }


    }
}