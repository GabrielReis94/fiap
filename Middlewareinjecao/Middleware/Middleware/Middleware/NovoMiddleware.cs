using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Middleware.Models;
using System.Threading.Tasks;

namespace Middleware.Middleware
{
    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
    public class NovoMiddleware
    {
        private readonly RequestDelegate _next;

        //Construtor
        public NovoMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        //Metodo invoke
        public Task Invoke(HttpContext httpContext)
        {
            BDConnection.BancoDeDados = "Mudamos a conexão do Middleware";
            return _next(httpContext);
        }
    }

    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class NovoMiddlewareExtensions
    {
        public static IApplicationBuilder UseNovoMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<NovoMiddleware>();
        }
    }
}
