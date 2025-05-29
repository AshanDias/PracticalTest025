using AutoMapper;
using PracticalTest.Student.Management.DTOs;
using PracticalTest.Student.Management.Models;

namespace PracticalTest.Student.Management.Profiles;

public class AutoMapperProfile : Profile
{
    public AutoMapperProfile()
    {
        CreateMap<StudentEntity, StudentDto>().ReverseMap();
    }
}
