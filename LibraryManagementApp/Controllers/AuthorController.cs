using LibraryManagementApp.Data;
using LibraryManagementApp.Models;
using Microsoft.AspNetCore.Mvc;

namespace LibraryManagementApp.Controllers
{
    public class AuthorController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AuthorController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public JsonResult GetAllAuthors()
        {
            var authors = _context.Authors.ToList();
            return Json(new{data = authors });
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Author author)
        {
            if (ModelState.IsValid)
            {
                _context.Authors.Add(author);
                await _context.SaveChangesAsync();

                TempData["Mensaje"] = "Autor creado exitosamente";
                return RedirectToAction(nameof(Index));
            }
            return View();
        }
    }
}
