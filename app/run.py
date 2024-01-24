from flask import Flask, request, jsonify
import source.paciente_eventos as find_paciente_eventos
import source.medico_eventos as find_medico_eventos
import source.empresa_atendimentos as find_empresa_atendimentos
import source.receitas_medico as find_receitas_medico
app = Flask(__name__)

if(__name__ == "__main__"):
    
    @app.route('/paciente/eventos', methods=['GET'])
    def eventos_paciente():
        dados = request.get_json()
        if "nome" in dados and "data_buscada" in dados:
            eventos, stt_code = find_paciente_eventos.consulta_paciente_data(dados)
            return jsonify(eventos), stt_code
        elif "nome" in dados:
            eventos, stt_code = find_paciente_eventos.consulta_paciente(dados)
            return jsonify(eventos), stt_code
        else:
            return jsonify({'status':'error'}), 404
    
    @app.route('/medico/eventos', methods=['GET'])
    def eventos_medico():
        dados = request.get_json()
        if "nome" in dados and "data_buscada" in dados:
            eventos, stt_code = find_medico_eventos.consulta_medico_data(dados)
            return jsonify(eventos), stt_code
        elif "nome" in dados:
            eventos, stt_code = find_medico_eventos.consulta_medico(dados)
            return jsonify(eventos), stt_code
        else:
            return jsonify({'status':'error'}), 404
        
    @app.route('/empresa/atendimentos', methods=['GET'])
    def atendimentos_empresa():
        dados = request.get_json()
        if "cnpj" in dados:
            atendimentos, stt_code = find_empresa_atendimentos.atendimentos_empresa(dados)
            return jsonify(atendimentos), stt_code
        else:
            return jsonify({'status':'error'}), 404
        
    @app.route('/receitas/medico', methods=['GET'])
    def receitas_medico():
        dados = request.get_json()
        if "crm" in dados:
            receitas, stt_code = find_receitas_medico.receitas_medico(dados)
            return jsonify(receitas), stt_code
        else:
            return jsonify({'status':'error'}), 404
        
    app.run(debug=True, port=5000)