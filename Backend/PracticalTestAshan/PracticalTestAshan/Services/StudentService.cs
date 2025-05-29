using AutoMapper;
using PracticalTest.Student.Management.DTOs;
using PracticalTest.Student.Management.Models;
using PracticalTest.Student.Management.Repositories;

namespace PracticalTest.Student.Management.Services;

public class StudentService(IStudentRepository repository, IMapper mapper) : IStudentService
{
    private readonly IStudentRepository _repository = repository;
    private readonly IMapper _mapper = mapper;

    public async Task<List<StudentDto>> GetAllAsync()
       => _mapper.Map<List<StudentDto>>(await _repository.GetAllAsync());

    public async Task<StudentDto?> GetByIdAsync(int id)
    {
        var student = await _repository.GetByIdAsync(id);
        return student == null ? null : _mapper.Map<StudentDto>(student);
    }

    public async Task AddAsync(StudentDto dto)
    {
        var student = _mapper.Map<StudentEntity>(dto);
        await _repository.AddAsync(student);
    }

    public async Task UpdateAsync(StudentDto dto)
    {
        var student = _mapper.Map<StudentEntity>(dto);
        await _repository.UpdateAsync(student);
    }

    public async Task DeleteAsync(int id)
    {
        await _repository.DeleteAsync(id);
    }
}
