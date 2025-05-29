using PracticalTest.Student.Management.DTOs;

namespace PracticalTest.Student.Management.Services
{
    public interface IStudentService
    {
        Task<List<StudentDto>> GetAllAsync();

        Task<StudentDto?> GetByIdAsync(int id);

        Task AddAsync(StudentDto dto);

        Task UpdateAsync(StudentDto dto);

        Task DeleteAsync(int id);
    }
}
