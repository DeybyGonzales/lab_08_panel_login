// ─────────────────────────────────────────────────────────────
// LAB 09 – EduPanel Cupertino  (con imágenes)
// Imágenes:
//   - Asset local  → assets/images/logo.png  (Login)
//   - URL de red   → fotos de alumnos en ListarAlumnos y Perfil
// Widgets: CupertinoApp, CupertinoPageScaffold, CupertinoNavigationBar,
//   CupertinoButton, CupertinoTextField, CupertinoListTile,
//   CupertinoListSection, CupertinoAlertDialog, CupertinoPageRoute,
//   Image.asset, Image.network, ListView, Cards personalizadas
// ─────────────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

// ─── PALETA DE COLORES ────────────────────────────────────────
const kPrimario    = Color(0xFF00897B);
const kPrimarioOsc = Color(0xFF00695C);
const kAcento      = Color(0xFFFFB300);
const kFondo       = Color(0xFFF0F4F3);
const kSuperficie  = Color(0xFFFFFFFF);
const kTexto       = Color(0xFF1A2E2B);
const kTextoSub    = Color(0xFF607972);
const kBorde       = Color(0xFFD4E2DF);

// ─────────────────────────────────────────────────────────────
// APP ROOT
// ─────────────────────────────────────────────────────────────
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'EduPanel',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: kPrimario,
        barBackgroundColor: kSuperficie,
        scaffoldBackgroundColor: kFondo,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: '.SF Pro Text',
            color: kTexto,
            fontSize: 14,
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// ═════════════════════════════════════════════════════════════
// PANTALLA: LOGIN
// ═════════════════════════════════════════════════════════════
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: kFondo,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                // ── Logo asset local ──
                // Image.asset: carga imagen desde la carpeta assets/images/
                // El archivo logo.png fue descargado con curl
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [kPrimario, kPrimarioOsc],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimario.withOpacity(0.35),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    // Image.asset: imagen local del proyecto
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        // errorBuilder: si la imagen falla, muestra ícono de respaldo
                        errorBuilder: (_, __, ___) => const Icon(
                          CupertinoIcons.book_fill,
                          size: 50,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'EduPanel',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: kTexto,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Plataforma de gestión estudiantil',
                    style: TextStyle(fontSize: 13, color: kTextoSub),
                  ),
                ),
                const SizedBox(height: 44),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: kSuperficie,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kBorde),
                    boxShadow: [
                      BoxShadow(
                        color: kPrimario.withOpacity(0.07),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kTexto,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const _CampoTexto(
                        hint: 'Correo o usuario',
                        icono: CupertinoIcons.mail,
                      ),
                      const SizedBox(height: 14),
                      const _CampoTexto(
                        hint: 'Contraseña',
                        icono: CupertinoIcons.lock,
                        obscure: true,
                      ),
                      const SizedBox(height: 24),
                      CupertinoButton.filled(
                        borderRadius: BorderRadius.circular(13),
                        onPressed: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => const MenuScreen(),
                          ),
                        ),
                        child: const Text(
                          'Ingresar',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════
// PANTALLA: MENÚ PRINCIPAL
// ═════════════════════════════════════════════════════════════
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // Lista de Mapas: estructura de datos para las opciones del menú
  static const List<Map<String, dynamic>> _opciones = [
    {
      'icono': CupertinoIcons.person_circle,
      'titulo': 'Mi Perfil',
      'sub': 'Ver mis datos personales',
      'color': kPrimario,
      'ruta': 'perfil',
    },
    {
      'icono': CupertinoIcons.person_add,
      'titulo': 'Registrar Alumno',
      'sub': 'Añadir un nuevo estudiante',
      'color': Color(0xFF0288D1),
      'ruta': 'registrar',
    },
    {
      'icono': CupertinoIcons.group,
      'titulo': 'Listar Alumnos',
      'sub': 'Ver todos los estudiantes',
      'color': Color(0xFF7B1FA2),
      'ruta': 'listar',
    },
    {
      'icono': CupertinoIcons.question_circle,
      'titulo': 'Preguntas Frecuentes',
      'sub': 'Centro de ayuda y soporte',
      'color': kAcento,
      'ruta': 'faq',
    },
  ];

  Widget _destino(String ruta) {
    const rutas = {
      'perfil':    PerfilScreen(),
      'registrar': RegistrarAlumnoScreen(),
      'listar':    ListarAlumnosScreen(),
      'faq':       PreguntasFrecuentesScreen(),
    };
    return rutas[ruta]!;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: kFondo,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kPrimario, kPrimarioOsc],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Logo pequeño en el header usando Image.asset
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: CupertinoColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Icon(
                              CupertinoIcons.book_fill,
                              color: CupertinoColors.white,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 7),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(CupertinoIcons.square_arrow_left,
                                  color: CupertinoColors.white, size: 16),
                              SizedBox(width: 6),
                              Text('Salir',
                                  style: TextStyle(
                                      color: CupertinoColors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Hola, Deyby 👋',
                    style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '¿Qué deseas hacer hoy?',
                    style: TextStyle(
                        color: CupertinoColors.white.withOpacity(0.75),
                        fontSize: 13),
                  ),
                ],
              ),
            ),
            // ListView: lista de opciones del menú con scroll
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: _opciones.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final op = _opciones[i];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => _destino(op['ruta'] as String)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 16),
                      decoration: BoxDecoration(
                        color: kSuperficie,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: kBorde),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: (op['color'] as Color).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Icon(op['icono'] as IconData,
                                color: op['color'] as Color, size: 24),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(op['titulo'] as String,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: kTexto)),
                                const SizedBox(height: 2),
                                Text(op['sub'] as String,
                                    style: const TextStyle(
                                        fontSize: 12, color: kTextoSub)),
                              ],
                            ),
                          ),
                          const Icon(CupertinoIcons.chevron_forward,
                              color: kBorde, size: 18),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8F8),
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: const Color(0xFFFFCDD2)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.square_arrow_left,
                          color: Color(0xFFD32F2F), size: 18),
                      SizedBox(width: 8),
                      Text('Cerrar Sesión',
                          style: TextStyle(
                              color: Color(0xFFD32F2F),
                              fontWeight: FontWeight.w600,
                              fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════
// PANTALLA: PERFIL  (imagen de red para el avatar)
// ═════════════════════════════════════════════════════════════
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  // Lista de Mapas con datos del perfil
  static const List<Map<String, String>> _datos = [
    {'label': 'Nombre',    'valor': 'Deyby'},
    {'label': 'Apellido',  'valor': 'Gonzales'},
    {'label': 'Edad',      'valor': '20 años'},
    {'label': 'Carrera',   'valor': 'Ingeniería de Software'},
    {'label': 'Instituto', 'valor': 'Tecsup'},
    {'label': 'Turno',     'valor': 'Noche'},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: kSuperficie,
        border: const Border(bottom: BorderSide(color: kBorde)),
        middle: const Text('Mi Perfil',
            style: TextStyle(
                color: kTexto, fontWeight: FontWeight.w700, fontSize: 17)),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.chevron_back,
              color: kPrimario, size: 22),
        ),
      ),
      backgroundColor: kFondo,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 8),
              // Avatar con imagen de red (URL)
              // Image.network: carga imagen desde internet
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: kPrimario, width: 3),
                  boxShadow: [
                    BoxShadow(
                        color: kPrimario.withOpacity(0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 6))
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(27),
                  // Image.network: imagen desde URL (internet)
                  child: Image.network(
                    'https://i.pravatar.cc/150?img=12',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    // loadingBuilder: muestra indicador mientras carga
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    },
                    // errorBuilder: si falla, muestra iniciales
                    errorBuilder: (_, __, ___) => Container(
                      color: kPrimario,
                      child: const Center(
                        child: Text('DG',
                            style: TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Deyby Gonzales',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: kTexto)),
              const SizedBox(height: 4),
              const Text('Estudiante · Tecsup',
                  style: TextStyle(fontSize: 13, color: kTextoSub)),
              const SizedBox(height: 28),
              // CupertinoListSection: lista agrupada estilo iOS (Ajustes)
              CupertinoListSection.insetGrouped(
                header: const Text('INFORMACIÓN PERSONAL',
                    style: TextStyle(
                        fontSize: 12,
                        color: kTextoSub,
                        fontWeight: FontWeight.w600)),
                children: _datos.map((d) =>
                  CupertinoListTile(
                    title: Text(d['label']!,
                        style: const TextStyle(color: kTextoSub, fontSize: 13)),
                    trailing: Text(d['valor']!,
                        style: const TextStyle(
                            color: kTexto,
                            fontWeight: FontWeight.w600,
                            fontSize: 14)),
                  ),
                ).toList(),
              ),
              const SizedBox(height: 16),
              _BotonRegresar(onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════
// PANTALLA: REGISTRAR ALUMNO
// ═════════════════════════════════════════════════════════════
class RegistrarAlumnoScreen extends StatelessWidget {
  const RegistrarAlumnoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: kSuperficie,
        border: const Border(bottom: BorderSide(color: kBorde)),
        middle: const Text('Registrar Alumno',
            style: TextStyle(
                color: kTexto, fontWeight: FontWeight.w700, fontSize: 17)),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.chevron_back,
              color: kPrimario, size: 22),
        ),
      ),
      backgroundColor: kFondo,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kSuperficie,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kBorde),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Datos del alumno',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: kTexto)),
                    SizedBox(height: 20),
                    _Etiqueta('Nombre'),
                    SizedBox(height: 6),
                    _CampoTexto(
                        hint: 'Ingrese el nombre',
                        icono: CupertinoIcons.person),
                    SizedBox(height: 14),
                    _Etiqueta('Apellido'),
                    SizedBox(height: 6),
                    _CampoTexto(
                        hint: 'Ingrese el apellido',
                        icono: CupertinoIcons.person_2),
                    SizedBox(height: 14),
                    _Etiqueta('Edad'),
                    SizedBox(height: 6),
                    _CampoTexto(
                        hint: 'Ingrese la edad',
                        icono: CupertinoIcons.number,
                        teclado: TextInputType.number),
                    SizedBox(height: 14),
                    _Etiqueta('Carrera'),
                    SizedBox(height: 6),
                    _CampoTexto(
                        hint: 'Ingrese la carrera',
                        icono: CupertinoIcons.book),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                borderRadius: BorderRadius.circular(13),
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: const Text('¡Guardado!'),
                      content: const Text(
                          'El alumno fue registrado correctamente.'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Guardar Alumno',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: CupertinoColors.white),
                ),
              ),
              const SizedBox(height: 12),
              _BotonRegresar(onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════
// PANTALLA: LISTAR ALUMNOS (Image.network en cada card)
// ═════════════════════════════════════════════════════════════
class ListarAlumnosScreen extends StatelessWidget {
  const ListarAlumnosScreen({super.key});

  // Lista de Mapas: cada mapa es un alumno con su foto URL
  // pravatar.cc genera avatares únicos por número (img=1..70)
  static const List<Map<String, String>> _alumnos = [
    {'nombre': 'Deyby',    'apellido': 'Gonzales', 'edad': '20', 'carrera': 'Ingeniería de Software', 'foto': 'https://i.pravatar.cc/150?img=12'},
    {'nombre': 'Lucía',    'apellido': 'Castillo',  'edad': '21', 'carrera': 'Diseño Gráfico',          'foto': 'https://i.pravatar.cc/150?img=5'},
    {'nombre': 'Sebastián','apellido': 'Huanca',    'edad': '22', 'carrera': 'Administración',          'foto': 'https://i.pravatar.cc/150?img=15'},
    {'nombre': 'Valeria',  'apellido': 'Quispe',    'edad': '19', 'carrera': 'Contabilidad',            'foto': 'https://i.pravatar.cc/150?img=9'},
    {'nombre': 'Omar',     'apellido': 'Paredes',   'edad': '23', 'carrera': 'Mecatrónica',             'foto': 'https://i.pravatar.cc/150?img=20'},
    {'nombre': 'Nataly',   'apellido': 'Rivas',     'edad': '20', 'carrera': 'Enfermería',              'foto': 'https://i.pravatar.cc/150?img=47'},
    {'nombre': 'Rodrigo',  'apellido': 'Sánchez',   'edad': '21', 'carrera': 'Electrónica',             'foto': 'https://i.pravatar.cc/150?img=33'},
  ];

  static const List<Color> _colores = [
    kPrimario, Color(0xFF0288D1), Color(0xFF7B1FA2),
    kAcento, Color(0xFFD32F2F), Color(0xFF0288D1), kPrimarioOsc,
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: kSuperficie,
        border: const Border(bottom: BorderSide(color: kBorde)),
        middle: const Text('Alumnos Registrados',
            style: TextStyle(
                color: kTexto, fontWeight: FontWeight.w700, fontSize: 17)),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.chevron_back,
              color: kPrimario, size: 22),
        ),
      ),
      backgroundColor: kFondo,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 16, 20, 4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: kPrimario.withOpacity(0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kPrimario.withOpacity(0.15)),
              ),
              child: Row(
                children: [
                  const Icon(CupertinoIcons.group, color: kPrimario, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    '${_alumnos.length} alumnos en el sistema',
                    style: const TextStyle(
                        color: kPrimario,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  ),
                ],
              ),
            ),
            // ListView.builder con foto de red en cada ítem
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                itemCount: _alumnos.length,
                itemBuilder: (context, index) {
                  final a = _alumnos[index];
                  final color = _colores[index % _colores.length];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: kSuperficie,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: kBorde),
                    ),
                    child: Row(
                      children: [
                        // Avatar con Image.network + fallback de iniciales
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: color.withOpacity(0.3), width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            // Image.network: foto del alumno desde internet
                            child: Image.network(
                              a['foto']!,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                              loadingBuilder: (_, child, progress) {
                                if (progress == null) return child;
                                // CupertinoActivityIndicator: spinner iOS
                                return Container(
                                  color: color.withOpacity(0.1),
                                  child: const Center(
                                    child: CupertinoActivityIndicator(
                                        radius: 10),
                                  ),
                                );
                              },
                              errorBuilder: (_, __, ___) => Container(
                                color: color.withOpacity(0.12),
                                child: Center(
                                  child: Text(
                                    '${a['nombre']![0]}${a['apellido']![0]}',
                                    style: TextStyle(
                                        color: color,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${a['nombre']} ${a['apellido']}',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: kTexto),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                a['carrera']!,
                                style: const TextStyle(
                                    fontSize: 12, color: kTextoSub),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9, vertical: 4),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${a['edad']} a.',
                            style: TextStyle(
                                color: color,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: _BotonRegresar(onTap: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════
// PANTALLA: PREGUNTAS FRECUENTES
// ═════════════════════════════════════════════════════════════
class PreguntasFrecuentesScreen extends StatefulWidget {
  const PreguntasFrecuentesScreen({super.key});

  @override
  State<PreguntasFrecuentesScreen> createState() =>
      _PreguntasFrecuentesState();
}

class _PreguntasFrecuentesState extends State<PreguntasFrecuentesScreen> {
  // Lista de Mapas con preguntas y respuestas
  static const List<Map<String, String>> _faqs = [
    {
      'p': '¿Cómo registro un nuevo alumno?',
      'r': 'Ve al menú principal y selecciona "Registrar Alumno". Completa el formulario y presiona "Guardar Alumno".',
    },
    {
      'p': '¿Dónde veo la lista de alumnos?',
      'r': 'En el menú principal selecciona "Listar Alumnos". Verás todos los estudiantes con sus datos básicos.',
    },
    {
      'p': '¿Cómo ver mis datos de perfil?',
      'r': 'Selecciona "Mi Perfil" en el menú. Ahí encontrarás tus datos personales.',
    },
    {
      'p': '¿Cómo cierro sesión?',
      'r': 'Puedes usar el botón "Cerrar Sesión" al fondo del menú principal.',
    },
    {
      'p': '¿Los datos son permanentes?',
      'r': 'No. En esta versión los datos son locales. Al cerrar la app no se guardan en ninguna base de datos.',
    },
    {
      'p': '¿La app funciona en el navegador?',
      'r': 'Sí. Está desarrollada con Flutter y puede ejecutarse con flutter run -d chrome.',
    },
  ];

  late List<bool> _abiertos;

  @override
  void initState() {
    super.initState();
    _abiertos = List.filled(_faqs.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: kSuperficie,
        border: const Border(bottom: BorderSide(color: kBorde)),
        middle: const Text('Preguntas Frecuentes',
            style: TextStyle(
                color: kTexto, fontWeight: FontWeight.w700, fontSize: 17)),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.chevron_back,
              color: kPrimario, size: 22),
        ),
      ),
      backgroundColor: kFondo,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 16, 20, 4),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: kAcento.withOpacity(0.08),
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: kAcento.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  const Icon(CupertinoIcons.lightbulb, color: kAcento, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Toca cualquier pregunta para ver la respuesta.',
                      style: TextStyle(
                          color: kAcento.withOpacity(0.9), fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                itemCount: _faqs.length,
                itemBuilder: (context, i) {
                  final abierto = _abiertos[i];
                  return GestureDetector(
                    onTap: () =>
                        setState(() => _abiertos[i] = !_abiertos[i]),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: kSuperficie,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: abierto ? kAcento.withOpacity(0.4) : kBorde,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: abierto
                                        ? kAcento.withOpacity(0.15)
                                        : kFondo,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text('${i + 1}',
                                        style: TextStyle(
                                            color: abierto ? kAcento : kTextoSub,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 13)),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(_faqs[i]['p']!,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: kTexto)),
                                ),
                                Icon(
                                  abierto
                                      ? CupertinoIcons.chevron_up
                                      : CupertinoIcons.chevron_down,
                                  color: abierto ? kAcento : kTextoSub,
                                  size: 18,
                                ),
                              ],
                            ),
                            if (abierto) ...[
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: kFondo,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(_faqs[i]['r']!,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: kTextoSub,
                                        height: 1.55)),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: _BotonRegresar(onTap: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════
// WIDGETS REUTILIZABLES
// ═════════════════════════════════════════════════════════════

// CupertinoTextField: campo de texto nativo iOS
class _CampoTexto extends StatelessWidget {
  final String hint;
  final IconData icono;
  final bool obscure;
  final TextInputType teclado;

  const _CampoTexto({
    required this.hint,
    required this.icono,
    this.obscure = false,
    this.teclado = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      obscureText: obscure,
      keyboardType: teclado,
      placeholder: hint,
      placeholderStyle: const TextStyle(color: kTextoSub, fontSize: 14),
      style: const TextStyle(color: kTexto, fontSize: 14),
      prefix: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Icon(icono, color: kTextoSub, size: 18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: kSuperficie,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorde),
      ),
    );
  }
}

class _Etiqueta extends StatelessWidget {
  final String texto;
  const _Etiqueta(this.texto);

  @override
  Widget build(BuildContext context) {
    return Text(texto,
        style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: kTexto,
            letterSpacing: 0.2));
  }
}

// CupertinoButton con borde: reemplaza OutlinedButton de Material
class _BotonRegresar extends StatelessWidget {
  final VoidCallback onTap;
  const _BotonRegresar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: kSuperficie,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: kPrimario, width: 1.5),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.chevron_back, color: kPrimario, size: 16),
            SizedBox(width: 6),
            Text('Regresar al Menú',
                style: TextStyle(
                    color: kPrimario,
                    fontWeight: FontWeight.w600,
                    fontSize: 14)),
          ],
        ),
      ),
    );
  }
}