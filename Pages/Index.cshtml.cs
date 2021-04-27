﻿using AppAnimes.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
 

namespace AppAnimes.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly AppAnimesDBContext _context;



        public IndexModel(ILogger<IndexModel> logger, AppAnimesDBContext context)
        {
            _logger = logger;
            _context = context;

        }

        public IList<Models.Animes> Anime { get; set; }
        public IList<Temporadas> Temporadas { get; set; }

        public async Task<IActionResult> OnGetAsync()
        {


            IQueryable<Models.Animes> animesIQ = from a in _context.Animes select a;
            IQueryable<Temporadas> temporadasIQ = from t in _context.Temporadas select t;


            Anime = await animesIQ.AsNoTracking().ToListAsync();
            Temporadas = await temporadasIQ.AsNoTracking().ToListAsync();
            return Page();
        }


    }
}
