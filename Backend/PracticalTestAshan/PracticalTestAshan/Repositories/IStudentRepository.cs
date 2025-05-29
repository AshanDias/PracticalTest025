using PracticalTest.Student.Management.Models;

namespace PracticalTest.Student.Management.Repositories;

public interface IStudentRepository
{
    Task<List<StudentEntity>> GetAllAsync();

    Task<StudentEntity?> GetByIdAsync(int id);

    Task AddAsync(StudentEntity student);

    Task UpdateAsync(StudentEntity student);

    Task DeleteAsync(int id);
}
