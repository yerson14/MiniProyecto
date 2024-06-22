import 'dart:io';

void main(List<String> args) {
  //List<String> Temas = [];
  List<String> estudiantes =[];
  int num,cantEstudiantes,predefinida,crud;
  String? nomEstudiantes,nomRemove;

  //String? temas1;
    print('-'*80);
    print("Ponga 1 si quiere generar la informacion o responda 2 si quiere la informacion predefinida");
    predefinida=int.parse(stdin.readLineSync()!);
    print('-'*80);
    if (predefinida==1) {
      print("Digite la cantidad de estudiantes");
      cantEstudiantes=int.parse(stdin.readLineSync()!);
      for (var i = 0; i < cantEstudiantes; i++) {
        print("Digite el nombre de los estudiantes");
        nomEstudiantes=stdin.readLineSync()!;
        estudiantes.add(nomEstudiantes);
      }
      print("Digite 1 si quiere editar el nombre de algun estudiante");
      print("Digite 2 si quiere remover algun estidainte");
      print("Digite 3 si quiere ingresar otro estudiante");
      print("Digite 4 para mostrar la lista de estudiantes");
      crud=int.parse(stdin.readLineSync()!);
      switch (crud) {
        case 1:
          print("Estos son los aprendices");
          print(estudiantes);
          print("Digite el nombre del estudiante que quiere editar");
          nomEstudiantes=stdin.readLineSync()!;
          for(var i = 0; i < estudiantes.length; i++){
            if (nomEstudiantes==estudiantes[i]) {
              print("Digite el cambio que desea realizar");
              nomEstudiantes=stdin.readLineSync()!;
              estudiantes[i]=nomEstudiantes;
              print(estudiantes);
              print("Estudiante editado exitosamente");
            }
            else{
              print("No se encontro aprendiz con ese nombre");
            }
          }

          break;
        case 2:
        print("Estos son los estudiantes que hay");
        print(estudiantes);
        print("Digite el nombre del estudiante que quiere eliminar");
        nomRemove=stdin.readLineSync()!;
        for(var i = 0; i < estudiantes.length; i++){
          if (nomRemove==estudiantes[i]) {
        estudiantes.removeAt(estudiantes.length-1);
        print(estudiantes);
        print("Estudiante removido exitosamente");
          }
          else{
            print("No se encontro aprendiz con ese nombre");
          }
        }
          break;
        case 3:
          print("Digite el nombre del estudiante que quiere agregar");
          nomEstudiantes=stdin.readLineSync()!;
          estudiantes.add(nomEstudiantes);
          break;
        case 4:
          print(estudiantes);
          break;
        default:
        print("bye");
      }
    }
    else if(predefinida==2){
  do {
    print("Escoja el tema que se asignara a los estudiantes");
    print("Digite 1 para la suma");
    print("Digite 2 para la resta");
    print("Digite 3 para la division");
    print("Digite 4 para la ecuacion");
    print("Digite 5 para salir");
    num=int.parse(stdin.readLineSync()!);
    
    switch (num) {
      case 1:
        print("Se asignaran estudiantes al tema");
        
        break;
      default:
    }


  } while (num!=5);

    }
}