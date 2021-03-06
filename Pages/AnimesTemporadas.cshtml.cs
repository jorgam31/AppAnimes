using AppAnimes.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AppAnimesNuevo;
using System;

namespace AppAnimes.Pages
{

    /*
        Clase que actua como "Controlador" de Razor Pages 
        Se hace la conexion a SQLServer usando la inyeccion de dependencias (DI) en el constructor
        
        El metodo OnGetAsync devuleve la lista de los Animes junto con el nombre de las temporadas 
        Como consultamos una bbdd en este caso SQL Server, el metodo es asincronico y debe tener aysnc/await 

        Consultamos con Language Integrated Query (LINQ) a dbcontext de la aplicacion 
        y generamos un nuevo objeto que será lo que verá el usuario en la vista Razor Pages 
        llamado AnimesTemporadasViewModel que contiene datos tanto de la tabla Animestest como de la tabla TemporadasTest en una unica View o Vista.
    */
    public class AnimesTemporadasModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly AppAnimesDBContext _context;

        // public IList<AnimesTemporadasViewModel> animesTemporadasViewModels { get; set; }
        public PaginatedList<AnimesTemporadasViewModel> animesTemporadasPaginated { get; set; }
        public AnimesTemporadasViewModel animesTemporadasViewModel { get; set; }

        [BindProperty(SupportsGet = true)] //Enlace Modelo Soporta GET esto se aplica a la variable searchstring
        public string searchString { get; set; } // cadena busqueda
        public AnimesTemporadasModel(ILogger<IndexModel> logger, AppAnimesDBContext context)
        {
            _logger = logger;
            _context = context;

        }


        public async Task<IActionResult> OnGetAsync(int? pageIndex)
        {
            int pageSize = 10; // Tamaño maximo  de filas que tiene la tabla.
            // si me introducen un pageindex < 1 redirigimos al index de AnimesTemporadas
            if (pageIndex <= 0)
            {
                return RedirectToPage("AnimesTemporadas");

            }

            animesTemporadasPaginated = await PaginatedList<AnimesTemporadasViewModel>.CreateAsync(
                     from a in _context.Animes
                     join t in _context.Temporadas on a equals t.Anime into atemp
                     from at in atemp
                     orderby at.Estado
                     select new AnimesTemporadasViewModel()
                     {
                         id_anime = a.AnimeId,
                         id_temporada = at.TemporadaId,
                         NumeroTemporada = at.NumeroTemporada,
                         NombreAnimeTemporada = a.Nombre + " " + at.NombreTemporada,
                         genero = a.Genero,
                         nombreEnIngles = a.NombreIngles,
                         estado = at.Estado,
                         tipo = at.Tipo,
                         temporada_estreno = at.TemporadaEstreno

                     }, pageIndex ?? 1, pageSize);


            // Busqueda

            if (!string.IsNullOrEmpty(searchString))
            {
                animesTemporadasPaginated = await PaginatedList<AnimesTemporadasViewModel>.CreateAsync(
                   from a in _context.Animes
                   join t in _context.Temporadas on a equals t.Anime into atemp
                   from at in atemp
                   orderby at.Estado
                   where at.Anime.Nombre.Contains(searchString) || at.NombreTemporada.Contains(searchString) || a.NombreIngles.Contains(searchString)

                   select new AnimesTemporadasViewModel()
                   {
                       id_anime = a.AnimeId,
                       id_temporada = at.TemporadaId,
                       NumeroTemporada = at.NumeroTemporada,
                       NombreAnimeTemporada = a.Nombre + " " + at.NombreTemporada,
                       genero = a.Genero,
                       nombreEnIngles = at.Anime.NombreIngles,
                       estado = at.Estado,
                       tipo = at.Tipo,
                       temporada_estreno = at.TemporadaEstreno

                   }, pageIndex ?? 1, pageSize);
            }
                

            return Page();
        }

        /*
            Metodo OnGetFind(int id)
            Metodo que devuelve un JSON con la informacion del anime, se pasa el id a la base de datos.
            Para llamar a este metodo desde JS JQuery se llama Find omitimos OnGet.
        */

        public IActionResult OnGetFind(int id)
        {
            var temporada = _context.Temporadas.Find(id);
            //string anime = _context.Animes.Where(a => a.AnimeId == temporada.AnimeId).Select( a => a.Nombre).FirstOrDefault();
            Anime anime = _context.Animes.Where(a => a.AnimeId == temporada.AnimeId).FirstOrDefault();
            temporada.Anime = anime;
           
            return new JsonResult(temporada);
        }
        public async Task<IActionResult> OnPostCambiarEstado(int? id, string estado, string paginavisto)
        {
            Temporada temporada = _context.Temporadas.Find(id);
            Historial historial = _context.Historial.Where(h => h.TemporadaId == id && h.FechaFin == null).FirstOrDefault();


            // Si lo que esta en la base de datos antes de hacer la inserccion es visto entonces el cambio es de visto a viendo
            if (temporada.Estado.Equals("Visto"))
            {
                // 1. Añadimos nuevo registro en historial

                historial = new Historial();
                historial.AnimeId = temporada.AnimeId;
                historial.TemporadaId = temporada.TemporadaId;
                historial.FechaInicio = DateTime.Now;
                historial.FechaFin = null;
                historial.VistoEn = paginavisto;

                // 2. Establecemos el valor de estado a Viendo
                temporada.Estado = estado;
            }
            else
            {
                // Si no quiere decir que he terminado de ver un anime y el cambio es de viendo a visto Actualizamos FechaFin que estará en Null.

                historial.FechaFin = DateTime.Now;
                // 2. Establecemos el valor de estado a Visto
                temporada.Estado = estado;
            }


            // Actualizamos nuevos valores en la base de datos. 
            _context.Temporadas.Update(temporada);
            _context.Historial.Update(historial);

            await _context.SaveChangesAsync();


            return RedirectToPage("./AnimesTemporadas");
        }


    }
}

