import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  List<String> estudiantes = [];
  List<String> temas = [];
  Map<String, String> asignaciones = {};

  print('-' * 80);
  print("Ingrese 1 para generar la información o 2 para utilizar la información predefinida:");
  int opcion = int.parse(stdin.readLineSync()!);
  print('-' * 80);

  if (opcion == 1) {
    ingresarInformacion(estudiantes, temas);
  } else if (opcion == 2) {
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

  gestionEstudiantes(estudiantes, asignaciones);
  gestionTemas(temas, estudiantes, asignaciones);
  menuFinal(estudiantes, temas, asignaciones);
}

void ingresarInformacion(List<String> estudiantes, List<String> temas) {
  print("Digite la cantidad de estudiantes:");
  int cantEstudiantes = int.parse(stdin.readLineSync()!);
  for (var i = 0; i < cantEstudiantes; i++) {
    print("Digite el nombre del estudiante ${i + 1}:");
    String nombreEstudiante = stdin.readLineSync()!;
    estudiantes.add(nombreEstudiante);
  }

  print('-' * 80);
  print("Ingrese la cantidad de temas de exposición:");
  int cantTemas = int.parse(stdin.readLineSync()!);
  for (var i = 0; i < cantTemas; i++) {
    print("Digite el nombre del tema de exposición ${i + 1}:");
    String nombreTema = stdin.readLineSync()!;
    temas.add(nombreTema);
  }
}

void gestionEstudiantes(List<String> estudiantes, Map<String, String> asignaciones) {
  bool exit = false;
  while (!exit) {
    print('-' * 80);
    print("Menú de gestión de estudiantes:");
    print("1. Editar nombre de estudiante");
    print("2. Eliminar estudiante");
    print("3. Agregar estudiante");
    print("4. Mostrar lista de estudiantes");
    print("5. Salir del menú de estudiantes");

    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        editarEstudiante(estudiantes);
        break;
      case 2:
        eliminarEstudiante(estudiantes);
        break;
      case 3:
        agregarEstudiante(estudiantes);
        break;
      case 4:
        mostrarEstudiantes(estudiantes);
        break;
      case 5:
        exit = true;
        break;
      default:
        print("Opción no válida");
    }
  }
}

void editarEstudiante(List<String> estudiantes) {
  print("Lista de estudiantes:");
  mostrarEstudiantes(estudiantes);
  print("Digite el nombre del estudiante que quiere editar:");
  String nombreEstudiante = stdin.readLineSync()!;
  bool encontrado = false;

  for (var i = 0; i < estudiantes.length; i++) {
    if (nombreEstudiante == estudiantes[i]) {
      print("Digite el nuevo nombre para ${estudiantes[i]}:");
      String nuevoNombre = stdin.readLineSync()!;
      estudiantes[i] = nuevoNombre;
      encontrado = true;
      print("Estudiante editado exitosamente.");
      mostrarEstudiantes(estudiantes);
      break;
    }
  }

  if (!encontrado) {
    print("No se encontró ningún estudiante con ese nombre.");
  }
}

void eliminarEstudiante(List<String> estudiantes) {
  print("Lista de estudiantes:");
  mostrarEstudiantes(estudiantes);
  print("Digite el nombre del estudiante que quiere eliminar:");
  String nombreEstudiante = stdin.readLineSync()!;
  bool encontrado = false;

  for (var i = 0; i < estudiantes.length; i++) {
    if (nombreEstudiante == estudiantes[i]) {
      estudiantes.removeAt(i);
      encontrado = true;
      print("Estudiante removido exitosamente.");
      mostrarEstudiantes(estudiantes);
      break;
    }
  }

  if (!encontrado) {
    print("No se encontró ningún estudiante con ese nombre.");
  }
}

void agregarEstudiante(List<String> estudiantes) {
  print("Digite el nombre del estudiante que quiere agregar:");
  String nombreEstudiante = stdin.readLineSync()!;
  estudiantes.add(nombreEstudiante);
  print("Estudiante agregado exitosamente.");
  mostrarEstudiantes(estudiantes);
}

