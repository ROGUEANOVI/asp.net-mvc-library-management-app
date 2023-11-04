using LibraryManagementApp.Data;
using LibraryManagementApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

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
            var books = _context.Books.ToList().Select(book => {
                book.Author = _context.Authors.Find(book.AuthorId);
                return book;
            }).ToList();

            return Json(new { data = books });
        }

        [HttpGet]
        public IActionResult Create()
        {
            var authors = _context.Authors.ToList();
            ViewBag.AuthorsList = authors.Select(author => new SelectListItem { Value = author.Id.ToString(), Text = author.Name }).ToList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Title, AuthorId")] Book book)
        {
            if (ModelState.IsValid)
            {
                _context.Books.Add(book);
                await _context.SaveChangesAsync();

                TempData["Mensaje"] = "Libro creado exitosamente";
                return RedirectToAction(nameof(Index));
            }
            var authors = _context.Authors.ToList();
            ViewBag.AuthorsList = authors.Select(author => new SelectListItem { Value = author.Id.ToString(), Text = author.Name }).ToList();
            return View(book);
        }
    }
}
