import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/background.dart';
import '../widgets/dropdown_field.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _nickname;
  int? _age;
  String? _gender;
  String? _region;

  final List<int> _ages = List<int>.generate(100, (i) => i + 1);
  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _regions = ['Americas', 'Europe', 'Asia', 'Oceania'];

  bool _saving = false;

  Future<void> _saveAndContinue() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() => _saving = true);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nickname', _nickname!);
    await prefs.setInt('age', _age!);
    await prefs.setString('gender', _gender!);
    if (_region != null) {
      await prefs.setString('region', _region!);
    }

    setState(() => _saving = false);
    // Navigate to the next screen:
    Navigator.pushNamed(context, '/disorder_check');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Image.asset('assets/images/logo.png', width: 100),
                const SizedBox(height: 32),
                const Text(
                  'Tell us about yourself',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                // The form
                Form(
                  key: _formKey,
                  child: Expanded(
                    child: ListView(
                      children: [
                        // Nickname
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Enter a Nickname',
                            labelStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator:
                              (v) =>
                                  v == null || v.trim().isEmpty
                                      ? 'Nickname cannot be empty'
                                      : null,
                          onSaved: (v) => _nickname = v!.trim(),
                        ),
                        const SizedBox(height: 16),

                        // Age dropdown
                        DropdownField<int>(
                          label: 'Select Your Age',
                          value: _age,
                          items:
                              _ages
                                  .map(
                                    (a) => DropdownMenuItem(
                                      value: a,
                                      child: Text(a.toString()),
                                    ),
                                  )
                                  .toList(),
                          validator:
                              (v) =>
                                  v == null ? 'Please select your age' : null,
                          onChanged: (v) => setState(() => _age = v),
                        ),

                        // Gender dropdown
                        DropdownField<String>(
                          label: 'Select Your Gender',
                          value: _gender,
                          items:
                              _genders
                                  .map(
                                    (g) => DropdownMenuItem(
                                      value: g,
                                      child: Text(g),
                                    ),
                                  )
                                  .toList(),
                          validator:
                              (v) =>
                                  v == null
                                      ? 'Please select your gender'
                                      : null,
                          onChanged: (v) => setState(() => _gender = v),
                        ),

                        // Region dropdown (optional)
                        DropdownField<String>(
                          label: 'Select Your Region (optional)',
                          value: _region,
                          items:
                              _regions
                                  .map(
                                    (r) => DropdownMenuItem(
                                      value: r,
                                      child: Text(r),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (v) => setState(() => _region = v),
                        ),
                      ],
                    ),
                  ),
                ),

                // Continue button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _saving ? null : _saveAndContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child:
                        _saving
                            ? const CircularProgressIndicator()
                            : const Text(
                              'CONTINUE',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7BAE9D),
                              ),
                            ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
