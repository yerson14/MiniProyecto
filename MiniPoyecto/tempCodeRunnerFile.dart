import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  // Variables para estudiantes y temas
  List<String> estudiantes = [];
  List<String> temas = [];
  Map<String, String> asignaciones = {}; // Mapa para almacenar asignaciones
  int predefinida, crud;
  String? nomEstudiantes, nomRemove, nomTemas, nomremoveTemas;

  print('-' * 80);
  print("Ponga 1 si quiere generar la información o responda 2 si quiere la información predefinida");
  predefinida = int.parse(stdin.readLineSync()!);
  print('-' * 80);

  if (predefinida == 1) {
    print("Digite la cantidad de estudiantes");
    int cantEstudiantes = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < cantEstudiantes; i++) {
      print("Digite el nombre de los estudiantes");
      nomEstudiantes = stdin.readLineSync()!;
      estudiantes.add(nomEstudiantes);
    }

    print('-' * 80);
    print("Ingrese la cantidad de temas de exposición");
    int cantTemas = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < cantTemas; i++) {
      print("Digite el nombre de los temas de exposición");
      nomTemas = stdin.readLineSync()!;
      temas.add(nomTemas);
    }
  } else if (predefinida == 2) {
    // Datos predefinidos para estudiantes y temas
    estudiantes = [
      "ANDRES FELIPE SANCHEZ HURTADO",  
      "ANGIE DAHIANA RIOS QUINTERO",
      "CRISTIAN ALVAREZ ARANZAZU",    
      "DANIEL ESTIVEN ARBOLEDA DUQUE",    
      "DAVID ANDRES MORALES GUAPACHA",  
      "DAVID STIVEN OCAMPO LONDOÑO",
      "ESTEBAN REYES AGUDELO",    
      "JACOBO GALVIS JIMENEZ",  
      "JAIME ANDRES CALLE SALAZAR",  
      "JEFERSON MAURICIO HERNANDEZ LADINO",
      "JHON ALEXANDER PINEDA OSORIO",    
      "JOSE MIGUEL SIERRA ARISTIZABAL",  
      "JOSÉ SEBASTIÁN OCAMPO LÓPEZ",    
      "JUAN ANDRES OSORIO GOMEZ",  
      "JUAN DIEGO CALVO OSORIO",  
      "JUAN ESTEBAN LOPEZ CALLE",  
      "JUAN PABLO RIOS ARISTIZABAL",    
      "MARIA PAULA MELO SOLANO",  
      "MIGUEL ANGEL PEÑA JIMENEZ",    
      "SAMUEL CASTAÑO CARDONA",    
      "JUAN JOSÉ POSADA PÉREZ",    
      "ALEJANDRO SERNA LONDOÑO",  
      "JUAN MANUEL ZULUAGA RINCON",
      "JUAN DANIEL GOMEZ LASERNA",  
      "YERSON STIVEN HERRERA OBANDO",  
      "MATEO HERRERA VARGAS",
      "ALEJANDRO VALLEJO ESCOBAR"];
    temas = ["Suma", "Resta", "Multiplicación", "División"];
  } else {
    print("Opción no válida");
    return;
  }

  // Menú de gestión de estudiantes
  bool exit = false;
  while (!exit) {
    print('-' * 80);
    print("Bienvenido al menú de estudiantes, ingrese el número de lo que desea realizar:");
    print("Digite 1 si quiere editar el nombre de algún estudiante");
    print("Digite 2 si quiere remover algún estudiante");
    print("Digite 3 si quiere ingresar otro estudiante");
    print("Digite 4 para mostrar la lista de estudiantes");
    print("Digite 5 para salir de menú de estudiantes");

    crud = int.parse(stdin.readLineSync()!);

    switch (crud) {
      case 1:
        print("Estos son los aprendices");
        print(estudiantes);
        print("Digite el nombre del estudiante que quiere editar");
        nomEstudiantes = stdin.readLineSync()!;
        bool editar = false;

        for (var i = 0; i < estudiantes.length; i++) {
          if (nomEstudiantes == estudiantes[i]) {
            print("Digite el cambio que desea realizar");
            String nuevoNombre = stdin.readLineSync()!;
            estudiantes[i] = nuevoNombre;
            editar = true;
            print(estudiantes);
            print("Estudiante editado exitosamente");
            break;
          }
        }
        if (!editar) {
          print("No se encontró aprendiz con ese nombre");
        }
        break;

      case 2:
        print("Estos son los estudiantes que hay");
        print(estudiantes);
        print("Digite el nombre del estudiante que quiere eliminar");
        nomRemove = stdin.readLineSync()!;
        bool eliminar = false;

        for (var i = 0; i < estudiantes.length; i++) {
          if (nomRemove == estudiantes[i]) {
            estudiantes.removeAt(i);
            eliminar = true;
            print(estudiantes);
            print("Estudiante removido exitosamente");
            break;
          }
        }
        if (!eliminar) {
          print("No se encontró aprendiz con ese nombre");
        }
        break;

      case 3:
        print("Digite el nombre del estudiante que quiere agregar");
        nomEstudiantes = stdin.readLineSync()!;
        estudiantes.add(nomEstudiantes);
        print(estudiantes);
        break;

      case 4:
        print(estudiantes);
        break;

      case 5:
        exit = true;
        break;

      default:
        print("Opción no válida");
    }
  }

  // Menú de gestión de temas
  exit = false; 
  while (!exit) {
    print("-" * 80);
    print("Menú de gestión Temas de exposiciones");
    print("1. Si desea editar algún tema");
    print("2. Si desea agregar nuevo tema");
    print("3. Si desea eliminar algún tema");
    print("4. Si desea ver todos los temas");
    print("\x1B[4m5. Asignar temas a estudiantes aleatoriamente y mostrar asignaciones\x1B[0m");
    print("6. Para salir");
    print("Digite la opción");

    int crud2 = int.parse(stdin.readLineSync()!);
    switch (crud2) {
      case 1:
        print("Estos son los temas de exposición:");
        print(temas);
        print("Digite el tema que desea editar");
        nomTemas = stdin.readLineSync()!;
        bool editar = false;
        for (var i = 0; i < temas.length; i++) {
          if (nomTemas == temas[i]) {
            print("Digite el cambio que desea realizar");
            String nuevoTema = stdin.readLineSync()!;
            temas[i] = nuevoTema;
            editar = true;
            print(temas);
            print("Tema editado exitosamente");
            break;
          }
        }
        if (!editar) {
          print("No se encontró tema con ese nombre");
        }
        break;

      case 2:
        print("Digite el nombre del tema que quiere agregar");
        nomTemas = stdin.readLineSync()!;
        temas.add(nomTemas);
        print(temas);
        break;

      case 3:
        print("Estos son los temas que hay");
        print(temas);
        print("Digite el nombre del tema que desea eliminar");
        nomremoveTemas = stdin.readLineSync()!;
        bool eliminar = false;
        for (var i = 0; i < temas.length; i++) {
          if (nomremoveTemas == temas[i]) {
            temas.removeAt(i);
            eliminar = true;
            print(temas);
            print("Tema removido exitosamente");
            break;
          }
        }
        if (!eliminar) {
          print("No se encontró tema con ese nombre");
        }
        break;

      case 4:
        print(temas);
        break;

      case 5:
        asignarYMostrarTemasAleatoriamente(estudiantes, temas, asignaciones);
        break;

      case 6:
        exit = true;
        break;

      default:
        print("Opción no válida");
    }
  }

