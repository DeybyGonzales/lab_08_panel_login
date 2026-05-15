import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ─── PALETA DE COLORES ───────────────────────────────────────────────────────
const kPrimario    = Color(0xFF00897B); // teal/esmeralda
const kPrimarioOsc = Color(0xFF00695C);
const kAcento      = Color(0xFFFFB300); // ámbar cálido
const kFondo       = Color(0xFFF0F4F3);
const kSuperficie  = Colors.white;
const kTexto       = Color(0xFF1A2E2B);
const kTextoSub    = Color(0xFF607972);
const kBorde       = Color(0xFFD4E2DF);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduPanel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimario,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

// ════════════════════════════════════════════════════════════
// PANTALLA: LOGIN
// ════════════════════════════════════════════════════════════
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFondo,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [kPrimario, kPrimarioOsc],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimario.withOpacity(0.35),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.menu_book_rounded,
                        size: 42, color: Colors.white),
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
                      const _InputField(
                        hint: 'Correo o usuario',
                        icono: Icons.alternate_email_rounded,
                      ),
                      const SizedBox(height: 14),
                      const _InputField(
                        hint: 'Contraseña',
                        icono: Icons.lock_outline_rounded,
                        obscure: true,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MenuScreen()),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimario,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// PANTALLA: MENÚ PRINCIPAL
// ════════════════════════════════════════════════════════════
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final opciones = [
      _OpcionMenu(
        icono: Icons.account_circle_outlined,
        titulo: 'Mi Perfil',
        sub: 'Ver mis datos personales',
        color: kPrimario,
        destino: const PerfilScreen(),
      ),
      _OpcionMenu(
        icono: Icons.person_add_alt_1_rounded,
        titulo: 'Registrar Alumno',
        sub: 'Añadir un nuevo estudiante',
        color: const Color(0xFF0288D1),
        destino: const RegistrarAlumnoScreen(),
      ),
      _OpcionMenu(
        icono: Icons.people_alt_outlined,
        titulo: 'Listar Alumnos',
        sub: 'Ver todos los estudiantes',
        color: const Color(0xFF7B1FA2),
        destino: const ListarAlumnosScreen(),
      ),
      _OpcionMenu(
        icono: Icons.quiz_outlined,
        titulo: 'Preguntas Frecuentes',
        sub: 'Centro de ayuda y soporte',
        color: kAcento,
        destino: const PreguntasFrecuentesScreen(),
      ),
    ];

    return Scaffold(
      backgroundColor: kFondo,
      body: SafeArea(
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
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.menu_book_rounded,
                            color: Colors.white, size: 26),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 7),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.logout_rounded,
                                  color: Colors.white, size: 16),
                              SizedBox(width: 6),
                              Text('Salir',
                                  style: TextStyle(
                                      color: Colors.white,
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
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '¿Qué deseas hacer hoy?',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.75), fontSize: 13),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: opciones.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) => _MenuTile(opcion: opciones[i]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.logout_rounded,
                      color: Color(0xFFD32F2F), size: 18),
                  label: const Text('Cerrar Sesión',
                      style: TextStyle(
                          color: Color(0xFFD32F2F),
                          fontWeight: FontWeight.w600)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: Color(0xFFFFCDD2), width: 1.5),
                    backgroundColor: const Color(0xFFFFF8F8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
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

class _OpcionMenu {
  final IconData icono;
  final String titulo;
  final String sub;
  final Color color;
  final Widget destino;
  const _OpcionMenu(
      {required this.icono,
      required this.titulo,
      required this.sub,
      required this.color,
      required this.destino});
}

class _MenuTile extends StatelessWidget {
  final _OpcionMenu opcion;
  const _MenuTile({super.key, required this.opcion});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kSuperficie,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => opcion.destino)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: kBorde),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: opcion.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(opcion.icono, color: opcion.color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(opcion.titulo,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kTexto)),
                    const SizedBox(height: 2),
                    Text(opcion.sub,
                        style: const TextStyle(
                            fontSize: 12, color: kTextoSub)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                  color: kBorde, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// PANTALLA: PERFIL
// ════════════════════════════════════════════════════════════
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFondo,
      appBar: const _AppBarEstilo(titulo: 'Mi Perfil'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [kPrimario, kPrimarioOsc],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: kPrimario.withOpacity(0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 6))
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'DG',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1),
                    ),
                  ),
                ),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: kAcento,
                    shape: BoxShape.circle,
                    border: Border.all(color: kFondo, width: 2),
                  ),
                  child: const Icon(Icons.verified_rounded,
                      size: 14, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Deyby Gonzales',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w800, color: kTexto),
            ),
            const SizedBox(height: 4),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: kPrimario.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Ingeniería de Software',
                style: TextStyle(
                    color: kPrimario,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                color: kSuperficie,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: kBorde),
              ),
              child: Column(
                children: [
                  const _FilaDato(
                      icono: Icons.badge_outlined,
                      label: 'Nombre',
                      valor: 'Deyby',
                      primero: true),
                  _Divider(),
                  const _FilaDato(
                      icono: Icons.person_outline_rounded,
                      label: 'Apellido',
                      valor: 'Gonzales'),
                  _Divider(),
                  const _FilaDato(
                      icono: Icons.cake_outlined,
                      label: 'Edad',
                      valor: '20 años'),
                  _Divider(),
                  const _FilaDato(
                      icono: Icons.school_outlined,
                      label: 'Carrera',
                      valor: 'Ingeniería de Software',
                      ultimo: true),
                ],
              ),
            ),
            const SizedBox(height: 28),
            _BotonRegresar(onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}

