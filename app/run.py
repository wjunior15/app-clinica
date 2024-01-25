from flask import Flask, request, jsonify
from flask_cors import CORS
import source.paciente_eventos as find_paciente_eventos
import source.medico_eventos as find_medico_eventos
import source.empresa_atendimentos as find_empresa_atendimentos
import source.receitas_medico as find_receitas_medico
import source.alteracao_dados_consulta as change_consulta
import source.add_nova_consulta as add_consulta
app = Flask(__name__)
CORS(app)

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
        
    @app.route('/consulta/alteracao', methods=['POST'])
    def altera_consulta():
        dados = request.get_json()
        if "novo_status" in dados and "data" in dados and "hora" in dados and "paciente" in dados and "medico" in dados:
            stt_msg, stt_code = change_consulta.altera_status(dados)
            return jsonify({"msg":stt_msg}), stt_code
        
        elif "nova_data" in dados and "data_atual" in dados and "hora_atual" in dados and "paciente" in dados and "medico" in dados:
            if not "nova_hora" in dados:
                dados["nova_hora"] = dados["hora_atual"]
            stt_msg, stt_code = change_consulta.altera_data_hora(dados)
            return jsonify({"msg":stt_msg}), stt_code
        
        else:
            return jsonify({"erro":"Dados insuficientes"}), 404
        
    @app.route('/consulta/nova/plano', methods=['POST'])
    def nova_consulta_plano():
        dados = request.get_json()
        if "data" in dados and "hora" in dados and "paciente" in dados and "medico" in dados and "especialidade" in dados and "empresa" in dados and "plano" in dados:
            stt_msg, stt_code = add_consulta.add_consulta_plano(dados)
            return jsonify({"msg":stt_msg}), stt_code
        else:
            return jsonify({"erro":"Dados insuficientes"}), 404
        
    @app.route('/consulta/nova/particular', methods=['POST'])
    def nova_consulta_particular():
        dados = request.get_json()
        if "data" in dados and "hora" in dados and "paciente" in dados and "medico" in dados and "especialidade" in dados:
            stt_msg, stt_code = add_consulta.add_consulta_particular(dados)
            return jsonify({"msg":stt_msg}), stt_code
        else:
            return jsonify({"erro":"Dados insuficientes"}), 404

    app.run(debug=True, port=5000)