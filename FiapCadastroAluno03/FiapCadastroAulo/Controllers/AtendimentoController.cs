using Fiap_Aula3_CadastroAlunosAPI.Interfaces;
using Fiap_Aula3_CadastroAlunosAPI.Models;
using Fiap_Aula3_TrabalhandoLogs.Logging;
using Microsoft.AspNetCore.Mvc;

namespace Fiap_Aula3_TrabalhandoLogs.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AtendimentoController : ControllerBase
    {
        private readonly IAlunoCadastro _alunoCadastro;
        private readonly ILogger<AtendimentoController> _logger;

        public AtendimentoController(IAlunoCadastro alunoCadastro, ILogger<AtendimentoController> logger)
        {
            _alunoCadastro = alunoCadastro;
            _logger = logger;
        }
        
        [HttpGet("aluno")]
        public IActionResult GetAluno(IServiceProvider serviceProvider, int id) {
            var alunoCadastro = serviceProvider.GetRequiredService<IAlunoCadastro>();
            
            CustomLogger.Arquivo = false;
            _logger.LogInformation("Teste de Log do tipo Informação");
            CustomLogger.Arquivo = true;

            return Ok();
        }

        [HttpPost("inserirAluno")]
        public IActionResult PostInserirAluno([FromKeyedServices("Forma2")] IAlunoCadastro alunoCadastro, [FromBody] Aluno aluno)
        {
            alunoCadastro.CriarAluno(aluno);
            return Ok(aluno);
        }
    }
}