//menu final
exit = false;
  while (!exit) {
    print('-' * 80);
    print("Menú Final");
    print("1. Ver estudiantes junto a su tema de exposición final");
    print("2. Ver temas de exposición");
    print("3. Ver la cantidad de estudiantes por exposición");
    print("4. Ver estudiantes");
    print("5. Salir");
    print("Digite la opción");
  int crud3 = int.parse(stdin.readLineSync()!);
    switch (crud3) {
      case 1:
        print("Estudiantes y sus temas de exposición:");
        asignaciones.forEach((estudiante, tema) {
          print("$estudiante: $tema");
        });
        break;

      case 2:
        print("Temas de exposición:");
        print(temas);
        break;

      case 3:
        Map<String, int> cantidadPorTema = {};
        asignaciones.forEach((estudiante, tema) {
          if (cantidadPorTema.containsKey(tema)) {
            cantidadPorTema[tema] = cantidadPorTema[tema]! + 1;
          } else {
            cantidadPorTema[tema] = 1;
          }
        });
        print("Cantidad de estudiantes por tema de exposición:");
        cantidadPorTema.forEach((tema, cantidad) {
          print("$tema: $cantidad estudiante(s)");
        });
        break;

      case 4:
        print("Lista de estudiantes:");
        print(estudiantes);
        break;

    case 5:
        exit = true;
        break;

      default:
        print("Opción no válida");
    }
  }
}

void asignarYMostrarTemasAleatoriamente(List<String> estudiantes, List<String> temas, Map<String, String> asignaciones) {
  Random random = Random();
  asignaciones.clear(); // Limpiar asignaciones previas

  for (var estudiante in estudiantes) {
    int indexTema = random.nextInt(temas.length);
    String temaAsignado = temas[indexTema];
    asignaciones[estudiante] = temaAsignado;
  }

  print("\nAsignaciones de temas a estudiantes:");
  asignaciones.forEach((estudiante, tema) {
    print("$estudiante -> $tema");
  });
}
