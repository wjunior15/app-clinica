from flask import Flask, request, jsonify
import source.paciente_eventos as find_paciente_eventos
import source.medico_eventos as find_medico_eventos
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
        
    app.run(debug=True, port=5000)