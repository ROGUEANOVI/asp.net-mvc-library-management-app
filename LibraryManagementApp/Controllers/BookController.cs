using LibraryManagementApp.Data;
using LibraryManagementApp.Models;
using Microsoft.AspNetCore.Mvc;

namespace LibraryManagementApp.Controllers
{
    public class BookController : Controller
    {
        private readonly ApplicationDbContext _context;

        public BookController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public JsonResult GetAllBooks()
        {
            var books = _context.Books.ToList();
            return Json(new { data = books });
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

                TempData["Mensaje"] = "Libro creado exitosamente";
                return RedirectToAction(nameof(Index));
            }
            return View();
        }
    }
}
