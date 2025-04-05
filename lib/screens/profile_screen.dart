import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../widgets/profile_form_field.dart';
import '../widgets/user_avatar.dart';
import '../widgets/section_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserProfile _userProfile;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userProfile = UserProfile.defaultProfile();
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Implement profile update logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              UserAvatar(
                avatarUrl: _userProfile.avatarUrl,
                radius: 50,
                iconSize: 50,
              ),
              const SizedBox(height: 20),
              ProfileFormField(
                initialValue: _userProfile.name,
                labelText: 'Name',
                validator: _validateName,
                onSaved: (value) => _userProfile.name = value ?? '',
              ),
              const SizedBox(height: 16),
              ProfileFormField(
                initialValue: _userProfile.email,
                labelText: 'Email',
                validator: _validateEmail,
                onSaved: (value) => _userProfile.email = value ?? '',
              ),
              const SizedBox(height: 16),
              ProfileFormField(
                initialValue: _userProfile.bio,
                labelText: 'Bio',
                maxLines: 3,
                onSaved: (value) => _userProfile.bio = value ?? '',
              ),
              const SizedBox(height: 24),
              _buildSaveButton(),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              const SectionHeader(title: 'Joined Servers'),
              const SizedBox(height: 8),
              _buildJoinedServersList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _updateProfile,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text('Save Profile'),
    );
  }

  Widget _buildJoinedServersList() {
    if (_userProfile.joinedServers.isEmpty) {
      return const Text('No servers joined yet');
    }
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _userProfile.joinedServers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_userProfile.joinedServers[index]),
        );
      },
    );
  }
} 