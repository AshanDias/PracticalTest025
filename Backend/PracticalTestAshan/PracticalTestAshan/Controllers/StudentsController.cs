using Microsoft.AspNetCore.Mvc;
using PracticalTest.Student.Management.DTOs;
using PracticalTest.Student.Management.Services;

namespace PracticalTest.Student.Management.Controllers;

[ApiController]
[Route("[controller]")]
public class StudentsController(IStudentService service) : Controller
{
    private readonly IStudentService _service = service;

    [HttpGet]
    public async Task<ActionResult<IEnumerable<StudentDto>>> GetAll() => Ok(await _service.GetAllAsync());

    [HttpGet("{id}")]
    public async Task<ActionResult<StudentDto>> Get(int id)
    {
        var student = await _service.GetByIdAsync(id);
        return student == null ? NotFound() : Ok(student);
    }

    [HttpPost]
    public async Task<IActionResult> Create(StudentDto dto)
    {
        await _service.AddAsync(dto);
        return CreatedAtAction(nameof(Get), new { dto.Id }, dto);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, StudentDto dto)
    {
        if (id != dto.Id) return BadRequest();
        await _service.UpdateAsync(dto);
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id)
    {
        await _service.DeleteAsync(id);
        return NoContent();
    }
}