void mostrarEstudiantes(List<String> estudiantes) {
  print("Lista de estudiantes:");
  for (var estudiante in estudiantes) {
    print(estudiante);
  }
}

void gestionTemas(List<String> temas, List<String> estudiantes, Map<String, String> asignaciones) {
  bool exit = false;
  while (!exit) {
    print("-" * 80);
    print("Menú de gestión de temas de exposiciones:");
    print("1. Editar tema de exposición");
    print("2. Agregar tema de exposición");
    print("3. Eliminar tema de exposición");
    print("4. Mostrar lista de temas de exposición");
    print("5. Asignar temas a estudiantes aleatoriamente y mostrar asignaciones");
    print("6. Salir del menú de temas");

    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        editarTema(temas);
        break;
      case 2:
        agregarTema(temas);
        break;
      case 3:
        eliminarTema(temas);
        break;
      case 4:
        mostrarTemas(temas);
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
}

void editarTema(List<String> temas) {
  print("Lista de temas de exposición:");
  mostrarTemas(temas);
  print("Digite el nombre del tema que quiere editar:");
  String nombreTema = stdin.readLineSync()!;
  bool encontrado = false;

  for (var i = 0; i < temas.length; i++) {
    if (nombreTema == temas[i]) {
      print("Digite el nuevo nombre para ${temas[i]}:");
      String nuevoTema = stdin.readLineSync()!;
      temas[i] = nuevoTema;
      encontrado = true;
      print("Tema editado exitosamente.");
      mostrarTemas(temas);
      break;
    }
  }

  if (!encontrado) {
    print("No se encontró ningún tema con ese nombre.");
  }
}

void agregarTema(List<String> temas) {
  print("Digite el nombre del tema que quiere agregar:");
  String nombreTema = stdin.readLineSync()!;
  temas.add(nombreTema);
  print("Tema agregado exitosamente.");
  mostrarTemas(temas);
}

void eliminarTema(List<String> temas) {
  print("Lista de temas de exposición:");
  mostrarTemas(temas);
  print("Digite el nombre del tema que desea eliminar:");
  String nombreTema = stdin.readLineSync()!;
  bool encontrado = false;

  for (var i = 0; i < temas.length; i++) {
    if (nombreTema == temas[i]) {
      temas.removeAt(i);
      encontrado = true;
      print("Tema removido exitosamente.");
      mostrarTemas(temas);
      break;
    }
  }

  if (!encontrado) {
    print("No se encontró ningún tema con ese nombre.");
  }
}

void mostrarTemas(List<String> temas) {
  print("Lista de temas de exposición:");
  for (var tema in temas) {
    print(tema);
  }
}

void asignarYMostrarTemasAleatoriamente(List<String> estudiantes, List<String> temas, Map<String, String> asignaciones) {
  if (estudiantes.isEmpty || temas.isEmpty) {
    print("No hay suficientes estudiantes o temas para asignar.");
    return;
  }

  asignaciones.clear(); // Limpiar asignaciones previas
  Random random = Random();

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

void menuFinal(List<String> estudiantes, List<String> temas, Map<String, String> asignaciones) {
  bool exit = false;
  while (!exit) {
    print('-' * 80);
    print("Menú Final:");
    print("1. Ver estudiantes junto a su tema de exposición final");
    print("2. Ver temas de exposición");
    print("3. Ver la cantidad de estudiantes por exposición");
    print("4. Ver lista de estudiantes");
    print("5. Salir");

    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        verEstudiantesYTemas(asignaciones);
        break;
      case 2:
        mostrarTemas(temas);
        break;
      case 3:
        verCantidadEstudiantesPorExposicion(estudiantes, asignaciones);
        break;
      case 4:
        mostrarEstudiantes(estudiantes);
        break;
      case 5:
        exit = true;
        break;
      default:
        print("Opción no válida");
    }
  }
}

void verEstudiantesYTemas(Map<String, String> asignaciones) {
  print("Estudiantes y sus temas de exposición:");
  asignaciones.forEach((estudiante, tema) {
    print("$estudiante: $tema");
  });
}

void verCantidadEstudiantesPorExposicion(List<String> estudiantes, Map<String, String> asignaciones) {
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
}
