using AppAnimes.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System;
using AppAnimesNuevo;

namespace AppAnimes.Pages
{
    public class HistorialModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly AppAnimesDBContext _context;


        public PaginatedList<HistorialViewModel> HistorialAnimesTemporadasPaginated { get; set; }

        [BindProperty(SupportsGet = true)]//Enlace Modelo Soporta GET
        public string searchString { get; set; } // cadena busqueda
        public HistorialModel(ILogger<IndexModel> logger, AppAnimesDBContext context)
        {
            _logger = logger;
            _context = context;

        }


        public async Task<IActionResult> OnGetAsync(int? pageIndex, int? id)
        {

            // Paginacion
            var pageSize = 100;
            if (pageIndex <= 0)
            {
                return RedirectToPage("Historial");
            }
            ViewData["id"] = id;

            if (id != null) // Si hay un filtro de anime filtramos.
            {
                HistorialAnimesTemporadasPaginated = await PaginatedList<HistorialViewModel>.CreateAsync(
              from historial in _context.Historial
              where historial.AnimeId == id
                orderby historial.IdHistorial,historial.IdHistorial ascending
              select new HistorialViewModel()
              {
                  idHistorial = historial.IdHistorial,
                  id_anime = historial.Anime.AnimeId,
                  id_temporada = historial.TemporadaId,
                
                  NombreAnime = historial.Anime.Nombre,
                  NombreAnimeTemporada = historial.Anime.Nombre + " " ,
                  fechaInicio = historial.FechaInicio,
                  fechaFin = historial.FechaFin,
                  VistoEn = historial.VistoEn,
                  AnyoVisto = historial.AnyoVisto
              }, pageIndex ?? 1, pageSize);

                ViewData["nombreAnimeFiltrado"] = HistorialAnimesTemporadasPaginated[0].NombreAnime;
                ViewData["NumeroTemporada"] = HistorialAnimesTemporadasPaginated[0].NumeroTemporada;
            }
            else
            {
                HistorialAnimesTemporadasPaginated = await PaginatedList<HistorialViewModel>.CreateAsync(
              from historial in _context.Historial
              join temporadas in _context.Temporadas on  historial.TemporadaId equals temporadas.TemporadaId
    
              select new HistorialViewModel()
              {
                  idHistorial = historial.IdHistorial,
                  id_anime = historial.Anime.AnimeId,
                  id_temporada = historial.TemporadaId,
                  NumeroTemporada = temporadas.NumeroTemporada,
                  NombreAnimeTemporada = historial.Anime.Nombre + " " + temporadas.NombreTemporada,
                  fechaInicio = historial.FechaInicio,
                  fechaFin = historial.FechaFin,
                  VistoEn = historial.VistoEn,
                  AnyoVisto = historial.AnyoVisto
              }, pageIndex ?? 1, pageSize);
            }


         


            // BUSQUEDA
            if (!string.IsNullOrEmpty(searchString))
            {
                HistorialAnimesTemporadasPaginated = await PaginatedList<HistorialViewModel>.CreateAsync(
                from historial in _context.Historial
                join temporadas in _context.Temporadas  on  historial.TemporadaId equals temporadas.TemporadaId
                orderby historial.FechaFin
                where historial.Anime.Nombre.Contains(searchString)  || historial.Anime.NombreIngles.Contains(searchString) // Nombre del anime o el nombre de temporada.
                select new HistorialViewModel()
                {
                    idHistorial = historial.IdHistorial,
                    id_anime = historial.Anime.AnimeId,
                    id_temporada = historial.TemporadaId,
                    NumeroTemporada = temporadas.NumeroTemporada,
                    NombreAnimeTemporada = historial.Anime.Nombre + " " + historial.Anime.Temporadas.Single().NombreTemporada,
                    fechaInicio = historial.FechaInicio,
                    fechaFin = historial.FechaFin,
                    VistoEn = historial.VistoEn,
                    AnyoVisto = historial.AnyoVisto

                }, pageIndex ?? 1, pageSize);
            }





            return Page();
        }

    }

}


