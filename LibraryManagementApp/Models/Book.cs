using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LibraryManagementApp.Models
{
    [Table(name: "Book")]
    public class Book
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "El título es requerido")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = "El titulo debe tener entre 2 y 100 caracteres")]
        [Display(Name = "Título")]
        public string Title { get; set; } = null!;

        [Required]
        public int AuthorId { get; set; }

        [ForeignKey("AuthorId")]
        public Author? Author { get; set; }

    }
}
