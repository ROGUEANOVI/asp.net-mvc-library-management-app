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
        [StringLength(100, ErrorMessage = "El título debe tener máximo 100 carateres")]
        [Display(Name = "Título")]
        public string Title { get; set; } = null!;

        [Required]
        public int AuthorId { get; set; }

        [ForeignKey("AuthorId")]
        public Author Author { get; set; } = null!;

    }
}
