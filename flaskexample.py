from flask import Flask, render_template, url_for, request, redirect


app = Flask(__name__)
Employees = []

@app.route('/',methods=['GET','POST'])
def index():
    if request.method == 'POST':
        EmployeeID = request.form['EmployeeID']
        FirstName = request.form['FirstName']
        LastName = request.form['LastName']
        FavMovie = request.form['FavMovie']
        Position = request.form['Position']
        
        Employees.append({'EmployeeID': EmployeeID, 'FirstName': FirstName, 'LastName': LastName, 'FavMovie': FavMovie, 'Position': Position})

        return render_template('index.html', Employees=Employees)

if __name__== "__main__":
    app.run(debug=True)