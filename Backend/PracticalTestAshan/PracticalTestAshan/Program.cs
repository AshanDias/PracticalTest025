using Microsoft.EntityFrameworkCore;
using PracticalTest.Student.Management.Data;
using PracticalTest.Student.Management.Repositories;
using PracticalTest.Student.Management.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<IStudentRepository, StudentRepository>();
builder.Services.AddScoped<IStudentService, StudentService>();
builder.Services.AddAutoMapper(typeof(Program));

// Configure CORS
builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(policy =>
    {
        policy
            .AllowAnyOrigin()    // Allow all origins // development purpose only
            .AllowAnyMethod()    // Allow all HTTP methods (GET, POST, etc)  // development purpose only
            .AllowAnyHeader();   // Allow all headers  // development purpose only
    });
});
var app = builder.Build();

// Middleware
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(); // Using default policy
app.UseAuthorization();
app.MapControllers();
app.Run();
