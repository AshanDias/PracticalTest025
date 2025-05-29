using Microsoft.EntityFrameworkCore;
using PracticalTest.Student.Management.Models;

namespace PracticalTest.Student.Management.Data;

public class AppDbContext(DbContextOptions<AppDbContext> options) : DbContext (options)
{
    public DbSet<StudentEntity> Students { get; set; }
}