class _FilaDato extends StatelessWidget {
  final IconData icono;
  final String label;
  final String valor;
  final bool primero;
  final bool ultimo;
  const _FilaDato(
      {required this.icono,
      required this.label,
      required this.valor,
      this.primero = false,
      this.ultimo = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          20, primero ? 18 : 14, 20, ultimo ? 18 : 14),
      child: Row(
        children: [
          Icon(icono, color: kPrimario, size: 20),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(fontSize: 11, color: kTextoSub)),
              const SizedBox(height: 2),
              Text(valor,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kTexto)),
            ],
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, indent: 20, endIndent: 20, color: kBorde);
  }
}

// ════════════════════════════════════════════════════════════
// PANTALLA: REGISTRAR ALUMNO
// ════════════════════════════════════════════════════════════
class RegistrarAlumnoScreen extends StatelessWidget {
  const RegistrarAlumnoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFondo,
      appBar: const _AppBarEstilo(titulo: 'Registrar Alumno'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0288D1).withOpacity(0.08),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: const Color(0xFF0288D1).withOpacity(0.2)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline_rounded,
                      color: Color(0xFF0288D1), size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Completa todos los campos para registrar al alumno.',
                      style: TextStyle(
                          color: Color(0xFF0288D1), fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const _Label('Nombre'),
            const SizedBox(height: 8),
            const _InputField(
                hint: 'Ej: Juan', icono: Icons.person_outline_rounded),
            const SizedBox(height: 18),
            const _Label('Apellido'),
            const SizedBox(height: 8),
            const _InputField(hint: 'Ej: Pérez', icono: Icons.badge_outlined),
            const SizedBox(height: 18),
            const _Label('Edad'),
            const SizedBox(height: 8),
            const _InputField(
                hint: 'Ej: 20',
                icono: Icons.cake_outlined,
                tipoTeclado: TextInputType.number),
            const SizedBox(height: 18),
            const _Label('Carrera'),
            const SizedBox(height: 8),
            const _InputField(
                hint: 'Ej: Ingeniería de Sistemas',
                icono: Icons.school_outlined),
            const SizedBox(height: 36),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.check_circle_outline_rounded),
                label: const Text('Guardar Alumno',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0288D1),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _BotonRegresar(onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String texto;
  const _Label(this.texto);
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

class _InputField extends StatelessWidget {
  final String hint;
  final IconData icono;
  final bool obscure;
  final TextInputType tipoTeclado;
  const _InputField({
    required this.hint,
    required this.icono,
    this.obscure = false,
    this.tipoTeclado = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      keyboardType: tipoTeclado,
      style: const TextStyle(color: kTexto, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kTextoSub, fontSize: 14),
        prefixIcon: Icon(icono, color: kTextoSub, size: 20),
        filled: true,
        fillColor: kSuperficie,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kBorde),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kBorde),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kPrimario, width: 1.8),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// PANTALLA: LISTAR ALUMNOS
// ════════════════════════════════════════════════════════════
class ListarAlumnosScreen extends StatelessWidget {
  const ListarAlumnosScreen({super.key});

  static const List<Map<String, String>> _alumnos = [
    {'nombre': 'Deyby',    'apellido': 'Gonzales', 'edad': '20', 'carrera': 'Ingeniería de Software'},
    {'nombre': 'Lucía',    'apellido': 'Castillo',  'edad': '21', 'carrera': 'Diseño Gráfico'},
    {'nombre': 'Sebastián','apellido': 'Huanca',    'edad': '22', 'carrera': 'Administración'},
    {'nombre': 'Valeria',  'apellido': 'Quispe',    'edad': '19', 'carrera': 'Contabilidad'},
    {'nombre': 'Omar',     'apellido': 'Paredes',   'edad': '23', 'carrera': 'Mecatrónica'},
    {'nombre': 'Nataly',   'apellido': 'Rivas',     'edad': '20', 'carrera': 'Enfermería'},
    {'nombre': 'Rodrigo',  'apellido': 'Sánchez',   'edad': '21', 'carrera': 'Electrónica'},
  ];

  static const _colores = [
    kPrimario,
    Color(0xFF0288D1),
    Color(0xFF7B1FA2),
    kAcento,
    Color(0xFFD32F2F),
    Color(0xFF0288D1),
    kPrimarioOsc,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFondo,
      appBar: const _AppBarEstilo(titulo: 'Alumnos Registrados'),
      body: Column(
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
                const Icon(Icons.people_alt_outlined,
                    color: kPrimario, size: 18),
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              itemCount: _alumnos.length,
              itemBuilder: (context, index) {
                final a = _alumnos[index];
                final color = _colores[index % _colores.length];
                final iniciales =
                    '${a['nombre']![0]}${a['apellido']![0]}';
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
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                          child: Text(
                            iniciales,
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w800,
                                fontSize: 14),
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
    );
  }
}

// ════════════════════════════════════════════════════════════
// PANTALLA: PREGUNTAS FRECUENTES
// ════════════════════════════════════════════════════════════
class PreguntasFrecuentesScreen extends StatefulWidget {
  const PreguntasFrecuentesScreen({super.key});
  @override
  State<PreguntasFrecuentesScreen> createState() =>
      _PreguntasFrecuentesState();
}

class _PreguntasFrecuentesState extends State<PreguntasFrecuentesScreen> {
  static const List<Map<String, String>> _faqs = [
    {
      'p': '¿Cómo registro un nuevo alumno?',
      'r': 'Ve al menú principal y selecciona "Registrar Alumno". Completa el formulario con nombre, apellido, edad y carrera, luego presiona "Guardar Alumno".',
    },
    {
      'p': '¿Dónde veo la lista de alumnos?',
      'r': 'En el menú principal selecciona "Listar Alumnos". Verás todos los estudiantes con sus datos básicos y edades.',
    },
    {
      'p': '¿Cómo ver mis datos de perfil?',
      'r': 'Selecciona "Mi Perfil" en el menú. Ahí encontrarás tus datos: nombre, apellido, edad y carrera registrada.',
    },
    {
      'p': '¿Cómo cierro sesión?',
      'r': 'Puedes usar el botón "Cerrar Sesión" al fondo del menú principal, o el botón "Salir" en la esquina superior derecha.',
    },
    {
      'p': '¿Los datos son permanentes?',
      'r': 'No. En esta versión los datos son locales y no persistentes. Al cerrar sesión no se guardan en ninguna base de datos.',
    },
    {
      'p': '¿La app funciona en el navegador?',
      'r': 'Sí. Está desarrollada con Flutter Web y puede ejecutarse en Chrome con el comando flutter run -d chrome.',
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
    return Scaffold(
      backgroundColor: kFondo,
      appBar: const _AppBarEstilo(titulo: 'Preguntas Frecuentes'),
      body: Column(
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
                const Icon(Icons.lightbulb_outline_rounded,
                    color: kAcento, size: 20),
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
                        color: abierto
                            ? kAcento.withOpacity(0.4)
                            : kBorde,
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
                                  child: Text(
                                    '${i + 1}',
                                    style: TextStyle(
                                        color: abierto ? kAcento : kTextoSub,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  _faqs[i]['p']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kTexto,
                                  ),
                                ),
                              ),
                              Icon(
                                abierto
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                color: abierto ? kAcento : kTextoSub,
                                size: 22,
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
                              child: Text(
                                _faqs[i]['r']!,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: kTextoSub,
                                    height: 1.55),
                              ),
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
    );
  }
}

// ════════════════════════════════════════════════════════════
// WIDGETS REUTILIZABLES
// ════════════════════════════════════════════════════════════

class _AppBarEstilo extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  const _AppBarEstilo({required this.titulo});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kSuperficie,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: kSuperficie,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded,
            color: kTexto, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        titulo,
        style: const TextStyle(
            color: kTexto, fontWeight: FontWeight.w700, fontSize: 17),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: kBorde),
      ),
    );
  }
}

class _BotonRegresar extends StatelessWidget {
  final VoidCallback onTap;
  const _BotonRegresar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: const Icon(Icons.arrow_back_rounded, size: 18),
        label: const Text('Regresar al Menú',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        style: OutlinedButton.styleFrom(
          foregroundColor: kPrimario,
          side: const BorderSide(color: kPrimario, width: 1.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13)),
        ),
      ),
    );
  }
}