import consultas.paciente_eventos as paciente_eventos
import app.app as app

@app.route('/paciente/<str:nome_paciente>/eventos/<str:data>')
def eventos_paciente(nome_paciente, data):
    return paciente_eventos.eventos_paciente(nome_paciente, data)