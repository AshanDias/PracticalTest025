using Microsoft.EntityFrameworkCore;
using PracticalTest.Student.Management.Data;
using PracticalTest.Student.Management.Models;

namespace PracticalTest.Student.Management.Repositories;

public class StudentRepository(AppDbContext context) : IStudentRepository
{
    private readonly AppDbContext _context = context;

    public async Task AddAsync(StudentEntity student)
    {
        _context.Students.Add(student);
        await _context.SaveChangesAsync();
    }

    public async Task DeleteAsync(int id)
    {
        var student = await GetByIdAsync(id);
        if (student != null)
        {
            _context.Students.Remove(student);
            await _context.SaveChangesAsync();
        }
    }

    public async Task<List<StudentEntity>> GetAllAsync() => await _context.Students.ToListAsync();

    public async Task<StudentEntity?> GetByIdAsync(int id) => await _context.Students.FindAsync(id);

    public async Task UpdateAsync(StudentEntity student)
    {
        _context.Students.Update(student);
        await _context.SaveChangesAsync();
    }
}
