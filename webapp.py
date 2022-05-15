from flask import Flask, render_template, request
from flask_mysqldb import MySQL
import json

app = Flask(__name__)

'''
Load from json file the configuration for MySQL R-DBMS data
'''
for prop, val in json.load(open('mysql_config.json')).items():
	app.config[f'''MYSQL_{prop.upper()}'''] = val

mysql = MySQL(app)

'''
execute the query and return Result-Set
'''
def findPersons(fields):
	_q = f'''
		SELECT
			{', '.join(fields)}
		FROM
			PersonList
		WHERE
			1
		ORDER BY
			h ASC;
	'''
	_cur = mysql.connection.cursor()
	_num_rows = _cur.execute(_q)
	_rs = _cur.fetchall()
	_cur.close()
	return _rs

'''
NB: the temlate files must be into ./templates dir
'''
@app.route('/')
def home():
	fields = (
		'id',
		'firstname',
		'lastname',
		'gender',
		'h',
		'age'
	)
	return render_template(
		'showQuery.html',
		titolo='Show Person List',
		sql_tab=findPersons(fields),
		sql_fields=fields
	)

@app.route('/api/<int:id>', methods=['DELETE','GET'])
def deletePerson(id):
	#_id = request.values.get('id', default=-1, type=int)
	_q = f'''DELETE FROM PersonList WHERE id={id};'''
	_cur = mysql.connection.cursor()
	_affected_rows = _cur.execute(_q)
	mysql.connection.commit()
	_cur.close()
	return app.response_class(
		status=200,
		mimetype='application/json',
		response = json.dumps( { 'affected_rows' : _affected_rows } )
	)

if __name__ == '__main__':
	app.run(debug=True)
	'''
	app.run(
		debug=True,
		host='localhost'
		port=8000
	)
	'''