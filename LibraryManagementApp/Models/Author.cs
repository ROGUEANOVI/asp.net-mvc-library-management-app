using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LibraryManagementApp.Models
{
    [Table(name: "Author")]
    public class Author
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "El nombre es requerido")]
        [StringLength(45, MinimumLength = 3, ErrorMessage = "El nombre debe tener entre 3 y 45 caracteres")]
        [Display(Name = "Nombre")]
        public string Name { get; set; } = null!;
    }
}
