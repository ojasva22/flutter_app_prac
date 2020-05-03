/*
TODO:
imports
List of Employees
Stream Controllers
Stram Sink Getter
Constructor-to add Data; listen to hange data
Core functions
dispose

 */


import 'dart:async';
import 'Employee.dart';

class EmployeeBloc{
  List<Employee> _employeeList=[
    Employee(1, 'Ojasva', 10000.0),
    Employee(2, 'Oj', 20000.0),
    Employee(3, 'Oja', 40000.0),
    Employee(4, 'Ojas', 50000.0),
    Employee(5, 'Ojasv', 30000.0),
  ];
  final _employeeListStreamController = StreamController<List<Employee>>();
  final _employeeSalaryIncrementController = StreamController<Employee>();
  final _employeeSalaryDeccrementController = StreamController<Employee>();

  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;
  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement => _employeeSalaryIncrementController.sink;
  StreamSink<Employee> get employeeSalaryDecrement => _employeeSalaryDeccrementController.sink;
  
  EmployeeBloc(){
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementController.stream.listen(_incrementSalary);
    _employeeSalaryDeccrementController.stream.listen(_decrementSalary);
  }
  _incrementSalary(Employee employee){
    double salary = employee.salary;
    double incrementedSalary = salary * 0.2;
    _employeeList[employee.id-1].salary = salary+incrementedSalary;
    employeeListSink.add(_employeeList);

  }
  _decrementSalary(Employee employee){
    double salary = employee.salary;
    double decrementedSalary = salary * 0.2;
    _employeeList[employee.id-1].salary = salary-decrementedSalary;
    employeeListSink.add(_employeeList);
  }
  void dispose(){
    _employeeSalaryDeccrementController.close();
    _employeeSalaryIncrementController.close();
    _employeeListStreamController.close();
  }
}