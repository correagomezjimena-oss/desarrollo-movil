import 'package:flutter/material.dart';
import '../main.dart';
import '../services/auth_service.dart';
import '../widgets/shared_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
  final _authService = AuthService();

  bool _isLoading = false;
  late AnimationController _animCtrl;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut));
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    final error = await _authService.register(
      name: _nameCtrl.text,
      email: _emailCtrl.text,
      password: _passCtrl.text,
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (error != null) {
      showError(context, error);
    } else {
      showSuccess(context, '¡Cuenta creada exitosamente!');
      await Future.delayed(const Duration(milliseconds: 800));
      if (mounted) Navigator.pop(context);
    }
  }

  String? _validateName(String? v) {
    if (v == null || v.trim().isEmpty) return 'Ingresa tu nombre';
    if (v.trim().length < 2) return 'El nombre debe tener al menos 2 caracteres';
    return null;
  }

  String? _validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Ingresa tu correo';
    if (!RegExp(r'^[\w.-]+@[\w.-]+\.\w+$').hasMatch(v.trim())) {
      return 'Correo no válido';
    }
    return null;
  }

  String? _validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Ingresa una contraseña';
    if (v.length < 6) return 'Mínimo 6 caracteres';
    return null;
  }

  String? _validateConfirmPassword(String? v) {
    if (v == null || v.isEmpty) return 'Confirma tu contraseña';
    if (v != _passCtrl.text) return 'Las contraseñas no coinciden';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.surfaceLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppTheme.textPrimary,
              size: 18,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
          child: FadeTransition(
            opacity: _fadeAnim,
            child: SlideTransition(
              position: _slideAnim,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 36,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppTheme.accent, AppTheme.accentDark],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Crear\ncuenta',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          height: 1.15,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Completa tus datos para registrarte',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildFieldLabel('Nombre completo'),
                        const SizedBox(height: 8),
                        StyledTextField(
                          controller: _nameCtrl,
                          label: 'Nombre',
                          hint: 'Ej. María García',
                          prefixIcon: Icons.person_outline_rounded,
                          keyboardType: TextInputType.name,
                          validator: _validateName,
                        ),
                        const SizedBox(height: 20),
                        _buildFieldLabel('Correo electrónico'),
                        const SizedBox(height: 8),
                        StyledTextField(
                          controller: _emailCtrl,
                          label: 'Correo',
                          hint: 'ejemplo@correo.com',
                          prefixIcon: Icons.mail_outline_rounded,
                          keyboardType: TextInputType.emailAddress,
                          validator: _validateEmail,
                        ),
                        const SizedBox(height: 20),
                        _buildFieldLabel('Contraseña'),
                        const SizedBox(height: 8),
                        StyledTextField(
                          controller: _passCtrl,
                          label: 'Contraseña',
                          hint: 'Mínimo 6 caracteres',
                          prefixIcon: Icons.lock_outline_rounded,
                          isPassword: true,
                          validator: _validatePassword,
                        ),
                        const SizedBox(height: 20),
                        _buildFieldLabel('Verificar contraseña'),
                        const SizedBox(height: 8),
                        StyledTextField(
                          controller: _confirmPassCtrl,
                          label: 'Confirmar contraseña',
                          prefixIcon: Icons.lock_reset_rounded,
                          isPassword: true,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => _register(),
                          validator: _validateConfirmPassword,
                        ),
                        const SizedBox(height: 12),
                        _PasswordMatchIndicator(
                          passCtrl: _passCtrl,
                          confirmCtrl: _confirmPassCtrl,
                        ),
                        const SizedBox(height: 28),
                        LoadingButton(
                          isLoading: _isLoading,
                          onPressed: _register,
                          label: 'Crear cuenta',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Ya tienes cuenta? ',
                        style: TextStyle(color: AppTheme.textSecondary),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Inicia sesión',
                          style: TextStyle(
                            color: AppTheme.accent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class _PasswordMatchIndicator extends StatefulWidget {
  final TextEditingController passCtrl;
  final TextEditingController confirmCtrl;

  const _PasswordMatchIndicator({
    required this.passCtrl,
    required this.confirmCtrl,
  });

  @override
  State<_PasswordMatchIndicator> createState() =>
      _PasswordMatchIndicatorState();
}

class _PasswordMatchIndicatorState extends State<_PasswordMatchIndicator> {
  @override
  void initState() {
    super.initState();
    widget.passCtrl.addListener(_rebuild);
    widget.confirmCtrl.addListener(_rebuild);
  }

  void _rebuild() => setState(() {});

  @override
  void dispose() {
    widget.passCtrl.removeListener(_rebuild);
    widget.confirmCtrl.removeListener(_rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.passCtrl.text;
    final c = widget.confirmCtrl.text;

    if (c.isEmpty) return const SizedBox.shrink();

    final match = p == c && p.isNotEmpty;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: match
            ? AppTheme.success.withValues(alpha: 0.12)
            : AppTheme.error.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            match ? Icons.check_circle_outline : Icons.cancel_outlined,
            size: 16,
            color: match ? AppTheme.success : AppTheme.error,
          ),
          const SizedBox(width: 8),
          Text(
            match ? 'Las contraseñas coinciden' : 'Las contraseñas no coinciden',
            style: TextStyle(
              color: match ? AppTheme.success : AppTheme.error,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}